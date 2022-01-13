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
@Table(name="Tbl_Immi_Forms_Rejection_Details")
public class FormsRejectionDetailsEntity {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	private int history_id;
	 
	@Column(name="form_id")
	private Integer form_id;
	
	@Column(name="rejectedfields")
	private String rejectedfields;
	
	@Column(name="rejectioncoments")
	private String rejectioncoments;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="verifier_submitted_on")
	private Date submitted_on;
	
	@Column(name="form_type")
	private String form_type;
	
	@Column(name="form_status")
	private String form_status;
	
	@Column(name="benf_type")
	private String benf_type;
	
	@Column(name="status")
	private String status;

	@Column(name="varifier_by")
	private Integer varifier_by;
	
	public Integer getVarifier_by() {
		return varifier_by;
	}

	public void setVarifier_by(Integer varifier_by) {
		this.varifier_by = varifier_by;
	}

	public String getRejectedfields() {
		return rejectedfields;
	}

	public void setRejectedfields(String rejectedfields) {
		this.rejectedfields = rejectedfields;
	}

	public int getHistory_id() {
		return history_id;
	}

	public void setHistory_id(int history_id) {
		this.history_id = history_id;
	}

	public Integer getForm_id() {
		return form_id;
	}

	public void setForm_id(Integer form_id) {
		this.form_id = form_id;
	}

	public String getRejectioncoments() {
		return rejectioncoments;
	}

	public void setRejectioncoments(String rejectioncoments) {
		this.rejectioncoments = rejectioncoments;
	}

	public Date getSubmitted_on() {
		return submitted_on;
	}

	public void setSubmitted_on(Date submitted_on) {
		this.submitted_on = submitted_on;
	}

	public String getForm_type() {
		return form_type;
	}

	public void setForm_type(String form_type) {
		this.form_type = form_type;
	}

	public String getForm_status() {
		return form_status;
	}

	public void setForm_status(String form_status) {
		this.form_status = form_status;
	}

	public String getBenf_type() {
		return benf_type;
	}

	public void setBenf_type(String benf_type) {
		this.benf_type = benf_type;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
}
