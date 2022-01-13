package com.tekskills.Service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

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
import com.tekskills.Entity.CandidateBGCCheckList;
import com.tekskills.Entity.CandidateBGCDetails;
import com.tekskills.Entity.CategoryEntity;
import com.tekskills.Entity.DocumentTypeEntity;
import com.tekskills.Entity.ProfileLableMaster;
import com.tekskills.Entity.ProfileMasterCheckList;
import com.tekskills.Entity.SubCategoryDocumentsEntity;
import com.tekskills.Entity.SubCategoryEntity;
import com.tekskills.Entity.TemporaryCandidateDetails;

public interface BGCService  {

	int saveCategory(String category, Integer lgempno);

	int saveSubCategory(String category, String subCategory, String sameas_category, Integer lgempno, 
			String subcattype, String doctype, String isdocupload, MultipartFile[] document);

	String checkCategory(String category);

	String checkSubCategory(String subCategory);

	List<CategoryEntity> getAllCategeories();

	String updatecategory(String category, String categoryid);

	List<SubCategoryEntity> getAllSubCategeories();

	List<CategoreisDTO> getSubCategeoriesList();

	String updatesubcategory(String category, String subCategory, String sameas_category, Integer lgempno, 
			String subcategoryid, String usubcattype, String udoctype, String udocupload, MultipartFile[] udocument);

	String checkprofilemaster(String profilename);

	List<SubCategoryEntity> getSubCategoriesByCatid(String categoryid);

	Integer saveGroupingProfileName(String profilename, Integer lgempno);

	String saveProfileMaster(Integer lableId, String subcategoryId, Integer lgempno);

	List<ProfileLableMaster> getProfileList();

	List<ProfileMasterDTO> getProfileListByProfileId(String profileid);

	String getProfileNameById(String profileid);

	List<ProfileMasterCheckList> getProfileMasterListById(String profile_id);

	String updateprofilemaster(Integer lableId, String subcategoryId, Integer lgempno);

	void deleteMasterListById(Integer lableId, Integer scatid);

	void updateprofileName(String profile_id, String profilename);

	List<TemporaryCandidateDetails> getTempCandidateList();

	List<ProfileMasterDTO> getCandidateSpecifics(String Categoryid, String profileid);

	Integer saveCandidateBGCDetails(String profile, String candidate, String status, Integer lgempno , String baicform);

	SubCategoryEntity getCategoryBySubCatid(String subcategoryId);

	String saveCandidateBGCCheckList(String candidate, String subcategoryId, Integer lgempno, Integer profileid,Integer catid, Integer bgc_id);

	List<AssignedCandidateDto> getAssignedCandidateList();

	CandidateBGCDetails getBGCDetailsByCandidateId(String bgcid);

	List<Integer> getSubCategoriesByProfileId(String profile_id);

	List<Integer> getCandidateBGCCheckList(String bgcid);

	void deleteBGCCheckListById(Integer catid, Integer scatid, Integer bgc_id);

	Integer updateCandidateBGCDetail(Integer profileid, String candidate, String status, Integer bgc_id, Integer lgempno ,String baicform);

	void saveBGCCheckListByProfileId(String candidate, int subcategory_id, Integer lgempno, String profile,
			Integer catid, Integer bgc_id);

	List<TempCandidateDetailsDTO> getAllCandidates();

	int saveCandidateDetails(String fname, String ssn, String phne_no, String emailid, Integer lgempno, String lname);

	String updatecandidate(String candidateId, String ssn, String fname, String lname, String phne_no, String emailid,
			Integer lgempno);

	List<ProfileLableMaster> getAllProfiles();

	List<TempCandidateDetailsDTO> getCandidatesByProfileId(String profileId);

	ContractsPanelDetails_DTO getContrctsPanelDetailsById(String candidateId, String profileId);

	String saveCommentDetails(String bgcChkId, String bgcChkStatus, String comment, Integer lgempno,
			MultipartFile[] bgcfile, String bgcCandidateId);

