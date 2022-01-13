package com.tekskills.Dto;

public class EmpBankDetailsDto {
	private String accountNo;
	private String swift_Code;
	private String iban_Code;
	private String bank_Roting_No;
	private String bank_file_name;
	private String bank_name;
	private int vendorid;
	private int userid;
	private int emp_number;
	private String ssn_no;
	private int tblpk;
	private int amount;
	private String ven_name; 
	private String payment_mode;
	
	public String getPayment_mode() {
		return payment_mode;
	}
	public void setPayment_mode(String payment_mode) {
		this.payment_mode = payment_mode;
	}
	public String getVen_name() {
		return ven_name;
	}
	public void setVen_name(String ven_name) {
		this.ven_name = ven_name;
	}
	public int getEmp_number() {
		return emp_number;
	}
	public void setEmp_number(int emp_number) {
		this.emp_number = emp_number;
	}
	public String getSsn_no() {
		return ssn_no;
	}
	public void setSsn_no(String ssn_no) {
		this.ssn_no = ssn_no;
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
	public String getBank_Roting_No() {
		return bank_Roting_No;
	}
	public void setBank_Roting_No(String bank_Roting_No) {
		this.bank_Roting_No = bank_Roting_No;
	}
	public String getBank_file_name() {
		return bank_file_name;
	}
	public void setBank_file_name(String bank_file_name) {
		this.bank_file_name = bank_file_name;
	}
	public int getVendorid() {
		return vendorid;
	}
	public void setVendorid(int vendorid) {
		this.vendorid = vendorid;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public String getBank_name() {
		return bank_name;
	}
	public void setBank_name(String bank_name) {
		this.bank_name = bank_name;
	}
	public int getTblpk() {
		return tblpk;
	}
	public void setTblpk(int tblpk) {
		this.tblpk = tblpk;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	
}
