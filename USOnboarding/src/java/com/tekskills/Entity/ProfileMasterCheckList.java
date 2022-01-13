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
@Table(name="Tbl_ProfileMasterCheckList")
public class ProfileMasterCheckList {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	
	@Column(name="checklist_id")
	private int checklist_id;
	
	@Column(name="profile_id")
	private int profile_id;
	
	@Column(name="subcategory_id")
	private int subcategory_id;
	
	@Column(name="posted_by")
	private int posted_by;
	
	
	@Temporal(TemporalType.DATE)
	@Column(name="submitted_date")
	private Date submitted_date;


	public int getChecklist_id() {
		return checklist_id;
	}


	public void setChecklist_id(int checklist_id) {
		this.checklist_id = checklist_id;
	}


	public int getProfile_id() {
		return profile_id;
	}


	public void setProfile_id(int profile_id) {
		this.profile_id = profile_id;
	}


	public int getSubcategory_id() {
		return subcategory_id;
	}


	public void setSubcategory_id(int subcategory_id) {
		this.subcategory_id = subcategory_id;
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
