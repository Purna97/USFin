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
@Table(name="Tbl_BgvCandidateEmployment")
public class CandidateBGCEmploymentEntity {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="employment_id")
	private int employment_id; 
	
	@Column(name="candidate_id")
	private int candidate_id; 
	
	@Column(name="company_name")
	private String company_name;
	
	@Column(name="positionheld")
	private String positionheld;	
	
	@Column(name="company_phone")
	private String company_phone;	
	
	@Column(name="reported_to_name")
	private String reported_to_name;
		
	@Column(name="reported_to_position")
	private String reported_to_position;	
	
	@Column(name="hr_name")
	private String hr_name;
	
	@Column(name="employmentType")
	private String employmentType;	
		
	@Column(name="contact_person_name")
	private String contact_person_name;
	
	@Column(name="contact_person_email")
	private String contact_person_email;
	
	@Column(name="contact_person_number")
	private String contact_person_number;
	
	@Column(name="additional_contact_person_name")
	private String additional_contact_person_name;
	
	@Column(name="additional_contact_person_pnumber")
	private String additional_contact_person_pnumber;

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
	
	@Column(name="startedYear")
	private String startedYear;
	
	@Column(name="startedMonth")
	private String startedMonth;
		
	@Column(name="workedTillYear")
	private String workedTillYear;
		
	@Column(name="workedTillMonth")
	private String workedTillMonth;
	

	public String getStartedYear() {
		return startedYear;
	}

	public void setStartedYear(String startedYear) {
		this.startedYear = startedYear;
	}

	public String getStartedMonth() {
		return startedMonth;
	}

	public void setStartedMonth(String startedMonth) {
		this.startedMonth = startedMonth;
	}

	public String getWorkedTillYear() {
		return workedTillYear;
	}

	public void setWorkedTillYear(String workedTillYear) {
		this.workedTillYear = workedTillYear;
	}

	public String getWorkedTillMonth() {
		return workedTillMonth;
	}

	public void setWorkedTillMonth(String workedTillMonth) {
		this.workedTillMonth = workedTillMonth;
	}

	public String getApproved_status() {
		return approved_status;
	}

	public void setApproved_status(String approved_status) {
		this.approved_status = approved_status;
	}

	public int getEmployment_id() {
		return employment_id;
	}

	public void setEmployment_id(int employment_id) {
		this.employment_id = employment_id;
	}

	public int getCandidate_id() {
		return candidate_id;
	}

	public void setCandidate_id(int candidate_id) {
		this.candidate_id = candidate_id;
	}

	public String getCompany_name() {
		return company_name;
	}

	public void setCompany_name(String company_name) {
		this.company_name = company_name;
	}

	public String getPositionheld() {
		return positionheld;
	}

	public void setPositionheld(String positionheld) {
		this.positionheld = positionheld;
	}

	public String getCompany_phone() {
		return company_phone;
	}

	public void setCompany_phone(String company_phone) {
		this.company_phone = company_phone;
	}

	public String getReported_to_name() {
		return reported_to_name;
	}

	public void setReported_to_name(String reported_to_name) {
		this.reported_to_name = reported_to_name;
	}

	public String getReported_to_position() {
		return reported_to_position;
	}

	public void setReported_to_position(String reported_to_position) {
		this.reported_to_position = reported_to_position;
	}

	public String getHr_name() {
		return hr_name;
	}

	public void setHr_name(String hr_name) {
		this.hr_name = hr_name;
	}

	public String getEmploymentType() {
		return employmentType;
	}

	public void setEmploymentType(String employmentType) {
		this.employmentType = employmentType;
	}

	public String getContact_person_name() {
		return contact_person_name;
	}

	public void setContact_person_name(String contact_person_name) {
		this.contact_person_name = contact_person_name;
	}

	public String getContact_person_email() {
		return contact_person_email;
	}

	public void setContact_person_email(String contact_person_email) {
		this.contact_person_email = contact_person_email;
	}

	public String getContact_person_number() {
		return contact_person_number;
	}

	public void setContact_person_number(String contact_person_number) {
		this.contact_person_number = contact_person_number;
	}

	public String getAdditional_contact_person_name() {
		return additional_contact_person_name;
	}

	public void setAdditional_contact_person_name(String additional_contact_person_name) {
		this.additional_contact_person_name = additional_contact_person_name;
	}

	public String getAdditional_contact_person_pnumber() {
		return additional_contact_person_pnumber;
	}

	public void setAdditional_contact_person_pnumber(String additional_contact_person_pnumber) {
		this.additional_contact_person_pnumber = additional_contact_person_pnumber;
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
