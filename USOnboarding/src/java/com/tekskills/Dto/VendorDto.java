package com.tekskills.Dto;

public class VendorDto {
	
	private int vendor_id;
	private String venName;
	private String fileName;
	private String fileInput;
	private String fileType;
	private String expirydate;
	
	public int getVendor_id() {
		return vendor_id;
	}
	public void setVendor_id(int vendor_id) {
		this.vendor_id = vendor_id;
	}
	public String getVenName() {
		return venName;
	}
	public void setVenName(String venName) {
		this.venName = venName;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getFileInput() {
		return fileInput;
	}
	public void setFileInput(String fileInput) {
		this.fileInput = fileInput;
	}
	public String getFileType() {
		return fileType;
	}
	public void setFileType(String fileType) {
		this.fileType = fileType;
	}
	public String getExpirydate() {
		return expirydate;
	}
	public void setExpirydate(String expirydate) {
		this.expirydate = expirydate;
	}
	
}
