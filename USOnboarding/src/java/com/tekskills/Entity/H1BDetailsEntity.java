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
@Table(name="Tbl_H1BDetails")
public class H1BDetailsEntity {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)	
	@Column(name="h1b_id")
	private int h1b_id;
		
	@Column(name="receipt_number")
	private String receipt_number;
	
	@Column(name="h1b_fromdate")
	private String h1b_fromdate;
	
	@Column(name="h1b_todate")
	private String h1b_todate;
	
	@Column(name="I94_number")
	private String i94_number;
	
	@Column(name="I94_fromdate")
	private String i94_fromdate;
	
	@Column(name="I94_todate")
	private String i94_todate;
	
	@Column(name="candidate_id")
	private int candidate_id;
	
	@Column(name="posted_by")
	private int posted_by;
	
	@Column(name="h1b_reference")
	private Integer h1b_reference;
	
	@Column(name="status")
	private String status;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="submitted_date")
	private Date submitted_date;
	
	public int getH1b_id() {
		return h1b_id;
	}

	public void setH1b_id(int h1b_id) {
		this.h1b_id = h1b_id;
	}

	public String getReceipt_number() {
		return receipt_number;
	}

	public void setReceipt_number(String receipt_number) {
		this.receipt_number = receipt_number;
	}

	public String getH1b_fromdate() {
		return h1b_fromdate;
	}

	public void setH1b_fromdate(String h1b_fromdate) {
		this.h1b_fromdate = h1b_fromdate;
	}

	public String getH1b_todate() {
		return h1b_todate;
	}

	public void setH1b_todate(String h1b_todate) {
		this.h1b_todate = h1b_todate;
	}

	public String getI94_number() {
		return i94_number;
	}

	public void setI94_number(String i94_number) {
		this.i94_number = i94_number;
	}

	public String getI94_fromdate() {
		return i94_fromdate;
	}

	public void setI94_fromdate(String i94_fromdate) {
		this.i94_fromdate = i94_fromdate;
	}

	public String getI94_todate() {
		return i94_todate;
	}

	public void setI94_todate(String i94_todate) {
		this.i94_todate = i94_todate;
	}

	public int getCandidate_id() {
		return candidate_id;
	}

	public void setCandidate_id(int candidate_id) {
		this.candidate_id = candidate_id;
	}

	public int getPosted_by() {
		return posted_by;
	}

	public void setPosted_by(int posted_by) {
		this.posted_by = posted_by;
	}

	public Integer getH1b_reference() {
		return h1b_reference;
	}

	public void setH1b_reference(Integer h1b_reference) {
		this.h1b_reference = h1b_reference;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Date getSubmitted_date() {
		return submitted_date;
	}

	public void setSubmitted_date(Date submitted_date) {
		this.submitted_date = submitted_date;
	}
	
}
