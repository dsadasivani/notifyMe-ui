package com.notifyme.model;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "NME_BATCH_RUN_CONTROL")
public class NmeBatchRunControl {
	
	@Id @GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name="RUN_ID")
	private long runId;
	
	@Column(name="JOB_ID")
	private String jobId;
	
	@Column(name="JOB_STATUS")
	private String jobStatus;
	
	@Column(name="START_TIME")
	private Timestamp startTime;
	
	@Column(name="END_TIME")
	private Timestamp endTime;
	
	@Column(name="CREATE_DT")
	private Timestamp createDt;
	
//	private long runNum;

	public Timestamp getCreateDt() {
		return createDt;
	}

	public void setCreateDt(Timestamp createDt) {
		this.createDt = createDt;
	}

	public long getRunId() {
		return runId;
	}

	public void setRunId(long runId) {
		this.runId = runId;
	}

	public String getJobId() {
		return jobId;
	}

	public void setJobId(String jobId) {
		this.jobId = jobId;
	}

	public String getJobStatus() {
		return jobStatus;
	}

	public void setJobStatus(String jobStatus) {
		this.jobStatus = jobStatus;
	}

	public Timestamp getStartTime() {
		return startTime;
	}

	public void setStartTime(Timestamp startTime) {
		this.startTime = startTime;
	}

	public Timestamp getEndTime() {
		return endTime;
	}

	public void setEndTime(Timestamp endTime) {
		this.endTime = endTime;
	}
	
}
