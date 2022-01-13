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
@Table(name="Bgv_CandidateFormsStatus")
public class BGCCandidateFormsStatusEntity {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="status_id")
	private int status_id; 
	
	@Column(name="candidate_id")
	private int candidate_id; 
	
	@Column(name="candidate_personal_status")
	private String candidate_personal_status;
	
	@Column(name="candidate_education_status")
	private String candidate_education_status;
	
	@Column(name="candidate_employment_status")
	private String candidate_employment_status;
	
	@Column(name="verifier_personal_status")
	private String verifier_personal_status;
	
	@Column(name="verifier_education_status")
	private String verifier_education_status;
	
	@Column(name="verifier_employment_status")
	private String verifier_employment_status;
		
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="verifier_personal_submitted_on")
	private Date verifier_personal_submitted_on;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="verifier_education_submitted_on")
	private Date verifier_education_submitted_on;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="verifier_employment_submitted_on")
	private Date verifier_employment_submitted_on;
	
	
	@Column(name="personal_verified_by")
	private int personal_verified_by;
	
	@Column(name="education_verified_by")
	private int education_verified_by;
	
	@Column(name="employment_verified_by")
	private int employment_verified_by;

	public int getStatus_id() {
		return status_id;
	}

	public void setStatus_id(int status_id) {
		this.status_id = status_id;
	}

	public int getCandidate_id() {
		return candidate_id;
	}

	public void setCandidate_id(int candidate_id) {
		this.candidate_id = candidate_id;
	}

	public String getCandidate_personal_status() {
		return candidate_personal_status;
	}

	public void setCandidate_personal_status(String candidate_personal_status) {
		this.candidate_personal_status = candidate_personal_status;
	}

	public String getCandidate_education_status() {
		return candidate_education_status;
	}

	public void setCandidate_education_status(String candidate_education_status) {
		this.candidate_education_status = candidate_education_status;
	}

	public String getCandidate_employment_status() {
		return candidate_employment_status;
	}

	public void setCandidate_employment_status(String candidate_employment_status) {
		this.candidate_employment_status = candidate_employment_status;
	}

	public String getVerifier_personal_status() {
		return verifier_personal_status;
	}

	public void setVerifier_personal_status(String verifier_personal_status) {
		this.verifier_personal_status = verifier_personal_status;
	}

	public String getVerifier_education_status() {
		return verifier_education_status;
	}

	public void setVerifier_education_status(String verifier_education_status) {
		this.verifier_education_status = verifier_education_status;
	}

	public String getVerifier_employment_status() {
		return verifier_employment_status;
	}

	public void setVerifier_employment_status(String verifier_employment_status) {
		this.verifier_employment_status = verifier_employment_status;
	}

	public Date getVerifier_personal_submitted_on() {
		return verifier_personal_submitted_on;
	}

	public void setVerifier_personal_submitted_on(Date verifier_personal_submitted_on) {
		this.verifier_personal_submitted_on = verifier_personal_submitted_on;
	}

	public Date getVerifier_education_submitted_on() {
		return verifier_education_submitted_on;
	}

	public void setVerifier_education_submitted_on(Date verifier_education_submitted_on) {
		this.verifier_education_submitted_on = verifier_education_submitted_on;
	}

	public Date getVerifier_employment_submitted_on() {
		return verifier_employment_submitted_on;
	}

	public void setVerifier_employment_submitted_on(Date verifier_employment_submitted_on) {
		this.verifier_employment_submitted_on = verifier_employment_submitted_on;
	}

	public int getPersonal_verified_by() {
		return personal_verified_by;
	}

	public void setPersonal_verified_by(int personal_verified_by) {
		this.personal_verified_by = personal_verified_by;
	}

	public int getEducation_verified_by() {
		return education_verified_by;
	}

	public void setEducation_verified_by(int education_verified_by) {
		this.education_verified_by = education_verified_by;
	}

	public int getEmployment_verified_by() {
		return employment_verified_by;
	}

	public void setEmployment_verified_by(int employment_verified_by) {
		this.employment_verified_by = employment_verified_by;
	}
	
}
