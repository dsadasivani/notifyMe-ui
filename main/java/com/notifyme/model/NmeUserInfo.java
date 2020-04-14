package com.notifyme.model;


import javax.persistence.*;

@Entity
@Table(name = "NME_USER_INFO",schema="ADMIN")
public class NmeUserInfo {

	
	
	/*@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="user_sequence")
	@SequenceGenerator(
		name="user_sequence",
		sequenceName="user_sequence",
		allocationSize=20
	)	*/
	@Id
	@Column(name = "user_id")
	private long userId;
	
	@Column(name = "name")
	private String name;
	
	@Column(name = "email_id")
	private String emailId;
	
	@Column(name = "mobile_no")
	private String mobileNo;
	
	@Column(name = "mobile_vrf_sw")
	private char mobileVrfSw;
	
	@Column(name = "email_vrf_sw")
	private char emailVrfSw;
	
	@Column(name = "mobile_alert")
	private char mobileAlert;
	
	@Column(name = "password")
	private String password;

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public long getUserId() {
		return userId;
	}

	public void setUserId(long userId) {
		this.userId = userId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmailId() {
		return emailId;
	}

	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}

	public String getMobileNo() {
		return mobileNo;
	}

	public void setMobileNo(String mobileNo) {
		this.mobileNo = mobileNo;
	}

	public char getMobileVrfSw() {
		return mobileVrfSw;
	}

	public void setMobileVrfSw(char mobileVrfSw) {
		this.mobileVrfSw = mobileVrfSw;
	}

	public char getEmailVrfSw() {
		return emailVrfSw;
	}

	public void setEmailVrfSw(char emailVrfSw) {
		this.emailVrfSw = emailVrfSw;
	}

	public char getMobileAlert() {
		return mobileAlert;
	}

	public void setMobileAlert(char mobileAlert) {
		this.mobileAlert = mobileAlert;
	}
	
	
}