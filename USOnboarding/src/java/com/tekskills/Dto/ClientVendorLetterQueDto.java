package com.tekskills.Dto;

import java.util.List;

import com.tekskills.Entity.CandidateH1BInitiateDetailsEntity;
import com.tekskills.Entity.ClientVendorQuestionnarieAddressEntity;
import com.tekskills.Entity.ClientVendorQuestionnarieEntity;
import com.tekskills.Entity.EntryandExitDatesEntity;
import com.tekskills.Entity.FormsRejectionDetailsEntity;
import com.tekskills.Entity.H1BQuestionnariesEntity;
import com.tekskills.Entity.ImmiCandidateFormsStatusEntity;
import com.tekskills.Entity.TempClientVendorQuestionnarieAddressEntity;
import com.tekskills.Entity.TempClientVendorQuestionnarieEntity;
import com.tekskills.Entity.TempEntryandExitDatesEntity;
import com.tekskills.Entity.TempH1BQuestionnariesEntity;

public class ClientVendorLetterQueDto {
	
	ClientVendorQuestionnarieEntity cvlqObj;
	ClientVendorQuestionnarieAddressEntity cvlendclientObj;
	List<ClientVendorQuestionnarieAddressEntity> cvlAddressList;
	
	H1BQuestionnariesEntity h1bApplObj;
	H1BQuestionnariesEntity spouseObj;
	H1BQuestionnariesEntity childObj;
	List<H1BQuestionnariesEntity> childList;
	List<EntryandExitDatesEntity> entryexitList;
	
	List<EntryandExitDatesEntity> applEntryList;
	List<EntryandExitDatesEntity> spouseEntryList;
	List<EntryandExitDatesEntity> childEntryList;
	
	
	ImmiCandidateFormsStatusEntity formObj;
	
	CandidateH1BInitiateDetailsEntity initiateObj;
	
	
	TempH1BQuestionnariesEntity temph1bApplObj;
	TempH1BQuestionnariesEntity tempspouseObj;
	TempH1BQuestionnariesEntity tempchildObj;
	List<TempH1BQuestionnariesEntity> tempchildList;
	List<TempEntryandExitDatesEntity> tempapplEntryList;
	List<TempEntryandExitDatesEntity> tempspouseEntryList;
	List<TempEntryandExitDatesEntity> tempchildEntryList;
	
	TempClientVendorQuestionnarieEntity tempcvlqObj;
	TempClientVendorQuestionnarieAddressEntity tempcvlendclientObj;
	List<TempClientVendorQuestionnarieAddressEntity> tempcvlAddressList;
	
	FormsRejectionDetailsEntity rejformsObj;
	FormsRejectionDetailsEntity rejformh1bApplObj;
	FormsRejectionDetailsEntity rejformspouseObj;
	FormsRejectionDetailsEntity rejformChildObj;
	
	List<FormsRejectionDetailsEntity> rejformscvlhistoryList;
	List<FormsRejectionDetailsEntity> rejformsApplhistoryList;
	List<FormsRejectionDetailsEntity> rejformsspousehistoryList;
	List<FormsRejectionDetailsEntity> rejformschildhistoryList;
	
	public List<FormsRejectionDetailsEntity> getRejformscvlhistoryList() {
		return rejformscvlhistoryList;
	}
	public void setRejformscvlhistoryList(List<FormsRejectionDetailsEntity> rejformscvlhistoryList) {
		this.rejformscvlhistoryList = rejformscvlhistoryList;
	}
	
	public List<FormsRejectionDetailsEntity> getRejformschildhistoryList() {
		return rejformschildhistoryList;
	}
	public void setRejformschildhistoryList(List<FormsRejectionDetailsEntity> rejformschildhistoryList) {
		this.rejformschildhistoryList = rejformschildhistoryList;
	}
	List<FormsRejectionDetailsEntity> rejformshistoryList;
	
