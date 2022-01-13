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
@Table(name="Tbl_BiWeeklyTemplate2")
public class BiWeeklyTemplateEntity2 {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="biweek_id")
	private int week_id; 
	
	@Column(name="year")
	private int year;
	
	@Column(name="month")
	private String month;
	
	@Column(name="payroll_fromdate")
	private String payroll_fromdate;
	
	@Column(name="payroll_todate")
	private String payroll_todate;
	
	@Column(name="weeks")
	private String weeks;
	
	@Column(name="week_fromdate")
	private String week_fromdate;
	
	@Column(name="week_todate")
	private String week_todate;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="submitted_date")
	private Date submitted_date; 	
	
	@Column(name="posted_by")
	private int posted_by;

	

	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}

	public String getMonth() {
		return month;
	}

	public int getWeek_id() {
		return week_id;
	}

	public void setWeek_id(int week_id) {
		this.week_id = week_id;
	}

	public void setMonth(String month) {
		this.month = month;
	}


	public String getWeeks() {
		return weeks;
	}

	public void setWeeks(String weeks) {
		this.weeks = weeks;
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

	public String getWeek_fromdate() {
		return week_fromdate;
	}

	public void setWeek_fromdate(String week_fromdate) {
		this.week_fromdate = week_fromdate;
	}

	public String getWeek_todate() {
		return week_todate;
	}

	public void setWeek_todate(String week_todate) {
		this.week_todate = week_todate;
	}

	

}
