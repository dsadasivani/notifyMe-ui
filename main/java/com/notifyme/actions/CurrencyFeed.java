package com.notifyme.actions;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.io.StringWriter;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.List;

import javax.xml.transform.Source;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class CurrencyFeed {

	static Source xslt = new StreamSource(
			"C:\\NotifyMeTempWorkspace\\NotifyMeBeta\\src\\resources\\product.xsl");

	public static List getFeedData() throws IOException

	{
		StringWriter sw = new StringWriter();
		List feedList=new ArrayList<String>();
		// URL url=new URL("http://www.moneycontrol.com/rss/commodities.xml");
		// URL url=new URL("http://www.moneycontrol.com/rss/currency.xml");
		URL url = new URL("http://www.moneycontrol.com/rss/technology.xml");

		URLConnection connection = url.openConnection();
		connection.setDoOutput(true);
		BufferedReader in = new BufferedReader(new InputStreamReader(
				connection.getInputStream()));

		StringBuilder sb = new StringBuilder();
		int cp;
		while ((cp = in.read()) != -1) {
			sb.append((char) cp);
		}

		try {

			StringWriter fw = new StringWriter();
			TransformerFactory tFactory = TransformerFactory.newInstance();
			Transformer trasform = tFactory.newTransformer(xslt);
			Source xmlInput = new StreamSource(new StringReader(sb.toString()));
			trasform.transform(xmlInput, new StreamResult(sw));
			fw.write(sw.toString());			
			Document doc = Jsoup.parse(fw.toString());
			Elements listItems = doc.getElementsByTag("li");			 
			for (Element item : listItems) {
				feedList.add(item.text());
				System.out.println(item.text());
				}
			fw.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return feedList;
	}

}
