package com.tekskills.Dto;

import java.util.List;

import com.tekskills.Entity.ClientDetailsEntity;
import com.tekskills.Entity.CompanyAdressEntity;
import com.tekskills.Entity.LCADetailsEntity;
import com.tekskills.Entity.SOCcodeMasterEntity;

public class PAFDetailsDto {
	LCADetailsEntity lcaObj;
	ClientDetailsEntity clientObj;
	SOCcodeMasterEntity socObj;
	String endclientAddress;
	String remoteaddress;
	List<BasicDetailsDto> basicDetails;
	
	private Integer empcount;
	
	 List<CompanyAdressEntity> lcaLocationList;
		
	
	public Integer getEmpcount() {
		return empcount;
	}
	public void setEmpcount(Integer empcount) {
		this.empcount = empcount;
	}
	public List<CompanyAdressEntity> getLcaLocationList() {
		return lcaLocationList;
	}
	public void setLcaLocationList(List<CompanyAdressEntity> lcaLocationList) {
		this.lcaLocationList = lcaLocationList;
	}
	public LCADetailsEntity getLcaObj() {
		return lcaObj;
	}
	public List<BasicDetailsDto> getBasicDetails() {
		return basicDetails;
	}
	public void setBasicDetails(List<BasicDetailsDto> basicDetails) {
		this.basicDetails = basicDetails;
	}
	public void setLcaObj(LCADetailsEntity lcaObj) {
		this.lcaObj = lcaObj;
	}
	public ClientDetailsEntity getClientObj() {
		return clientObj;
	}
	public void setClientObj(ClientDetailsEntity clientObj) {
		this.clientObj = clientObj;
	}
	public SOCcodeMasterEntity getSocObj() {
		return socObj;
	}
	public void setSocObj(SOCcodeMasterEntity socObj) {
		this.socObj = socObj;
	}
	public String getEndclientAddress() {
		return endclientAddress;
	}
	public void setEndclientAddress(String endclientAddress) {
		this.endclientAddress = endclientAddress;
	}
	public String getRemoteaddress() {
		return remoteaddress;
	}
	public void setRemoteaddress(String remoteaddress) {
		this.remoteaddress = remoteaddress;
	}
	
}
