package com.tekskills.Dto;

public class DocumentHistoryDto {

	private int document_id;
	private String file_name;
	private String submit_date;	
	private String filetype;
	private String inputval;  
	private String startdate;  
	private String expirydate;  
	private String docStatus;
	
	private String isdocshowntocand;
	
	public String getIsdocshowntocand() {
		return isdocshowntocand;
	}
	public void setIsdocshowntocand(String isdocshowntocand) {
		this.isdocshowntocand = isdocshowntocand;
	}
	public String getForm_type() {
		return form_type;
	}
	public void setForm_type(String form_type) {
		this.form_type = form_type;
	}
	public String getVerifier_status() {
		return verifier_status;
	}
	public void setVerifier_status(String verifier_status) {
		this.verifier_status = verifier_status;
	}
	private String posted_by;
	private String custName;
	private String venName;
	
	private String form_type;
	private String verifier_status;
	
	public String getProfile_type() {
		return profile_type;
	}
	public void setProfile_type(String profile_type) {
		this.profile_type = profile_type;
	}
	private int subdocid;
	public int getSubdocid() {
		return subdocid;
	}
	public void setSubdocid(int subdocid) {
		this.subdocid = subdocid;
	}
	private String doctypename;
	private String subdoctypename;
	private String beneficiary_Name;
	private String profile_type;
	private int documentsubtype_id;
	private int h1b_checklist_id;
	private int profile_id;
	private int candidate_id;
	
	public int getCandidate_id() {
		return candidate_id;
	}
	public void setCandidate_id(int candidate_id) {
		this.candidate_id = candidate_id;
	}
	public int getProfile_id() {
		return profile_id;
	}
	public void setProfile_id(int profile_id) {
		this.profile_id = profile_id;
	}
	public int getH1b_checklist_id() {
		return h1b_checklist_id;
	}
	public void setH1b_checklist_id(int h1b_checklist_id) {
		this.h1b_checklist_id = h1b_checklist_id;
	}
	public int getDocumentsubtype_id() {
		return documentsubtype_id;
	}
	public void setDocumentsubtype_id(int documentsubtype_id) {
		this.documentsubtype_id = documentsubtype_id;
	}
	public String getProfile_name() {
		return profile_name;
	}
	public void setProfile_name(String profile_name) {
		this.profile_name = profile_name;
	}
	private int initiate_id;
	private int candidateId;
	private Integer h1bId;
	private String profile_name;
	
	public String getDoctypename() {
		return doctypename;
	}
	public void setDoctypename(String doctypename) {
		this.doctypename = doctypename;
	}
	public String getSubdoctypename() {
		return subdoctypename;
	}
	public void setSubdoctypename(String subdoctypename) {
		this.subdoctypename = subdoctypename;
	}
	public int getDocument_id() {
		return document_id;
	}
	public void setDocument_id(int document_id) {
		this.document_id = document_id;
	}
	public String getFile_name() {
		return file_name;
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
	public String getStartdate() {
		return startdate;
	}
	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}
	public String getExpirydate() {
		return expirydate;
	}
	public void setExpirydate(String expirydate) {
		this.expirydate = expirydate;
	}
	public String getDocStatus() {
		return docStatus;
	}
	public void setDocStatus(String docStatus) {
		this.docStatus = docStatus;
	}
	public String getPosted_by() {
		return posted_by;
	}
	public void setPosted_by(String posted_by) {
		this.posted_by = posted_by;
	}
	public String getCustName() {
		return custName;
	}
	public void setCustName(String custName) {
		this.custName = custName;
	}
	public String getVenName() {
		return venName;
	}
	public void setVenName(String venName) {
		this.venName = venName;
	}
	public String getBeneficiary_Name() {
		return beneficiary_Name;
	}
	public void setBeneficiary_Name(String beneficiary_Name) {
		this.beneficiary_Name = beneficiary_Name;
	}
	public int getInitiate_id() {
		return initiate_id;
	}
	public void setInitiate_id(int initiate_id) {
		this.initiate_id = initiate_id;
	}
	public int getCandidateId() {
		return candidateId;
	}
	public void setCandidateId(int candidateId) {
		this.candidateId = candidateId;
	}
	public Integer getH1bId() {
		return h1bId;
	}
	public void setH1bId(Integer h1bId) {
		this.h1bId = h1bId;
	}
	
}