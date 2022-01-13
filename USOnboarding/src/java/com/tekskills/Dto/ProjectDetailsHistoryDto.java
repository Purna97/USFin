package com.tekskills.Dto;

public class ProjectDetailsHistoryDto {
	private int phistory_id;
	private int payrate_id;
	private String proj_startDate;
	private String proj_endDate;
	private Integer customer_id;
	private Integer vendorid;
	private Integer candidate_id;
	private String submittedBy;
	private String vendorname; 
	private String custname;
	private String submittedOn;
	
	public String getVendorname() {
		return vendorname;
	}

	public void setVendorname(String vendorname) {
		this.vendorname = vendorname;
	}

	public String getCustname() {
		return custname;
	}

	public void setCustname(String custname) {
		this.custname = custname;
	}

	public String getSubmittedOn() {
		return submittedOn;
	}

	public void setSubmittedOn(String submittedOn) {
		this.submittedOn = submittedOn;
	}
	
	public String getProj_startDate() {
		return proj_startDate;
	}

	public void setProj_startDate(String proj_startDate) {
		this.proj_startDate = proj_startDate;
	}

	public String getProj_endDate() {
		return proj_endDate;
	}

	public void setProj_endDate(String proj_endDate) {
		this.proj_endDate = proj_endDate;
	}

	public Integer getCustomer_id() {
		return customer_id;
	}

	public void setCustomer_id(Integer customer_id) {
		this.customer_id = customer_id;
	}

	public Integer getVendorid() {
		return vendorid;
	}

	public void setVendorid(Integer vendorid) {
		this.vendorid = vendorid;
	}

	public int getPayrate_id() {
		return payrate_id;
	}

	public void setPayrate_id(int payrate_id) {
		this.payrate_id = payrate_id;
	}

	public Integer getCandidate_id() {
		return candidate_id;
	}

	public void setCandidate_id(Integer candidate_id) {
		this.candidate_id = candidate_id;
	}

	public String getSubmittedBy() {
		return submittedBy;
	}

	public void setSubmittedBy(String submittedBy) {
		this.submittedBy = submittedBy;
	}

	public int getPhistory_id() {
		return phistory_id;
	}

	public void setPhistory_id(int phistory_id) {
		this.phistory_id = phistory_id;
	}
}
