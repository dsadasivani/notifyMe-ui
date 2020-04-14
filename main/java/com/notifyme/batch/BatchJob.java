package com.notifyme.batch;

import org.quartz.JobBuilder;
import org.quartz.JobDetail;
import org.quartz.Scheduler;
import org.quartz.SimpleScheduleBuilder;
import org.quartz.Trigger;
import org.quartz.TriggerBuilder;
import org.quartz.impl.StdSchedulerFactory;

import com.notifyme.utilities.BatchSearchUsingGoogleNewsApi;

public class BatchJob
{
    public static void main( String[] args ) throws Exception
    {
    	JobDetail job = JobBuilder.newJob(BatchSearchUsingGoogleNewsApi.class)
    			.withIdentity("dummyJobName", "group1").build();
    	

                    //Quartz 1.6.3
    		// SimpleTrigger trigger = new SimpleTrigger();
    		// trigger.setStartTime(new Date(System.currentTimeMillis() + 1000));
    		// trigger.setRepeatCount(SimpleTrigger.REPEAT_INDEFINITELY);
    		// trigger.setRepeatInterval(30000);

    		// Trigger the job to run on the next round minute
    		Trigger trigger = TriggerBuilder
    			.newTrigger()
    			.withIdentity("dummyTriggerName", "group1")
    			.withSchedule(
    				SimpleScheduleBuilder.simpleSchedule()
    					.withIntervalInSeconds(100).repeatForever())
    			.build();

    		// schedule it
    		Scheduler scheduler = new StdSchedulerFactory().getScheduler();
    		scheduler.start();
    		scheduler.scheduleJob(job, trigger);



    }
}
