package com.tekskills.Dao;

import java.util.List;

import com.tekskills.Dto.BasicDetailsDto;
import com.tekskills.Dto.CandidateH1BInitiateDetailsDto;
import com.tekskills.Dto.ContractsPanelDetails_DTO;
import com.tekskills.Dto.DocumentHistoryDto;
import com.tekskills.Dto.DocumentTypeDto;
import com.tekskills.Dto.DocumentsDTO;
import com.tekskills.Dto.FormsRejectionDetailsDto;
import com.tekskills.Dto.H1BDetailsDto;
import com.tekskills.Dto.ImmicommentsDTO;
import com.tekskills.Dto.LCADetailsDto;
import com.tekskills.Dto.ProfileMasterDTO;
import com.tekskills.Dto.PublicBenefitsChecklistDTO;
import com.tekskills.Dto.commentHistoryDto;
import com.tekskills.Entity.CandidateH1BCheckList;
import com.tekskills.Entity.CandidateH1BInitiateDetailsEntity;
import com.tekskills.Entity.CandidateScannedDocumentsEntity;
import com.tekskills.Entity.ClientVendorQuestionnarieAddressEntity;
import com.tekskills.Entity.ClientVendorQuestionnarieEntity;
import com.tekskills.Entity.EmpDocumentsEntity;
import com.tekskills.Entity.EntryandExitDatesEntity;
import com.tekskills.Entity.FormsRejectionDetailsEntity;
import com.tekskills.Entity.H1BDetailsEntity;
import com.tekskills.Entity.H1BQuestionnariesEntity;
import com.tekskills.Entity.ImmiCandidateFormsStatusEntity;
import com.tekskills.Entity.ImmiCheckListCommentsHistory;
import com.tekskills.Entity.ImmiDocumentSubTypeEntity;
import com.tekskills.Entity.ImmiDocumentTypeEntity;
import com.tekskills.Entity.ImmiFormsCommentsHistoryEntity;
import com.tekskills.Entity.ImmiProfileLableMaster;
import com.tekskills.Entity.ImmiProfileMasterCheckList;
import com.tekskills.Entity.LCADetailsEntity;
import com.tekskills.Entity.PAFModifiedDocumentsEntity;
import com.tekskills.Entity.PublicBenefitsChecklistEntity;
import com.tekskills.Entity.SOCcodeMasterEntity;
import com.tekskills.Entity.TaskDetailsEntity;
import com.tekskills.Entity.TempClientVendorQuestionnarieAddressEntity;
import com.tekskills.Entity.TempClientVendorQuestionnarieEntity;
import com.tekskills.Entity.TempEntryandExitDatesEntity;
import com.tekskills.Entity.TempH1BQuestionnariesEntity;

public interface H1BDao {

	List<ImmiProfileLableMaster> getInitiateTemplateList();

	List<ImmiDocumentTypeEntity> getAllDocuments();

	List<DocumentsDTO> getSubDocumentList();

	String checkimmiprofilemaster(String profilename);

	List<ImmiDocumentSubTypeEntity> getSubDocumentsByDocid(Integer doc_id);

	void saveImmiTemplateMaster(ImmiProfileMasterCheckList profileMasterObj);

	List<DocumentsDTO> getInitiatedTemplates();

	String getProfileNameById(Integer profile_Id);

	List<ImmiProfileMasterCheckList> getProfileMasterListById(Integer profile_Id);

	List<ProfileMasterDTO> getProfileListByProfileId(Integer profile_Id);

	List<ImmiProfileMasterCheckList> getProfileListByProfileSubcatId(Integer profileid, Integer subcatid);

	List<Integer> getSubCategoiesByProfileId(Integer profileid);

	void deleteMasterListById(Integer profileid, Integer scatid);

	Integer getProfileTemplateIdByName(String h1initVal);

	Integer saveInitiateDetails(CandidateH1BInitiateDetailsEntity initiateObj);

	Integer saveCandidateH1BCheckList(CandidateH1BCheckList candchecklistObj);

	List<String> getDocumentNameByProfileId(Integer profileid);

