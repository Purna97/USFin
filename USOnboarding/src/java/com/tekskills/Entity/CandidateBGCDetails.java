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
@Table(name="Tbl_CandidateBGCDetails")
public class CandidateBGCDetails {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)	
	@Column(name="bgc_id")
	private int bgc_id;
	
	@Column(name="candidate_id")
	private int candidate_id;
	  
	@Column(name="profile_id")
	private int profile_id;
	
	@Column(name="task_status")
	private String task_status;
	
	@Column(name="bgc_status")
	private String bgc_status;
	
	@Column(name="posted_by")
	private int posted_by;
		
	@Temporal(TemporalType.DATE)
	@Column(name="submitted_date")
	private Date submitted_date;
	
	
	@Column(name="status")
	private String status;
	
	@Column(name="predefined_forms")
	private String predefined_forms;
	
	
	public String getPredefined_forms() {
		return predefined_forms;
	}

	public void setPredefined_forms(String predefined_forms) {
		this.predefined_forms = predefined_forms;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getBgc_id() {
		return bgc_id;
	}

	public void setBgc_id(int bgc_id) {
		this.bgc_id = bgc_id;
	}

	public int getCandidate_id() {
		return candidate_id;
	}

	public void setCandidate_id(int candidate_id) {
		this.candidate_id = candidate_id;
	}

	public int getProfile_id() {
		return profile_id;
	}

	public void setProfile_id(int profile_id) {
		this.profile_id = profile_id;
	}

	public String getTask_status() {
		return task_status;
	}

	public void setTask_status(String task_status) {
		this.task_status = task_status;
	}

	public String getBgc_status() {
		return bgc_status;
	}

	public void setBgc_status(String bgc_status) {
		this.bgc_status = bgc_status;
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
