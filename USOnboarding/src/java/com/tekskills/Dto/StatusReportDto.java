package com.tekskills.Dto;

public class StatusReportDto {
	private int template_id; 
	private String month;
	private String period;
	private Integer year; 
	private String period_name;
	private String status;
	private Integer posted_by;
	private Integer status_report_id; 
	private Integer candidate_id; 
	private String fullname;
	private String clientName;
	private String clientAddress; 
	private String projectName;
	private String deliverables;
	private String outputs;
	private String challenges;
	private String comments;
	private String approvedby;
	private String customer_name;
	private String submitted_date;
	private Integer toprecord;
	
	public int getTemplate_id() {
		return template_id;
	}
	public String getFullname() {
		return fullname;
	}
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	public void setTemplate_id(int template_id) {
		this.template_id = template_id;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public String getPeriod() {
		return period;
	}
	public void setPeriod(String period) {
		this.period = period;
	}
	public Integer getYear() {
		return year;
	}
	public void setYear(Integer year) {
		this.year = year;
	}
	public String getPeriod_name() {
		return period_name;
	}
	public void setPeriod_name(String period_name) {
		this.period_name = period_name;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Integer getPosted_by() {
		return posted_by;
	}
	public void setPosted_by(Integer posted_by) {
		this.posted_by = posted_by;
	}
	public Integer getStatus_report_id() {
		return status_report_id;
	}
	public void setStatus_report_id(Integer status_report_id) {
		this.status_report_id = status_report_id;
	}
	public Integer getCandidate_id() {
		return candidate_id;
	}
	public void setCandidate_id(Integer candidate_id) {
		this.candidate_id = candidate_id;
	}
	public String getClientName() {
		return clientName;
	}
	public void setClientName(String clientName) {
		this.clientName = clientName;
	}
	public String getClientAddress() {
		return clientAddress;
	}
	public void setClientAddress(String clientAddress) {
		this.clientAddress = clientAddress;
	}
	public String getProjectName() {
		return projectName;
	}
	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}
	public String getDeliverables() {
		return deliverables;
	}
	public void setDeliverables(String deliverables) {
		this.deliverables = deliverables;
	}
	public String getOutputs() {
		return outputs;
	}
	public void setOutputs(String outputs) {
		this.outputs = outputs;
	}
	public String getChallenges() {
		return challenges;
	}
	public void setChallenges(String challenges) {
		this.challenges = challenges;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	public String getApprovedby() {
		return approvedby;
	}
	public void setApprovedby(String approvedby) {
		this.approvedby = approvedby;
	}
	public String getCustomer_name() {
		return customer_name;
	}
	public void setCustomer_name(String customer_name) {
		this.customer_name = customer_name;
	}
	public String getSubmitted_date() {
		return submitted_date;
	}
	public void setSubmitted_date(String submitted_date) {
		this.submitted_date = submitted_date;
	}
	public Integer getToprecord() {
		return toprecord;
	}
	public void setToprecord(Integer toprecord) {
		this.toprecord = toprecord;
	}

}