	Integer getInitiateDetailsTopRow(Integer candidate_id);

	CandidateH1BInitiateDetailsEntity getInitiateDetailsByInitiateId(Integer initiateId);

	List<ContractsPanelDetails_DTO> getimmiDocsAdminList(Integer initiateId, int profile_id, Integer candidate_id);

	List<ContractsPanelDetails_DTO> getimmiDocsCandidateList(Integer initiateId, int profile_id, Integer candidate_id);

	ImmiCandidateFormsStatusEntity getFormStatusByType(Integer candidate_id, String string, Integer initiateId);

	String getinitiateTopName(Integer candidate_id);

	List<ImmicommentsDTO> viewCommentHistoryBycandId(Integer cand_Id, String form_type);

	void updateFormsStatus(ImmiCandidateFormsStatusEntity formsobj);

	PublicBenefitsChecklistEntity getPublicBenefitsApplicantTypeCanId(Integer candidateid, String beneficiaryType, int intiate_id);

	Integer savepublicbenefits(PublicBenefitsChecklistEntity childObj);

	Integer saveImmiFormsStatus(ImmiCandidateFormsStatusEntity formStatus);

	List<PublicBenefitsChecklistEntity> getPublicBenefitsSizeByCanId(Integer candidateid);

	void updatepublicbenefits(PublicBenefitsChecklistEntity spouseObj);

	ImmiCandidateFormsStatusEntity getFormsSatusByCandidateId(Integer candidateId, String form_type, int intiate_id);

	void saveImmiComments(ImmiFormsCommentsHistoryEntity cmntHistory);

	H1BDetailsDto getLcaTopRecord();

	Integer saveH1BDetails(H1BDetailsEntity h1oBj);


	Integer saveH1bQuestionnaries(H1BQuestionnariesEntity h1bqueApplObj);

	void saveH1bEntryExitDetails(EntryandExitDatesEntity h1bObj);

	Integer saveClientVendorLetterQuestionnaire(ClientVendorQuestionnarieEntity cvlqueObj);

	void saveClientVendorLetterQuestionnaireAddress(ClientVendorQuestionnarieAddressEntity cvlAddressObj);

	void saveFormsStatus(ImmiCandidateFormsStatusEntity formStatusObj);

	ClientVendorQuestionnarieEntity getClientVendorLetterQuestionarieById(Integer candidateid, int intiate_id);

	List<ClientVendorQuestionnarieAddressEntity> getClientVendorLetterQuestionarieAddressesById(Integer candidateid, Integer clientid);

	ClientVendorQuestionnarieAddressEntity getClientVendorQuestionnarieAddressById(Integer otheraddress_id);

	void updateClientVendorLetterQuestionnaireAddress(ClientVendorQuestionnarieAddressEntity cvlAddressObj);

	ClientVendorQuestionnarieEntity getClientVendorQuestionnarieById(Integer clientid);

	void updateClientVendorLetterQuestionnaire(ClientVendorQuestionnarieEntity cvlqueObj);

	H1BQuestionnariesEntity getH1BQuestionnariesByType(Integer candidateid, String beneficiaryType, int intiate_id);

	List<H1BQuestionnariesEntity> getH1BQuestionnariesByChild(Integer candidateid, String beneficiaryType, int intiate_id);

	List<EntryandExitDatesEntity> getentryexitList(Integer candidateid, String beneficiaryType, int h1queid);

	H1BQuestionnariesEntity getH1BQuestionnarieDetailsById(Integer applh1queid);

	void updateH1bQuestionnaries(H1BQuestionnariesEntity h1bqueApplObj);

	EntryandExitDatesEntity getEntryandExitDatesDetailsById(Integer applEntryid);

	void updateH1bEntryExitDetails(EntryandExitDatesEntity h1bObj);

	List<EntryandExitDatesEntity> getentryexitListById(Integer h1queid);

	H1BDetailsEntity getH1BDetailsById(Integer h1b_id);
	
