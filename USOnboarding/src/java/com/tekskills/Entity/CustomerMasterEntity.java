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
@Table(name="Tbl_CustomerMaster")
public class CustomerMasterEntity {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="customer_id")
	private int customer_id; 
	
	@Column(name="customer_name")
	private String customer_name;
	
	@Column(name="customer_address")
	private String customer_add;
	
	@Column(name="customer_contact_no")
	private String customer_contact_no;
	
	@Column(name="customer_mgr_email")
	private String mgr_email;
	
	@Column(name="status")
	private String status;
	
	@Temporal(TemporalType.DATE)
	@Column(name = "submitted_on")
	private Date submittedOn;
	
	@Column(name="posted_by")
	private int postedBy;
	
	@Column(name="fed_id")
	private String fed_id;

	@Column(name="qb_customerid")
	private Integer qb_customerid; 
	
	@Column(name="payment_terms")
	private String payment_terms;
	
	@Column(name="notes")
	private String notes;

	public Integer getQb_customerid() {
		return qb_customerid;
	}

	public void setQb_customerid(Integer qb_customerid) {
		this.qb_customerid = qb_customerid;
	}

	public String getNotes() {
		return notes;
	}

	public void setNotes(String notes) {
		this.notes = notes;
	}

	public String getPayment_terms() {
		return payment_terms;
	}

	public void setPayment_terms(String payment_terms) {
		this.payment_terms = payment_terms;
	}

	public String getFed_id() {
		return fed_id;
	}

	public void setFed_id(String fed_id) {
		this.fed_id = fed_id;
	}

	public int getCustomer_id() {
		return customer_id;
	}

	public void setCustomer_id(int customer_id) {
		this.customer_id = customer_id;
	}

	public String getCustomer_name() {
		return customer_name;
	}

	public void setCustomer_name(String customer_name) {
		this.customer_name = customer_name;
	}

	public String getCustomer_add() {
		return customer_add;
	}

	public void setCustomer_add(String customer_add) {
		this.customer_add = customer_add;
	}

	public String getMgr_email() {
		return mgr_email;
	}

	public void setMgr_email(String mgr_email) {
		this.mgr_email = mgr_email;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Date getSubmittedOn() {
		return submittedOn;
	}

	public void setSubmittedOn(Date submittedOn) {
		this.submittedOn = submittedOn;
	}

	public int getPostedBy() {
		return postedBy;
	}

	public void setPostedBy(int postedBy) {
		this.postedBy = postedBy;
	}

	public String getCustomer_contact_no() {
		return customer_contact_no;
	}

	public void setCustomer_contact_no(String customer_contact_no) {
		this.customer_contact_no = customer_contact_no;
	}
}
