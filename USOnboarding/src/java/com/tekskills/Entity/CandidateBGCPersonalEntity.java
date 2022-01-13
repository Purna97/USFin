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
@Table(name="Tbl_bgv_CandidatePersonalDetails")
public class CandidateBGCPersonalEntity {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="personal_id")
	private int personal_id; 
	
	@Column(name="candidate_id")
	private int candidate_id; 
	
	@Column(name="title")
	private String title;
	
	@Column(name="first_name")
	private String first_name;
	
	@Column(name="middle_name")
	private String middle_name;
	
	@Column(name="last_name")
	private String last_name;	
	
	@Column(name="father_name")
	private String father_name;	
	
	@Column(name="nationality")
	private String nationality;
		
	@Column(name="contact_no")
	private String contact_no;	
	
	@Column(name="mobile_number")
	private String mobile_number;	
	
	@Column(name="email_id")
	private String email_id;	
	
	@Column(name="gender")
	private String gender;
	
	@Column(name="dob")
	private String dob;
	
	@Column(name="ssn")
	private String ssn_no;

	@Column(name="candidate_status")
	private String candidate_status;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="submitted_on")
	private Date submitted_on;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="approved_on")
	private Date approved_on;
	
	@Column(name="approved_by")
	private int approved_by;
	@Column(name="approved_status")
	private String approved_status;

	public String getApproved_status() {
		return approved_status;
	}

	public void setApproved_status(String approved_status) {
		this.approved_status = approved_status;
	}

	public int getPersonal_id() {
		return personal_id;
	}

	public void setPersonal_id(int personal_id) {
		this.personal_id = personal_id;
	}

	public int getCandidate_id() {
		return candidate_id;
	}

	public void setCandidate_id(int candidate_id) {
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

	public Date getSubmitted_on() {
		return submitted_on;
	}

	public void setSubmitted_on(Date submitted_on) {
		this.submitted_on = submitted_on;
	}

	public Date getApproved_on() {
		return approved_on;
	}

	public void setApproved_on(Date approved_on) {
		this.approved_on = approved_on;
	}

	public int getApproved_by() {
		return approved_by;
	}

	public void setApproved_by(int approved_by) {
		this.approved_by = approved_by;
	}

}
