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
@Table(name="Tbl_SemiMonthlyTemplate")
public class SemiMonthlyTemplateEntity {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="bi_weekly_id")
	private int bi_weekly_id; 
	
	@Column(name="year")
	private int year;
	
	@Column(name="month")
	private String month;
	
	@Column(name="payroll_fromdate")
	private String payroll_fromdate;
	
	@Column(name="payroll_todate")
	private String payroll_todate;
	
	@Column(name="period")
	private String period;
	
	@Column(name="period_fromdate")
	private String period_fromdate;
	
	@Column(name="period_todate")
	private String period_todate;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="submitted_date")
	private Date submitted_date; 	
	
	@Column(name="posted_by")
	private int posted_by;

	public int getBi_weekly_id() {
		return bi_weekly_id;
	}

	public void setBi_weekly_id(int bi_weekly_id) {
		this.bi_weekly_id = bi_weekly_id;
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

	

	public String getPeriod() {
		return period;
	}

	public void setPeriod(String period) {
		this.period = period;
	}


	public Date getSubmitted_date() {
		return submitted_date;
	}

	public void setSubmitted_date(Date submitted_date) {
		this.submitted_date = submitted_date;
	}

	public int getPosted_by() {
		return posted_by;
	}

	public void setPosted_by(int posted_by) {
		this.posted_by = posted_by;
	}

	public String getPayroll_fromdate() {
		return payroll_fromdate;
	}

	public void setPayroll_fromdate(String payroll_fromdate) {
		this.payroll_fromdate = payroll_fromdate;
	}

	public String getPayroll_todate() {
		return payroll_todate;
	}

	public void setPayroll_todate(String payroll_todate) {
		this.payroll_todate = payroll_todate;
	}

	public String getPeriod_fromdate() {
		return period_fromdate;
	}

	public void setPeriod_fromdate(String period_fromdate) {
		this.period_fromdate = period_fromdate;
	}

	public String getPeriod_todate() {
		return period_todate;
	}

	public void setPeriod_todate(String period_todate) {
		this.period_todate = period_todate;
	}

	
}
