package com.tekskills.Dto;

public class DocEmpBean {

	private int document_id;
	private String FullName;
	private int emp_number;
	private String file_name;
	private String submit_date;
	
	private String empName;
	private String filetype;
	private String inputval;  
	private Integer candidate_id;
	private String emp_type;
	private String vendorname;
	private String custname;
	
	private int roleId;
	private String roleName;
	private String workAuth;
	
	private String startdate;
	private String expirydate;
	private String submitted_on;
	
	private String client_name;
	private String lca_number;
	private Integer lca_id;
	private String doctypename;
	private String subdocname;
	private String jobtitle;
	private Integer documentsubtype_id;
	
	public String getJobtitle() {
		return jobtitle;
	}
	public void setJobtitle(String jobtitle) {
		this.jobtitle = jobtitle;
	}
	public String getExpirydate() {
		return expirydate;
	}
	public void setExpirydate(String expirydate) {
		this.expirydate = expirydate;
	}
	public String getStartdate() {
		return startdate;
	}
	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}
	
	public int getRoleId() {
		return roleId;
	}
	public void setRoleId(int roleId) {
		this.roleId = roleId;
	}
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	public final String getVendorname() {
		return vendorname;
	}
	public final void setVendorname(String vendorname) {
		this.vendorname = vendorname;
	}
	public final String getCustname() {
		return custname;
	}
	public final void setCustname(String custname) {
		this.custname = custname;
	}
	
	
	public String getEmpName() {
		return empName;
	}
	public void setEmpName(String empName) {
		this.empName = empName;
	}
	public String getFiletype() {
		return filetype;
	}
	public void setFiletype(String filetype) {
		this.filetype = filetype;
	}
	public String getInputval() {
		return inputval;
	}
	public void setInputval(String inputval) {
		this.inputval = inputval;
	}
	
	public String getEmp_type() {
		return emp_type;
	}
	public void setEmp_type(String emp_type) {
		this.emp_type = emp_type;
	}
	

	public int getDocument_id() {
		return document_id;
	}
	public void setDocument_id(int document_id) {
		this.document_id = document_id;
	}
	public String getFullName() {
		return FullName;
	}
	public void setFullName(String fullName) {
		FullName = fullName;
	}
	public int getEmp_number() {
		return emp_number;
	}
	public void setEmp_number(int emp_number) {
		this.emp_number = emp_number;
	}
	public String getFile_name() {
		return file_name;
	}
	public String getSubmitted_on() {
		return submitted_on;
	}
	public String getClient_name() {
		return client_name;
	}
	public void setClient_name(String client_name) {
		this.client_name = client_name;
	}
	public String getLca_number() {
		return lca_number;
	}
	public void setLca_number(String lca_number) {
		this.lca_number = lca_number;
	}
	public Integer getLca_id() {
		return lca_id;
	}
	public void setLca_id(Integer lca_id) {
		this.lca_id = lca_id;
	}
	public void setSubmitted_on(String submitted_on) {
		this.submitted_on = submitted_on;
	}
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}
	public String getSubmit_date() {
		return submit_date;
	}
	public void setSubmit_date(String submit_date) {
		this.submit_date = submit_date;
	}
	public String getWorkAuth() {
		return workAuth;
	}
	public void setWorkAuth(String workAuth) {
		this.workAuth = workAuth;
	}
	public Integer getCandidate_id() {
		return candidate_id;
	}
	public void setCandidate_id(Integer candidate_id) {
		this.candidate_id = candidate_id;
	}
	public String getSubdocname() {
		return subdocname;
	}
	public void setSubdocname(String subdocname) {
		this.subdocname = subdocname;
	}
	public String getDoctypename() {
		return doctypename;
	}
	public void setDoctypename(String doctypename) {
		this.doctypename = doctypename;
	}
	public Integer getDocumentsubtype_id() {
		return documentsubtype_id;
	}
	public void setDocumentsubtype_id(Integer documentsubtype_id) {
		this.documentsubtype_id = documentsubtype_id;
	}	
}
