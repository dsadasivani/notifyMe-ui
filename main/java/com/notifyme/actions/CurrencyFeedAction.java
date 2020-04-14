package com.notifyme.actions;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.io.StringWriter;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.util.HashMap;
import java.util.Map;

import javax.xml.transform.Source;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.util.ValueStack;

public class CurrencyFeedAction extends ActionSupport {	

	static Source xslt = new StreamSource(
			"C:\\NotifyMeTempWorkspace\\NotifyMeBeta\\src\\resources\\product.xsl");
	
	private static final long serialVersionUID = 1L;
	
	public String execute() throws IOException {
		
		StringWriter sw = new StringWriter();

		//URL url=new URL("http://www.moneycontrol.com/rss/commodities.xml");
		 URL url=new URL("http://www.moneycontrol.com/rss/currency.xml");
		//URL url = new URL("http://www.moneycontrol.com/rss/technology.xml");

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
			ValueStack stack = ActionContext.getContext().getValueStack();
		    Map<String, String> context = new HashMap<String, String>();
		    context.put("currencyfeedData",fw.toString()); 
	        stack.push(context);
			fw.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "success";
	}

}