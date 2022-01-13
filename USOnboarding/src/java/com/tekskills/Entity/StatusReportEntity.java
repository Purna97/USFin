package com.tekskills.Entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
@Entity
@Table(name="Tbl_EmpStatusReports")
public class StatusReportEntity {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="status_report_id")
	private int status_report_id; 
	
	@Column(name="month")
	private String month;
	
	@Column(name="period")
	private String period;
	
	@Column(name="year")
	private Integer year; 
	
	@Column(name="period_name")
	private String period_name;
	@Column(name="status")
	private String status;
	
	@Column(name="deliverables")
	private String deliverables;
	
	@Column(name="outputs")
	private String outputs;
	
	@Column(name="challenges")
	private String challenges;
	  

	@Column(name="candidate_id")
	private int candidate_id; 
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="submitted_on")
	private Date submitted_on;
	
	@Column(name="approved_by")
	private int approved_by; 

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="approved_on")
	private Date approved_on;
	
	@Column(name="comments")
	private String comments;
	
	@Column(name="full_name")
	private String full_name;
	
	@Column(name="client_name")
	private String client_name;
	
	@Column(name="project_name")
	private String project_name;
	@Column(name="client_address")
	private String client_address;
	
	@Column(name="payrate_id")
	private Integer payrate_id;
	
	@Column(name="customer_id")
	private Integer customer_id;
	
	@Column(name="endclient_id")
	private Integer endclient_id;
	
	public String getFull_name() {
		return full_name;
	}

	public void setFull_name(String full_name) {
		this.full_name = full_name;
	}

	public String getClient_name() {
		return client_name;
	}

	public void setClient_name(String client_name) {
		this.client_name = client_name;
	}

	public String getProject_name() {
		return project_name;
	}

	public void setProject_name(String project_name) {
		this.project_name = project_name;
	}

	public String getClient_address() {
		return client_address;
	}

	public void setClient_address(String client_address) {
		this.client_address = client_address;
	}

	public Date getApproved_on() {
		return approved_on;
	}

	public void setApproved_on(Date approved_on) {
		this.approved_on = approved_on;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
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

	public int getStatus_report_id() {
		return status_report_id;
	}

	public void setStatus_report_id(int status_report_id) {
		this.status_report_id = status_report_id;
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

	public int getCandidate_id() {
		return candidate_id;
	}

	public Integer getPayrate_id() {
		return payrate_id;
	}

	public void setPayrate_id(Integer payrate_id) {
		this.payrate_id = payrate_id;
	}

	public Integer getCustomer_id() {
		return customer_id;
	}

	public void setCustomer_id(Integer customer_id) {
		this.customer_id = customer_id;
	}

	public Integer getEndclient_id() {
		return endclient_id;
	}

	public void setEndclient_id(Integer endclient_id) {
		this.endclient_id = endclient_id;
	}

	public void setCandidate_id(int candidate_id) {
		this.candidate_id = candidate_id;
	}

	public Date getSubmitted_on() {
		return submitted_on;
	}

	public void setSubmitted_on(Date submitted_on) {
		this.submitted_on = submitted_on;
	}

	public int getApproved_by() {
		return approved_by;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public void setApproved_by(int approved_by) {
		this.approved_by = approved_by;
	}
}
