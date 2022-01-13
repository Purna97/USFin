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
@Table(name="Tbl_SubCategoryDocuments")
public class SubCategoryDocumentsEntity {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)	
	@Column(name="document_id")
	private int doc_id;
	
	@Column(name="subcat_id")
	private Integer subcat_id;
		
	@Column(name="file_name")
	private String file_name;
	
	@Column(name="document_status")
	private String docStatus;
	
	@Column(name="posted_by")
	private int posted_by;
	
	@Temporal(TemporalType.DATE)
	@Column(name="submitted_date")
	private Date submitted_date;

	public Integer getSubcat_id() {
		return subcat_id;
	}

	public void setSubcat_id(Integer subcat_id) {
		this.subcat_id = subcat_id;
	}

	public int getDoc_id() {
		return doc_id;
	}

	public void setDoc_id(int doc_id) {
		this.doc_id = doc_id;
	}

	public String getFile_name() {
		return file_name;
	}

	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}

	public String getDocStatus() {
		return docStatus;
	}

	public void setDocStatus(String docStatus) {
		this.docStatus = docStatus;
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
