package com.notifyme.actions;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import org.hibernate.criterion.Restrictions;

import com.notifyme.model.NmeArticleDetail;
import com.notifyme.model.NmeUserDetails;

@SuppressWarnings("deprecation")
public class FacebookLoginAction  {
	
	private String userName ;
	private String userId ;
	private String source ;
	private NmeUserDetails UserDetails;

	
	
	public NmeUserDetails getUserDetails() {
		return UserDetails;
	}


	public void setUserDetails(NmeUserDetails userDetails) {
		this.UserDetails = userDetails;
	}


	public String getSource() {
		return source;
	}


	public void setSource(String source) {
		this.source = source;
	}


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


	

	public String execute(){
		
		System.out.println("fetch userid"+this.getUserId());
		SessionFactory sessionFactory = buildSessionFactory();
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		
		
		Criteria cr = session.createCriteria(NmeUserDetails.class);
	    cr.add(Restrictions.eq("userId",userId));
	    cr.add(Restrictions.eq("userSource", source));

	    List<NmeUserDetails> result = (List<NmeUserDetails>)cr.list();
	    
	    if(result.size()==0) {
	    	
	    	NmeUserDetails userDetails = new NmeUserDetails();
	    	userDetails.setUserId(userId);
	    	userDetails.setUserName(userName);
	    	userDetails.setUserSource(source);
	    	userDetails.setAccountCreationDt(new Date());
	    	
	    	session.save(userDetails);
	    	session.getTransaction().commit();
			session.close();
			
			this.setUserDetails(userDetails);
			return "success";
			
	    }else {
	    	this.setUserDetails(result.get(0));
	    	return "success";
	    }
	     
	   }


	private SessionFactory buildSessionFactory() {
		// TODO Auto-generated method stub
		return null;
	}

}
