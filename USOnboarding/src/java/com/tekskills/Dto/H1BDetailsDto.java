package com.tekskills.Dto;

public class H1BDetailsDto {
	private Integer h1b_id;
	private String receipt_number;
	private String h1b_fromdate;
	private String h1b_todate;
	private String i94_number;
	private String i94_fromdate;
	private String i94_todate;
	private Integer candidate_id;
	private Integer posted_by;
	private Integer h1b_reference;
	private String status;
	
	public Integer getH1b_id() {
		return h1b_id;
	}
	public void setH1b_id(Integer h1b_id) {
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
	public Integer getCandidate_id() {
		return candidate_id;
	}
	public void setCandidate_id(Integer candidate_id) {
		this.candidate_id = candidate_id;
	}
	public Integer getPosted_by() {
		return posted_by;
	}
	public void setPosted_by(Integer posted_by) {
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
	
}
