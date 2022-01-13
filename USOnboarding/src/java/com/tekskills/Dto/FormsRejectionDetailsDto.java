package com.tekskills.Dto;

public class FormsRejectionDetailsDto {
	private int history_id;
	private Integer form_id;
	private String rejectedfields;
	private String rejectioncoments;
	private String submitted_on;
	private String form_type;
	private String form_status;
	private String benf_type;
	private String status;
	private String varifier_by;
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
	public String getRejectedfields() {
		return rejectedfields;
	}
	public void setRejectedfields(String rejectedfields) {
		this.rejectedfields = rejectedfields;
	}
	public String getRejectioncoments() {
		return rejectioncoments;
	}
	public void setRejectioncoments(String rejectioncoments) {
		this.rejectioncoments = rejectioncoments;
	}
	public String getSubmitted_on() {
		return submitted_on;
	}
	public void setSubmitted_on(String submitted_on) {
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
	public String getVarifier_by() {
		return varifier_by;
	}
	public void setVarifier_by(String varifier_by) {
		this.varifier_by = varifier_by;
	}
	
}
