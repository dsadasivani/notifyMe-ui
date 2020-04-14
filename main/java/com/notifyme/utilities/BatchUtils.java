package com.notifyme.utilities;

import java.sql.Timestamp;
import java.text.Format;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.Metadata;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.service.ServiceRegistry;

import com.notifyme.model.NmeBatchRunControl;



/**
 * Batch Utility Class
 * @author Dilip Kumar Patnaik
 * @category Utility
 * 
 */
public class BatchUtils {
	
	public static final String BATCH_START = "STARTED";
	public static final String BATCH_ENDED = "ENDED";
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

	
	@SuppressWarnings("deprecation")
	public static Object[] initiateBatchProcess(String jobId) throws ParseException {
		
		Object[] obj = new Object[2];
		Timestamp lastRunTime = null;
		NmeBatchRunControl batchControl = new NmeBatchRunControl();
		Session session = getSessionFactory().openSession();
		session.beginTransaction();
		
		Query query = session.createQuery("from NmeBatchRunControl where jobId = :jobId order by startTime desc")
				.setParameter("jobId", jobId);
		query.setFirstResult(0);
		query.setMaxResults(1);
		
		List<NmeBatchRunControl> list = query.list();
		if(list.size()>0) {
			lastRunTime = list.get(0).getEndTime();
//			obj[0] = lastRunTime;
			batchControl.setJobId(jobId);
			batchControl.setJobStatus(BATCH_START);
			batchControl.setStartTime(lastRunTime);
			batchControl.setCreateDt(new Timestamp(System.currentTimeMillis()));
		}else {
			
			Timestamp date = new Timestamp(System.currentTimeMillis());
			Format formatter = new SimpleDateFormat("dd/MM/yyyy");
		    String s = formatter.format(date); 
		    SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
		    Date parsedDate = dateFormat.parse(s);
			
			lastRunTime = new java.sql.Timestamp(parsedDate.getTime());
			batchControl.setJobId(jobId);
			batchControl.setJobStatus(BATCH_START);
			batchControl.setStartTime(lastRunTime);
			batchControl.setCreateDt(new Timestamp(System.currentTimeMillis()));
		}
		session.save(batchControl);
		session.getTransaction().commit();
		
		obj[0] = batchControl.getRunId();
		
		obj[1] = lastRunTime;
		
		session.close();
		return obj;
	}
	
	public static void completeBatchProcess(String status, long runId) {
		NmeBatchRunControl batchControl = new NmeBatchRunControl();
		Session session = getSessionFactory().openSession();
		session.beginTransaction();
		
		Query query = session.createQuery("from NmeBatchRunControl where runId = :runId")
				.setParameter("runId", runId);
		List<NmeBatchRunControl> list = query.list();
		batchControl = list.get(0);
		batchControl.setEndTime(new Timestamp(System.currentTimeMillis()));
		batchControl.setJobStatus(status);
		
		session.getTransaction().commit();
		session.close();
	}
}
