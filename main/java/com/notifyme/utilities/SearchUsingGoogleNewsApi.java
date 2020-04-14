package com.notifyme.utilities;



import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;

import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.notifyme.actions.NotificationsDataPersistUtil;
import com.notifyme.model.NmeNotificationsMaster;

import freemarker.template.TemplateException;

public class SearchUsingGoogleNewsApi {

	static TrustManager[] trustAllCerts = new TrustManager[] { new X509TrustManager() {
		public java.security.cert.X509Certificate[] getAcceptedIssuers() {
			return null;
		}

		public void checkClientTrusted(java.security.cert.X509Certificate[] certs, String authType) {
		}

		public void checkServerTrusted(java.security.cert.X509Certificate[] certs, String authType) {
		}
	} };
	
	

	final static Logger logger = Logger.getLogger(SearchUsingGoogleNewsApi.class);
	
	final static Properties prop = new Properties();
	
	final static Properties secProp = new Properties();
	
	static
	{
		InputStream input = null;
		try {
			input = new FileInputStream("/home/dilip/eclipse-workspace/NotifyMe/src/main/resources/NotifyMe.properties");
			prop.load(input);
		} catch (FileNotFoundException e) {			
			e.printStackTrace();
		} catch (IOException e) {			
			e.printStackTrace();
		}
	}
	
	static
	{
		InputStream input = null;
		try {
			input = new FileInputStream("/home/dilip/eclipse-workspace/NotifyMe/src/main/resources/sectors.properties");
			secProp.load(input);
		} catch (FileNotFoundException e) {			
			e.printStackTrace();
		} catch (IOException e) {			
			e.printStackTrace();
		}
	}
	
	
	public static void main(String[] args) throws IOException, ParseException, TemplateException, java.text.ParseException {

		
		// Trusting everyone
		try {
			SSLContext sc = SSLContext.getInstance("SSL");
			sc.init(null, trustAllCerts, new java.security.SecureRandom());
			HttpsURLConnection.setDefaultSSLSocketFactory(sc.getSocketFactory());
			
		} catch (Exception e) {
		}

		// Logging configuration
		String log4jConfPath = "/home/dilip/eclipse-workspace/NotifyMe/src/main/resources/log4j.properties"; 
																																		

		PropertyConfigurator.configure(log4jConfPath);

		// Variable Declaration
		String finalText = "";
		String constructUrl = "";
		List<String> jsonStringList = new ArrayList<String>();
		Map<String,String> checkMap=new LinkedHashMap<String,String>();
		List<String> keyList=new ArrayList<String>();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss");
		String startDate,endDate;
		Timestamp endDt;
		
		List<NmeNotificationsMaster> notificationList = new ArrayList<NmeNotificationsMaster>();
		finalText = "";
		StringBuffer finalSb = new StringBuffer();

		// Getting Keys For Searching News
		List feed = BusinessNewsDataFeeder.getFeed();
		
		/*Object[] params = BatchUtils.initiateBatchProcess("NEWS-DLY");
		
		startDate = format.format((Timestamp)params[1]);
		endDt = new Timestamp(System.currentTimeMillis());
		endDate = format.format(endDt);*/
		
		// Logic to get news for a certain period
		for (int i = 0; i < feed.size(); i++) {
			constructUrl = searchByPublishDate((String) feed.get(i)+" stock", "26-06-2019", "26-06-2019");
			keyList.add(secProp.getProperty(((String) feed.get(i)).replace(" ", ".")));
			URL furl = new URL(constructUrl);
			URLConnection connection = furl.openConnection();
			connection.setDoOutput(true);

			BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
			String decodedString;
			String[] lines = new String[100000];
			while ((decodedString = in.readLine()) != null) {
				lines = decodedString.split("source");
			}

			finalText = FormatJsonResponse.formatJson(Arrays.toString(lines));
			/*if(!finalText.equals("[{\"status\":\"ok\",\"totalResults\":0,\"articles\":[]}]"))
			{*/
			jsonStringList.add(finalText);			
			checkMap.put((String) feed.get(i), finalText);
			
			in.close();
		}

		// Logic to parse json data and persist
		for (int j = 0; j < jsonStringList.size(); j++) {
			JSONParser parser = new JSONParser();
			Object obj = parser.parse(jsonStringList.get(j));
			JSONObject jo = (JSONObject) obj;
			JSONArray ja = (JSONArray) jo.get("articles");
			Set<String> linkSet = new HashSet<String>();
			Iterator itr2 = ja.iterator();
			Iterator<Map.Entry> itr1 = ja.iterator();
			int count = 1;
			

			while (itr2.hasNext()) {
				NmeNotificationsMaster nm = new NmeNotificationsMaster();
				/*finalSb = finalSb.append(
						"-----------------------------------------------------------------------------------------")
						.append("\n");*/
				itr1 = ((Map) itr2.next()).entrySet().iterator();

				while (itr1.hasNext()) {
					String imageUrl = "";
					Map.Entry pair = itr1.next();
					if (!(pair.getKey().toString().trim().replace("  ", "").equals(","))
							&& !(pair.getKey().equals("author"))) {
						if (pair.getKey().equals("description")) {
							nm.setDetailedNews((String) pair.getValue());
						} else if (pair.getKey().equals("title")) {
							nm.setShortNews((String) pair.getValue());
						} else if (pair.getKey().equals("url")) {
							nm.setNewsLink((String) pair.getValue());
						} else if (pair.getKey().equals("publishedAt")) { 
							
							DateTimeFormatter inputFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss", Locale.ENGLISH);
							LocalDateTime date = LocalDateTime.parse((CharSequence) pair.getValue().toString().substring(0, pair.getValue().toString().length()-1), inputFormatter);
						
							nm.setArticlePublishDate(Timestamp.valueOf(date));
							
						} else if (pair.getKey().equals("urlToImage")) {
							nm.setImageUrl((String) pair.getValue());
							imageUrl = (String) pair.getValue();

						}

						/*finalSb = finalSb.append(pair.getKey() + " : " + pair.getValue()).append("\n");*/
					}

				}
				count++;
				
				String keyS="";
				String sector="";
				
				keyS=getKey(checkMap, jsonStringList.get(j));				
				sector=(String) secProp.get(keyS.replace(" ", "."));				
				nm.setNewsKey(keyS);
				nm.setSector(sector);
				nm.setPreference("STOCKS");
				nm.setCreatedDate(new Timestamp(System.currentTimeMillis()));
				notificationList.add(nm);
			}

		}

		NotificationsDataPersistUtil.persistNewsToDB(notificationList);
		
		//BatchUtils.completeBatchProcess(BatchUtils.BATCH_ENDED, (long)params[0]);
		//PdfCreater.writeDocument(finalSb.toString());
		//SendEmailController.sendMail(finalSb.toString());
		
	}
	

