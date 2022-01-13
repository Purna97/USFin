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
@Table(name="Tbl_EmpDocumentshistory")
public class EmpDocumentsHistoryEntity {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="documenthistory_id")
	private int documenthistory_id; 
	
	@Column(name="document_id")
	private int document_id; 
		
	@Column(name="file_name")
	private String file_name;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="submitted_date")
	private Date submit_date;
	
	@Column(name="posted_by")
	private int PostedBy;
	
	@Column(name="file_type")
	private String filetype;
	
	@Column(name="candidate_id")
	private int candidate_id;
	
	@Column(name="customer_id")
	private int customer_id;
	
	@Column(name="vendor_id")
	private int vendorid;	

	@Column(name="input_value")
	private String inputvalue;


	@Column(name="status")
	private String status;
	
	@Column(name="from_date")
	private String from_date;
	
	@Column(name="expiry_date")
	private String expiry_date;
	
	@Column(name="documenttype_id")
	private int documenttype_id;
	
	@Column(name="documentsubtype_id")
	private int documentsubtype_id;
	
	@Column(name="payrate_id")
	private int payrate_id;
	
	@Column(name="lca_id")
	private Integer lca_id;
	
	@Column(name="client_id")
	private Integer client_id;

	@Column(name="h1b_checklist_id")
	private Integer h1b_checklist_id;

	@Column(name="initiate_id")
	private Integer initiate_id;

	@Column(name="h1b_id")
	private Integer h1b_id;

	public Integer getClient_id() {
		return client_id;
	}

	public void setClient_id(Integer client_id) {
		this.client_id = client_id;
	}

	
	public Integer getLca_id() {
		return lca_id;
	}

	public void setLca_id(Integer lca_id) {
		this.lca_id = lca_id;
	}

	public int getDocumenttype_id() {
		return documenttype_id;
	}

	public void setDocumenttype_id(int documenttype_id) {
		this.documenttype_id = documenttype_id;
	}

	public int getDocumentsubtype_id() {
		return documentsubtype_id;
	}

	public void setDocumentsubtype_id(int documentsubtype_id) {
		this.documentsubtype_id = documentsubtype_id;
	}

	public int getPayrate_id() {
		return payrate_id;
	}

	public void setPayrate_id(int payrate_id) {
		this.payrate_id = payrate_id;
	}

	public int getDocumenthistory_id() {
		return documenthistory_id;
	}

	public void setDocumenthistory_id(int documenthistory_id) {
		this.documenthistory_id = documenthistory_id;
	}

	public int getCandidate_id() {
		return candidate_id;
	}

	public void setCandidate_id(int candidate_id) {
		this.candidate_id = candidate_id;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getDocument_id() {
		return document_id;
	}

	public void setDocument_id(int document_id) {
		this.document_id = document_id;
	}

	public String getFile_name() {
		return file_name;
	}

	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}

	public int getPostedBy() {
		return PostedBy;
	}

	public void setPostedBy(int postedBy) {
		PostedBy = postedBy;
	}

	public String getFiletype() {
		return filetype;
	}

	public void setFiletype(String filetype) {
		this.filetype = filetype;
	}	

	public int getCustomer_id() {
		return customer_id;
	}

	public void setCustomer_id(int customer_id) {
		this.customer_id = customer_id;
	}

	public int getVendorid() {
		return vendorid;
	}

	public void setVendorid(int vendorid) {
		this.vendorid = vendorid;
	}

	public String getInputvalue() {
		return inputvalue;
	}

	public void setInputvalue(String inputvalue) {
		this.inputvalue = inputvalue;
	}

	public Date getSubmit_date() {
		return submit_date;
	}

	public Integer getH1b_checklist_id() {
		return h1b_checklist_id;
	}

	public void setH1b_checklist_id(Integer h1b_checklist_id) {
		this.h1b_checklist_id = h1b_checklist_id;
	}

	public Integer getInitiate_id() {
		return initiate_id;
	}

	public void setInitiate_id(Integer initiate_id) {
		this.initiate_id = initiate_id;
	}

	public Integer getH1b_id() {
		return h1b_id;
	}

	public void setH1b_id(Integer h1b_id) {
		this.h1b_id = h1b_id;
	}

	public void setSubmit_date(Date submit_date) {
		this.submit_date = submit_date;
	}

	public String getFrom_date() {
		return from_date;
	}

	public void setFrom_date(String from_date) {
		this.from_date = from_date;
	}

	public String getExpiry_date() {
		return expiry_date;
	}

	public void setExpiry_date(String expiry_date) {
		this.expiry_date = expiry_date;
	}
}
