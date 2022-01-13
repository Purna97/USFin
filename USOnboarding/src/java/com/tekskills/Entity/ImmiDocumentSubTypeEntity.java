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
@Table(name="ImmiDocumentSubTypeMaster")
public class ImmiDocumentSubTypeEntity {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="subdocumenttype_id ")
	private int subdocumenttype_id ;
	
	@Column(name="documenttype_id")
	private Integer documenttype_id;
		
	@Column(name="document_type")
	private String document_type;
	
	@Column(name="status")
	private String status;
	
	@Column(name="posted_by")
	private int posted_by;
	
	@Temporal(TemporalType.DATE)
	@Column(name="submitted_date")
	private Date submitted_date;
	
	@Column(name="issubycand")
	private Integer issubycand;
	
	@Column(name="is_same")
	private Integer is_same;

	public Integer getIssubycand() {
		return issubycand;
	}

	public void setIssubycand(Integer issubycand) {
		this.issubycand = issubycand;
	}

	public int getSubdocumenttype_id() {
		return subdocumenttype_id;
	}

	public void setSubdocumenttype_id(int subdocumenttype_id) {
		this.subdocumenttype_id = subdocumenttype_id;
	}

	public Integer getDocumenttype_id() {
		return documenttype_id;
	}

	public void setDocumenttype_id(Integer documenttype_id) {
		this.documenttype_id = documenttype_id;
	}

	public String getDocument_type() {
		return document_type;
	}

	public void setDocument_type(String document_type) {
		this.document_type = document_type;
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

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Integer getIs_same() {
		return is_same;
	}

	public void setIs_same(Integer is_same) {
		this.is_same = is_same;
	}


}
