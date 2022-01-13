package com.tekskills.Dao;

import java.util.List;

import com.tekskills.Dto.AssignedCandidateDto;
import com.tekskills.Dto.CandidateBGCAddressDetailsDto;
import com.tekskills.Dto.CandidateBGCPersonalDetailsDto;
import com.tekskills.Dto.CandidateBgvEducationDto;
import com.tekskills.Dto.CandidateBgvEmploymentDto;
import com.tekskills.Dto.CategoreisDTO;
import com.tekskills.Dto.ContractsPanelDetails_DTO;
import com.tekskills.Dto.DocEmpBean;
import com.tekskills.Dto.DocumentTypeDto;
import com.tekskills.Dto.ProfileMasterDTO;
import com.tekskills.Dto.TempCandidateDetailsDTO;
import com.tekskills.Dto.commentHistoryDto;
import com.tekskills.Dto.fileHistoryDto;
import com.tekskills.Entity.BGCCandidateFormsStatusEntity;
import com.tekskills.Entity.BGCCheckListCommentsHistory;
import com.tekskills.Entity.BGCCheckListFileHistory;
import com.tekskills.Entity.CandidateBGCAddressEntity;
import com.tekskills.Entity.CandidateBGCCheckList;
import com.tekskills.Entity.CandidateBGCDetails;
import com.tekskills.Entity.CandidateBGCEducationEntity;
import com.tekskills.Entity.CandidateBGCEmploymentEntity;
import com.tekskills.Entity.CandidateBGCPersonalEntity;
import com.tekskills.Entity.CategoryEntity;
import com.tekskills.Entity.DocumentTypeEntity;
import com.tekskills.Entity.FormsCommentsHistory;
import com.tekskills.Entity.ProfileLableMaster;
import com.tekskills.Entity.ProfileMasterCheckList;
import com.tekskills.Entity.SubCategoryDocumentsEntity;
import com.tekskills.Entity.SubCategoryEntity;
import com.tekskills.Entity.TemporaryCandidateDetails;

public interface BGCDao {

	int saveCategory(CategoryEntity categoryObj);

	List<CategoryEntity> getAllCategeories();

	String checkCategory(String category);

	CategoryEntity getCategoryByCategoryId(Integer categoryId);

	void updatecategory(CategoryEntity catObj);

	List<SubCategoryEntity> getAllSubCategeories();

	int saveSubCategory(SubCategoryEntity subcatObj);

	String checkSubCategory(String subCategory);

	List<CategoreisDTO> getSubCategeoriesList();

	SubCategoryEntity getSubCategoryBysubCategoryId(Integer subcategoryId);

	void updatesubcategory(SubCategoryEntity subcatObj);

	SubCategoryEntity getSubCategoryByCategoryId(Integer categoryId);

	String checkprofilemaster(String profilename);

	List<SubCategoryEntity> getSubCategoriesByCatid(Integer categoryId);

	int saveGroupingProfileName(ProfileLableMaster lableObj);

	void saveProfileMaster(ProfileMasterCheckList profileMasterObj);

	List<ProfileLableMaster> getProfileList();

	List<ProfileMasterDTO> getProfileListByProfileId(Integer profile_Id);

	String getProfileNameById(Integer profile_Id);

	List<ProfileMasterCheckList> getProfileMasterListById(Integer profile_Id);

	void deleteMasterListById(Integer lableId, Integer scatid);

	ProfileLableMaster geProfileLableMasterById(Integer profileId);

	void updateprofileName(ProfileLableMaster lableObj);

	List<TemporaryCandidateDetails> getTempCandidateList();

	SubCategoryEntity getCategoryBySubCatid(Integer subcategoryId);

	List<Integer> getSubCategoiesByProfileId(Integer profile_Id);

	List<Integer> getSubCategoryIds();

	ProfileMasterDTO getCatSubcatBySubcatId(Integer subid);

	List<Integer> getSubCategoryByCatId(Integer category_Id);

	Integer saveCandidateBGCDetails(CandidateBGCDetails candidateObj);