	public List<FormsRejectionDetailsEntity> getRejformsApplhistoryList() {
		return rejformsApplhistoryList;
	}
	public void setRejformsApplhistoryList(List<FormsRejectionDetailsEntity> rejformsApplhistoryList) {
		this.rejformsApplhistoryList = rejformsApplhistoryList;
	}
	public List<FormsRejectionDetailsEntity> getRejformsspousehistoryList() {
		return rejformsspousehistoryList;
	}
	public void setRejformsspousehistoryList(List<FormsRejectionDetailsEntity> rejformsspousehistoryList) {
		this.rejformsspousehistoryList = rejformsspousehistoryList;
	}
	public FormsRejectionDetailsEntity getRejformChildObj() {
		return rejformChildObj;
	}
	public void setRejformChildObj(FormsRejectionDetailsEntity rejformChildObj) {
		this.rejformChildObj = rejformChildObj;
	}
	public FormsRejectionDetailsEntity getRejformh1bApplObj() {
		return rejformh1bApplObj;
	}
	public void setRejformh1bApplObj(FormsRejectionDetailsEntity rejformh1bApplObj) {
		this.rejformh1bApplObj = rejformh1bApplObj;
	}
	public FormsRejectionDetailsEntity getRejformspouseObj() {
		return rejformspouseObj;
	}
	public void setRejformspouseObj(FormsRejectionDetailsEntity rejformspouseObj) {
		this.rejformspouseObj = rejformspouseObj;
	}
	
	
	public List<FormsRejectionDetailsEntity> getRejformshistoryList() {
		return rejformshistoryList;
	}
	public void setRejformshistoryList(List<FormsRejectionDetailsEntity> rejformshistoryList) {
		this.rejformshistoryList = rejformshistoryList;
	}
	public FormsRejectionDetailsEntity getRejformsObj() {
		return rejformsObj;
	}
	public void setRejformsObj(FormsRejectionDetailsEntity rejformsObj) {
		this.rejformsObj = rejformsObj;
	}
	public TempClientVendorQuestionnarieEntity getTempcvlqObj() {
		return tempcvlqObj;
	}
	public void setTempcvlqObj(TempClientVendorQuestionnarieEntity tempcvlqObj) {
		this.tempcvlqObj = tempcvlqObj;
	}
	public TempClientVendorQuestionnarieAddressEntity getTempcvlendclientObj() {
		return tempcvlendclientObj;
	}
	public void setTempcvlendclientObj(TempClientVendorQuestionnarieAddressEntity tempcvlendclientObj) {
		this.tempcvlendclientObj = tempcvlendclientObj;
	}
	public List<TempClientVendorQuestionnarieAddressEntity> getTempcvlAddressList() {
		return tempcvlAddressList;
	}
	public void setTempcvlAddressList(List<TempClientVendorQuestionnarieAddressEntity> tempcvlAddressList) {
		this.tempcvlAddressList = tempcvlAddressList;
	}
	public List<TempH1BQuestionnariesEntity> getTempchildList() {
		return tempchildList;
	}
	public void setTempchildList(List<TempH1BQuestionnariesEntity> tempchildList) {
		this.tempchildList = tempchildList;
	}
	public TempH1BQuestionnariesEntity getTemph1bApplObj() {
		return temph1bApplObj;
	}
	public void setTemph1bApplObj(TempH1BQuestionnariesEntity temph1bApplObj) {
		this.temph1bApplObj = temph1bApplObj;
	}
	public TempH1BQuestionnariesEntity getTempspouseObj() {
		return tempspouseObj;
	}
	public void setTempspouseObj(TempH1BQuestionnariesEntity tempspouseObj) {
		this.tempspouseObj = tempspouseObj;
	}
	public TempH1BQuestionnariesEntity getTempchildObj() {
		return tempchildObj;
	}
	public void setTempchildObj(TempH1BQuestionnariesEntity tempchildObj) {
		this.tempchildObj = tempchildObj;
	}
	public List<TempEntryandExitDatesEntity> getTempapplEntryList() {
		return tempapplEntryList;
	}
	public void setTempapplEntryList(List<TempEntryandExitDatesEntity> tempapplEntryList) {
		this.tempapplEntryList = tempapplEntryList;
	}
	public List<TempEntryandExitDatesEntity> getTempspouseEntryList() {
		return tempspouseEntryList;
	}
	public void setTempspouseEntryList(List<TempEntryandExitDatesEntity> tempspouseEntryList) {
		this.tempspouseEntryList = tempspouseEntryList;
	}
	public List<TempEntryandExitDatesEntity> getTempchildEntryList() {
		return tempchildEntryList;
	}
	public void setTempchildEntryList(List<TempEntryandExitDatesEntity> tempchildEntryList) {
		this.tempchildEntryList = tempchildEntryList;
	}
	public ClientVendorQuestionnarieAddressEntity getCvlendclientObj() {
		return cvlendclientObj;
	}
	public void setCvlendclientObj(ClientVendorQuestionnarieAddressEntity cvlendclientObj) {
		this.cvlendclientObj = cvlendclientObj;
	}
	
