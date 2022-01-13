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
@Table(name="Tbl_SubCategoryMaster")
public class SubCategoryEntity {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	
	@Column(name="subcategory_id")
	private int subcategory_id;
	
	@Column(name="category_id")
	private int category_id;
	
	@Column(name="is_same")
	private int is_same;
		
	@Column(name="subcategory_name")
	private String subcategory_name;
	
	@Column(name="posted_by")
	private int posted_by;
	
	@Column(name="subcategory_type")
	private Integer subcategory_type;
	
	@Column(name="documenttype_id")
	private Integer documenttype_id;
	
	
	
	@Temporal(TemporalType.DATE)
	@Column(name="submitted_date")
	private Date submitted_date;
	
	@Column(name="document_status")
	private String docStatus;

	public String getDocStatus() {
		return docStatus;
	}

	public void setDocStatus(String docStatus) {
		this.docStatus = docStatus;
	}
	
	public int getSubcategory_id() {
		return subcategory_id;
	}

	public void setSubcategory_id(int subcategory_id) {
		this.subcategory_id = subcategory_id;
	}


	public int getCategory_id() {
		return category_id;
	}


	public void setCategory_id(int category_id) {
		this.category_id = category_id;
	}


	public int getIs_same() {
		return is_same;
	}


	public void setIs_same(int is_same) {
		this.is_same = is_same;
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
	public String getSubcategory_name() {
		return subcategory_name;
	}


	public void setSubcategory_name(String subcategory_name) {
		this.subcategory_name = subcategory_name;
	}


	public Integer getSubcategory_type() {
		return subcategory_type;
	}


	public void setSubcategory_type(Integer subcategory_type) {
		this.subcategory_type = subcategory_type;
	}


	public Integer getDocumenttype_id() {
		return documenttype_id;
	}


	public void setDocumenttype_id(Integer documenttype_id) {
		this.documenttype_id = documenttype_id;
	}

}
