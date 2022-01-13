package com.tekskills.Entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name="Tbl_CandidateDetailedInfo")
public class CandidateDetailedInfo {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="emp_details_id")
	private int emp_details_id; 
	
	@ManyToOne
	@JoinColumn(name="candidate_id")
	private EmpBasicDetailsEntity candidateInfo;
	
	public EmpBasicDetailsEntity getCandidateInfo() {
		return candidateInfo;
	}

	public void setCandidateInfo(EmpBasicDetailsEntity candidateInfo) {
		this.candidateInfo = candidateInfo;
	}

	@Column(name="department_id")
	private int department_id;
	
	@Column(name="role_id")
	private int role_id;
	
	@Column(name="reporting_head")
	private int reporting_head;
	
	@Column(name="work_authorization")
	private String work_authorization;
	
	@Column(name="designation")
	private String designation;
	
	@Column(name="bgc_type")
	private String bgc_type;
	
	@Temporal(TemporalType.DATE)
	@Column(name="joining_date")
	private Date joining_date;
	
	@Column(name="recruiter_name")
	private String recruiter_name;
	
	@Column(name="hr_name")
	private String hr_name;
	
	@Column(name="status")
	private String status;
	
	@Column(name="posted_by")
	private int posted_by;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="submitted_on")
	private Date submitted_on;
	
	@Column(name="c2c_type")
	private String c2c_type;
	
	@Column(name="contact_team_person")
	private String contact_team_person;
	
	@Column(name="emp_billing")
	private String emp_billing;
	
	@Column(name="emp_type")
	private String emp_type;
	
	@Column(name="payroll_type")
	private String payroll_type ;
	
	@Column(name="validateby_flag")
	private Integer validateby_flag ;

	public int getEmp_details_id() {
		return emp_details_id;
	}

	public void setEmp_details_id(int emp_details_id) {
		this.emp_details_id = emp_details_id;
	}

	public int getDepartment_id() {
		return department_id;
	}

	public void setDepartment_id(int department_id) {
		this.department_id = department_id;
	}

	public int getRole_id() {
		return role_id;
	}

	public void setRole_id(int role_id) {
		this.role_id = role_id;
	}

	public int getReporting_head() {
		return reporting_head;
	}

	public void setReporting_head(int reporting_head) {
		this.reporting_head = reporting_head;
	}

	public String getWork_authorization() {
		return work_authorization;
	}

	public void setWork_authorization(String work_authorization) {
		this.work_authorization = work_authorization;
	}

	public String getDesignation() {
		return designation;
	}

	public void setDesignation(String designation) {
		this.designation = designation;
	}

	public String getPayroll_type() {
		return payroll_type;
	}

	public void setPayroll_type(String payroll_type) {
		this.payroll_type = payroll_type;
	}

	public String getBgc_type() {
		return bgc_type;
	}

	public void setBgc_type(String bgc_type) {
		this.bgc_type = bgc_type;
	}


	public String getRecruiter_name() {
		return recruiter_name;
	}

	public void setRecruiter_name(String recruiter_name) {
		this.recruiter_name = recruiter_name;
	}

	public String getHr_name() {
		return hr_name;
	}

	public Date getJoining_date() {
		return joining_date;
	}

	public void setJoining_date(Date joining_date) {
		this.joining_date = joining_date;
	}

	public void setHr_name(String hr_name) {
		this.hr_name = hr_name;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getPosted_by() {
		return posted_by;
	}

	public void setPosted_by(int posted_by) {
		this.posted_by = posted_by;
	}

	public Date getSubmitted_on() {
		return submitted_on;
	}

	public void setSubmitted_on(Date submitted_on) {
		this.submitted_on = submitted_on;
	}

	public String getC2c_type() {
		return c2c_type;
	}

	public void setC2c_type(String c2c_type) {
		this.c2c_type = c2c_type;
	}

	

	public Integer getValidateby_flag() {
		return validateby_flag;
	}

	public void setValidateby_flag(Integer validateby_flag) {
		this.validateby_flag = validateby_flag;
	}

	public String getContact_team_person() {
		return contact_team_person;
	}

	public void setContact_team_person(String contact_team_person) {
		this.contact_team_person = contact_team_person;
	}

	public String getEmp_billing() {
		return emp_billing;
	}

	public void setEmp_billing(String emp_billing) {
		this.emp_billing = emp_billing;
	}

	public String getEmp_type() {
		return emp_type;
	}

	public void setEmp_type(String emp_type) {
		this.emp_type = emp_type;
	}
}
