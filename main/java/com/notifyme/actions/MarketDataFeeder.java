package com.notifyme.actions;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import com.notifyme.model.NmeIndicators;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.util.ValueStack;

public class MarketDataFeeder {
	
	private static String BITCOINDATAURL="https://api.coindesk.com/v1/bpi/currentprice.json";

	public String execute() throws Exception {
		
		
		
		List<NmeIndicators> indicatorList=new ArrayList<NmeIndicators>();
		
		indicatorList.add(nseInfo());
		indicatorList.add(niftyInfo());
		indicatorList.add(cryptoInfo());
		indicatorList.addAll(globalMarketsInfo());
		
		ValueStack stack = ActionContext.getContext().getValueStack();
	    Map<String, Object> context = new HashMap<String, Object>();
	    context.put("marketindicators",indicatorList); 
        stack.push(context);
		return "success";
	}
	
	private List<NmeIndicators> globalMarketsInfo() throws IOException {
		
			URL url = new URL("https://www.moneycontrol.com/markets/global-indices/");
			URLConnection connection = url.openConnection();
			connection.setDoOutput(true);
			BufferedReader in = new BufferedReader(new InputStreamReader(
					connection.getInputStream()));
	
			StringBuilder sb = new StringBuilder();
			int cp;
			while ((cp = in.read()) != -1) {
				sb.append((char) cp);
			}
			
			Document doc = Jsoup.parse(sb.toString());		
	        Elements divTag = doc.getElementsByClass("glob_indi_lft");
	        Elements rowEles=divTag.select("tbody").select("tr");
		 	int row=0;
	        List<NmeIndicators> dataList= new ArrayList<NmeIndicators>();
	        for (Element e : rowEles) {
	        	NmeIndicators data= new NmeIndicators();
	        	if((row==1 || row==3 || row==5 || row==15))
	        	{
	        		Elements colEelements= e.select("td");
	            	int colNum=0;
	            	int colSet=0;
	            	for (Element ec:colEelements)
	            	{
	            		
	            		if(colNum<3)
	            		{
	            		if(colSet==0)
	            		{
	            			System.out.println();
	            			int sti=ec.text().indexOf("(");
	            			
	            			ec.text().indexOf("(");
	            			data.setIndicatorName(ec.text().substring(0,sti).trim());
	            			colSet++;
	            		}
	            		else if (colSet==1)
	            		{
	            			data.setLastPrice(ec.text());
	            			colSet++;
	            			
	            		}
	            		else if (colSet==2)
	            		{
	            			int sti=ec.text().indexOf(" ");
	            			data.setChange(ec.text().substring(0,sti).trim());
	            			colSet++;
	            			
	            		}
	            		
	            		colNum++;
	            		}
	            		else
	            		{
	            			
	            			break;
	            		}
	            	}
	            	dataList.add(data);
	        		
	        		
	        		
	        	}
	        	row++;
	        }
		
		
		
		return dataList;
	}

	private  NmeIndicators cryptoInfo() throws Exception {
		
		
		
		NmeIndicators data= new NmeIndicators();
		
		
		URL furl = new URL(BITCOINDATAURL);
		URLConnection connection = furl.openConnection();
		connection.setDoOutput(true);
		BufferedReader in = new BufferedReader(new InputStreamReader(
				connection.getInputStream()));

		StringBuilder sb = new StringBuilder();
		int cp;
		while ((cp = in.read()) != -1) {
			sb.append((char) cp);
		}
		
		
		
		String jsonString = sb.toString();

		JSONParser parser = new JSONParser();
		JSONObject dataJson = (JSONObject) parser.parse(jsonString);
		JSONObject dataObj = (JSONObject) dataJson
				.get("bpi");
		
		JSONObject usdDataObj=(JSONObject)dataObj.get("USD");	
		
		data.setLastPrice((String) usdDataObj.get("rate"));
		data.setIndicatorName("BTC");
		
		return data;
		
	}
	
	

	public NmeIndicators nseInfo() throws Exception{
		
		NmeIndicators nseData=new NmeIndicators();
		
		String constructUrl = "http://appfeeds.moneycontrol.com/jsonapi/market/indices&ind_id=4";
		URL furl = new URL(constructUrl);
		URLConnection connection = furl.openConnection();
		connection.setDoOutput(true);
		BufferedReader in = new BufferedReader(new InputStreamReader(
				connection.getInputStream()));
		String decodedString;
		String[] lines = new String[100000];
		while ((decodedString = in.readLine()) != null) {
			lines = decodedString.split("source");
		}		
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(Arrays.toString(lines));
		JSONArray array = (JSONArray) obj;
		JSONObject a = new JSONObject();

		Iterator itr2 = array.iterator();
		Iterator<Map.Entry> itr1 = array.iterator();
		while (itr2.hasNext()) {
			itr1 = ((Map) itr2.next()).entrySet().iterator();
			while (itr1.hasNext()) {
				Map.Entry pair = itr1.next();
				if (pair.getKey().toString().trim().equals("indices")) {
					a.put("index", pair.getValue());					
					//System.out.println(pair.getValue());
				}
			}
		}		
		JSONObject jo = (JSONObject) a.get("index");
		
				
		nseData.setLastPrice((String) jo.get("lastprice"));
		nseData.setChange((String) jo.get("change"));
		nseData.setDirection((String) jo.get("direction"));
		nseData.setPercentchange((String) jo.get("percentchange"));
		nseData.setIndicatorName("BSE");
		return nseData;
		
	}
	
	public NmeIndicators niftyInfo() throws Exception{
		
		NmeIndicators nseData=new NmeIndicators();
		
		String constructUrl = "http://appfeeds.moneycontrol.com/jsonapi/market/indices&ind_id=9";
		URL furl = new URL(constructUrl);
		URLConnection connection = furl.openConnection();
		connection.setDoOutput(true);
		BufferedReader in = new BufferedReader(new InputStreamReader(
				connection.getInputStream()));
		String decodedString;
		String[] lines = new String[100000];
		while ((decodedString = in.readLine()) != null) {
			lines = decodedString.split("source");
		}		
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(Arrays.toString(lines));
		JSONArray array = (JSONArray) obj;
		JSONObject a = new JSONObject();

		Iterator itr2 = array.iterator();
		Iterator<Map.Entry> itr1 = array.iterator();
		while (itr2.hasNext()) {
			itr1 = ((Map) itr2.next()).entrySet().iterator();
			while (itr1.hasNext()) {
				Map.Entry pair = itr1.next();
				if (pair.getKey().toString().trim().equals("indices")) {
					a.put("index", pair.getValue());					
					//System.out.println(pair.getValue());
				}
			}
		}		
		JSONObject jo = (JSONObject) a.get("index");
		
				
		nseData.setLastPrice((String) jo.get("lastprice"));
		nseData.setChange((String) jo.get("change"));
		nseData.setDirection((String) jo.get("direction"));
		nseData.setPercentchange((String) jo.get("percentchange"));
		nseData.setIndicatorName("NIFTY");
		return nseData;
		
	}
}
