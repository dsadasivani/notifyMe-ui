package com.notifyme.actions;


import org.hibernate.SessionFactory;


import com.notifyme.model.NmeUserInfo;

public class SignupSaveDataAction {
	private String name;
	private String emailId;
	private String mobileNo;
	private String password;
	
	
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
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

	public String execute()
	{
		/*System.out.println("In Signup save Action");
		System.out.println(this.getEmailId());
		NmeUserInfo ui=new NmeUserInfo();
		ui.setUserId(1);
		ui.setPassword(this.getPassword());
		ui.setEmailId(this.getEmailId());
		ui.setMobileNo(this.getMobileNo());
		ui.setName(this.getName());
		UserDataPersistUtil.persistNewUserToDB(ui);*/
		
	    return "success";
	     
	}

}
