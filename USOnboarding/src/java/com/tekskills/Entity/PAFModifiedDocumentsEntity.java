package com.tekskills.Entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="PAFModifiedDocuments")
public class PAFModifiedDocumentsEntity {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="document_id")
	private int document_id; 
	
	@Column(name="input_value")
	private String input_value;
	
	@Column(name="file_name")
	private String file_name;
	
	@Column(name="paf_type")
	private String paf_type;
	
	@Column(name="lca_id")
	private int lca_id; 
	@Column(name="initiate_id")
	private int initiate_id; 
	
	@Column(name="candidate_id")
	private int candidate_id; 
	
	@Column(name="posted_by")
	private int posted_by; 
	
	@Column(name="status")
	private String status;

	@Column(name="submitted_date")
	private Date submitted_date;

	public int getDocument_id() {
		return document_id;
	}

	public void setDocument_id(int document_id) {
		this.document_id = document_id;
	}

	public String getInput_value() {
		return input_value;
	}

	public void setInput_value(String input_value) {
		this.input_value = input_value;
	}

	public String getFile_name() {
		return file_name;
	}

	public void setFile_name(String file_name) {
		this.file_name = file_name;
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

	public int getPosted_by() {
		return posted_by;
	}

	public void setPosted_by(int posted_by) {
		this.posted_by = posted_by;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Date getSubmitted_date() {
		return submitted_date;
	}

	public void setSubmitted_date(Date submitted_date) {
		this.submitted_date = submitted_date;
	}

	public String getPaf_type() {
		return paf_type;
	}

	public void setPaf_type(String paf_type) {
		this.paf_type = paf_type;
	}

	public int getLca_id() {
		return lca_id;
	}

	public void setLca_id(int lca_id) {
		this.lca_id = lca_id;
	} 
	
	
	
}
