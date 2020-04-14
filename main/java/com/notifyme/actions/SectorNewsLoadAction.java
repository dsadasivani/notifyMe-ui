package com.notifyme.actions;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.notifyme.model.NmeNotificationsMaster;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.util.ValueStack;

public class SectorNewsLoadAction extends ActionSupport{
	
	private static final long serialVersionUID = 1L;
	
	private String sector;
	
	public String getSector() {
		return sector;
	}


	public void setSector(String sector) {
		this.sector = sector;
	}


	public List<NmeNotificationsMaster> getNewsList() {
		return newsList;
	}


	public void setNewsList(List<NmeNotificationsMaster> newsList) {
		this.newsList = newsList;
	}


	List<NmeNotificationsMaster> newsList=new ArrayList<NmeNotificationsMaster>();
	
	Map<String, List<NmeNotificationsMaster>> sectorNews= null;


	public Map<String, List<NmeNotificationsMaster>> getMap() {
		return sectorNews;
	}


	public void setMap(Map<String, List<NmeNotificationsMaster>> sectorNews) {
		this.sectorNews = sectorNews;
	}


	public String execute(){
		System.out.println("sector"+sector);
		
		List<NmeNotificationsMaster> sectorList = null;
		
		newsList=NotificationsDataPersistUtil.getDataFromDB();
		
		for(int i=0;i<newsList.size();i++) {
			String pattern = "E, dd MMMM ''yy hh:mm a z";
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
			String date = simpleDateFormat.format(newsList.get(i).getArticlePublishDate());
			newsList.get(i).setDisplayDate(date);
		} 
		
		//List segregating based on sectors
		if(newsList.size()>0) {
			sectorNews = new LinkedHashMap<>();
			for(NmeNotificationsMaster n : newsList) {
					if(sectorNews.containsKey(n.getSector()))
						sectorList = sectorNews.get(n.getSector());
					else 
						sectorList = new ArrayList<>();
					
					sectorList.add(n);
					sectorNews.put(n.getSector(), sectorList);
			}
		}
		
		ValueStack stack = ActionContext.getContext().getValueStack();
	    Map<String, Object> context = new HashMap<String, Object>();
	    context.put("sectornewsList",sectorNews); 
        stack.push(context);
        context.put("sectorSelected",sector);  
	  // System.out.println("sectorNews-"+sectorNews);
	   //System.out.println("No. of sectors"+sectorNews.size());
		return "success";
	}

}
