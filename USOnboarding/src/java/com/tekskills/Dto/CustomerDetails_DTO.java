package com.tekskills.Dto;

import com.tekskills.Entity.CompanyAdressEntity;
import com.tekskills.Entity.CustomerMasterEntity;

public class CustomerDetails_DTO {
	
	private CustomerMasterEntity custObj;
	private CompanyAdressEntity custAddressObj;
	
	private String fileName;
	private String fileType;
	private int fileId;
	private String startdate;
	private String expirydate;
	
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
	
	
	public final String getFileName() {
		return fileName;
	}
	public final void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public final String getFileType() {
		return fileType;
	}
	public final void setFileType(String fileType) {
		this.fileType = fileType;
	}
	public final int getFileId() {
		return fileId;
	}
	public final void setFileId(int fileId) {
		this.fileId = fileId;
	}
	public CustomerMasterEntity getCustObj() {
		return custObj;
	}
	public void setCustObj(CustomerMasterEntity custObj) {
		this.custObj = custObj;
	}
	public CompanyAdressEntity getCustAddressObj() {
		return custAddressObj;
	}
	public void setCustAddressObj(CompanyAdressEntity custAddressObj) {
		this.custAddressObj = custAddressObj;
	}

}