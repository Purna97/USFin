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
@Table(name="Tbl_H1BCheckListCommentsHistory")
public class ImmiCheckListCommentsHistory {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)	
	@Column(name="comments_id")
	private int comments_id;
	
	@Column(name="initiate_id")
	private int initiate_id;
	 
	@Column(name="doctype_id")
	private int doctype_id;
	
	@Column(name="status")
	private String status;
	
	@Column(name="comments")
	private String comments;
	
	@Column(name="verified_by")
	private int posted_by;
	
	@Column(name="candidate_id")
	private Integer candidate_id;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="submitted_date")
	private Date submitted_date;

	@Column(name="profile_id")
	private Integer profile_id;
	
	@Column(name="profile_type")
	private String profile_type;
	
	public Integer getProfile_id() {
		return profile_id;
	}

	public void setProfile_id(Integer profile_id) {
		this.profile_id = profile_id;
	}

	public String getProfile_type() {
		return profile_type;
	}

	public void setProfile_type(String profile_type) {
		this.profile_type = profile_type;
	}
	
	public int getComments_id() {
		return comments_id;
	}

	public void setComments_id(int comments_id) {
		this.comments_id = comments_id;
	}

	public int getInitiate_id() {
		return initiate_id;
	}

	public void setInitiate_id(int initiate_id) {
		this.initiate_id = initiate_id;
	}

	public int getDoctype_id() {
		return doctype_id;
	}

	public void setDoctype_id(int doctype_id) {
		this.doctype_id = doctype_id;
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

	public Integer getCandidate_id() {
		return candidate_id;
	}

	public void setCandidate_id(Integer candidate_id) {
		this.candidate_id = candidate_id;
	}

	public Date getSubmitted_date() {
		return submitted_date;
	}

	public void setSubmitted_date(Date submitted_date) {
		this.submitted_date = submitted_date;
	}
}
