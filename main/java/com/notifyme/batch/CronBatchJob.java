package com.notifyme.batch;

import org.quartz.CronScheduleBuilder;
import org.quartz.JobBuilder;
import org.quartz.JobDetail;
import org.quartz.Scheduler;
import org.quartz.Trigger;
import org.quartz.TriggerBuilder;
import org.quartz.impl.StdSchedulerFactory;

import com.notifyme.utilities.BatchSearchUsingGoogleNewsApi;

public class CronBatchJob
{
    public static void main( String[] args ) throws Exception
    {
    	JobDetail job = JobBuilder.newJob(BatchSearchUsingGoogleNewsApi.class)
    			.withIdentity("dummyJobName", "group1").build();
    	

                 
    	Trigger trigger = TriggerBuilder
    			.newTrigger()
    			.withIdentity("dummyTriggerName", "group1")
    			.withSchedule(
    				CronScheduleBuilder.cronSchedule("0 0/30 * 1/1 * ? *"))
    			.build();

    		// schedule it
    		Scheduler scheduler = new StdSchedulerFactory().getScheduler();
    		scheduler.start();
    		scheduler.scheduleJob(job, trigger);



    }
}