	void saveCandidateBGCCheckList(CandidateBGCCheckList bgccheckObj);

	TemporaryCandidateDetails getCandidateDetailsById(int parseInt);

	void updateCandidateStatus(TemporaryCandidateDetails candiOb);

	List<AssignedCandidateDto> getAssignedCandidateList();

	CandidateBGCDetails getBGCDetailsByCandidateId(Integer bgc_id);

	List<ProfileMasterCheckList> getProfileListByProfileSubcatId(Integer lableId, Integer subcatid);

	List<Integer> getCandidateBGCCheckList(Integer bgc_Id);

	void deleteBGCCheckListById(Integer catid, Integer scatid, Integer bgc_id);

	void updateCandidateBGCDetail(CandidateBGCDetails candidateObj);

	int saveCandidateDetails(TemporaryCandidateDetails candidateObj);

	TemporaryCandidateDetails getCandidateByCandidateId(Integer candidate_Id);

	void updatecandidate(TemporaryCandidateDetails candDbObj);

	List<TempCandidateDetailsDTO> getAllCandidates();

	List<ContractsPanelDetails_DTO> getContrctsPanelDetailsById(Integer candidate_Id, Integer profile_Id);

	List<Integer> getCategoryIdsById(Integer candidate_Id, Integer profile_Id);

	List<Integer> getSubCategoryIdsById(Integer candidate_Id, Integer profile_Id, Integer catId);

	List<ProfileLableMaster> getAllProfiles();

	List<TempCandidateDetailsDTO> getCandidatesByProfileId(Integer profile_Id);

	CandidateBGCCheckList getBGCCheckListById(Integer bgcChk_Id);

	void updateCommentDetails(CandidateBGCCheckList candidateBgcObj);

	void saveCommentHistory(BGCCheckListCommentsHistory commentHistory);

	void saveDocumentHistory(BGCCheckListFileHistory filehisory);

	List<commentHistoryDto> viewCommentHistoryById(Integer chkList_Id);

	List<fileHistoryDto> viewfileHistoryByChkListId(Integer chkList_Id);

	List<CandidateBGCCheckList> getBGCListByIds(Integer bgc_id, Integer subcatId, Integer catid, Integer candidateId);

	ProfileLableMaster getprofileMasterByprofileId(Integer profile_Id);

	List<ProfileLableMaster> getInactiveProfileList();

	Integer getBGCIdByCandidateIdProfileID(Integer candidate_Id, Integer profile_Id);

	List<ContractsPanelDetails_DTO> getBGCPendingList();

	String ssncheckInTempReg(String ssn_emp);

	List<ContractsPanelDetails_DTO> getContrctsPanelAdminList(Integer candidate_Id, Integer profile_Id);

	List<ContractsPanelDetails_DTO> getContrctsPanelCandidateList(Integer candidate_Id, Integer profile_Id);

	CandidateBGCPersonalEntity getBGVCandidatePersonalDetailsById(Integer candidate_Id);

	CandidateBGCEducationEntity getBGVCandidateEducationDetailsById(Integer candidate_Id);

	CandidateBGCEmploymentEntity getBGVCandidateEmploymentDetailsById(Integer candidate_Id);

	String resetPasswordTempReg(String emailId, String resetpass_word);

	TemporaryCandidateDetails getCandidateByCandidateEmailId(String emailId);

	String changePasswordTempReg(String lgemailid, String confirmPassword);

	String checkPasswordTempReg(String lgemailid, String currentPassword);

	TemporaryCandidateDetails checkLoginWithEmailId(String emailId, String password);

	String emailcheckInTempReg(String email_emp);

	Integer saveEducationDetails(CandidateBGCEducationEntity othereducationDetailObj);

	void saveCandidateBGCAddressDetails(CandidateBGCAddressEntity candOtherAddressObj);

	Integer saveEmploymentDetails(CandidateBGCEmploymentEntity otheremploymentDetailObj);

	Integer savePersonalDetails(CandidateBGCPersonalEntity personalDetailObj);

	CandidateBGCPersonalDetailsDto viewCandidateBGCPersonalDetailsById(Integer candidate_id);

