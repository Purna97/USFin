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
@Table(name="Tbl_Timesheet")
public class TimesheetEntity {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="timesheet_id")
	private int timesheet_id; 
	
	@Column(name="candidate_id")
	private int candidate_id;
	
	@Column(name="year")
	private int year;
	
	@Column(name="month")
	private String month;
	
	@Column(name="week_or_period")
	private String week_or_period;
	
	@Column(name="cadidate_status")
	private String cadidate_status;
	
	@Column(name="manager_status")
	private String manager_status;
	
	@Column(name="hr_status")
	private String hr_status;
	
	@Column(name="audit_status")
	private String audit_status;
	
	@Column(name="client_mgr_approved_fie")
	private String client_mgr_approved_fie;
	
	@Column(name="manager_comments")
	private String manager_comments;
	
	@Column(name="hr_comments")
	private String hr_comments;
	
	@Column(name="audit_comments")
	private String audit_comments;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="candidate_submitted_on")
	private Date candidate_submitted_on; 	
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="manager_approved_on")
	private Date manager_approved_on; 	
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="hr_approved_on")
	private Date hr_approved_on; 	
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="audit_approved_on")
	private Date audit_approved_on;
	
	@Column(name="timesheet_status")
	private String timesheet_status;
	
	@Column(name="manager_empno")
	private int manager_empno;
	@Column(name="hr_empno")
	private int hr_empno;
	@Column(name="audit_empno")
	private int audit_empno;
	@Column(name="payrate_id")
	private Integer payrate_id;
	
	@Column(name="customer_id")
	private Integer customer_id;
	
	@Column(name="endclient_id")
	private Integer endclient_id;
	
	
	public Integer getPayrate_id() {
		return payrate_id;
	}

	public void setPayrate_id(Integer payrate_id) {
		this.payrate_id = payrate_id;
	}

	
	
	
	public String getFrom_date() {
		return from_date;
	}

	public void setFrom_date(String from_date) {
		this.from_date = from_date;
	}

	public String getTo_date() {
		return to_date;
	}

	public void setTo_date(String to_date) {
		this.to_date = to_date;
	}

	@Column(name="from_date")
	private String from_date;
	
	@Column(name="to_date")
	private String to_date;

	public String getTimesheet_status() {
		return timesheet_status;
	}

	public void setTimesheet_status(String timesheet_status) {
		this.timesheet_status = timesheet_status;
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

	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public String getWeek_or_period() {
		return week_or_period;
	}

	public void setWeek_or_period(String week_or_period) {
		this.week_or_period = week_or_period;
	}

	public String getCadidate_status() {
		return cadidate_status;
	}

	public void setCadidate_status(String cadidate_status) {
		this.cadidate_status = cadidate_status;
	}

	public String getManager_status() {
		return manager_status;
	}

	public void setManager_status(String manager_status) {
		this.manager_status = manager_status;
	}

	public String getHr_status() {
		return hr_status;
	}

	public void setHr_status(String hr_status) {
		this.hr_status = hr_status;
	}

	public String getAudit_status() {
		return audit_status;
	}

	public void setAudit_status(String audit_status) {
		this.audit_status = audit_status;
	}

	public String getClient_mgr_approved_fie() {
		return client_mgr_approved_fie;
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

	public void setClient_mgr_approved_fie(String client_mgr_approved_fie) {
		this.client_mgr_approved_fie = client_mgr_approved_fie;
	}

	public String getManager_comments() {
		return manager_comments;
	}

	public void setManager_comments(String manager_comments) {
		this.manager_comments = manager_comments;
	}

	public String getHr_comments() {
		return hr_comments;
	}

	public void setHr_comments(String hr_comments) {
		this.hr_comments = hr_comments;
	}

	public int getManager_empno() {
		return manager_empno;
	}

	public void setManager_empno(int manager_empno) {
		this.manager_empno = manager_empno;
	}

	public int getHr_empno() {
		return hr_empno;
	}

	public void setHr_empno(int hr_empno) {
		this.hr_empno = hr_empno;
	}

	public int getAudit_empno() {
		return audit_empno;
	}

	public void setAudit_empno(int audit_empno) {
		this.audit_empno = audit_empno;
	}

	public String getAudit_comments() {
		return audit_comments;
	}

	public void setAudit_comments(String audit_comments) {
		this.audit_comments = audit_comments;
	}

	public Date getCandidate_submitted_on() {
		return candidate_submitted_on;
	}

	public void setCandidate_submitted_on(Date candidate_submitted_on) {
		this.candidate_submitted_on = candidate_submitted_on;
	}

	public Date getManager_approved_on() {
		return manager_approved_on;
	}

	public void setManager_approved_on(Date manager_approved_on) {
		this.manager_approved_on = manager_approved_on;
	}

	public Date getHr_approved_on() {
		return hr_approved_on;
	}

	public void setHr_approved_on(Date hr_approved_on) {
		this.hr_approved_on = hr_approved_on;
	}

	public Date getAudit_approved_on() {
		return audit_approved_on;
	}

	public void setAudit_approved_on(Date audit_approved_on) {
		this.audit_approved_on = audit_approved_on;
	} 	
	
	
}
