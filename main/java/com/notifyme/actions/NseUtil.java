package com.notifyme.actions;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.util.EntityUtils;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class NseUtil {
	
	
	public static Map<String,String> getData(String input) throws Exception
	{
		
		
		 HttpClient client = HttpClientBuilder.create().build();
	     HttpGet request = new HttpGet("https://www.nseindia.com/products/dynaContent/equities/equities/histscrip.jsp?symbolCode=242&symbol=input&symbol=rel&segmentLink=3&symbolCount=2&series=ALL&dateRange=+&fromDate=09-07-2018&toDate=12-07-2018&dataType=PRICEVOLUMEDELIVERABLE");

	      try {
	    	  
	    	    HashMap data=new LinkedHashMap();
	    	    HashMap price=new LinkedHashMap();
	    	    List dates=new ArrayList();
	            HttpResponse response = client.execute(request);
	            HttpEntity entity = response.getEntity();

	            // Read the contents of an entity and return it as a String.
	            String content = EntityUtils.toString(entity);
	            Document doc = Jsoup.parse(content);
	            
	            Element  table = doc.select("table").get(0);
	            Elements rows = table.select("tr");
	            String stockName="";
	            
	            for (int i = 1; i < rows.size(); i++) {
	            	
	            	Element   row = rows.get(i);
	                Elements  cols = row.select("td");
	                
	                stockName=String.valueOf(cols.get(0).text());
	                dates.add(cols.get(2).text());
	                data.put(cols.get(2).text(),cols.get(14).text());
	                price.put(cols.get(2).text(),cols.get(9).text().replace(",",""));
	            }
	            
	            //System.out.println(stockName+":"+Arrays.toString(data.toArray()));
	            //NseChart.displayChart(dates,stockName,data,price);
	            return data;
	}
	      finally{
	    	  
	      }

}
}