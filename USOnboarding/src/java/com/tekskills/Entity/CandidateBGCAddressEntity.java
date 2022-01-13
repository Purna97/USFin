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
@Table(name="Tbl_bgv_CandidateAddressDetails")
public class CandidateBGCAddressEntity {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="contact_id")
	private int contact_id; 
	
	@Column(name="personal_id")
	private int personal_id; 
	
	@Column(name="education_id")
	private int education_id; 
	
	@Column(name="employment_id")
	private int employment_id; 
	 
	@Column(name="from_date")
	private String from_date;
	
	@Column(name="to_date")
	private String to_date;
	 
	@Column(name="line1")
	private String line1;
	
	@Column(name="line2")
	private String line2;
	
	@Column(name="city")
	private String city;
	
	@Column(name="state")
	private String state;
	
	@Column(name="zipcode")
	private String zipcode;
	
	@Column(name="isCurrentAddress")
	private int isCurrentAddress; 
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="submitted_on")
	private Date submitted_on;

	public int getEducation_id() {
		return education_id;
	}

	public void setEducation_id(int education_id) {
		this.education_id = education_id;
	}

	public int getEmployment_id() {
		return employment_id;
	}

	public void setEmployment_id(int employment_id) {
		this.employment_id = employment_id;
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

	public int getContact_id() {
		return contact_id;
	}

	public void setContact_id(int contact_id) {
		this.contact_id = contact_id;
	}

	public int getPersonal_id() {
		return personal_id;
	}

	public void setPersonal_id(int personal_id) {
		this.personal_id = personal_id;
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
	
	public int getIsCurrentAddress() {
		return isCurrentAddress;
	}

	public void setIsCurrentAddress(int isCurrentAddress) {
		this.isCurrentAddress = isCurrentAddress;
	}

	public Date getSubmitted_on() {
		return submitted_on;
	}

	public void setSubmitted_on(Date submitted_on) {
		this.submitted_on = submitted_on;
	}
}
