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
@Table(name="Tbl_CandidateBGCCheckList")
public class CandidateBGCCheckList {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)	
	@Column(name="bgc_checklist_id")
	private int bgc_checklist_id;
	          
	@Column(name="bgc_id")
	private int bgc_id;
	  
	@Column(name="profile_id")
	private int profile_id;
	
	@Column(name="category_id")
	private int category_id;
	
	@Column(name="subcategory_id")
	private int subcategory_id;
	
	@Column(name="status")
	private String status;
	@Column(name="candidate_status")
	private String candidate_status;
	
	
	@Column(name="candidate_id")
	private int candidate_id;
	
	@Column(name="posted_by")
	private int posted_by;
		
	@Temporal(TemporalType.DATE)
	@Column(name="submitted_date")
	private Date submitted_date;

	public int getBgc_checklist_id() {
		return bgc_checklist_id;
	}

	public void setBgc_checklist_id(int bgc_checklist_id) {
		this.bgc_checklist_id = bgc_checklist_id;
	}

	public int getBgc_id() {
		return bgc_id;
	}

	public void setBgc_id(int bgc_id) {
		this.bgc_id = bgc_id;
	}

	public int getProfile_id() {
		return profile_id;
	}

	public void setProfile_id(int profile_id) {
		this.profile_id = profile_id;
	}

	public int getCategory_id() {
		return category_id;
	}

	public void setCategory_id(int category_id) {
		this.category_id = category_id;
	}

	public int getSubcategory_id() {
		return subcategory_id;
	}

	public void setSubcategory_id(int subcategory_id) {
		this.subcategory_id = subcategory_id;
	}	

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getCandidate_id() {
		return candidate_id;
	}

	public void setCandidate_id(int candidate_id) {
		this.candidate_id = candidate_id;
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

	public String getCandidate_status() {
		return candidate_status;
	}

	public void setCandidate_status(String candidate_status) {
		this.candidate_status = candidate_status;
	}

	
}
