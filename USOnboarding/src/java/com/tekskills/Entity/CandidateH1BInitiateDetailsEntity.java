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
@Table(name="Tbl_CandidateH1BInitiateDetails")
public class CandidateH1BInitiateDetailsEntity {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)	
	@Column(name="initiate_id")
	private int initiate_id;
	
	@Column(name="candidate_id")
	private int candidate_id;
	  
	@Column(name="profile_id")
	private int profile_id;
	
	@Column(name="status")
	private String status;

	@Column(name="posted_by")
	private int posted_by;
		
	@Temporal(TemporalType.DATE)
	@Column(name="submitted_date")
	private Date submitted_date;
	
	@Column(name="marital_status")
	private String marital_status;
	
	@Column(name="filingforspouse")
	private String filingforspouse;
	
	@Column(name="spouse_profile_id")
	private Integer spouse_profile_id;

	
	@Column(name="kids_status")
	private String kids_status;
	
	@Column(name="filingforkids")
	private String filingforkid;
	
	@Column(name="kids_profile_id")
	private Integer kids_profile_id;
	
	
	@Column(name="filingspouse_ead")
	private String filingspouse_ead;
	
	@Column(name="ead_profile_id")
	private Integer ead_profile_id;
	
	@Column(name="initiaion_status")
	private String initiaion_status;
	
	@Column(name="comments")
	private String comments;
	
	@Temporal(TemporalType.DATE)
	@Column(name="inactivated_date")
	private Date inactivated_date;
	
	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public Date getInactivated_date() {
		return inactivated_date;
	}

	public void setInactivated_date(Date inactivated_date) {
		this.inactivated_date = inactivated_date;
	}

	public String getInitiaion_status() {
		return initiaion_status;
	}

	public void setInitiaion_status(String initiaion_status) {
		this.initiaion_status = initiaion_status;
	}
	
	public String getFilingforspouse() {
		return filingforspouse;
	}

	public void setFilingforspouse(String filingforspouse) {
		this.filingforspouse = filingforspouse;
	}

	public Integer getSpouse_profile_id() {
		return spouse_profile_id;
	}

	public void setSpouse_profile_id(Integer spouse_profile_id) {
		this.spouse_profile_id = spouse_profile_id;
	}

	public String getFilingforkid() {
		return filingforkid;
	}

	public void setFilingforkid(String filingforkid) {
		this.filingforkid = filingforkid;
	}

	public String getFilingspouse_ead() {
		return filingspouse_ead;
	}

	public void setFilingspouse_ead(String filingspouse_ead) {
		this.filingspouse_ead = filingspouse_ead;
	}

	public Integer getEad_profile_id() {
		return ead_profile_id;
	}

	public void setEad_profile_id(Integer ead_profile_id) {
		this.ead_profile_id = ead_profile_id;
	}

	public Integer getKids_profile_id() {
		return kids_profile_id;
	}

	public void setKids_profile_id(Integer kids_profile_id) {
		this.kids_profile_id = kids_profile_id;
	}

	public String getMarital_status() {
		return marital_status;
	}

	public void setMarital_status(String marital_status) {
		this.marital_status = marital_status;
	}

	public String getKids_status() {
		return kids_status;
	}

	public void setKids_status(String kids_status) {
		this.kids_status = kids_status;
	}

	public int getInitiate_id() {
		return initiate_id;
	}

	public void setInitiate_id(int initiate_id) {
		this.initiate_id = initiate_id;
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

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
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
