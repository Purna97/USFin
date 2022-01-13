package com.tekskills.Dto;

import java.util.List;

import com.tekskills.Entity.CandidateH1BInitiateDetailsEntity;
import com.tekskills.Entity.H1BQuestionnariesEntity;
import com.tekskills.Entity.ImmiCandidateFormsStatusEntity;
import com.tekskills.Entity.ImmiDocumentSubTypeEntity;

public class ContractsPanelDetails_DTO {
	
	private int candidateId;
	private int bgc_checklist_id;
	private int h1b_checklist_id;
	
	private Integer personalObj;
	private Integer educationList;
	private Integer employmentList;
	private Integer document_id;
	private Integer initiate_id;
	private Integer subcategory_id;
	private Integer subcategory_type;
	private Integer scanedDocCount;
	private Integer is_same;
	private Integer dependent_profile_id;
	private Integer profile_id;
	private Integer questionnarie_id;
	
	private String candidateName;
	private String profileName;
	private String catName;
	private String subcatName;
	private String fileName;
	private String taskStatus;
	private String comments;
	private String status;
	private String subdate;
	private String  candidate_status;
	private String  approved_status;
	private String  personal_status;
	private String  education_status;
	private String  employment_status;
	private String  personal_Apprstatus;
	private String  education_Apprstatus;
	private String  employment_Apprstatus;
	private String  clientform_status;
	private String  h1bform_status;
	private String  pbcform_status;
	private String  document_status;
	private String printed_status;
	private String beneficiary_Name;
	private String profile_type;
	
	private boolean personal_Details;
	private boolean education_Details;
	private boolean employment_Details;

	private boolean alldocstatus;
	private boolean allformstatus;
	
	private String initiaion_status;
	
	
	ImmiCandidateFormsStatusEntity clientObj;
	ImmiCandidateFormsStatusEntity h1bObj;
	ImmiCandidateFormsStatusEntity pbcObj;
	CandidateH1BInitiateDetailsEntity initiateObj;

	List<ImmiDocumentSubTypeEntity> subdocttypeList;
	List<ImmiDocumentSubTypeEntity> subdocttypeListAdmin;
   
    List<ContractsPanelDetails_DTO> adminList;
	List<ContractsPanelDetails_DTO> candidateList;
	List<ContractsPanelDetails_DTO> candidatedocTypeList;
	List<ContractsPanelDetails_DTO> candidateSpouseList;
	List<ContractsPanelDetails_DTO> admindocTypeList;
	List<ContractsPanelDetails_DTO> candidateKidsList;
	List<ContractsPanelDetails_DTO> candidateSpouseEadList;
	List<ContractsPanelDetails_DTO> initiatedList;
	
	List<DocumentHistoryDto> ah1docList;
	List<DocumentHistoryDto> dochistoryList;
	List<DocumentHistoryDto> doctypeRepoList;
	List<DocumentHistoryDto> pendingList;
	
	List<DocumentHistoryDto> docList;
	List<DocumentHistoryDto> subdocList;
	List<DocumentHistoryDto> searchList;
	List<DocumentHistoryDto> userList;
	private String permit_to_posth1b;
	private String permit_to_petpack;
    public String getPermit_to_posth1b() {
		return permit_to_posth1b;
	}
	public void setPermit_to_posth1b(String permit_to_posth1b) {
		this.permit_to_posth1b = permit_to_posth1b;
	}
	public String getPermit_to_petpack() {
		return permit_to_petpack;
	}
	public void setPermit_to_petpack(String permit_to_petpack) {
		this.permit_to_petpack = permit_to_petpack;
	}
	public List<DocumentHistoryDto> getUserList() {
		return userList;
	}
	public void setUserList(List<DocumentHistoryDto> userList) {
		this.userList = userList;
	}
	List<DocumentTypeDto> subDocumentTypeList;

	H1BQuestionnariesEntity h1bApplObj;
	H1BQuestionnariesEntity spouseObj;
	List<H1BQuestionnariesEntity> childList;
	
	 List<ContractsPanelDetails_DTO> adminDocList;
	 
