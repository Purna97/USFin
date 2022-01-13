package com.tekskills.Dto;

public class FileBean
 {
	
	private int fileId;
	private String fileType;
	private String fileName;
	private String inputval;
	private String startdate;
	private String expirydate;
	
	
	public String getInputval() {
		return inputval;
	}
	public void setInputval(String inputval) {
		this.inputval = inputval;
	}
	public final int getFileId() {
		return fileId;
	}
	public final void setFileId(int fileId) {
		this.fileId = fileId;
	}
	public final String getFileType() {
		return fileType;
	}
	public final void setFileType(String fileType) {
		this.fileType = fileType;
	}
	public final String getFileName() {
		return fileName;
	}
	public final void setFileName(String fileName) {
		this.fileName = fileName;
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
}
