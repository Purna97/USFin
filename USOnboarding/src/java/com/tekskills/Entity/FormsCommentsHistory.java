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
@Table(name="Tbl_BGVFormsCommentsHistory")
public class FormsCommentsHistory {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)	
	@Column(name="comments_id")
	private int comments_id;
	
	@Column(name="status")
	private String status;
	
	@Column(name="comments")
	private String comments;
	
	@Column(name="approved_by")
	private Integer approved_by;
	
	@Column(name="candidate_id")
	private Integer candidate_id;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="submitted_date")
	private Date submitted_date;
	
	@Column(name="form_type")
	private String form_type;
	
	

	public String getForm_type() {
		return form_type;
	}

	public void setForm_type(String form_type) {
		this.form_type = form_type;
	}

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

	

	public Integer getApproved_by() {
		return approved_by;
	}

	public void setApproved_by(Integer approved_by) {
		this.approved_by = approved_by;
	}

	public Date getSubmitted_date() {
		return submitted_date;
	}

	public void setSubmitted_date(Date submitted_date) {
		this.submitted_date = submitted_date;
	}
	
	
	
}
