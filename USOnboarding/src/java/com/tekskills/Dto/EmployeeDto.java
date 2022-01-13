package com.tekskills.Dto;

import java.util.Date;
import java.util.List;

import com.tekskills.Entity.EmpDocumentsEntity;
import com.tekskills.Entity.PageStatusEntity;

public class EmployeeDto {
	
	private int candidateId;
	private String message;
	private String empType;
	private PageStatusEntity pageStsObj;
	private int docstatus;
	private List<EmpDocumentsEntity> empdocList;
	private int emp_number;
	private String emp_type;
	private String full_name;
	private String username;
	private int bankstatus;
	private int clientstatus;
	private String joiningdate;
	private Date joining_date;
	private String work_authorization;
	private String emailid;
	private String billing;
	
	private String jsonString;
	private Integer productId;
	
	public String getEmailid() {
		return emailid;
	}
	public void setEmailid(String emailid) {
		this.emailid = emailid;
	}
	public String getWork_authorization() {
		return work_authorization;
	}
	public void setWork_authorization(String work_authorization) {
		this.work_authorization = work_authorization;
	}
	public int getBankstatus() {
		return bankstatus;
	}
	public void setBankstatus(int bankstatus) {
		this.bankstatus = bankstatus;
	}
	public int getClientstatus() {
		return clientstatus;
	}
	public void setClientstatus(int clientstatus) {
		this.clientstatus = clientstatus;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getEmpType() {
		return empType;
	}
	public void setEmpType(String empType) {
		this.empType = empType;
	}
	public PageStatusEntity getPageStsObj() {
		return pageStsObj;
	}
	public void setPageStsObj(PageStatusEntity pageStsObj) {
		this.pageStsObj = pageStsObj;
	}
	public int getDocstatus() {
		return docstatus;
	}
	public void setDocstatus(int docstatus) {
		this.docstatus = docstatus;
	}
	public List<EmpDocumentsEntity> getEmpdocList() {
		return empdocList;
	}
	public void setEmpdocList(List<EmpDocumentsEntity> empdocList) {
		this.empdocList = empdocList;
	}
	public int getCandidateId() {
		return candidateId;
	}
	public void setCandidateId(int candidateId) {
		this.candidateId = candidateId;
	}
	public int getEmp_number() {
		return emp_number;
	}
	public void setEmp_number(int emp_number) {
		this.emp_number = emp_number;
	}
	public String getEmp_type() {
		return emp_type;
	}
	public void setEmp_type(String emp_type) {
		this.emp_type = emp_type;
	}
	public String getFull_name() {
		return full_name;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public void setFull_name(String full_name) {
		this.full_name = full_name;
	}
	public String getJoiningdate() {
		return joiningdate;
	}
	public void setJoiningdate(String joiningdate) {
		this.joiningdate = joiningdate;
	}
	public Date getJoining_date() {
		return joining_date;
	}
	public void setJoining_date(Date joining_date) {
		this.joining_date = joining_date;
	}
	public String getBilling() {
		return billing;
	}
	public void setBilling(String billing) {
		this.billing = billing;
	}
	public String getJsonString() {
		return jsonString;
	}
	public void setJsonString(String jsonString) {
		this.jsonString = jsonString;
	}
	public Integer getProductId() {
		return productId;
	}
	public void setProductId(Integer productId) {
		this.productId = productId;
	}

}
