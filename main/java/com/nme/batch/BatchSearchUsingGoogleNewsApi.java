package com.nme.batch;

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
import org.hibernate.HibernateException;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

import com.notifyme.actions.NotificationsDataPersistUtil;
import com.notifyme.model.NmeNotificationsMaster;
import com.notifyme.utilities.BusinessNewsDataFeeder;
import com.notifyme.utilities.FormatJsonResponse;
import com.notifyme.utilities.SearchKeyConstants;
import com.notifyme.utilities.SearchUsingGoogleNewsApi;

import freemarker.template.TemplateException;




public class BatchSearchUsingGoogleNewsApi implements Job{
	
	
	public void execute(JobExecutionContext context)
			throws JobExecutionException {
		
		try {
			SearchUsingGoogleNewsApi.main(null);
		} catch (IOException | ParseException | TemplateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (java.text.ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	

}
