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
@Table(name="Tbl_StatusReportTemplate")
public class StatusReportTemplateEntity {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="template_id")
	private int template_id; 
	
	@Column(name="month")
	private String month;
	
	@Column(name="period")
	private String period;
	
	@Column(name="year")
	private Integer year; 
	
	@Column(name="period_name")
	private String period_name;

	@Column(name="posted_by")
	private int posted_by; 
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="submitted_on")
	private Date submitted_on;
	
	@Temporal(TemporalType.DATE)
	@Column(name="from_date")
	private Date from_date;
	
	@Temporal(TemporalType.DATE)
	@Column(name="to_date")
	private Date to_date;

	public int getTemplate_id() {
		return template_id;
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

	public int getPosted_by() {
		return posted_by;
	}

	public void setPosted_by(int posted_by) {
		this.posted_by = posted_by;
	}

	public Date getSubmitted_on() {
		return submitted_on;
	}

	public void setSubmitted_on(Date submitted_on) {
		this.submitted_on = submitted_on;
	}

	public Date getFrom_date() {
		return from_date;
	}

	public void setFrom_date(Date from_date) {
		this.from_date = from_date;
	}

	public Date getTo_date() {
		return to_date;
	}

	public void setTo_date(Date to_date) {
		this.to_date = to_date;
	} 
	
	
	
}
