package com.notifyme.actions;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.notifyme.model.NmeNotificationsMaster;
import com.notifyme.model.NmeUserInfo;
import com.notifyme.utilities.PasswordEncryptUtil;
import com.opensymphony.xwork2.ActionSupport;

public class LoginValidateActionSession extends ActionSupport implements SessionAware {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String pswd;
	private String email;
	
	private Map<String, Object> sessionMap;
    
    @Override
    public void setSession(Map<String, Object> sessionMap) {
        this.sessionMap = sessionMap;
    }
	
	public List<NmeNotificationsMaster> getNewsList() {
		return newsList;
	}


	public void setNewsList(List<NmeNotificationsMaster> newsList) {
		this.newsList = newsList;
	}


	List<NmeNotificationsMaster> newsList=new ArrayList<NmeNotificationsMaster>();
	


	public String getPswd() {
		return pswd;
	}


	public void setPswd(String pswd) {
		this.pswd = pswd;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String execute(){
		
		NmeUserInfo ui=new NmeUserInfo();
		
		
		ui.setPassword(PasswordEncryptUtil.generateHash(this.getPswd()));
		ui.setEmailId(this.getEmail());
		
		boolean userExists=UserDataPersistUtil.getUserFromDB(ui);
		
		
		if(userExists)
		{
			newsList=NotificationsDataPersistUtil.getDataFromDB();
		}
		
		
		
		 
	    if(userExists)  
	    return "success";
	    else
	    return "error";
	     
	   }
	
	 public String logout() {
	        // remove userName from the session
	        if (sessionMap.containsKey("userName")) {
	            sessionMap.remove("userName");
	        }
	        return SUCCESS;
	    }
	 
	 

}