	List<DocumentTypeDto> getimmiSubDocumentByDocTypeId(Integer candidate_id, Integer doctypeid, Integer intiate_id);

	Integer getCheckListIdByids(Integer candidate_id, Integer doctypeid, Integer intiate_id,
			Integer documentsubtypeid, Integer profile_id, String bentype, Integer questionnarieId);

	CandidateH1BInitiateDetailsEntity getInitiateDetailsByCandidateId(Integer candidateid);

	List<PublicBenefitsChecklistEntity> getPublicBenefitsKidsApplicantTypeCanId(Integer candidateid, String beneficiaryType, int intiate_id);

	PublicBenefitsChecklistEntity getPublicBenefitsApplicantTypeBenifitId(Integer benfitid);

	List<PublicBenefitsChecklistDTO> getPublicBenefitByCanId(Integer candidateid, int intiate_id);

	CandidateH1BInitiateDetailsEntity getCandidateH1BInitiateDetailsById(Integer candidate_id);

	Integer saveImmiGroupingProfileName(ImmiProfileLableMaster lableObj);

	ImmiProfileLableMaster getImmiProfileLableMasterById(Integer profileId);

	void updateImmiprofileName(ImmiProfileLableMaster lableObj);
	
	
	List<EmpDocumentsEntity> getallinputvals(Integer intiate_id, Integer candidate_id, Integer document_id, Integer h1bchecklistid);

	List<EmpDocumentsEntity> viewfilehistory(Integer candidate_id, Integer document_id, Integer subdocument_id,
			Integer initiate_id, Integer checklist_id);

	List<ContractsPanelDetails_DTO> getSubmittedSubdocsbyIds(Integer candidate_id, Integer documentid,
			Integer intiate_id, String benficiary_type, Integer profileid, Integer questionnarieId);

	List<DocumentsDTO> getdocumentshistory(Integer docid);

	List<ContractsPanelDetails_DTO> getimmisubdocumentBydocid(Integer candidate_id, Integer documentid,
			Integer intiate_id, String benficiary_type, Integer profileid, Integer questionnarieId);
	
	List<DocumentHistoryDto> getCandidateDocumentsByIds(Integer docTypeId, Integer candidate_Id,
			Integer initiateid, Integer profile_id, String profile_type, Integer questionnarieId, String view_type);

	List<CandidateH1BCheckList> getCandidateH1BCheckListByIds(Integer docType_Id, Integer candidate_Id,
			Integer initiate_id, Integer profile_id, String profile_type, Integer questionnarieId);

	CandidateH1BCheckList getCandidateH1BCheckListById(Integer chklistid);

	Integer saveImmiCheckListComments(ImmiCheckListCommentsHistory commentObj);

	void updateCandidateH1BCheckList(CandidateH1BCheckList h1bChkObj);

	List<commentHistoryDto> getImmiCandidateDocumentsByIds(Integer docType_id, Integer candidate_id,
			Integer initiate_id, Integer profile_id, String profile_type);

	List<ContractsPanelDetails_DTO> getCandidateDocumentTypeList(Integer initiateId, int profile_id,
			Integer candidate_id, String profiletype);

	List<ContractsPanelDetails_DTO> getAdminDocumentTypeList(Integer initiateId, int profile_id, Integer candidate_id);

	/*List<ContractsPanelDetails_DTO> getCandidateSpouseDocumentTypeList(Integer initiateId, Integer dependent_profile_id,
			Integer candidate_id);*/

	List<ProfileMasterDTO> getProfileListByDependentProfileId(Integer dependentprofileid);

	List<ImmiProfileLableMaster> getDependentInitiateTemplateList();

	String getProfileIsDependentById(Integer profile_Id);

	List<Integer> getCanSubDocumentIdCheckList(Integer candidate_id, Integer documentid, Integer intiate_id, String benficiary_type);

	List<Integer> getSubDocumentIds(Integer documentid);

	ImmiDocumentSubTypeEntity getSubDocumentNameBysubdoctypeId(Integer subid);

	void updateInitiateDetails(CandidateH1BInitiateDetailsEntity initiateDetObj);

