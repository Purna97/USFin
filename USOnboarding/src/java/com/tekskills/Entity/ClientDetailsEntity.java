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
@Table(name="Tbl_ClientDetails")
public class ClientDetailsEntity {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="client_id")
	private int client_id; 
	
	@Column(name="client_name")
	private String clientName;
	
	@Column(name="client_address")
	private String clientAdd;
	
	@Column(name="client_mgr_name")
	private String client_mgr;
	
	@Column(name="client_mgr_extn")
	private String client_mgr_extn;
	
	@Column(name="client_mgr_email")
	private String client_mgr_email;
	
	@Column(name="emp_mailat_client")
	private String emp_mailat_client;

	@Column(name="emp_extnat_client")
	private String emp_extnat_client;
	
	@Column(name="candidate_id")
	private int candidate_id; 
	
	@Column(name="payrate_id")
	private Integer payrate_id; 
	

	@Column(name="status")
	private int status;
	
	@Column(name="fed_id")
	private String fed_id;
	
	@Column(name="posted_by")
	private int posted_by;
	
	@Column(name="project_name")
	private String project_name;
	
	@Column(name="client_type")
	private String client_type;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="submitted_on")
	private Date submittedOn;
	
	
	@Column(name="organization_name")
	String organization_name;
	
	@Column(name="job_title")
	String cand_job_title;
	
	@Column(name="education")
	String education; 
	
	@Column(name="county")
	String county; 
	
	@Column(name="soc_code")
	String soc_code;
	
	@Column(name="working_from")
	String workinglocation;
	
	@Column(name="amendment_status")
	String amendment_status;
	
	@Column(name="reason_lca")
	String reason_lca;

	@Column(name="metro_politan_area")
	private String metro_politan_area;
	
	
	
	public String getMetro_politan_area() {
		return metro_politan_area;
	}

	public void setMetro_politan_area(String metro_politan_area) {
		this.metro_politan_area = metro_politan_area;
	}

	public String getReason_lca() {
		return reason_lca;
	}

	public void setReason_lca(String reason_lca) {
		this.reason_lca = reason_lca;
	}

	public String getOrganization_name() {
		return organization_name;
	}

	public void setOrganization_name(String organization_name) {
		this.organization_name = organization_name;
	}

	public String getCand_job_title() {
		return cand_job_title;
	}

	public void setCand_job_title(String cand_job_title) {
		this.cand_job_title = cand_job_title;
	}

	public String getEducation() {
		return education;
	}

	public void setEducation(String education) {
		this.education = education;
	}

	public String getCounty() {
		return county;
	}

	public void setCounty(String county) {
		this.county = county;
	}

	public String getSoc_code() {
		return soc_code;
	}

	public void setSoc_code(String soc_code) {
		this.soc_code = soc_code;
	}

	public String getWorkinglocation() {
		return workinglocation;
	}

	public void setWorkinglocation(String workinglocation) {
		this.workinglocation = workinglocation;
	}

	public String getAmendment_status() {
		return amendment_status;
	}

	public void setAmendment_status(String amendment_status) {
		this.amendment_status = amendment_status;
	}

	public Integer getPayrate_id() {
		return payrate_id;
	}

	public void setPayrate_id(Integer payrate_id) {
		this.payrate_id = payrate_id;
	}

	public String getClient_type() {
		return client_type;
	}

	public void setClient_type(String client_type) {
		this.client_type = client_type;
	}

	public String getProject_name() {
		return project_name;
	}

	public void setProject_name(String project_name) {
		this.project_name = project_name;
	}

	public String getFed_id() {
		return fed_id;
	}

	public void setFed_id(String fed_id) {
		this.fed_id = fed_id;
	}

	public String getClient_mgr_email() {
		return client_mgr_email;
	}

	public void setClient_mgr_email(String client_mgr_email) {
		this.client_mgr_email = client_mgr_email;
	}

	public String getEmp_mailat_client() {
		return emp_mailat_client;
	}

	public Date getSubmittedOn() {
		return submittedOn;
	}

	public void setSubmittedOn(Date submittedOn) {
		this.submittedOn = submittedOn;
	}

	public int getClient_id() {
		return client_id;
	}

	public void setClient_id(int client_id) {
		this.client_id = client_id;
	}

	public String getClientName() {
		return clientName;
	}

	public void setClientName(String clientName) {
		this.clientName = clientName;
	}

	public String getClientAdd() {
		return clientAdd;
	}

	public void setClientAdd(String clientAdd) {
		this.clientAdd = clientAdd;
	}

	public String getClient_mgr() {
		return client_mgr;
	}

	public void setClient_mgr(String client_mgr) {
		this.client_mgr = client_mgr;
	}

	public String getClient_mgr_extn() {
		return client_mgr_extn;
	}

	public void setClient_mgr_extn(String client_mgr_extn) {
		this.client_mgr_extn = client_mgr_extn;
	}

	public void setEmp_mailat_client(String emp_mailat_client) {
		this.emp_mailat_client = emp_mailat_client;
	}

	public String getEmp_extnat_client() {
		return emp_extnat_client;
	}

	public void setEmp_extnat_client(String emp_extnat_client) {
		this.emp_extnat_client = emp_extnat_client;
	}	

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public int getCandidate_id() {
		return candidate_id;
	}

	public void setCandidate_id(int candidate_id) {
		this.candidate_id = candidate_id;
	}
	
	public int getPosted_by() {
		return posted_by;
	}

	public void setPosted_by(int posted_by) {
		this.posted_by = posted_by;
	} 

}
