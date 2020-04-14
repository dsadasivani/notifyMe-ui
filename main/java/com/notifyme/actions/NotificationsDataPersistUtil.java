package com.notifyme.actions;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.boot.Metadata;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.hibernate.service.ServiceRegistry;
import org.json.simple.parser.ParseException;

import com.notifyme.model.NmeArticleDetail;
import com.notifyme.model.NmeNotificationsMaster;
import com.notifyme.utilities.PrimeNewsUtility;





@SuppressWarnings("deprecation")
public class NotificationsDataPersistUtil {
	
	private static SessionFactory factory;

	static {
		try {
			factory =buildSessionFactory();
		} catch (Throwable ex) {
			System.err.println("Initial SessionFactory creation failed." + ex);
			throw new ExceptionInInitializerError(ex);
		}
	}

	public static SessionFactory getSessionFactory() {
		return factory;
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

	public static void persistNewsToDB(List<NmeNotificationsMaster> notifyList) throws HibernateException, IOException, ParseException
		  {
		
		System.out.println("Persisting STart >>>>"+notifyList.size());
		try {
				Set newsSet = new HashSet();
				Set urlLastStringSet=new HashSet();
				for (int i = 0; i < notifyList.size(); i++) {
					if(newsSet.add(notifyList.get(i).getNewsLink()) 
							  && urlLastStringSet.add(notifyList.get(i).getNewsLink().substring(notifyList.get(i).getNewsLink().lastIndexOf("/")+1, 
									  notifyList.get(i).getNewsLink().length())) /*&& DomainFiltering.indianWebsite(notifyList.get(i).getNewsLink())*/)
			    	  {

				NmeNotificationsMaster nm = new NmeNotificationsMaster();
				Session session = factory.openSession();
				Transaction tx = null;
				tx = session.beginTransaction();
				nm.setArticlePublishDate(notifyList.get(i).getArticlePublishDate());
				nm.setCreatedDate(new Timestamp(System.currentTimeMillis()));
				nm.setDetailedNews(notifyList.get(i).getDetailedNews());
				nm.setNewsLink(notifyList.get(i).getNewsLink());
				nm.setPreference(notifyList.get(i).getPreference());
				nm.setShortNews(notifyList.get(i).getShortNews());
				if(notifyList.get(i).getImageUrl()!=null)
				{
					/*if(BrokenImageUtil.imageAvailable(notifyList.get(i).getImageUrl()))
					{
						nm.setImageUrl(notifyList.get(i).getImageUrl());
						nm.setImageAvailable("Y");
					}
					else
					{
						nm.setImageAvailable("N");
					}*/
				}
				
				nm.setLocalImageUrl(notifyList.get(i).getLocalImageUrl());
				nm.setSector(notifyList.get(i).getSector());
				nm.setNewsKey(notifyList.get(i).getNewsKey());
				session.save(nm);
				tx.commit();
				session.close();
			}
			  }
		}
		catch(Exception e)
		{
			System.out.println("Exception while persisting");
		}
		  }
	
	public static void persistIntNewsToDB(List<NmeNotificationsMaster> notifyList) throws HibernateException, IOException, ParseException
	  {
			Set newsSet = new HashSet();
			Set urlLastStringSet=new HashSet();
			for (int i = 0; i < notifyList.size(); i++) {
				
			NmeNotificationsMaster nm = new NmeNotificationsMaster();
			Session session = factory.openSession();
			Transaction tx = null;
			tx = session.beginTransaction();
			nm.setArticlePublishDate(notifyList.get(i).getArticlePublishDate());
			nm.setCreatedDate(new Timestamp(System.currentTimeMillis()));
			nm.setDetailedNews(notifyList.get(i).getDetailedNews());
			nm.setNewsLink(notifyList.get(i).getNewsLink());
			nm.setPreference(notifyList.get(i).getPreference());
			nm.setShortNews(notifyList.get(i).getShortNews());
			if(notifyList.get(i).getImageUrl()!=null)
			{
				/*if(BrokenImageUtil.imageAvailable(notifyList.get(i).getImageUrl()))
				{
					nm.setImageUrl(notifyList.get(i).getImageUrl());
					nm.setImageAvailable("Y");
				}
				else
				{
					nm.setImageAvailable("N");
				}*/
			}
			
			nm.setLocalImageUrl(notifyList.get(i).getLocalImageUrl());
			session.save(nm);
			tx.commit();
			session.close();
		
		  }
	  }
		  
		  @SuppressWarnings("unchecked")
		public static List<NmeNotificationsMaster> getDataFromDB()
		  {
			  
				  List<NmeNotificationsMaster> nm = new ArrayList<NmeNotificationsMaster>();
				  List<NmeNotificationsMaster> nm1 = new ArrayList<NmeNotificationsMaster>();

			      Session session = factory.openSession();
			      Transaction tx = null;
			      tx = session.beginTransaction();
			      //System.out.println("##################################################"+session.createQuery("from NmeNotificationsMaster").getQueryString());
			      nm=session.createQuery("from NmeNotificationsMaster").list();
			      
			      for (int i=0;i<nm.size();i++)
			      {
			    	  NmeNotificationsMaster nm2=new NmeNotificationsMaster();
			    	  nm2.setArticlePublishDate(nm.get(i).getArticlePublishDate());
			    	  nm2.setCreatedDate(nm.get(i).getCreatedDate());
			    	  nm2.setDetailedNews(nm.get(i).getDetailedNews());
			    	  nm2.setImageUrl(nm.get(i).getImageUrl());
			    	  nm2.setLocalImageUrl(nm.get(i).getLocalImageUrl());
			    	  nm2.setNewsLink(nm.get(i).getNewsLink());
			    	  nm2.setPreference(nm.get(i).getPreference());
			    	  nm2.setShortNews(nm.get(i).getShortNews());
			    	  nm2.setId(nm.get(i).getId());
			    	  nm2.setSector(nm.get(i).getSector());
			    	  nm2.setNewsKey(nm.get(i).getNewsKey());
			    	  //nm2.setImageAvailable(nm.get(i).getImageAvailable());
			    	  nm1.add(nm2);
			    	  
			      }
			      tx.commit();
			      session.close();
			      return nm1;
		  }
		  
		  
		  @SuppressWarnings("unchecked")
			public static List<NmeNotificationsMaster> getIntDataFromDB()
			  {
				  
					  List<NmeNotificationsMaster> nm = new ArrayList<NmeNotificationsMaster>();
					  List<NmeNotificationsMaster> nm1 = new ArrayList<NmeNotificationsMaster>();

				      Session session = factory.openSession();
				      Transaction tx = null;
				      tx = session.beginTransaction();
				      //System.out.println("##################################################"+session.createQuery("from NmeNotificationsMaster").getQueryString());
				      /*nm=session.createQuery("from NmeNotificationsMaster").list();*/
				      Criteria cr = session.createCriteria(NmeNotificationsMaster.class);
				      cr.add(Restrictions.eq("preference", "INTERNATIONAL"));
				      nm= cr.list();
				      for (int i=0;i<nm.size();i++)
				      {
				    	  NmeNotificationsMaster nm2=new NmeNotificationsMaster();
				    	  nm2.setArticlePublishDate(nm.get(i).getArticlePublishDate());
				    	  nm2.setCreatedDate(nm.get(i).getCreatedDate());
				    	  nm2.setDetailedNews(nm.get(i).getDetailedNews());
				    	  nm2.setImageUrl(nm.get(i).getImageUrl());
				    	  nm2.setLocalImageUrl(nm.get(i).getLocalImageUrl());
				    	  nm2.setNewsLink(nm.get(i).getNewsLink());
				    	  nm2.setPreference(nm.get(i).getPreference());
				    	  nm2.setShortNews(nm.get(i).getShortNews());
				    	  nm2.setId(nm.get(i).getId());
				    	  nm1.add(nm2);
				    	  
				      }
				      tx.commit();
				      session.close();
				      return nm1;
			  }

		public static void persistArticleToDB(
				ArrayList<NmeArticleDetail> detailRecList) {
			for (int i=0;i<detailRecList.size();i++)
			  {
				NmeArticleDetail nm = new NmeArticleDetail();
				  nm.setArticleContent(detailRecList.get(i).getArticleContent());
				  nm.setArticleId(detailRecList.get(i).getArticleId());
				  nm.setExtractionDate(new Timestamp(System.currentTimeMillis()));
			      Session session = factory.openSession();
			      Transaction tx = null;
			      tx = session.beginTransaction();			      
			     
			      session.save(nm);
			      tx.commit();			    
			      session.close(); 
			  }
			
		}
		
		
		
		/*public static List getStockKeys()
		{
			  List stockCodes=new ArrayList();
			  List<NmeStockMaster> nm = new ArrayList<NmeStockMaster>();
			  Session session = factory.openSession();
		      Transaction tx = null;
		      tx = session.beginTransaction();
		      Criteria cr = session.createCriteria(NmeStockMaster.class);	      
		      nm= cr.list();
		      for (int i=0;i<nm.size();i++)
		      {
		    	  stockCodes.add(nm.get(i).getSymbol());
		      }
		      
		      return stockCodes;
		}*/

		public static List<NmeNotificationsMaster> getRelatedNewsList(String sector) {
			
			  List<NmeNotificationsMaster> nm = new ArrayList<NmeNotificationsMaster>();
			  List<NmeNotificationsMaster> nm1 = new ArrayList<NmeNotificationsMaster>();

		      Session session = factory.openSession();
		      Transaction tx = null;
		      tx = session.beginTransaction();
		      Criteria cr = session.createCriteria(NmeNotificationsMaster.class);
		      cr.add(Restrictions.eq("sector", sector));
		      nm= cr.list();
		     
		      for (int i=0;i<nm.size();i++)
		      {
		    	  
		    	  NmeNotificationsMaster nm2=new NmeNotificationsMaster();
		    	  nm2.setArticlePublishDate(nm.get(i).getArticlePublishDate());
		    	  nm2.setCreatedDate(nm.get(i).getCreatedDate());
		    	  nm2.setDetailedNews(nm.get(i).getDetailedNews());
		    	  nm2.setImageUrl(nm.get(i).getImageUrl());
		    	  nm2.setLocalImageUrl(nm.get(i).getLocalImageUrl());
		    	  nm2.setNewsLink(nm.get(i).getNewsLink());
		    	  nm2.setPreference(nm.get(i).getPreference());
		    	  nm2.setShortNews(nm.get(i).getShortNews());
		    	  nm2.setId(nm.get(i).getId());
		    	  nm2.setSector(nm.get(i).getSector());
		    	  nm2.setNewsKey(nm.get(i).getNewsKey());
		    	  
		    	  nm1.add(nm2);
		    	  
		    }
		    	  
		      
		      tx.commit();
		      session.close();
		      return nm1;
		}

		public static List<NmeNotificationsMaster> getDataByKey(String newsKey) {
			
			  List<NmeNotificationsMaster> nm = new ArrayList<NmeNotificationsMaster>();
			  List<NmeNotificationsMaster> nm1 = new ArrayList<NmeNotificationsMaster>();

		      Session session = factory.openSession();
		      Transaction tx = null;
		      tx = session.beginTransaction();
		      
		      Timestamp startDate = null;
			  Timestamp endDate = null;
			  Calendar cal = Calendar.getInstance();
			  cal.set(Calendar.HOUR_OF_DAY, 0);
			  cal.clear(Calendar.MINUTE);
			  cal.clear(Calendar.SECOND);
			  cal.clear(Calendar.MILLISECOND);
				
			  startDate=new Timestamp(cal.getTime().getTime());
			  cal.add(Calendar.DATE, -200);
			  endDate = new Timestamp(cal.getTime().getTime());

		      
			  String hql = "select * FROM Nme_Notifications_Master WHERE "
			      		+ "newsKey =:news_key AND article_publish_date BETWEEN    :endDate and :startDate order by article_publish_date desc";
		      
			  SQLQuery query = session.createSQLQuery(hql);
			  query.addEntity(NmeNotificationsMaster.class);
			  query.setString("news_key",newsKey);
			  query.setTimestamp("startDate",startDate);
			  query.setTimestamp("endDate",endDate);
			  nm= (List<NmeNotificationsMaster>)query.list();
		      
		      for (int i=0;i<nm.size();i++)
		      {
		    	  
		    	  NmeNotificationsMaster nm2=new NmeNotificationsMaster();
		    	  nm2.setArticlePublishDate(nm.get(i).getArticlePublishDate());		    	
		    	  nm2.setShortNews(nm.get(i).getShortNews());
		    	  nm2.setId(nm.get(i).getId());
		    	  nm2.setSector(nm.get(i).getSector());		    	  
		    	  nm1.add(nm2);
		    	  
		    }
		    	  
		      
		      tx.commit();
		      session.close();
		      return nm1;
		}

		
		public static String getSectorById(String id) {
			  List<NmeNotificationsMaster> nm = new ArrayList<NmeNotificationsMaster>();
			  Session session = factory.openSession();
		      Transaction tx = null;
		      tx = session.beginTransaction();
		      Criteria cr = session.createCriteria(NmeNotificationsMaster.class);
		      cr.add(Restrictions.eq("id", Long.valueOf(id)));
		      nm= cr.list();
		      String sector="";
		      for (int i=0;i<nm.size();i++)
		      {
		    	  
		    	  sector=nm.get(i).getSector();
		    	  
		    	  
		    	  
		      } 
		    	  
		      
		      tx.commit();
		      session.close();
		      return sector;
		}
		
		 @SuppressWarnings("unchecked")
			public static List<NmeNotificationsMaster> getPrimeNewsFromDB()
			  {
				  
					  List<NmeNotificationsMaster> nm = new ArrayList<NmeNotificationsMaster>();
					  List<NmeNotificationsMaster> nm1 = new ArrayList<NmeNotificationsMaster>();

				      Session session = factory.openSession();
				      Transaction tx = null;
				      tx = session.beginTransaction();
				      //System.out.println("##################################################"+session.createQuery("from NmeNotificationsMaster").getQueryString());
				      Criteria cr = session.createCriteria(NmeNotificationsMaster.class);
					      cr.add(Restrictions.eq("preference", "STOCKS"));
					      //cr.addOrder(Order.desc("articlePublishDate"));
					      nm= cr.list();
				      for (int i=0;i<nm.size();i++)
				      {
				    	  if(i == 30){
				    		 // break;
				    	  }
				    	  NmeNotificationsMaster nm2=new NmeNotificationsMaster();
				    	  nm2.setArticlePublishDate(nm.get(i).getArticlePublishDate());
				    	  nm2.setCreatedDate(nm.get(i).getCreatedDate());
				    	  nm2.setDetailedNews(nm.get(i).getDetailedNews());
				    	  nm2.setImageUrl(nm.get(i).getImageUrl());
				    	  nm2.setLocalImageUrl(nm.get(i).getLocalImageUrl());
				    	  nm2.setNewsLink(nm.get(i).getNewsLink());
				    	  nm2.setPreference(nm.get(i).getPreference());
				    	  nm2.setShortNews(nm.get(i).getShortNews());
				    	  nm2.setId(nm.get(i).getId());
				    	  nm2.setSector(nm.get(i).getSector());
				    	  nm2.setNewsKey(nm.get(i).getNewsKey());
				    	  nm1.add(nm2);
				    	  
				      }
				      tx.commit();
				      session.close();
				      
				      return PrimeNewsUtility.getPrimeNewsList(nm1);
			  }
		 
		 public static List<NmeArticleDetail> getContentData(String id) {
			  List<NmeArticleDetail> nm = new ArrayList<NmeArticleDetail>();
			  NmeArticleDetail nm2=new NmeArticleDetail();
			  
		      Session session = factory.openSession();
		      Transaction tx = null;
		      tx = session.beginTransaction();		     
		      Criteria cr = session.createCriteria(NmeArticleDetail.class);
		      cr.add(Restrictions.eq("articleId",Long.valueOf(id)));
		      nm= cr.list();
		      String content="";
		      for (int i=0;i<nm.size();i++)
		      {		    	  
		    	  NmeArticleDetail nm1=new NmeArticleDetail();
		    	  nm1.setArticleContent(nm.get(i).getArticleContent());
		    	  nm1.setArticleId(nm.get(i).getArticleId());
		    	  nm1.setExcerpt(nm.get(i).getExcerpt());
		    	  nm1.setLeadImageUrl(nm.get(i).getLeadImageUrl());
		    	  nm1.setTitle(nm.get(i).getTitle());
		    	  //content=nm.get(i).getArticleContent();		    	  
		    	  
		      }
		      tx.commit();
		      session.close();
		      return nm;			
		}	 


		/*public static void updateStockData(List<NmeStockMaster> stockList) {
			
			
			for(int i=0;i<stockList.size();i++)
			{
				
			      Session session = factory.openSession();
			      Transaction tx = null;
			      tx = session.beginTransaction();    
			      session.saveOrUpdate("NME_STOCK_MASTER", stockList.get(i));
			      tx.commit();			    
			      session.close();
			      System.out.println("Updating Data For "+stockList.get(i).getSymbol());	
				
			}
			
		}*/
}		  
		  