	List<commentHistoryDto> viewCommentHistoryById(String chkListId);

	List<fileHistoryDto> viewfileHistoryByChkListId(String chkListId);

	List<CandidateBGCCheckList> getBGCListByIds(Integer catid, String subcategoryId, Integer bgc_id, String candidate);

	String updateProfileStatus(String profileid, String status);

	List<ProfileLableMaster> getInactiveProfileList();

	String saveBgcStatusById(String candidateId, String profileId, String bgcStatus);

	List<ContractsPanelDetails_DTO> getBGCPendingList();

	String ssncheckInTempReg(String ssn_emp);

	String updatecanstatus(String bgcChkId, String bgcChkStatus, String comment, Integer lgempno,
			String bgcCandidateId, Integer logincandidateid);

	TemporaryCandidateDetails checkLoginWithEmailId(String emailId, String password);

	String emailcheckInTempRegForgotPassword(String emailId);

	String checkPasswordTempReg(String lgemailid, String currentPassword);

	String changePasswordTempReg(String lgemailid, String confirmPassword);

	String emailcheckInTempReg(String emailId);

	String resetPasswordTempReg(String emailId);

	String saveEducationDetails(String collegeNameAddr, String universityNameAddr, String graduatedYear,
			String enrollNo, String typeofeducation, String subMajor, String qualification,
			String fromDate, String toDate, String courseType, Integer loginempno);

	String saveEmploymentDetails(String company_name, String reported_to_name, String hrmgr, String positionheld,
			String employmentType, String company_tele, String fromDate, String toDate, String cpname, String cpemail,
			String cpnumber, String acpname, String acpnumber, String line1, String line2, String city, String state,
			String zipcode, String[] othr_company_names, String[] othr_reported_to_names, String[] othr_hrmgrs,
			String[] othr_positionhelds, String[] othr_employmentTypes, String[] othr_company_teles,
			String[] othr_cpnames, String[] othr_cpemails, String[] othr_cpnumbers, String[] othr_acpnames,
			String[] othr_acpnumbers, String[] othr_line1s, String[] othr_line2s, String[] othr_citys,
			String[] othr_states, String[] othr_zipcodes, String[] othr_fromDates, String[] othr_toDates,
			String reported_to_position, String[] othr_reported_to_positions, Integer loginempno);

	String savePersonalDetails(String ssn_emp, String firstName, String middleName, String familyName,
			String fatherName, String dob, String genderType, String nationality, String contactTeleNo, String email_id,
			String mobile, Integer loginempno, String title, String line1, String line2, String city, String state,
			String zipcode, String fromDate, String toDate, String[] othr_line1s, String[] othr_line2s,
			String[] othr_citys, String[] othr_states, String[] othr_zipcodes, String[] othr_fromDates,
			String[] othr_toDates);

	ContractsPanelDetails_DTO getBgvDocFormsDetailsById(Integer candidateId);

	CandidateBGCPersonalDetailsDto viewCandidateBGCPersonalDetailsById(String candidateId);

	String updateCandidateBGCPersonalDetails(String ssn_emp, String firstName, String middleName, String familyName,
			String fatherName, String dob, String genderType, String nationality, String contactTeleNo, String email_id,
			String mobile, Integer loginempno, String title, String[] contact_id, String[] line1s, String[] line2s,
			String[] citys, String[] states, String[] zipcodes, String[] fromDates, String[] toDates,
			String[] othr_line1s, String[] othr_line2s, String[] othr_citys, String[] othr_states,
			String[] othr_zipcodes, String[] othr_fromDates, String[] othr_toDates);

	List<CandidateBgvEmploymentDto> viewCandidateBgvEmploymentDetailsById(String candidateId);

