package com.tekskills.Dto;

public class DocumentTypeDto {
Integer doctypeid;
Integer subdoctypeid;
String doctypename;
String subdoctypename;
Integer issubycand;
Integer isameas_doctype;
Integer subdocTypeCount;

String file_name;
String docStatus;
Integer doc_id;
Integer subcat_id;
String submitted_date;
String posted_by;

public Integer getSubdocTypeCount() {
	return subdocTypeCount;
}
public void setSubdocTypeCount(Integer subdocTypeCount) {
	this.subdocTypeCount = subdocTypeCount;
}
public Integer getIsameas_doctype() {
	return isameas_doctype;
}
public void setIsameas_doctype(Integer isameas_doctype) {
	this.isameas_doctype = isameas_doctype;
}
public Integer getIssubycand() {
	return issubycand;
}
public void setIssubycand(Integer issubycand) {
	this.issubycand = issubycand;
}
public Integer getDoctypeid() {
	return doctypeid;
}
public void setDoctypeid(Integer doctypeid) {
	this.doctypeid = doctypeid;
}
public Integer getSubdoctypeid() {
	return subdoctypeid;
}
public void setSubdoctypeid(Integer subdoctypeid) {
	this.subdoctypeid = subdoctypeid;
}
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
public String getFile_name() {
	return file_name;
}
public void setFile_name(String file_name) {
	this.file_name = file_name;
}
public String getDocStatus() {
	return docStatus;
}
public void setDocStatus(String docStatus) {
	this.docStatus = docStatus;
}
public Integer getDoc_id() {
	return doc_id;
}
public void setDoc_id(Integer doc_id) {
	this.doc_id = doc_id;
}
public Integer getSubcat_id() {
	return subcat_id;
}
public void setSubcat_id(Integer subcat_id) {
	this.subcat_id = subcat_id;
}
public String getSubmitted_date() {
	return submitted_date;
}
public void setSubmitted_date(String submitted_date) {
	this.submitted_date = submitted_date;
}
public String getPosted_by() {
	return posted_by;
}
public void setPosted_by(String posted_by) {
	this.posted_by = posted_by;
}
}
