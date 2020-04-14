package com.notifyme.model;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "NME_STOCK_WEIGHTAGE_A")
public class NmeStockWeightageAudit {
	
	@Id  @GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name="ID")
	private long Id;
	
	@Column(name= "STOCK_ID")
	private String stockId;

	@Column(name= "OCCURANCE_WEIGHTED_AVERAGE")
	private double occuranceWeightedAvg; 
	
	@Column(name= "MANUAL_OVERRIDE_SW")
	private char manualOverrideSw;
	
	@Column(name= "CURRENT_DAY_INDICATOR")
	private char currentDayIndicator;
	
	@Column(name= "CREATE_DT")
	private Timestamp createDt;
	
	@Column(name= "AUDIT_DATE")
	private Timestamp auditDate = new Timestamp(System.currentTimeMillis());

	public String getStockId() {
		return stockId;
	}

	public void setStockId(String stockId) {
		this.stockId = stockId;
	}

	public double getOccuranceWeightedAvg() {
		return occuranceWeightedAvg;
	}

	public void setOccuranceWeightedAvg(double occuranceWeightedAvg) {
		this.occuranceWeightedAvg = occuranceWeightedAvg;
	}

	public char getManualOverrideSw() {
		return manualOverrideSw;
	}

	public void setManualOverrideSw(char manualOverrideSw) {
		this.manualOverrideSw = manualOverrideSw;
	}

	public char getCurrentDayIndicator() {
		return currentDayIndicator;
	}

	public void setCurrentDayIndicator(char currentDayIndicator) {
		this.currentDayIndicator = currentDayIndicator;
	}

	public Timestamp getCreateDt() {
		return createDt;
	}

	public void setCreateDt(Timestamp createDt) {
		this.createDt = createDt;
	}
	
	public Timestamp getAuditDate() {
		return auditDate;
	}

	public void setAuditDate(Timestamp auditDate) {
		this.auditDate = auditDate;
	}
	public long getId() {
		return Id;
	}

	public void setId(long id) {
		Id = id;
	}
}