	String updateEmploymentDetails(String[] company_names, String[] reported_to_names, String[] hrmgrs,
			String[] positionhelds, String[] employmentTypes, String[] company_teles, String[] reported_to_positions,
			String[] fromDates, String[] toDates, String[] cpnames, String[] cpemails, String[] cpnumbers,
			String[] acpnames, String[] acpnumbers, String[] line1s, String[] line2s, String[] citys, String[] states,
			String[] zipcodes, String[] othr_company_names, String[] othr_reported_to_names,
			String[] othr_reported_to_positions, String[] othr_hrmgrs, String[] othr_positionhelds,
			String[] othr_employmentTypes, String[] othr_company_teles, String[] othr_cpnames, String[] othr_cpemails,
			String[] othr_cpnumbers, String[] othr_acpnames, String[] othr_acpnumbers, String[] othr_line1s,
			String[] othr_line2s, String[] othr_citys, String[] othr_states, String[] othr_zipcodes,
			String[] othr_fromDates, String[] othr_toDates, Integer loginempno, String[] employment_ids, String[] contact_ids);

	String saveBgvEmploymentDetails(String company_name, String reported_to_name, String hrmgr, String positionheld,
			String employmentType, String company_tele, String cpname, String cpemail,
			String cpnumber, String acpname, String acpnumber, String line1, String line2, String city, String state,
			String zipcode, String reported_to_position, Integer loginempno, 
			String startedYear, String startedMonth, String workedTillYear, String workedTillMonth);

	String updateBgvEmploymentDetails(String company_name, String reported_to_name, String hrmgr, String positionheld,
			String employmentType, String company_tele, String cpname, String cpemail, String cpnumber, String acpname,
			String acpnumber, String line1, String line2, String city, String state, String zipcode,
			String reported_to_position, String startedYear, String startedMonth,
			String workedTillYear, String workedTillMonth,Integer loginempno,
			String contact_id, String employment_id);

	List<CandidateBgvEducationDto> viewCandidateBgvEducationDetailsById(String candidateId);

	String getEmploymentLastrowStatus(String candidateId);

	List<commentHistoryDto> viewpersonalhistory(String candidateId, String formtype);

	String updateemploymentstatus(String bgcChkStatus, String comment, Integer lgempno, String candidate_id, Integer logincandidateid);

	String updateeducationstatus(String bgcChkStatus, String comment, Integer lgempno, String candidate_id, Integer logincandidateid);

	String updatepersonalstatus(String bgcChkStatus, String comment, Integer lgempno, String candidate_id, Integer logincandidateid);

	String updateBgvEducationDetails(String collegeNameAddr, String universityNameAddr, String graduatedYear,
			String enrollNo, String typeofeducation, String gradDate, String subMajor, String qualification,
			String fromDate, String toDate, String courseType, Integer loginempno, String educationId);

	String savebgvcandidatedocs(String bgcChkId, String comment, Integer lgempno, MultipartFile[] bgcfile,
			String bgcCandidateId);

	String ceckBGCCandidateIdExists(int candidate_id);

	TemporaryCandidateDetails getTempCandidateByCandidateId(Integer candidateId);

	List<ProfileMasterDTO> getProfilesByCandidateId(String candidateId);

	List<AssignedCandidateDto> getAssignedCandidatesList();

	List<DocumentTypeEntity> getDocumentTypeList();

	List<DocEmpBean> candidateDocumentsByType(String candidateId, String documentId);

	String savedoctype(String docname, Integer lgempno);

	String updatedoctype(String docname, String docid);

	String checkDocumentType(String docname);

	BGCCandidateFormsStatusEntity getBGCFormsStatusByCandidateId(String candidateId);

	CandidateBgvEmploymentDto getCandidateEmploymentDetailsByEmploymentId(String employmentId);

	List<SubCategoryDocumentsEntity> viewSubCatDocListBySubCatId(String subCatId);

	String updateSubCatDocumentStatus(String docid, String docstatus);

	List<String> getSubcategoryDocuments(String subcat_id);

	List<ContractsPanelDetails_DTO> ContrctsPanelHistoryById(String candidateId, String profileId);

	DocumentTypeDto bgccheckDocumentTypeissame(String docTypeid);

	List<DocumentTypeDto> viewSubCatDocListBySubCategories(String subCatId);


}
