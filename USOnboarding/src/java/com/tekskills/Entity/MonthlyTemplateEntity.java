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
@Table(name="Tbl_MonthlyTemplate")
public class MonthlyTemplateEntity {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="month_id")
	private int month_id; 
	
	@Column(name="year")
	private int year;
	
	@Column(name="month")
	private String month;
	
	@Column(name="payroll_fromdate")
	private String payroll_fromdate;
	
	@Column(name="payroll_todate")
	private String payroll_todate;
	
	@Column(name="month_no")
	private int month_no;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="submitted_date")
	private Date submitted_date; 	
	
	@Column(name="posted_by")
	private int posted_by;

	public int getMonth_id() {
		return month_id;
	}

	public void setMonth_id(int month_id) {
		this.month_id = month_id;
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

	public int getMonth_no() {
		return month_no;
	}

	public void setMonth_no(int month_no) {
		this.month_no = month_no;
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
}
