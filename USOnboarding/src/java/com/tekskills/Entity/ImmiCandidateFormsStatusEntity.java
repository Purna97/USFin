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
@Table(name="Immi_CandidateFormsStatus")
public class ImmiCandidateFormsStatusEntity {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="status_id")
	private int status_id; 
	
	@Column(name="candidate_id")
	private int candidate_id; 
	
	@Column(name="form_type")
	private String form_type;
	
	@Column(name="candidate_status")
	private String candidate_status;
	
	@Column(name="verifier_status")
	private String verifier_status;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="candidate_submitted_on")
	private Date candidate_submitted_on;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="verifier_submitted_on")
	private Date verifier_submitted_on;
	
	@Column(name="verifier_by")
	private int verifier_by;

	@Column(name="initiate_id")
	private Integer initiate_id; 
	

	public Integer getInitiate_id() {
		return initiate_id;
	}

	public void setInitiate_id(Integer initiate_id) {
		this.initiate_id = initiate_id;
	}

	
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

	public String getForm_type() {
		return form_type;
	}

	public void setForm_type(String form_type) {
		this.form_type = form_type;
	}

	public String getCandidate_status() {
		return candidate_status;
	}

	public void setCandidate_status(String candidate_status) {
		this.candidate_status = candidate_status;
	}

	public String getVerifier_status() {
		return verifier_status;
	}

	public void setVerifier_status(String verifier_status) {
		this.verifier_status = verifier_status;
	}

	public Date getCandidate_submitted_on() {
		return candidate_submitted_on;
	}

	public void setCandidate_submitted_on(Date candidate_submitted_on) {
		this.candidate_submitted_on = candidate_submitted_on;
	}

	public Date getVerifier_submitted_on() {
		return verifier_submitted_on;
	}

	public void setVerifier_submitted_on(Date verifier_submitted_on) {
		this.verifier_submitted_on = verifier_submitted_on;
	}

	public int getVerifier_by() {
		return verifier_by;
	}

	public void setVerifier_by(int verifier_by) {
		this.verifier_by = verifier_by;
	}
	
	
}
