package com.tekskills.Dto;

public class DocumentsDTO {
	private String document_name;
    private String subdocument_name;
    private Integer document_id;
    private Integer subdocument_id;
    private Integer issubycand;
	private int profile_id;
	private String profile_name;
	private String fileName;
	
	private String submitted_date;
	
	
	public int getProfile_id() {
		return profile_id;
	}
	public void setProfile_id(int profile_id) {
		this.profile_id = profile_id;
	}
	public String getProfile_name() {
		return profile_name;
	}
	public void setProfile_name(String profile_name) {
		this.profile_name = profile_name;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	private String status;
    
	public String getDocument_name() {
		return document_name;
	}
	public Integer getIssubycand() {
		return issubycand;
	}
	public void setIssubycand(Integer issubycand) {
		this.issubycand = issubycand;
	}
	public void setDocument_name(String document_name) {
		this.document_name = document_name;
	}
	public String getSubdocument_name() {
		return subdocument_name;
	}
	public void setSubdocument_name(String subdocument_name) {
		this.subdocument_name = subdocument_name;
	}
	public Integer getDocument_id() {
		return document_id;
	}
	public void setDocument_id(Integer document_id) {
		this.document_id = document_id;
	}
	public Integer getSubdocument_id() {
		return subdocument_id;
	}
	public void setSubdocument_id(Integer subdocument_id) {
		this.subdocument_id = subdocument_id;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getSubmitted_date() {
		return submitted_date;
	}
	public void setSubmitted_date(String submitted_date) {
		this.submitted_date = submitted_date;
	}
    
    

}
