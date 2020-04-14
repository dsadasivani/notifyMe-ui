package com.notifyme.actions;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.notifyme.model.NmeNotificationsMaster;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.util.ValueStack;

public class InternationalNewsLoadAction extends ActionSupport{
	
	private static final long serialVersionUID = 1L;
	
	public List<NmeNotificationsMaster> getNewsList() {
		return intNewsList;
	}


	public void setNewsList(List<NmeNotificationsMaster> intNewsList) {
		this.intNewsList = intNewsList;
	}


	List<NmeNotificationsMaster> intNewsList=new ArrayList<NmeNotificationsMaster>();
	


	public String execute(){
		
		
		intNewsList=NotificationsDataPersistUtil.getIntDataFromDB();
		ValueStack stack = ActionContext.getContext().getValueStack();
	    Map<String, Object> context = new HashMap<String, Object>();
	    context.put("internationalNewsList",intNewsList); 
        stack.push(context);
	     System.out.println("international news size"+intNewsList.size());
	   
		return "success";
	}

}