	private static String getKey(Map<String, String> map, String value) {
		for (Map.Entry<String, String> entry : map.entrySet()) {
			if (value.equals(entry.getValue())) {
				return entry.getKey();
			}
		}
		return null;
	}


	public static String searchByPublishDate(String searchString, String fromDt, String toDt) {
		searchString = searchString.replace(" ", "+");
		String fromDate = SearchKeyConstants.GOOGLE_FROM_WITHAMP + fromDt;
		String toDate = SearchKeyConstants.GOOGLE_TO_WITHAMP + toDt;
		String constructUrl = (String)prop.getProperty("GOOGLE_URL_WITHQ") + searchString + fromDate + toDate
				+ SearchKeyConstants.GOOGLE_SORTBYPUBLISHEDDT_WITHAMP
				+ SearchKeyConstants.GOOGLE_SEARCHLANGUAGE_WITHAMP
				+ (String)prop.getProperty("GOOGLE_NEW_API_KEY");		
		return constructUrl;
	}

	public static String searchByPublishDateSource(String searchString, String fromDt, String toDt) {
		searchString = searchString.replace(" ", "+");
		String fromDate = SearchKeyConstants.GOOGLE_FROM_WITHAMP + fromDt;
		String toDate = SearchKeyConstants.GOOGLE_TO_WITHAMP + toDt;
		String constructUrl = (String)prop.getProperty("GOOGLE_URL_WITHQ") + searchString + fromDate + toDate
				+ (String)prop.getProperty("GOOGLE_NEW_API_KEY");
		return constructUrl;
	}

}