	public List<ContractsPanelDetails_DTO> getAdminDocList() {
		return adminDocList;
	}
	public void setAdminDocList(List<ContractsPanelDetails_DTO> adminDocList) {
		this.adminDocList = adminDocList;
	}
	public List<DocumentHistoryDto> getDocList() {
		return docList;
	}
	public void setDocList(List<DocumentHistoryDto> docList) {
		this.docList = docList;
	}
	public List<DocumentHistoryDto> getSubdocList() {
		return subdocList;
	}
	public void setSubdocList(List<DocumentHistoryDto> subdocList) {
		this.subdocList = subdocList;
	}
	public List<DocumentHistoryDto> getSearchList() {
		return searchList;
	}
	public void setSearchList(List<DocumentHistoryDto> searchList) {
		this.searchList = searchList;
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
	public List<DocumentHistoryDto> getPendingList() {
		return pendingList;
	}
	public void setPendingList(List<DocumentHistoryDto> pendingList) {
		this.pendingList = pendingList;
	}
	
	public boolean isAlldocstatus() {
		return alldocstatus;
	}
	public void setAlldocstatus(boolean alldocstatus) {
		this.alldocstatus = alldocstatus;
	}
	public boolean isAllformstatus() {
		return allformstatus;
	}
	public void setAllformstatus(boolean allformstatus) {
		this.allformstatus = allformstatus;
	}
	public String getInitiaion_status() {
		return initiaion_status;
	}
	public void setInitiaion_status(String initiaion_status) {
		this.initiaion_status = initiaion_status;
	}
	public String getPrinted_status() {
		return printed_status;
	}
	public void setPrinted_status(String printed_status) {
		this.printed_status = printed_status;
	}
	public List<DocumentHistoryDto> getDochistoryList() {
		return dochistoryList;
	}
	public void setDochistoryList(List<DocumentHistoryDto> dochistoryList) {
		this.dochistoryList = dochistoryList;
	}
	public List<ImmiDocumentSubTypeEntity> getSubdocttypeListAdmin() {
		return subdocttypeListAdmin;
	}
	public void setSubdocttypeListAdmin(List<ImmiDocumentSubTypeEntity> subdocttypeListAdmin) {
		this.subdocttypeListAdmin = subdocttypeListAdmin;
	}
	
	public List<ContractsPanelDetails_DTO> getCandidateSpouseEadList() {
		return candidateSpouseEadList;
	}
	public void setCandidateSpouseEadList(List<ContractsPanelDetails_DTO> candidateSpouseEadList) {
		this.candidateSpouseEadList = candidateSpouseEadList;
	}
	
	
	public List<DocumentHistoryDto> getAh1docList() {
		return ah1docList;
	}
	public void setAh1docList(List<DocumentHistoryDto> ah1docList) {
		this.ah1docList = ah1docList;
	}
	public CandidateH1BInitiateDetailsEntity getInitiateObj() {
		return initiateObj;
	}
	public void setInitiateObj(CandidateH1BInitiateDetailsEntity initiateObj) {
		this.initiateObj = initiateObj;
	}

	public List<DocumentTypeDto> getSubDocumentTypeList() {
		return subDocumentTypeList;
	}

	public void setSubDocumentTypeList(List<DocumentTypeDto> subDocumentTypeList) {
		this.subDocumentTypeList = subDocumentTypeList;
	}

	public Integer getPersonalObj() {
		return personalObj;
	}

	public void setPersonalObj(Integer personalObj) {
		this.personalObj = personalObj;
	}

	public Integer getEducationList() {
		return educationList;
	}

	public void setEducationList(Integer educationList) {
		this.educationList = educationList;
	}

	public Integer getEmploymentList() {
		return employmentList;
	}

	public void setEmploymentList(Integer employmentList) {
		this.employmentList = employmentList;
	}

	public boolean isPersonal_Details() {
		return personal_Details;
	}

	public void setPersonal_Details(boolean personal_Details) {
		this.personal_Details = personal_Details;
	}

	public boolean isEducation_Details() {
		return education_Details;
	}

	public void setEducation_Details(boolean education_Details) {
		this.education_Details = education_Details;
	}

	public boolean isEmployment_Details() {
		return employment_Details;
	}

	public void setEmployment_Details(boolean employment_Details) {
		this.employment_Details = employment_Details;
	}

	public Integer getSubcategory_id() {
		return subcategory_id;
	}

	public void setSubcategory_id(Integer subcategory_id) {
		this.subcategory_id = subcategory_id;
	}

	public String getDocument_status() {
		return document_status;
	}

	public void setDocument_status(String document_status) {
		this.document_status = document_status;
	}

	public String getPersonal_status() {
		return personal_status;
	}

	public void setPersonal_status(String personal_status) {
		this.personal_status = personal_status;
	}

	public String getClientform_status() {
		return clientform_status;
	}

	public ImmiCandidateFormsStatusEntity getClientObj() {
		return clientObj;
	}

	public List<ContractsPanelDetails_DTO> getInitiatedList() {
		return initiatedList;
	}
	public void setInitiatedList(List<ContractsPanelDetails_DTO> initiatedList) {
		this.initiatedList = initiatedList;
	}
	public List<ImmiDocumentSubTypeEntity> getSubdocttypeList() {
		return subdocttypeList;
	}
	
	public void setSubdocttypeList(List<ImmiDocumentSubTypeEntity> subdocttypeList) {
		this.subdocttypeList = subdocttypeList;
	}
	public void setClientObj(ImmiCandidateFormsStatusEntity clientObj) {
		this.clientObj = clientObj;
	}

	public List<ContractsPanelDetails_DTO> getCandidateKidsList() {
		return candidateKidsList;
	}
	public void setCandidateKidsList(List<ContractsPanelDetails_DTO> candidateKidsList) {
		this.candidateKidsList = candidateKidsList;
	}
	public ImmiCandidateFormsStatusEntity getH1bObj() {
		return h1bObj;
	}

	public void setH1bObj(ImmiCandidateFormsStatusEntity h1bObj) {
		this.h1bObj = h1bObj;
	}

	public List<ContractsPanelDetails_DTO> getCandidatedocTypeList() {
		return candidatedocTypeList;
	}
	public List<ContractsPanelDetails_DTO> getCandidateSpouseList() {
		return candidateSpouseList;
	}
	public void setCandidateSpouseList(List<ContractsPanelDetails_DTO> candidateSpouseList) {
		this.candidateSpouseList = candidateSpouseList;
	}
	public void setCandidatedocTypeList(List<ContractsPanelDetails_DTO> candidatedocTypeList) {
		this.candidatedocTypeList = candidatedocTypeList;
	}
	public List<ContractsPanelDetails_DTO> getAdmindocTypeList() {
		return admindocTypeList;
	}
	public void setAdmindocTypeList(List<ContractsPanelDetails_DTO> admindocTypeList) {
		this.admindocTypeList = admindocTypeList;
	}
	public ImmiCandidateFormsStatusEntity getPbcObj() {
		return pbcObj;
	}

	public void setPbcObj(ImmiCandidateFormsStatusEntity pbcObj) {
		this.pbcObj = pbcObj;
	}

	public void setClientform_status(String clientform_status) {
		this.clientform_status = clientform_status;
	}

	public String getH1bform_status() {
		return h1bform_status;
	}

	public void setH1bform_status(String h1bform_status) {
		this.h1bform_status = h1bform_status;
	}

	public String getPbcform_status() {
		return pbcform_status;
	}

	public void setPbcform_status(String pbcform_status) {
		this.pbcform_status = pbcform_status;
	}

	public String getEducation_status() {
		return education_status;
	}

	public void setEducation_status(String education_status) {
		this.education_status = education_status;
	}

	public String getEmployment_status() {
		return employment_status;
	}

	public void setEmployment_status(String employment_status) {
		this.employment_status = employment_status;
	}

	public String getPersonal_Apprstatus() {
		return personal_Apprstatus;
	}

	public void setPersonal_Apprstatus(String personal_Apprstatus) {
		this.personal_Apprstatus = personal_Apprstatus;
	}

	public String getEducation_Apprstatus() {
		return education_Apprstatus;
	}

	public void setEducation_Apprstatus(String education_Apprstatus) {
		this.education_Apprstatus = education_Apprstatus;
	}

	public String getEmployment_Apprstatus() {
		return employment_Apprstatus;
	}

	public void setEmployment_Apprstatus(String employment_Apprstatus) {
		this.employment_Apprstatus = employment_Apprstatus;
	}

	
	
	
	public String getCandidate_status() {
		return candidate_status;
	}

	public void setCandidate_status(String candidate_status) {
		this.candidate_status = candidate_status;
	}
	
	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	
	
	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getTaskStatus() {
		return taskStatus;
	}

	public void setTaskStatus(String taskStatus) {
		this.taskStatus = taskStatus;
	}
	
	public String getCatName() {
		return catName;
	}

	public void setCatName(String catName) {
		this.catName = catName;
	}

	public String getSubcatName() {
		return subcatName;
	}

	public void setSubcatName(String subcatName) {
		this.subcatName = subcatName;
	}

	public int getCandidateId() {
		return candidateId;
	}

	public void setCandidateId(int candidateId) {
		this.candidateId = candidateId;
	}

	public String getCandidateName() {
		return candidateName;
	}

	public void setCandidateName(String candidateName) {
		this.candidateName = candidateName;
	}

	public String getProfileName() {
		return profileName;
	}

	public void setProfileName(String profileName) {
		this.profileName = profileName;
	}

	public int getBgc_checklist_id() {
		return bgc_checklist_id;
	}

	public void setBgc_checklist_id(int bgc_checklist_id) {
		this.bgc_checklist_id = bgc_checklist_id;
	}

	public String getSubdate() {
		return subdate;
	}

	public void setSubdate(String subdate) {
		this.subdate = subdate;
	}

	

	public Integer getSubcategory_type() {
		return subcategory_type;
	}

	public void setSubcategory_type(Integer subcategory_type) {
		this.subcategory_type = subcategory_type;
	}

	public List<ContractsPanelDetails_DTO> getAdminList() {
		return adminList;
	}

	public void setAdminList(List<ContractsPanelDetails_DTO> adminList) {
		this.adminList = adminList;
	}

	public List<ContractsPanelDetails_DTO> getCandidateList() {
		return candidateList;
	}

	public void setCandidateList(List<ContractsPanelDetails_DTO> candidateList) {
		this.candidateList = candidateList;
	}

	public String getApproved_status() {
		return approved_status;
	}

	public void setApproved_status(String approved_status) {
		this.approved_status = approved_status;
	}

	public int getH1b_checklist_id() {
		return h1b_checklist_id;
	}

	public void setH1b_checklist_id(int h1b_checklist_id) {
		this.h1b_checklist_id = h1b_checklist_id;
	}

	public Integer getIs_same() {
		return is_same;
	}

	public void setIs_same(Integer is_same) {
		this.is_same = is_same;
	}

	public Integer getDocument_id() {
		return document_id;
	}

	public void setDocument_id(Integer document_id) {
		this.document_id = document_id;
	}

	public Integer getInitiate_id() {
		return initiate_id;
	}

	public void setInitiate_id(Integer initiate_id) {
		this.initiate_id = initiate_id;
	}
	public Integer getDependent_profile_id() {
		return dependent_profile_id;
	}
	public void setDependent_profile_id(Integer dependent_profile_id) {
		this.dependent_profile_id = dependent_profile_id;
	}
	public String getBeneficiary_Name() {
		return beneficiary_Name;
	}
	public void setBeneficiary_Name(String beneficiary_Name) {
		this.beneficiary_Name = beneficiary_Name;
	}
	public Integer getProfile_id() {
		return profile_id;
	}
	public void setProfile_id(Integer profile_id) {
		this.profile_id = profile_id;
	}
	public Integer getQuestionnarie_id() {
		return questionnarie_id;
	}
	public void setQuestionnarie_id(Integer questionnarie_id) {
		this.questionnarie_id = questionnarie_id;
	}
	public String getProfile_type() {
		return profile_type;
	}
	public void setProfile_type(String profile_type) {
		this.profile_type = profile_type;
	}
	public Integer getScanedDocCount() {
		return scanedDocCount;
	}
	public void setScanedDocCount(Integer scanedDocCount) {
		this.scanedDocCount = scanedDocCount;
	}
	public List<DocumentHistoryDto> getDoctypeRepoList() {
		return doctypeRepoList;
	}
	public void setDoctypeRepoList(List<DocumentHistoryDto> doctypeRepoList) {
		this.doctypeRepoList = doctypeRepoList;
	}

	
}