	List<CandidateBGCAddressDetailsDto> getCandidateBGCAddressDetailsById(Integer personal_id);

	//void updatePersonalDetails(CandidateBGCPersonalEntity updatepersonalDetailObj);

	CandidateBGCAddressEntity getBGVCandidateAdressDetailsById(Integer contact_id);

	void updateCandidateBGCAddressDetails(CandidateBGCAddressEntity updateCandAddressObj);

	List<CandidateBgvEmploymentDto> viewCandidateBgvEmploymentDetailsById(Integer candidate_id);

	CandidateBGCEmploymentEntity getBGVCandidateEmploymentDetailsByEmploymentId(Integer employment_id);

	void updateCandidateBGvEmploymentDetails(CandidateBGCEmploymentEntity updateEmploymentDetailObj);

	List<CandidateBgvEducationDto> viewCandidateBgvEducationDetailsById(Integer candidate_id);

	void updatePersonalDetails(CandidateBGCPersonalEntity personalObj);

	void saveFormsHistory(FormsCommentsHistory commentHistory);

	List<commentHistoryDto> viewpersonalhistory(Integer candidate_id, String formtype);

	void updateEducationDetails(CandidateBGCEducationEntity educationObj);

	void updateEmploymentDetails(CandidateBGCEmploymentEntity employmentObj);

	String getEmploymentLastrowStatus(Integer candidate_id);

	ContractsPanelDetails_DTO getEducationLastrowDetails(Integer candidate_Id);

	ContractsPanelDetails_DTO getEmploymentLastrowDetails(Integer candidate_Id);

	CandidateBGCEducationEntity getBGVCandidateEducationDetailsByEducationId(Integer education_Id);

	Integer getEducationLastrowIdByCandidateId(Integer candidateid);

	Integer getEmploymentLastrowIdByCandidateId(Integer candidateid);

	Integer ceckBGCCandidateIdExists(int candidate_id);

	List<ProfileMasterDTO> getProfilesByCandidateId(Integer candidate_Id);

	List<AssignedCandidateDto> getAssignedCandidatesList();

	Integer getTop1ProfileIdByCandidate(Integer candidate_Id);

	List<DocumentTypeEntity> getDocumentTypeList();

	List<DocEmpBean> candidateDocumentsByType(Integer candidate_Id, Integer document_Id);

	Integer savedocumentType(DocumentTypeEntity doctypeObj);

	DocumentTypeEntity getDocumentTypeById(Integer doc_id);

	void updateDocumentType(DocumentTypeEntity docObj);

	String checkDocumentType(String docname);

	BGCCandidateFormsStatusEntity getBGCFormsStatusByCandidateId(Integer candidate_Id);

	void updateCandidateFormsStatusDetails(BGCCandidateFormsStatusEntity candformsStatusDBObj);

	void saveCandidateFormsStatusDetails(BGCCandidateFormsStatusEntity candformsStatusObj);

	CandidateBgvEmploymentDto getCandidateEmploymentDetailsByEmploymentId(Integer employment_id);

	void saveSubCategoryDocument(SubCategoryDocumentsEntity subCatDocObj);

	List<SubCategoryDocumentsEntity> viewSubCatDocListBySubCatId(Integer subCat_Id);

	SubCategoryDocumentsEntity getSubCatDocumentBySubCatId(Integer doc_id);

	void updateSubCatDocument(SubCategoryDocumentsEntity docObj);

	List<String> getSubcategoryDocuments(Integer subcatid);

	CandidateBGCDetails getBGCDetailsByIds(Integer candidate_Id, Integer profile_Id);

	List<Integer> getBGCIdsByCandidateIdProfileID(Integer candidate_Id, Integer profile_Id);

	Integer bgccheckDocumentTypeIssame(Integer docType_id);

	Integer bgccheckDocumentTypeSubocTypeCount(Integer docType_id);

	String checkSubCategoryDocument(String originalFilename, Integer subcategoryId);

	List<DocumentTypeDto> viewSubCatDocListBySubCategories(Integer subCat_Id);


}
