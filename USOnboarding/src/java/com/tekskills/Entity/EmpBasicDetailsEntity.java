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
@Table(name="Tbl_EmpBasicDetails")
public class EmpBasicDetailsEntity {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="candidate_id")
	private int candidate_id; 
	
	@Column(name="user_name")
	private String userName;
	
	@Column(name="password")
	private String pwd;
	
	@Column(name="full_name")
	private String fullName;
	
	@Column(name="email_id")
	private String email;	
		
	@Column(name="dob")
	private String dob;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="submitted_date")
	private Date submit_date;
	
	@Column(name="emp_number")
	private Integer emp_number;
	
	@Column(name="ssn_no")
	private String ssn_no;
		
	@Column(name="flag")
	private Integer flag; 
	
	@Column(name="posted_by")
	private int posted_by;
	
	@Column(name="middle_name")
	private String middle_name;
	
	@Column(name="family_name")
	private String family_name;	
	
	@Column(name="status")
	private int status;	
	
	@Column(name="contact_no1")
	private String contact_no1;	
	
	@Column(name="contact_no_type1")
	private String contact_no_type1;
	
	@Column(name="contact_no2")
	private String contact_no2;	
	
	@Column(name="contact_no_type2")
	private String contact_no_type2;
	
	@Column(name="contact_no3")
	private String contact_no3;	
	
	@Column(name="contact_no_type3")
	private String contact_no_type3;
	
	@Column(name="first_name")
	private String first_name;
	
	
	@Column(name="qbEmpID")
	private String qbEmpID;
	
	

	public String getQbEmpID() {
		return qbEmpID;
	}

	public void setQbEmpID(String qbEmpID) {
		this.qbEmpID = qbEmpID;
	}
	

	public String getFirst_name() {
		return first_name;
	}

	public void setFirst_name(String first_name) {
		this.first_name = first_name;
	}

	public int getCandidate_id() {
		return candidate_id;
	}

	public void setCandidate_id(int candidate_id) {
		this.candidate_id = candidate_id;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getDob() {
		return dob;
	}

	public void setDob(String dob) {
		this.dob = dob;
	}

	public Date getSubmit_date() {
		return submit_date;
	}

	public void setSubmit_date(Date submit_date) {
		this.submit_date = submit_date;
	}

	public Integer getEmp_number() {
		return emp_number;
	}

	public void setEmp_number(Integer emp_number) {
		this.emp_number = emp_number;
	}

	public String getSsn_no() {
		return ssn_no;
	}

	public void setSsn_no(String ssn_no) {
		this.ssn_no = ssn_no;
	}

	public Integer getFlag() {
		return flag;
	}

	public void setFlag(Integer flag) {
		this.flag = flag;
	}

	public int getPosted_by() {
		return posted_by;
	}

	public void setPosted_by(int posted_by) {
		this.posted_by = posted_by;
	}

	public String getMiddle_name() {
		return middle_name;
	}

	public void setMiddle_name(String middle_name) {
		this.middle_name = middle_name;
	}

	public String getFamily_name() {
		return family_name;
	}

	public void setFamily_name(String family_name) {
		this.family_name = family_name;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getContact_no1() {
		return contact_no1;
	}

	public void setContact_no1(String contact_no1) {
		this.contact_no1 = contact_no1;
	}

	public String getContact_no_type1() {
		return contact_no_type1;
	}

	public void setContact_no_type1(String contact_no_type1) {
		this.contact_no_type1 = contact_no_type1;
	}

	public String getContact_no2() {
		return contact_no2;
	}

	public void setContact_no2(String contact_no2) {
		this.contact_no2 = contact_no2;
	}

	public String getContact_no_type2() {
		return contact_no_type2;
	}

	public void setContact_no_type2(String contact_no_type2) {
		this.contact_no_type2 = contact_no_type2;
	}

	public String getContact_no3() {
		return contact_no3;
	}

	public void setContact_no3(String contact_no3) {
		this.contact_no3 = contact_no3;
	}

	public String getContact_no_type3() {
		return contact_no_type3;
	}

	public void setContact_no_type3(String contact_no_type3) {
		this.contact_no_type3 = contact_no_type3;
	}	
}
