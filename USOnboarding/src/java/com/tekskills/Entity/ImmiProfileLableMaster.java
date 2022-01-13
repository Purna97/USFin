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
@Table(name="Tbl_ImmiProfileLableMaster")
public class ImmiProfileLableMaster {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	
	@Column(name="profile_id")
	private int profile_id;
	
	@Column(name="profile_name")
	private String profile_name;
	
	@Column(name="status")
	private String status;
	
	@Column(name="posted_by")
	private int posted_by;
	
	
	@Temporal(TemporalType.DATE)
	@Column(name="submitted_date")
	private Date submitted_date;

	@Column(name="isdependent")
	private String isdependent;
	
	public String getIsdependent() {
		return isdependent;
	}

	public void setIsdependent(String isdependent) {
		this.isdependent = isdependent;
	}
	
	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	public int getProfile_id() {
		return profile_id;
	}


	public void setProfile_id(int profile_id) {
		this.profile_id = profile_id;
	}


	public String getProfile_name() {
		return profile_name;
	}


	public void setProfile_name(String profile_name) {
		this.profile_name = profile_name;
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
