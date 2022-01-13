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
@Table(name="Temp_Tbl_ClientVendorLetterQuestionnaire")
public class TempClientVendorQuestionnarieEntity {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="client_id")
	private int client_id; 
	
	@Column(name="candidate_id")
	private int candidate_id; 
	
	@Column(name="beneficiary_name")
	private String beneficiary_name;
	
	@Column(name="beneficiary_job_title")
	private String beneficiary_job_title;
	
	@Column(name="start_date")
	private String start_date;
	
	@Column(name="end_date")
	private String end_date;
	
	@Column(name="job_duties")
	private String job_duties;
	
	@Column(name="working_location")
	private String working_location;
	
	@Column(name="line1")
	private String line1;
	
	@Column(name="line2")
	private String line2;
	
	@Column(name="city")
	private String city;
	
	@Column(name="state")
	private String state;
	
	@Column(name="zipcode")
	private String zipcode;	
	
	@Column(name="reporting_to")
	private String reporting_to;

	@Column(name="reporting_manager_name")
	private String reporting_manager_name;
	
	@Column(name="reporting_manager_title")
	private String reporting_manager_title;
	
	@Column(name="reporting_manager_contact")
	private String reporting_manager_contact;
	
	@Column(name="reporting_manager_emailid")
	private String reporting_manager_emailid;
	
	@Column(name="status")
	private int status;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="submitted_on")
	private Date submittedOn;
	
	@Column(name="initiate_id")
	private Integer initiate_id; 
	

	public Integer getInitiate_id() {
		return initiate_id;
	}

	public void setInitiate_id(Integer initiate_id) {
		this.initiate_id = initiate_id;
	}


	public int getClient_id() {
		return client_id;
	}

	public void setClient_id(int client_id) {
		this.client_id = client_id;
	}

	public int getCandidate_id() {
		return candidate_id;
	}

	public void setCandidate_id(int candidate_id) {
		this.candidate_id = candidate_id;
	}

	public String getBeneficiary_name() {
		return beneficiary_name;
	}

	public void setBeneficiary_name(String beneficiary_name) {
		this.beneficiary_name = beneficiary_name;
	}

	public String getBeneficiary_job_title() {
		return beneficiary_job_title;
	}

	public void setBeneficiary_job_title(String beneficiary_job_title) {
		this.beneficiary_job_title = beneficiary_job_title;
	}

	public String getStart_date() {
		return start_date;
	}

	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}

	public String getEnd_date() {
		return end_date;
	}

	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}

	public String getJob_duties() {
		return job_duties;
	}

	public void setJob_duties(String job_duties) {
		this.job_duties = job_duties;
	}

	public String getWorking_location() {
		return working_location;
	}

	public void setWorking_location(String working_location) {
		this.working_location = working_location;
	}

	public String getLine1() {
		return line1;
	}

	public void setLine1(String line1) {
		this.line1 = line1;
	}

	public String getLine2() {
		return line2;
	}

	public void setLine2(String line2) {
		this.line2 = line2;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public String getReporting_to() {
		return reporting_to;
	}

	public void setReporting_to(String reporting_to) {
		this.reporting_to = reporting_to;
	}

	public String getReporting_manager_name() {
		return reporting_manager_name;
	}

	public void setReporting_manager_name(String reporting_manager_name) {
		this.reporting_manager_name = reporting_manager_name;
	}

	public String getReporting_manager_title() {
		return reporting_manager_title;
	}

	public void setReporting_manager_title(String reporting_manager_title) {
		this.reporting_manager_title = reporting_manager_title;
	}

	public String getReporting_manager_contact() {
		return reporting_manager_contact;
	}

	public void setReporting_manager_contact(String reporting_manager_contact) {
		this.reporting_manager_contact = reporting_manager_contact;
	}

	public String getReporting_manager_emailid() {
		return reporting_manager_emailid;
	}

	public void setReporting_manager_emailid(String reporting_manager_emailid) {
		this.reporting_manager_emailid = reporting_manager_emailid;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public Date getSubmittedOn() {
		return submittedOn;
	}

	public void setSubmittedOn(Date submittedOn) {
		this.submittedOn = submittedOn;
	}
	
	
}
