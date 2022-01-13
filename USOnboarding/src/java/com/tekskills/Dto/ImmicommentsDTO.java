package com.tekskills.Dto;

public class ImmicommentsDTO {
private String status;
private Integer statusid;
private String comments;
private Integer submitted_by;
private String submitted_date;
private Integer candidate_id;
private String submittedby_name;


public String getSubmitted_date() {
	return submitted_date;
}
public void setSubmitted_date(String submitted_date) {
	this.submitted_date = submitted_date;
}
public Integer getCandidate_id() {
	return candidate_id;
}
public void setCandidate_id(Integer candidate_id) {
	this.candidate_id = candidate_id;
}
public String getSubmittedby_name() {
	return submittedby_name;
}
public void setSubmittedby_name(String submittedby_name) {
	this.submittedby_name = submittedby_name;
}
public Integer getSubmitted_by() {
	return submitted_by;
}
public void setSubmitted_by(Integer submitted_by) {
	this.submitted_by = submitted_by;
}
public String getStatus() {
	return status;
}
public void setStatus(String status) {
	this.status = status;
}
public Integer getStatusid() {
	return statusid;
}
public void setStatusid(Integer statusid) {
	this.statusid = statusid;
}
public String getComments() {
	return comments;
}
public void setComments(String comments) {
	this.comments = comments;
}

}
