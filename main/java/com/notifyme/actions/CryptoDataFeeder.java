/*package com.notifyme.actions;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;

import org.json.JSONObject;

import com.notifyme.model.NmeIndicators;

public class CryptoDataFeeder {

	public static void main(String[] args) throws Exception {

		usdtoinr();
		bitcointousd();
	}
	
	public static NmeIndicators usdtoinr() throws Exception
	{
		
		NmeIndicators data= new NmeIndicators();
		
		
		String constructUrl = "https://www.alphavantage.co/query?function=CURRENCY_EXCHANGE_RATE&from_currency=USD&to_currency=INR&apikey=VEX0M8AIQWBGYJM";
		URL furl = new URL(constructUrl);
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

		JSONObject forecastJson = new JSONObject(jsonString);

		JSONObject temperatureObject = (JSONObject) forecastJson
				.get("Realtime Currency Exchange Rate");
		
		data.setLastPrice((String) temperatureObject.get("5. Exchange Rate"));
		data.setIndicatorName("USD");
		data.setChange();
		data.setDirection();
		data.setPercentchange();		
		return data;
		
	}
	
	
	public static NmeIndicators bitcointousd() throws Exception
	{
		NmeIndicators data= new NmeIndicators();
		
		String constructUrl = "https://www.alphavantage.co/query?function=CURRENCY_EXCHANGE_RATE&from_currency=BTC&to_currency=USD&apikey=VEX0M8AIQWBGYJM";
		URL furl = new URL(constructUrl);
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

		JSONObject forecastJson = new JSONObject(jsonString);

		JSONObject temperatureObject = (JSONObject) forecastJson
				.get("Realtime Currency Exchange Rate");

		
		data.setLastPrice((String) temperatureObject.get("5. Exchange Rate"));
		data.setIndicatorName("BTC");
		data.setChange();
		data.setDirection();
		data.setPercentchange();		
		return data;
		
	}
}
*/