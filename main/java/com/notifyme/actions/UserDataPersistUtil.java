package com.notifyme.actions;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.boot.Metadata;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.criterion.Restrictions;
import org.hibernate.service.ServiceRegistry;

import com.notifyme.model.NmeUserInfo;
import com.notifyme.utilities.PasswordEncryptUtil;

@SuppressWarnings("deprecation")
public class UserDataPersistUtil {
	
	private static SessionFactory factory;
	static
	{
		
		
		
		factory =buildSessionFactory();	
	}
		 /* public static void main(String[] args) {
		      
		      try {
		         factory = new AnnotationConfiguration().
		                   configure().               
		                   addAnnotatedClass(NotificationsMaster.class).
		                   buildSessionFactory();
		      } catch (Throwable ex) { 
		         System.err.println("Failed to create sessionFactory object." + ex);
		         throw new ExceptionInInitializerError(ex); 
		      }
		      
		      NotificationsMaster nm = new NotificationsMaster();
		      Session session = factory.openSession();
		      Transaction tx = null;
		      tx = session.beginTransaction();
		      nm.setArticlePublishDate(new Timestamp(System.currentTimeMillis()));
		      nm.setCreatedDate(new Timestamp(System.currentTimeMillis()));
		      nm.setDetailedNews("Hi");
		      nm.setNewsLink("Google.com");
		      
		      nm.setPreference("STOCKS");
		      nm.setShortNews("Hello");
		      session.save(nm);
		      tx.commit();
		    
		         session.close(); 
		      
		     
		     
		   }*/
		  

		  
		  public static void persistNewUserToDB(NmeUserInfo ui2)
		  {
			  	  System.out.println("User Perists");
			  	  NmeUserInfo ui = new NmeUserInfo();
			      Session session = factory.openSession();
			      Transaction tx = null;
			      tx = session.beginTransaction();
			      ui.setEmailId(ui2.getEmailId());
			      //ui.setEmailVrfSw(userInfo.getEmailVrfSw());
			     // ui.setMobileAlert(userInfo.getMobileAlert());
			      ui.setMobileNo(ui2.getMobileNo());
			      
			      ui.setPassword(PasswordEncryptUtil.generateHash(ui2.getPassword()));
			      //ui.setMobileVrfSw(userInfo.getMobileVrfSw());
			      ui.setName(ui2.getName());
			      ui.setEmailVrfSw('Y');
			      ui.setMobileVrfSw('Y');
			      ui.setMobileAlert('N');
			      session.save(ui);
			      tx.commit();
			    
			         session.close(); 
			  
		  }
		  
		  private static SessionFactory buildSessionFactory() {
			  try {
		            // Create the ServiceRegistry from hibernate.cfg.xml
		            ServiceRegistry serviceRegistry = new StandardServiceRegistryBuilder()//
		                    .configure("hibernate.cfg.xml").build();
		 
		            // Create a metadata sources using the specified service registry.
		            Metadata metadata = new MetadataSources(serviceRegistry).getMetadataBuilder().build();
		 
		            return metadata.getSessionFactoryBuilder().build();
		        } catch (Throwable ex) {
		         
		            System.err.println("Initial SessionFactory creation failed." + ex);
		            throw new ExceptionInInitializerError(ex);
		        }
		}

		public static boolean getUserFromDB(NmeUserInfo ui2)
		  {
			  	 
			  	  NmeUserInfo ui = new NmeUserInfo();
			      Session session = factory.openSession();
			      Transaction tx = null;
			      tx = session.beginTransaction();
			      Criteria crit=session.createCriteria(NmeUserInfo.class);
			      crit.add(Restrictions.eq("password", ui2.getPassword()));
			      crit.add(Restrictions.eq("emailId", ui2.getEmailId()));
			      System.out.println(crit.toString());
			      List<NmeUserInfo> results=crit.list();
			      tx.commit();
			      session.close(); 
			      if(results.size()>0)
			    	  return true;
			      else
			    	  return false;
			  
		  }
}
