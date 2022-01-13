package com.tekskills.Dto;

import java.util.List;

import com.tekskills.Entity.BGCCandidateFormsStatusEntity;

public class CandidateBGCPersonalDetailsDto {
	private Integer personal_id; 
	private Integer candidate_id; 
	private String title;
	private String first_name;
	private String middle_name;
	private String last_name;	
	private String father_name;	
	private String nationality;
	private String contact_no;	
	private String mobile_number;	
	private String email_id;	
	private String gender;
	private String dob;
	private String ssn_no;
	private String candidate_status;
	private String submitted_on;
	private String approved_on;
	private Integer approved_by;
	private String approved_status;
	
	List<CandidateBGCAddressDetailsDto> addressList;
	
	private BGCCandidateFormsStatusEntity candformsStatus;
	
	public List<CandidateBGCAddressDetailsDto> getAddressList() {
		return addressList;
	}
	public void setAddressList(List<CandidateBGCAddressDetailsDto> addressList) {
		this.addressList = addressList;
	}
	public Integer getPersonal_id() {
		return personal_id;
	}
	public void setPersonal_id(Integer personal_id) {
		this.personal_id = personal_id;
	}
	public Integer getCandidate_id() {
		return candidate_id;
	}
	public void setCandidate_id(Integer candidate_id) {
		this.candidate_id = candidate_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getFirst_name() {
		return first_name;
	}
	public void setFirst_name(String first_name) {
		this.first_name = first_name;
	}
	public String getMiddle_name() {
		return middle_name;
	}
	public void setMiddle_name(String middle_name) {
		this.middle_name = middle_name;
	}
	public String getLast_name() {
		return last_name;
	}
	public void setLast_name(String last_name) {
		this.last_name = last_name;
	}
	public String getFather_name() {
		return father_name;
	}
	public void setFather_name(String father_name) {
		this.father_name = father_name;
	}
	public String getNationality() {
		return nationality;
	}
	public void setNationality(String nationality) {
		this.nationality = nationality;
	}
	public String getContact_no() {
		return contact_no;
	}
	public void setContact_no(String contact_no) {
		this.contact_no = contact_no;
	}
	public String getMobile_number() {
		return mobile_number;
	}
	public void setMobile_number(String mobile_number) {
		this.mobile_number = mobile_number;
	}
	public String getEmail_id() {
		return email_id;
	}
	public void setEmail_id(String email_id) {
		this.email_id = email_id;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getDob() {
		return dob;
	}
	public void setDob(String dob) {
		this.dob = dob;
	}
	public String getSsn_no() {
		return ssn_no;
	}
	public void setSsn_no(String ssn_no) {
		this.ssn_no = ssn_no;
	}
	public String getCandidate_status() {
		return candidate_status;
	}
	public void setCandidate_status(String candidate_status) {
		this.candidate_status = candidate_status;
	}
	public String getSubmitted_on() {
		return submitted_on;
	}
	public void setSubmitted_on(String submitted_on) {
		this.submitted_on = submitted_on;
	}
	public String getApproved_on() {
		return approved_on;
	}
	public void setApproved_on(String approved_on) {
		this.approved_on = approved_on;
	}
	public Integer getApproved_by() {
		return approved_by;
	}
	public void setApproved_by(Integer approved_by) {
		this.approved_by = approved_by;
	}
	public String getApproved_status() {
		return approved_status;
	}
	public void setApproved_status(String approved_status) {
		this.approved_status = approved_status;
	}
	public BGCCandidateFormsStatusEntity getCandformsStatus() {
		return candformsStatus;
	}
	public void setCandformsStatus(BGCCandidateFormsStatusEntity candformsStatus) {
		this.candformsStatus = candformsStatus;
	}

}
