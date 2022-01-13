package com.tekskills.Dto;

public class CandidateBGCAddressDetailsDto {
	private Integer contact_id; 
	private Integer personal_id; 
	private Integer education_id; 
	private Integer employment_id; 
	private String from_date;
	private String to_date;
	private String line1;
	private String line2;
	private String city;
	private String state;
	private String zipcode;
	private Integer isCurrentAddress; 
	private String submitted_on;
	
	public Integer getContact_id() {
		return contact_id;
	}
	public void setContact_id(Integer contact_id) {
		this.contact_id = contact_id;
	}
	public Integer getPersonal_id() {
		return personal_id;
	}
	public void setPersonal_id(Integer personal_id) {
		this.personal_id = personal_id;
	}
	public Integer getEducation_id() {
		return education_id;
	}
	public void setEducation_id(Integer education_id) {
		this.education_id = education_id;
	}
	public Integer getEmployment_id() {
		return employment_id;
	}
	public void setEmployment_id(Integer employment_id) {
		this.employment_id = employment_id;
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
	public String getLine1() {
		return line1;
	}
	public void setLine1(String line1) {
		this.line1 = line1;
	}
	public String getLine2() {
		return line2;
	}
	public void setLine2(String line2) {
		this.line2 = line2;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public Integer getIsCurrentAddress() {
		return isCurrentAddress;
	}
	public void setIsCurrentAddress(Integer isCurrentAddress) {
		this.isCurrentAddress = isCurrentAddress;
	}
	public String getSubmitted_on() {
		return submitted_on;
	}
	public void setSubmitted_on(String submitted_on) {
		this.submitted_on = submitted_on;
	}	
}
