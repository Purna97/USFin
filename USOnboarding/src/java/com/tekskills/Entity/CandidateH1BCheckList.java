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
@Table(name="Tbl_CandidateH1BCheckList")
public class CandidateH1BCheckList {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)	
	@Column(name="h1b_checklist_id")
	private int h1b_checklist_id;
	          
	@Column(name="initiate_id")
	private int initiate_id;
	  
	@Column(name="profile_id")
	private int profile_id;
	
	@Column(name="documenttype_id")
	private int documenttype_id;
	
	@Column(name="subdoctype_id")
	private int subdoctype_id;	
	
	@Column(name="candidate_id")
	private int candidate_id;
	
	@Column(name="posted_by")
	private int posted_by;
		
	@Temporal(TemporalType.DATE)
	@Column(name="submitted_date")
	private Date submitted_date;
	
	@Column(name="candidate_status")
	private String candidate_status;
	
	@Column(name="verifier_status")
	private String verifier_status;
	
	@Column(name="profile_type")
	private String profile_type;
	
	@Column(name="questionnarie_childid")
	private Integer questionnarie_childid;
	
	@Column(name="printed_status")
	private String printed_status;

	@Column(name="isdocshowntocand")
	private String isdocshown;

	public String getIsdocshown() {
		return isdocshown;
	}

	public void setIsdocshown(String isdocshown) {
		this.isdocshown = isdocshown;
	}
	
	public String getPrinted_status() {
		return printed_status;
	}

	public void setPrinted_status(String printed_status) {
		this.printed_status = printed_status;
	}

	public Integer getQuestionnarie_childid() {
		return questionnarie_childid;
	}

	public void setQuestionnarie_childid(Integer questionnarie_childid) {
		this.questionnarie_childid = questionnarie_childid;
	}

	public String getCandidate_status() {
		return candidate_status;
	}

	public void setCandidate_status(String candidate_status) {
		this.candidate_status = candidate_status;
	}

	public String getVerifier_status() {
		return verifier_status;
	}

	public void setVerifier_status(String verifier_status) {
		this.verifier_status = verifier_status;
	}

	public int getH1b_checklist_id() {
		return h1b_checklist_id;
	}

	public void setH1b_checklist_id(int h1b_checklist_id) {
		this.h1b_checklist_id = h1b_checklist_id;
	}

	public int getInitiate_id() {
		return initiate_id;
	}

	public void setInitiate_id(int initiate_id) {
		this.initiate_id = initiate_id;
	}

	public int getProfile_id() {
		return profile_id;
	}

	public void setProfile_id(int profile_id) {
		this.profile_id = profile_id;
	}

	public int getDocumenttype_id() {
		return documenttype_id;
	}

	public void setDocumenttype_id(int documenttype_id) {
		this.documenttype_id = documenttype_id;
	}

	public int getSubdoctype_id() {
		return subdoctype_id;
	}

	public void setSubdoctype_id(int subdoctype_id) {
		this.subdoctype_id = subdoctype_id;
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

	public String getProfile_type() {
		return profile_type;
	}

	public void setProfile_type(String profile_type) {
		this.profile_type = profile_type;
	}

	
}
