package com.notifyme.utilities;

import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.LinkedList;
import java.util.List;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.Metadata;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;

import org.hibernate.service.ServiceRegistry;

import com.notifyme.model.NmeNotificationsMaster;
import com.notifyme.model.NmeStockWeightage;
import com.notifyme.model.NmeUserDetails;

@SuppressWarnings("deprecation")
public class PrimeNewsUtility {

private static SessionFactory factory; 
	
	static {
		try {
			factory = buildSessionFactory();
		
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
	
	public static List<NmeNotificationsMaster> getPrimeNewsList(List<NmeNotificationsMaster> newsList) {
		
		List<NmeNotificationsMaster> primeList = new LinkedList<>();
		Session session = getSessionFactory().openSession();
		session.beginTransaction();
		
		SQLQuery query = session.createSQLQuery("SELECT * FROM NME_STOCK_WEIGHTAGE WHERE OCCURANCE_WEIGHTED_AVERAGE > 0 ORDER BY OCCURANCE_WEIGHTED_AVERAGE DESC  ");
		query.addEntity(NmeStockWeightage.class);
		List<NmeStockWeightage> weightedList = query.list();
		for(NmeStockWeightage obj : weightedList) {
			List<NmeNotificationsMaster> tempNews = new LinkedList<>();
			for(NmeNotificationsMaster news : newsList) {
				if(news.getNewsKey().equalsIgnoreCase(obj.getStockId())){
					tempNews.add(news);
//					newsList.remove(news);
				}
			}
			if(tempNews.size()>1) {
			Collections.sort(tempNews, new Comparator<NmeNotificationsMaster>() {
				  public int compare(NmeNotificationsMaster o1, NmeNotificationsMaster o2) {
				      return o2.getArticlePublishDate().compareTo(o1.getArticlePublishDate());
				  }
				});
			primeList.add(tempNews.get(0));
			}else if(tempNews.size()>0) primeList.add(tempNews.get(0));
		}
		
		return primeList;
	}
}
