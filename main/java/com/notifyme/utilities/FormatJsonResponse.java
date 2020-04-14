package com.notifyme.utilities;
import org.apache.commons.lang3.StringUtils;

public class FormatJsonResponse {
	
	public static String formatJson(String input) {
		
		String inputText=input;
		int index=StringUtils.lastIndexOf(inputText, "]");
		inputText=inputText.substring(1,index);
		return inputText;
		
	}

}
