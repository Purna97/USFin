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
@Table(name="Tbl_BankPaymentDetails")
public class BankPaymentDetailsEntity {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="payment_id")
	private int payment_id; 
	
	@Column(name="account_no")
	private String accountNo;
	
	@Column(name="swift_code")
	private String swift_Code;
	
	@Column(name="iban_code")
	private String iban_Code;
	
	@Column(name="bank_routing_no")
	private String bankRoutingNo;
	
	@Column(name="bank_filename")
	private String bankfilename;
	
	@Column(name="bank_name")
	private String bank_name;
	
	@Column(name="vendor_id")
	private Integer vendorid; 
	
	@Column(name="candidate_id")
	private int candidate_id; 
	
	@Column(name="payment_mode")
	private String payment_mode; 
	
	@Column(name="status")
	private String status;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="submitted_on")
	private Date submitted_date; 
	
	
	@Column(name="posted_by")
	private int posted_by; 
	
	public int getPayment_id() {
		return payment_id;
	}

	public void setPayment_id(int payment_id) {
		this.payment_id = payment_id;
	}

	
	public int getCandidate_id() {
		return candidate_id;
	}

	public void setCandidate_id(int candidate_id) {
		this.candidate_id = candidate_id;
	}

	public String getAccountNo() {
		return accountNo;
	}

	public void setAccountNo(String accountNo) {
		this.accountNo = accountNo;
	}

	public String getSwift_Code() {
		return swift_Code;
	}

	public void setSwift_Code(String swift_Code) {
		this.swift_Code = swift_Code;
	}

	public String getIban_Code() {
		return iban_Code;
	}

	public void setIban_Code(String iban_Code) {
		this.iban_Code = iban_Code;
	}

	public String getBankRoutingNo() {
		return bankRoutingNo;
	}

	public void setBankRoutingNo(String bankRoutingNo) {
		this.bankRoutingNo = bankRoutingNo;
	}

	public String getBankfilename() {
		return bankfilename;
	}

	public void setBankfilename(String bankfilename) {
		this.bankfilename = bankfilename;
	}

	public String getBank_name() {
		return bank_name;
	}

	public void setBank_name(String bank_name) {
		this.bank_name = bank_name;
	}



	/*public Integer getVendorid() {
		return vendorid;
	}

	public void setVendorid(Integer vendorid) {
		this.vendorid = vendorid;
	}*/
	
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

	public int getPosted_by() {
		return posted_by;
	}

	public void setPosted_by(int posted_by) {
		this.posted_by = posted_by;
	}

	public Integer getVendorid() {
		return vendorid;
	}

	public void setVendorid(Integer vendorid) {
		this.vendorid = vendorid;
	}

	public String getPayment_mode() {
		return payment_mode;
	}

	public void setPayment_mode(String payment_mode) {
		this.payment_mode = payment_mode;
	}
}
