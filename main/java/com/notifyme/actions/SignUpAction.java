package com.notifyme.actions;

import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import org.hibernate.criterion.Restrictions;
import org.json.simple.JSONObject;

import com.notifyme.model.NmeArticleDetail;
import com.notifyme.model.NmeUserDetails;
import com.notifyme.utilities.SendEmailController;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.util.ValueStack;

@SuppressWarnings("deprecation")
public class SignUpAction  {
	
	private String userName ;
	private String userId ;
	private String password ;
	
	private NmeUserDetails userDetails;
	
	
	public String getUserName() {
		return userName;
	}


	public void setUserName(String userName) {
		this.userName = userName;
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public NmeUserDetails getUserDetails() {
		return userDetails;
	}


	public void setUserDetails(NmeUserDetails userDetails) {
		this.userDetails = userDetails;
	}


	public String execute(){
		
		System.out.println("fetch userid"+this.getUserId());
		    
		SessionFactory sessionFactory =buildSessionFactory();
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		String loggedinusername = "";
		
		Criteria cr = session.createCriteria(NmeUserDetails.class);
	    cr.add(Restrictions.eq("userId",userId));

	    List<NmeUserDetails> result = (List<NmeUserDetails>)cr.list();
	    
	    if(result.size()==0) {
	    	
	    	NmeUserDetails userDetails = new NmeUserDetails();
	    	userDetails.setUserId(userId);
	    	userDetails.setUserName(userName);
	    	userDetails.setPassword(password);
	    	userDetails.setAccountCreationDt(new Date());
	    	
	    	session.save(userDetails);
	    	session.getTransaction().commit();
			session.close();
            //SendEmailController.sendMail("Welcome");			
			setUserDetails(userDetails);
			 
		      return "success";
			//return "success";
			
	    }else {
	    	
	    	return "error";
	    	//return "loginRedirect";
	    }
	     
	   }


	private SessionFactory buildSessionFactory() {
		// TODO Auto-generated method stub
		return null;
	}

}
