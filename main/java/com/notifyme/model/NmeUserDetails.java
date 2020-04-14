package com.notifyme.model;

import java.sql.Time;
import java.sql.Timestamp;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name="NME_USER_DETAILS")
public class NmeUserDetails {
	
	@Id
	@Column(name="USER_ID")
	private String userId;
	
	@Column(name="USER_NAME")
	private String userName;
	
	@Column(name="PASSWORD")
	private String password;
	
	@Column(name="PHONE_NUMBER")
	private String phoneNumber;
	
	@Column(name="USER_SOURCE")
	private String userSource;
	
	@Column(name="OLD_PASSWORD_1")
	private String oldPassword1;
	
	@Column(name="OLD_PASSWORD_2")
	private String oldPassword2;
	
	@Column(name="OLD_PASSWORD_3")
	private String oldPassword3;
	
	@Column(name="MOBILE_VERIFICATION_SW")
	private char mobileVerificationSw;
	
	@Column(name="MAIL_VERIFICATION_SW")
	private char mailVerificationSw;
	
	@Column(name="MOBILE_ALERT")
	private char mobileAlert;
	
	@Column(name="MAIL_ALERT")
	private char mailAlert;
	
	@Temporal(value = TemporalType.DATE)
	@Column(name="ACCOUNT_CREATION_DT")
	private Date accountCreationDt;

	public Date getAccountCreationDt() {
		return accountCreationDt;
	}

	public void setAccountCreationDt(Date accountCreationDt) {
		this.accountCreationDt = accountCreationDt;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getUserSource() {
		return userSource;
	}

	public void setUserSource(String userSource) {
		this.userSource = userSource;
	}

	public String getOldPassword1() {
		return oldPassword1;
	}

	public void setOldPassword1(String oldPassword1) {
		this.oldPassword1 = oldPassword1;
	}

	public String getOldPassword2() {
		return oldPassword2;
	}

	public void setOldPassword2(String oldPassword2) {
		this.oldPassword2 = oldPassword2;
	}

	public String getOldPassword3() {
		return oldPassword3;
	}

	public void setOldPassword3(String oldPassword3) {
		this.oldPassword3 = oldPassword3;
	}

	public char getMobileVerificationSw() {
		return mobileVerificationSw;
	}

	public void setMobileVerificationSw(char mobileVerificationSw) {
		this.mobileVerificationSw = mobileVerificationSw;
	}

	public char getMailVerificationSw() {
		return mailVerificationSw;
	}

	public void setMailVerificationSw(char mailVerificationSw) {
		this.mailVerificationSw = mailVerificationSw;
	}

	public char getMobileAlert() {
		return mobileAlert;
	}

	public void setMobileAlert(char mobileAlert) {
		this.mobileAlert = mobileAlert;
	}

	public char getMailAlert() {
		return mailAlert;
	}

	public void setMailAlert(char mailAlert) {
		this.mailAlert = mailAlert;
	}
}
