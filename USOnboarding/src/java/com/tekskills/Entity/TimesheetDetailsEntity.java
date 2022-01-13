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
@Table(name="Tbl_TimesheetDetails")
public class TimesheetDetailsEntity {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="timesheet_details_id")
	private int timesheet_details_id; 
	
	@Column(name="timesheet_id")
	private int timesheet_id;
	
	@Column(name="candidate_id")
	private int candidate_id;
	
	@Column(name="date")
	private String date;
	
	@Column(name="billable_hours")
	private String billable_hours;
	
	@Column(name="invoice_status")
	private String invoice_status;
	@Column(name="qbinvoice_id")
	private Integer qbinvoice_id;
	
	public Integer getQbinvoice_id() {
		return qbinvoice_id;
	}

	public void setQbinvoice_id(Integer qbinvoice_id) {
		this.qbinvoice_id = qbinvoice_id;
	}

	public String getInvoice_status() {
		return invoice_status;
	}

	public void setInvoice_status(String invoice_status) {
		this.invoice_status = invoice_status;
	}

	public String getOver_time() {
		return over_time;
	}

	public void setOver_time(String over_time) {
		this.over_time = over_time;
	}

	@Column(name="nonbillable_hours")
	private String nonbillable_hours;
	
	@Column(name="over_time")
	private String over_time;
	
	@Column(name="leaves")
	private String leaves;
	
	public String getLeaves() {
		return leaves;
	}

	public void setLeaves(String leaves) {
		this.leaves = leaves;
	}

	public String getDay_name() {
		return day_name;
	}

	public void setDay_name(String day_name) {
		this.day_name = day_name;
	}

	@Column(name="comments")
	private String comments;
	
	@Column(name="day_name")
	private String day_name;

	public int getTimesheet_details_id() {
		return timesheet_details_id;
	}

	public void setTimesheet_details_id(int timesheet_details_id) {
		this.timesheet_details_id = timesheet_details_id;
	}

	public int getTimesheet_id() {
		return timesheet_id;
	}

	public void setTimesheet_id(int timesheet_id) {
		this.timesheet_id = timesheet_id;
	}

	public int getCandidate_id() {
		return candidate_id;
	}

	public void setCandidate_id(int candidate_id) {
		this.candidate_id = candidate_id;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getBillable_hours() {
		return billable_hours;
	}

	public void setBillable_hours(String billable_hours) {
		this.billable_hours = billable_hours;
	}

	public String getNonbillable_hours() {
		return nonbillable_hours;
	}

	public void setNonbillable_hours(String nonbillable_hours) {
		this.nonbillable_hours = nonbillable_hours;
	}

	

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}
	
	
	
}
