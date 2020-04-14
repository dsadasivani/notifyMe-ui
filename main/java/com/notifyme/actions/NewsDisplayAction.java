package com.notifyme.actions;

import java.sql.ResultSet;

import java.util.List;


import com.notifyme.model.NmeNotificationsMaster;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class NewsDisplayAction extends ActionSupport {
	List<NmeNotificationsMaster> dataList = null;
	ResultSet rs = null;
	String fetchData = null;
	
	

	public String execute() throws Exception {
		System.out.println("in execute:: of NewsDisplayAction class");
		List<NmeNotificationsMaster> dataList=NotificationsDataPersistUtil.getDataFromDB();
		
		for (int i=0;i<dataList.size();i++)
		{
			System.out.println(dataList.get(i).getNewsLink());
		}
		return "success";
	}
}                    

