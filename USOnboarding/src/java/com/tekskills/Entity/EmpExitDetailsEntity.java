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
@Table(name="Tbl_EmpExitDetails")
public class EmpExitDetailsEntity {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="exit_id")
	private int ex_id; 
	
	@Column(name="exit_lwd")
	private String exit_lwd;
	
	@Column(name="term_mail_received_date")
	private String termMailRecievedOn;
	
	@Column(name="reasons")
	private String reasons;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="submitted_on")
	private Date submit_date;
	
	
	@Column(name="comments")
	private String comments;
	
	@Column(name="status")
	private String Status;
	
	
	@Column(name="posted_by")
	private int PostedBy;
	
	@Column(name="candidate_id")
	private int candidate_id;

	public Date getSubmit_date() {
		return submit_date;
	}

	public void setSubmit_date(Date submit_date) {
		this.submit_date = submit_date;
	}

	public int getEx_id() {
		return ex_id;
	}

	public void setEx_id(int ex_id) {
		this.ex_id = ex_id;
	}

	public String getExit_lwd() {
		return exit_lwd;
	}

	public void setExit_lwd(String exit_lwd) {
		this.exit_lwd = exit_lwd;
	}

	public String getTermMailRecievedOn() {
		return termMailRecievedOn;
	}

	public void setTermMailRecievedOn(String termMailRecievedOn) {
		this.termMailRecievedOn = termMailRecievedOn;
	}

	public String getReasons() {
		return reasons;
	}

	public void setReasons(String reasons) {
		this.reasons = reasons;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public String getStatus() {
		return Status;
	}

	public void setStatus(String status) {
		Status = status;
	}

	

	public int getPostedBy() {
		return PostedBy;
	}

	public void setPostedBy(int postedBy) {
		PostedBy = postedBy;
	}
	
	public int getCandidate_id() {
		return candidate_id;
	}

	public void setCandidate_id(int candidate_id) {
		this.candidate_id = candidate_id;
	}
}
