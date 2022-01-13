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
@Table(name="Tbl_ProjectDetailsHistory")
public class ProjectDetailsHistory {
	      
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="projecthistory_id")
	private int projecthistory_id;
	
	@Column(name="payrate_id")
	private int payrate_id;
	 
	@Column(name="project_start_date")
	private String proj_startDate;
	
	@Column(name="project_end_date")
	private String proj_endDate;

	@Column(name="customer_id")
	private Integer customer_id;
	
	@Column(name="vendor_id")
	private Integer vendorid;
	
	@Column(name="candidate_id")
	private Integer candidate_id;

	@Column(name="posted_by")
	private int postedBy;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="submitted_on")
	private Date submittedOn;
	
	/*@Column(name="invoice_period")
	private String invoice_period;
	
	public String getInvoice_period() {
		return invoice_period;
	}

	public void setInvoice_period(String invoice_period) {
		this.invoice_period = invoice_period;
	}
	*/
	public Date getSubmittedOn() {
		return submittedOn;
	}

	public void setSubmittedOn(Date submittedOn) {
		this.submittedOn = submittedOn;
	}
	
	public String getProj_startDate() {
		return proj_startDate;
	}

	public void setProj_startDate(String proj_startDate) {
		this.proj_startDate = proj_startDate;
	}

	public String getProj_endDate() {
		return proj_endDate;
	}

	public void setProj_endDate(String proj_endDate) {
		this.proj_endDate = proj_endDate;
	}

	public Integer getCustomer_id() {
		return customer_id;
	}

	public void setCustomer_id(Integer customer_id) {
		this.customer_id = customer_id;
	}

	public Integer getVendorid() {
		return vendorid;
	}

	public void setVendorid(Integer vendorid) {
		this.vendorid = vendorid;
	}
	
	public int getPostedBy() {
		return postedBy;
	}

	public void setPostedBy(int postedBy) {
		this.postedBy = postedBy;
	}

	public int getPayrate_id() {
		return payrate_id;
	}

	public void setPayrate_id(int payrate_id) {
		this.payrate_id = payrate_id;
	}

	public Integer getCandidate_id() {
		return candidate_id;
	}

	public void setCandidate_id(Integer candidate_id) {
		this.candidate_id = candidate_id;
	}
}
