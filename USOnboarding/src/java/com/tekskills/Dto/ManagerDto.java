package com.tekskills.Dto;

public class ManagerDto {
	
	private int mgrEmpNo;
	private String mgrEmpName;
	private String hrName;
	private String userName;
	private String fullName;
	private String ctName;
	private String emailId;
	
	public String getEmailId() {
		return emailId;
	}
	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getFullName() {
		return fullName;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	public int getMgrEmpNo() {
		return mgrEmpNo;
	}
	public void setMgrEmpNo(int mgrEmpNo) {
		this.mgrEmpNo = mgrEmpNo;
	}
	public String getMgrEmpName() {
		return mgrEmpName;
	}
	public void setMgrEmpName(String mgrEmpName) {
		this.mgrEmpName = mgrEmpName;
	}
	public String getHrName() {
		return hrName;
	}
	public void setHrName(String hrName) {
		this.hrName = hrName;
	}
	public String getCtName() {
		return ctName;
	}
	public void setCtName(String ctName) {
		this.ctName = ctName;
	}
	
}