	Integer getSubDocumentTypeId(Integer doc_Id);

	ClientVendorQuestionnarieAddressEntity getClientVendorQuestionnarieByClientIdType(int client_id, String clienttype);

	List<CandidateH1BCheckList> getCandidateH1BCheckList(Integer initiateid, Integer spouse_profile_id,
			int candidate_id, String ptype);

	SOCcodeMasterEntity getSocCodeDetailsBySocid(String soc);

	List<BasicDetailsDto> getActiveEmployeeList();

	SOCcodeMasterEntity getSOCDetailsById(Integer soc_id);

	List<SOCcodeMasterEntity> getSocCodeMasterList();

	Integer saveSocCodeMaster(SOCcodeMasterEntity socObj);

	String checkSocCode(String soc_code);

	void updateSocCodeMaster(SOCcodeMasterEntity socObj);
	List<ContractsPanelDetails_DTO> h1initiationhistory(Integer candidate_id);

	List<String> checkpetitionPacket(Integer initiateid, Integer candidate_id);

	List<CandidateH1BCheckList> getpetitionPacketDocuments(Integer initiate_id, Integer candidate_id);


	List<TaskDetailsEntity> getalltaskdetailsbycandidateid(Integer candidate_Id);

	List<ImmiDocumentSubTypeEntity> getSubDocumentsByDocidSubmittedByAdmin(Integer documentid);

	String getdocumentTypeByDocId(Integer documenttype_id);

	List<CandidateH1BCheckList> getdocumentsByCategoryId(Integer initiate_id, Integer candidate_id,
			Integer documenttype_id);
	List<String> getDocumentByChecklistId(Integer checklistid);

	List<DocumentHistoryDto> getsclist(Integer candId, Integer initiate_id);

	void saveScanneddoc(CandidateScannedDocumentsEntity scdoc);

	List<String> getScannedDocuments(Integer initiate_id, Integer candidate_id);

	List<Integer> getCheckListIdsByIds(Integer candidate_id, Integer doctypeid, Integer intiate_id,
			Integer profile_id, String bentype, Integer questionnarieId);

	String checkSelectedFileNameById(String filename, String filename2, Integer candidate_id, String profile_name, Integer profile_id, String checked, Integer initiateid);

	void updateH1BDetails(H1BDetailsEntity h1bObj);

	Integer getDocCountByH1bChkId(Integer chklistid);

	List<DocumentHistoryDto> getCandidateDocumentsrepoitoryByIds(Integer docType_Id, Integer candidate_Id,
			Integer initiate_id, Integer subdocid, String profile_id, String profile_type, Integer questionnarieId);

	List<Integer> getSubDocumentbyIds(Integer docType_Id, Integer candidate_Id, Integer initiate_id, String profile_type, Integer questionnarieId);

	List<DocumentHistoryDto> getmodifiedpaflist(Integer lca_id, Integer candidateid, String paf_type);

	void savemodifiedpafform(PAFModifiedDocumentsEntity scdoc);

	String checkpafdocexistornot(String filename, Integer candId, Integer lca_id, String paf_type);

	Integer getemployeesCountByJobTitle(String job_title);

	H1BQuestionnariesEntity getH1BQuetionnaireById(int h1questionnrie_id);

	List<String> getimmiDocsCandidateListSatus(int initiate_id, int candidate_id);

	List<String> getimmiQuestionnariesSatusById(int initiate_id, int i, int candidate_id);

	void deleteInitiateDetails(Integer initiate_id);

	void deleteCandidateH1BCheckListDetails(Integer initiate_id, Integer candidate_Id);

	ImmiDocumentSubTypeEntity getSubDocumentIdByName(String string);

	Integer getCheckListIdsByIds(Integer candidate_id, Integer doctypeid, int subdocumenttype_id, Integer intiate_id,
			Integer profile_id, String bentype);

	void deleteCandidateH1BCheckListDetails(Integer initiate_id, int candidate_id);

	List<DocumentHistoryDto> getCandidatependingdocs(Integer docType_Id, Integer candidate_Id, Integer initiate_id,
			Integer profile_id, String profile_type, Integer questionnarieId);

