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
@Table(name="Tbl_PageStatus")
public class PageStatusEntity {
	      
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	
	@Column(name="page_status_id")
	private int psid;

	@Column(name="candidate_id")
	private int candidate_id;
	
	
	@Column(name="basicinfo_status")
	private int basicinfo_status;
	
	@Column(name="document_status")
	private int document_status;
	
	@Column(name="client_status")
	private int client_status;
	
	@Column(name="bank_status")
	private int bank_status;
	
	@Column(name="exit_status")
	private int exit_status;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="basic_submitted_on")
	private Date basic_submitdate;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="document_submitted_on")
	private Date document_submitdate;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="client_submitted_on")
	private Date client_submitdate;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="bank_submitted_on")
	private Date bank_submitdate;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="exit_submitted_on")
	private Date exit_submitdate;

	@Column(name="posted_by")
	private int postedBy;

	public int getPsid() {
		return psid;
	}

	public void setPsid(int psid) {
		this.psid = psid;
	}	

	public int getBasicinfo_status() {
		return basicinfo_status;
	}

	public void setBasicinfo_status(int basicinfo_status) {
		this.basicinfo_status = basicinfo_status;
	}

	public int getDocument_status() {
		return document_status;
	}

	public void setDocument_status(int document_status) {
		this.document_status = document_status;
	}

	public int getClient_status() {
		return client_status;
	}

	public void setClient_status(int client_status) {
		this.client_status = client_status;
	}

	public int getBank_status() {
		return bank_status;
	}

	public void setBank_status(int bank_status) {
		this.bank_status = bank_status;
	}

	public int getExit_status() {
		return exit_status;
	}

	public void setExit_status(int exit_status) {
		this.exit_status = exit_status;
	}

	public Date getBasic_submitdate() {
		return basic_submitdate;
	}

	public void setBasic_submitdate(Date basic_submitdate) {
		this.basic_submitdate = basic_submitdate;
	}

	public Date getDocument_submitdate() {
		return document_submitdate;
	}

	

	public void setDocument_submitdate(Date document_submitdate) {
		this.document_submitdate = document_submitdate;
	}

	public Date getClient_submitdate() {
		return client_submitdate;
	}

	public void setClient_submitdate(Date client_submitdate) {
		this.client_submitdate = client_submitdate;
	}

	public Date getBank_submitdate() {
		return bank_submitdate;
	}

	public void setBank_submitdate(Date bank_submitdate) {
		this.bank_submitdate = bank_submitdate;
	}

	public Date getExit_submitdate() {
		return exit_submitdate;
	}

	public void setExit_submitdate(Date exit_submitdate) {
		this.exit_submitdate = exit_submitdate;
	}

	public int getPostedBy() {
		return postedBy;
	}

	public void setPostedBy(int postedBy) {
		this.postedBy = postedBy;
	}

	public int getCandidate_id() {
		return candidate_id;
	}

	public void setCandidate_id(int candidate_id) {
		this.candidate_id = candidate_id;
	}
}
