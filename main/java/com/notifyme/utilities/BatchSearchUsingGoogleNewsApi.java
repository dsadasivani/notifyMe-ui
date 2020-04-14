package com.notifyme.utilities;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

import com.notifyme.actions.NotificationsDataPersistUtil;
import com.notifyme.model.NmeNotificationsMaster;


public class BatchSearchUsingGoogleNewsApi implements Job{
	final static Logger logger = Logger.getLogger(BatchSearchUsingGoogleNewsApi.class);
	public void execute(JobExecutionContext context)
			throws JobExecutionException {
try{
		List<NmeNotificationsMaster> notificationList=new ArrayList<NmeNotificationsMaster>();
		String finalText="";
		String constructUrl="";
		List<String> jsonStringList=new ArrayList<String>();

		String log4jConfPath = "C:\\RIIES\\Test\\NotifyMeBeta\\WebContent\\properties\\log4j.properties";
		PropertyConfigurator.configure(log4jConfPath);		
		List feed=BusinessNewsDataFeeder.getFeed();	

		for (int i=0;i<feed.size();i++)
		{
			constructUrl=searchByPublishDate((String)feed.get(i),"2018-02-01","2018-02-15");
			//System.out.println(constructUrl);
			URL furl = new URL(constructUrl);
			URLConnection connection = furl.openConnection();
			connection.setDoOutput(true);

			BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
			String decodedString;
			String[] lines = new String[100000];		
			while ((decodedString = in.readLine()) != null) {
				lines = decodedString.split("source");
			}

			finalText=FormatJsonResponse.formatJson(Arrays.toString(lines));		
			jsonStringList.add(finalText);
			in.close();	
		}

		finalText="";
		StringBuffer finalSb=new StringBuffer();

		for(int j=0;j<jsonStringList.size();j++)
		{
			JSONParser parser = new JSONParser();
			Object obj = parser.parse(jsonStringList.get(j));
			JSONObject jo = (JSONObject) obj;
			System.out.println("[************************************Total Search Results******************************]:"+jo.get("totalResults"));
			JSONArray ja = (JSONArray) jo.get("articles");

			Iterator itr2 = ja.iterator();
			Iterator<Map.Entry> itr1 = ja.iterator();
			int count=1;

			while (itr2.hasNext()) 
			{
				NmeNotificationsMaster nm=new NmeNotificationsMaster();
				System.out.println("Result No:"+count);
				System.out.println("-------------");        	 
				finalSb=finalSb.append("-----------------------------------------------------------------------------------------").append("\n");
				itr1 = ((Map) itr2.next()).entrySet().iterator();
				while (itr1.hasNext()) {

					Map.Entry pair = itr1.next();
					if(!(pair.getKey().toString().trim().replace("  ","").equals(",")) && !(pair.getKey().equals("urlToImage")) && !(pair.getKey().equals("author")))
					{
						if(pair.getKey().equals("description"))
						{
							nm.setDetailedNews( (String) pair.getValue());
						}
						else if(pair.getKey().equals("title"))
						{
							nm.setShortNews((String) pair.getValue());
						}
						else if(pair.getKey().equals("url"))
						{
							nm.setNewsLink((String) pair.getValue());
						}
						else if(pair.getKey().equals("publishedAt"))
						{
							nm.setArticlePublishDate(new Timestamp(System.currentTimeMillis()));
						}
						//System.out.println(pair.getKey() + " : " + pair.getValue());               
						finalSb=finalSb.append(pair.getKey() + " : " + pair.getValue()).append("\n");                
					}

				}
				count++;
				nm.setPreference("STOCKS");
				nm.setCreatedDate(new Timestamp(System.currentTimeMillis()));
				notificationList.add(nm);
			}  

		}
		System.out.println("No.of.Records For DB Persistence:"+notificationList.size());
		NotificationsDataPersistUtil.persistNewsToDB(notificationList);
		PdfCreater.writeDocument(finalSb.toString());
		SendEmailController.sendMail(finalSb.toString());
		//logger.debug("This is debug : Mail Sent to the recipient");
}
catch(Exception e)
{
	
}
			}
	public static String searchByPublishDate(String searchString,String fromDt,String toDt) {		
		searchString=searchString.replace(" ","+");
		String fromDate=SearchKeyConstants.GOOGLE_FROM_WITHAMP+fromDt;
		String toDate=SearchKeyConstants.GOOGLE_TO_WITHAMP+toDt;		
		String constructUrl = SearchKeyConstants.GOOGLE_URL_WITHQ+searchString+fromDate+toDate+SearchKeyConstants.GOOGLE_SORTBYPUBLISHEDDT_WITHAMP+SearchKeyConstants.GOOGLE_SEARCHLANGUAGE_WITHAMP+/*"&domains=moneycontrol.com"+*/SearchKeyConstants.GOOGLE_API_KEY;
		System.out.println(constructUrl);
		return constructUrl;
	}
	public static String searchByPublishDateSource(String searchString,String fromDt,String toDt) {		
		searchString=searchString.replace(" ","+");
		String fromDate=SearchKeyConstants.GOOGLE_FROM_WITHAMP+fromDt;
		String toDate=SearchKeyConstants.GOOGLE_TO_WITHAMP+toDt;		
		String constructUrl = SearchKeyConstants.GOOGLE_URL_WITHQ+searchString+fromDate+toDate+SearchKeyConstants.GOOGLE_API_KEY;
		System.out.println(constructUrl);
		return constructUrl;
	}
}
