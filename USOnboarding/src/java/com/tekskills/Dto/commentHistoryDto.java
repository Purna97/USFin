package com.tekskills.Dto;

public class commentHistoryDto {
	
	private int bgc_checklist_id;
	private int commentid;
	private String comments;
	private String status;
	private String subdate;
	private String posted_by;
	private String candidatename;
	
	
	
	public String getCandidatename() {
		return candidatename;
	}

	public void setCandidatename(String candidatename) {
		this.candidatename = candidatename;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getBgc_checklist_id() {
		return bgc_checklist_id;
	}

	public void setBgc_checklist_id(int bgc_checklist_id) {
		this.bgc_checklist_id = bgc_checklist_id;
	}

	public String getSubdate() {
		return subdate;
	}

	public void setSubdate(String subdate) {
		this.subdate = subdate;
	}
	public String getPosted_by() {
		return posted_by;
	}

	public void setPosted_by(String posted_by) {
		this.posted_by = posted_by;
	}

	public int getCommentid() {
		return commentid;
	}

	public void setCommentid(int commentid) {
		this.commentid = commentid;
	}
}
