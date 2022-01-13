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
@Table(name="Tbl_VendorPayRateDetails")
public class EmpPayRateDetails {
	      
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="payrate_id")
	private int payrate_id;
	 
	@Column(name="pay_rate")
	private String payrate;
	
	@Column(name="bill_rate")
	private String billrate;
	
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
	
	@Column(name="payment_terms")
	private String payment_terms;
	
	@Column(name="invoice_terms")
	private String invoice_terms;
		
	@Column(name="Status")
	private String Status;
	
	@Column(name="project_status")
	private String project_status;
	
	@Column(name="payroll_type")
	private String payroll_type;
	
	public String getPayroll_type() {
		return payroll_type;
	}

	public void setPayroll_type(String payroll_type) {
		this.payroll_type = payroll_type;
	}

	public String getProject_status() {
		return project_status;
	}

	public void setProject_status(String project_status) {
		this.project_status = project_status;
	}

	@Column(name="posted_by")
	private int postedBy;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="submitted_on")
	private Date submittedOn;
	
	@Column(name="invoice_period")
	private String invoice_period;
	
	public String getInvoice_period() {
		return invoice_period;
	}

	public void setInvoice_period(String invoice_period) {
		this.invoice_period = invoice_period;
	}

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

	public String getPayment_terms() {
		return payment_terms;
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

	public void setPayment_terms(String payment_terms) {
		this.payment_terms = payment_terms;
	}

	public String getInvoice_terms() {
		return invoice_terms;
	}

	public void setInvoice_terms(String invoice_terms) {
		this.invoice_terms = invoice_terms;
	}

	public String getStatus() {
		return Status;
	}

	public void setStatus(String status) {
		Status = status;
	}
	
	public int getPostedBy() {
		return postedBy;
	}

	public void setPostedBy(int postedBy) {
		this.postedBy = postedBy;
	}

	public String getPayrate() {
		return payrate;
	}

	public void setPayrate(String payrate) {
		this.payrate = payrate;
	}

	public String getBillrate() {
		return billrate;
	}

	public int getPayrate_id() {
		return payrate_id;
	}

	public void setPayrate_id(int payrate_id) {
		this.payrate_id = payrate_id;
	}

	public void setBillrate(String billrate) {
		this.billrate = billrate;
	}

	public Integer getCandidate_id() {
		return candidate_id;
	}

	public void setCandidate_id(Integer candidate_id) {
		this.candidate_id = candidate_id;
	}
}
