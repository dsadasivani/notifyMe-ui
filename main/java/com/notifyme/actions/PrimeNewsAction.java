package com.notifyme.actions;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.notifyme.model.NmeNotificationsMaster;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.util.ValueStack;

public class PrimeNewsAction extends ActionSupport{
	
	private static final long serialVersionUID = 1L;
	
	public List<NmeNotificationsMaster> getNewsList() {
		return newsList;
	}


	public void setNewsList(List<NmeNotificationsMaster> newsList) {
		this.newsList = newsList;
	}


	List<NmeNotificationsMaster> newsList=new ArrayList<NmeNotificationsMaster>();
	


	public String execute(){
		
		
		newsList=NotificationsDataPersistUtil.getPrimeNewsFromDB();
		
		for(int i=0;i<newsList.size();i++) {
			String pattern = "E, dd MMMM ''yy hh:mm a z";
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
			String date = simpleDateFormat.format(newsList.get(i).getArticlePublishDate());
			newsList.get(i).setDisplayDate(date);
		} 
		
		ValueStack stack = ActionContext.getContext().getValueStack();
	    Map<String, Object> context = new HashMap<String, Object>();
	    context.put("newsList",newsList); 
        stack.push(context);
	     
	   System.out.println("newsList"+newsList);
	   System.out.println("newsList size"+newsList.size());
		return "success";
	}

}
