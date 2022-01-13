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
@Table(name="Tbl_ImmiFormsCommentsHistory")
public class ImmiFormsCommentsHistoryEntity {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)	
	@Column(name="comments_id")
	private int comments_id;
	
	@Column(name="status_id")
	private int status_id;
	
	@Column(name="candidate_id")
	private Integer candidate_id;
	
	@Column(name="status")
	private String status;
	
	@Column(name="comments")
	private String comments;
	
	@Column(name="submitted_by")
	private int submitted_by;

	
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

	
	public int getStatus_id() {
		return status_id;
	}

	public void setStatus_id(int status_id) {
		this.status_id = status_id;
	}

	public int getSubmitted_by() {
		return submitted_by;
	}

	public void setSubmitted_by(int submitted_by) {
		this.submitted_by = submitted_by;
	}

	public Date getSubmitted_date() {
		return submitted_date;
	}

	public void setSubmitted_date(Date submitted_date) {
		this.submitted_date = submitted_date;
	}
	
	
	
}
