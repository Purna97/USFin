package com.tekskills.Dto;

import java.util.List;

import com.tekskills.Entity.ClientDetailsEntity;
import com.tekskills.Entity.CompanyAdressEntity;
import com.tekskills.Entity.EmpPayRateDetails;
import com.tekskills.Entity.ImmiDocumentSubTypeEntity;
import com.tekskills.Entity.ImmiDocumentTypeEntity;
import com.tekskills.Entity.LCADetailsEntity;
import com.tekskills.Entity.SOCcodeMasterEntity;

public class EndClientDetialDto {
	/*String organization;
	String candidatename;
	String education;
	String jobtitle;
	String county;
	String soc;
	String endclientaddress;
	String remoteaddress;
	String workingfrom;*/
	Integer docCount;
	
	LCADetailsEntity lcaObj;
	
	ClientDetailsEntity clientObj;
	CompanyAdressEntity endclientaddres;
	CompanyAdressEntity remoteaddress;
	EmpPayRateDetails payRateObj;
	List<ImmiDocumentTypeEntity> docTypeyList;
	List<DocumentTypeDto> subdocTypeList;
	
	List<DocEmpBean> lcaHistoryList;
	List<LCADetailsDto> lcaList;
	List<ImmiDocumentSubTypeEntity> subDocumentTypeList;
	
	List<LCADetailsDto> alllcaList;
	List<TaskDetailsDto> alltaskList;
	List<LCADetailsDto> acitveInacitveLCAList;
	List<CompanyAdressEntity> lcaLocationList;
	
	public List<CompanyAdressEntity> getLcaLocationList() {
		return lcaLocationList;
	}
	public void setLcaLocationList(List<CompanyAdressEntity> lcaLocationList) {
		this.lcaLocationList = lcaLocationList;
	}
	public List<LCADetailsDto> getAcitveInacitveLCAList() {
		return acitveInacitveLCAList;
	}
	public void setAcitveInacitveLCAList(List<LCADetailsDto> acitveInacitveLCAList) {
		this.acitveInacitveLCAList = acitveInacitveLCAList;
	}
	List<ClientVendorMaster_DTO> endclientList;
	List<LCADetailsDto> pendinglcaList;
	
	List<SOCcodeMasterEntity> socCodeList;
	
	public List<SOCcodeMasterEntity> getSocCodeList() {
		return socCodeList;
	}
	public void setSocCodeList(List<SOCcodeMasterEntity> socCodeList) {
		this.socCodeList = socCodeList;
	}
	public LCADetailsEntity getLcaObj() {
		return lcaObj;
	}
	public void setLcaObj(LCADetailsEntity lcaObj) {
		this.lcaObj = lcaObj;
	}
	public List<LCADetailsDto> getPendinglcaList() {
		return pendinglcaList;
	}
	public void setPendinglcaList(List<LCADetailsDto> pendinglcaList) {
		this.pendinglcaList = pendinglcaList;
	}
	public List<ClientVendorMaster_DTO> getEndclientList() {
		return endclientList;
	}
	public void setEndclientList(List<ClientVendorMaster_DTO> endclientList) {
		this.endclientList = endclientList;
	}
	public List<TaskDetailsDto> getAlltaskList() {
		return alltaskList;
	}
	public void setAlltaskList(List<TaskDetailsDto> alltaskList) {
		this.alltaskList = alltaskList;
	}
	public List<LCADetailsDto> getAlllcaList() {
		return alllcaList;
	}
	public void setAlllcaList(List<LCADetailsDto> alllcaList) {
		this.alllcaList = alllcaList;
	}
	Integer lcaId;
	
	public Integer getLcaId() {
		return lcaId;
	}
	public void setLcaId(Integer lcaId) {
		this.lcaId = lcaId;
	}
	public List<ImmiDocumentSubTypeEntity> getSubDocumentTypeList() {
		return subDocumentTypeList;
	}
	public void setSubDocumentTypeList(List<ImmiDocumentSubTypeEntity> subDocumentTypeList) {
		this.subDocumentTypeList = subDocumentTypeList;
	}
	public Integer getDocCount() {
		return docCount;
	}
	public void setDocCount(Integer docCount) {
		this.docCount = docCount;
	}
	
	public List<DocumentTypeDto> getSubdocTypeList() {
		return subdocTypeList;
	}
	public void setSubdocTypeList(List<DocumentTypeDto> subdocTypeList) {
		this.subdocTypeList = subdocTypeList;
	}
	
	public List<ImmiDocumentTypeEntity> getDocTypeyList() {
		return docTypeyList;
	}
	public void setDocTypeyList(List<ImmiDocumentTypeEntity> docTypeyList) {
		this.docTypeyList = docTypeyList;
	}
	public EmpPayRateDetails getPayRateObj() {
		return payRateObj;
	}
	public void setPayRateObj(EmpPayRateDetails payRateObj) {
		this.payRateObj = payRateObj;
	}
	public ClientDetailsEntity getClientObj() {
		return clientObj;
	}
	public void setClientObj(ClientDetailsEntity clientObj) {
		this.clientObj = clientObj;
	}
	public CompanyAdressEntity getEndclientaddres() {
		return endclientaddres;
	}
	public void setEndclientaddres(CompanyAdressEntity endclientaddres) {
		this.endclientaddres = endclientaddres;
	}
	public CompanyAdressEntity getRemoteaddress() {
		return remoteaddress;
	}
	public void setRemoteaddress(CompanyAdressEntity remoteaddress) {
		this.remoteaddress = remoteaddress;
	}
	public List<DocEmpBean> getLcaHistoryList() {
		return lcaHistoryList;
	}
	public void setLcaHistoryList(List<DocEmpBean> lcaHistoryList) {
		this.lcaHistoryList = lcaHistoryList;
	}
	public List<LCADetailsDto> getLcaList() {
		return lcaList;
	}
	public void setLcaList(List<LCADetailsDto> lcaList) {
		this.lcaList = lcaList;
	}
	
	

}