	String checkFileByCheckListId(Integer chkid);

	List<DocumentHistoryDto> getRepoFilesBychklistid(List<Integer> list);

	List<Integer> getEmpidByids(Integer docType_id, Integer candidate_id, Integer initiate_id, Integer profile_id);

	TempH1BQuestionnariesEntity getTempH1BQuestionnariesByType(Integer candidateid, String string, int initiate_id);

	List<TempH1BQuestionnariesEntity> getTempH1BQuestionnariesByChild(Integer candidateid, String string,
			int initiate_id);

	List<TempEntryandExitDatesEntity> getTempentryexitList(int h1questionnrie_id);

	Integer saveTempH1bQuestionnaries(TempH1BQuestionnariesEntity h1bqueApplObj);

	void saveTempH1bEntryExitDetails(TempEntryandExitDatesEntity h1bObj);

	TempH1BQuestionnariesEntity getTempH1BQuestionnarieDetailsById(Integer applh1que_id);

	void updateTempH1bQuestionnaries(TempH1BQuestionnariesEntity h1bqueApplObjDb);

	TempEntryandExitDatesEntity getTempEntryandExitDatesDetailsById(Integer applEntryid);

	void updateTempH1bEntryExitDetails(TempEntryandExitDatesEntity h1bObj);

	List<ProfileMasterDTO> gettemplatedocsbyprofileid(Integer profile_id);
    List<CandidateH1BInitiateDetailsEntity> getCandidatebyInitiaton();
	
	List<DocumentHistoryDto> getPendingDocsbycandid(int candId, int initiateid);
	List<DocumentHistoryDto> getadminPendingDocsbycandid(int candId, int initiateid);
	List<DocumentHistoryDto> getadminaprPendingDocsbycandid(int candId, int initiateid);
	List<DocumentHistoryDto> getPendingquestionariesBycandid(int candId, int initiateid);

	List<LCADetailsEntity> getlcaid();
	List<LCADetailsDto> getPendingcandidBylcaid(int lcaid);

	TempClientVendorQuestionnarieEntity getTempClientVendorLetterQuestionarieById(Integer candidateid, int initiate_id);

	TempClientVendorQuestionnarieAddressEntity getTempClientVendorQuestionnarieByClientIdType(int client_id,
			String clientType);

	List<TempClientVendorQuestionnarieAddressEntity> getTempClientVendorLetterQuestionarieAddressesById(
			Integer candidateid, int client_id);

	TempClientVendorQuestionnarieEntity getTempClientVendorQuestionnarieByClientId(Integer cvlclientid);

	Integer saveTempClientVendorLetterQuestionnaire(TempClientVendorQuestionnarieEntity cvlqueObj);

	TempClientVendorQuestionnarieAddressEntity getTempClientVendorQuestionnarieAddressById(Integer otheraddress_id);

	void updateTempClientVendorLetterQuestionnaireAddress(TempClientVendorQuestionnarieAddressEntity cvlAddressObj);

	void saveTempClientVendorLetterQuestionnaireAddress(TempClientVendorQuestionnarieAddressEntity cvlAddressObj);

	void updateTempClientVendorLetterQuestionnaire(TempClientVendorQuestionnarieEntity cvlqueObjDb);

	List<ContractsPanelDetails_DTO> getimmiCandidateDocsAdminList(Integer initiateId, int profile_id,
			Integer candidate_id);

	FormsRejectionDetailsEntity getFormsRejectionDetailsById(Integer h1queid, String benf_type, String form_type);

	List<FormsRejectionDetailsEntity> getFormsRejectionDetailsListById(Integer h1queid, String benf_type,
			String form_type);

	List<FormsRejectionDetailsDto> viewrejectedfieldshistorybyid(Integer h1queid, String benf_type, String form_type);

	void updateFormsRejectionDetails(FormsRejectionDetailsEntity historyObjDb);

	void saveFormsRejectionDetails(FormsRejectionDetailsEntity historyObj);
}