	public CandidateH1BInitiateDetailsEntity getInitiateObj() {
		return initiateObj;
	}
	public void setInitiateObj(CandidateH1BInitiateDetailsEntity initiateObj) {
		this.initiateObj = initiateObj;
	}
	public ImmiCandidateFormsStatusEntity getFormObj() {
		return formObj;
	}
	public void setFormObj(ImmiCandidateFormsStatusEntity formObj) {
		this.formObj = formObj;
	}
	public H1BQuestionnariesEntity getH1bApplObj() {
		return h1bApplObj;
	}
	public void setH1bApplObj(H1BQuestionnariesEntity h1bApplObj) {
		this.h1bApplObj = h1bApplObj;
	}
	public H1BQuestionnariesEntity getSpouseObj() {
		return spouseObj;
	}
	public void setSpouseObj(H1BQuestionnariesEntity spouseObj) {
		this.spouseObj = spouseObj;
	}
	public List<H1BQuestionnariesEntity> getChildList() {
		return childList;
	}
	public void setChildList(List<H1BQuestionnariesEntity> childList) {
		this.childList = childList;
	}
	public List<EntryandExitDatesEntity> getEntryexitList() {
		return entryexitList;
	}
	public void setEntryexitList(List<EntryandExitDatesEntity> entryexitList) {
		this.entryexitList = entryexitList;
	}
	public ClientVendorQuestionnarieEntity getCvlqObj() {
		return cvlqObj;
	}
	public void setCvlqObj(ClientVendorQuestionnarieEntity cvlqObj) {
		this.cvlqObj = cvlqObj;
	}
	public List<ClientVendorQuestionnarieAddressEntity> getCvlAddressList() {
		return cvlAddressList;
	}
	public void setCvlAddressList(List<ClientVendorQuestionnarieAddressEntity> cvlAddressList) {
		this.cvlAddressList = cvlAddressList;
	}
	public List<EntryandExitDatesEntity> getApplEntryList() {
		return applEntryList;
	}
	public void setApplEntryList(List<EntryandExitDatesEntity> applEntryList) {
		this.applEntryList = applEntryList;
	}
	public List<EntryandExitDatesEntity> getSpouseEntryList() {
		return spouseEntryList;
	}
	public void setSpouseEntryList(List<EntryandExitDatesEntity> spouseEntryList) {
		this.spouseEntryList = spouseEntryList;
	}
	public List<EntryandExitDatesEntity> getChildEntryList() {
		return childEntryList;
	}
	public void setChildEntryList(List<EntryandExitDatesEntity> childEntryList) {
		this.childEntryList = childEntryList;
	}
	public H1BQuestionnariesEntity getChildObj() {
		return childObj;
	}
	public void setChildObj(H1BQuestionnariesEntity childObj) {
		this.childObj = childObj;
	}
	
}
