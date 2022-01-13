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
@Table(name="Tbl_BGCCheckListCommentsHistory")
public class BGCCheckListCommentsHistory {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)	
	@Column(name="comments_id")
	private int comments_id;
	
	@Column(name="bgc_checklist_id")
	private int bgc_checklist_id;
	
	@Column(name="status")
	private String status;
	
	@Column(name="comments")
	private String comments;
	
	@Column(name="posted_by")
	private int posted_by;
	@Column(name="candidate_id")
	private Integer candidate_id;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="submitted_date")
	private Date submitted_date;

	public Integer getCandidate_id() {
		return candidate_id;
	}

	public void setCandidate_id(Integer candidate_id) {
		this.candidate_id = candidate_id;
	}

	public int getComments_id() {
		return comments_id;
	}

	public void setComments_id(int comments_id) {
		this.comments_id = comments_id;
	}

	public int getBgc_checklist_id() {
		return bgc_checklist_id;
	}

	public void setBgc_checklist_id(int bgc_checklist_id) {
		this.bgc_checklist_id = bgc_checklist_id;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public int getPosted_by() {
		return posted_by;
	}

	public void setPosted_by(int posted_by) {
		this.posted_by = posted_by;
	}

	public Date getSubmitted_date() {
		return submitted_date;
	}

	public void setSubmitted_date(Date submitted_date) {
		this.submitted_date = submitted_date;
	}
	
	
	
}
