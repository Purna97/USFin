package com.tekskills.Service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.tekskills.Dto.BasicDetailsDto;
import com.tekskills.Dto.CandidateH1BInitiateDetailsDto;
import com.tekskills.Dto.ClientVendorLetterQueDto;
import com.tekskills.Dto.ContractsPanelDetails_DTO;
import com.tekskills.Dto.DocumentHistoryDto;
import com.tekskills.Dto.DocumentsDTO;
import com.tekskills.Dto.FormsRejectionDetailsDto;
import com.tekskills.Dto.ImmicommentsDTO;
import com.tekskills.Dto.LCADetailsDto;
import com.tekskills.Dto.PAFDetailsDto;
import com.tekskills.Dto.ProfileMasterDTO;
import com.tekskills.Dto.PublicBenefitsChecklistDTO;
import com.tekskills.Dto.commentHistoryDto;
import com.tekskills.Entity.CandidateH1BInitiateDetailsEntity;
import com.tekskills.Entity.EmpDocumentsEntity;
import com.tekskills.Entity.EntryandExitDatesEntity;
import com.tekskills.Entity.H1BDetailsEntity;
import com.tekskills.Entity.H1BQuestionnariesEntity;
import com.tekskills.Entity.ImmiDocumentSubTypeEntity;
import com.tekskills.Entity.ImmiDocumentTypeEntity;
import com.tekskills.Entity.ImmiProfileLableMaster;
import com.tekskills.Entity.ImmiProfileMasterCheckList;
import com.tekskills.Entity.PublicBenefitsChecklistEntity;
import com.tekskills.Entity.SOCcodeMasterEntity;
import com.tekskills.Entity.TaskDetailsEntity;

public interface H1BService {

	List<ImmiProfileLableMaster> getInitiateTemplateList();

	List<ImmiDocumentTypeEntity> getAllDocuments();

	List<DocumentsDTO> getSubDocumentList();

	String checkimmiprofilemaster(String profilename);

	List<ImmiDocumentSubTypeEntity> getSubDocumentsByDocid(String categoryid);

	String saveImmiTemplateMaster(Integer lableId, String subcategoryId, Integer lgempno);

	List<DocumentsDTO> getInitiatedTemplates();

	String getProfileNameById(String profileid);

	List<ImmiProfileMasterCheckList> getProfileMasterListById(String profileid);

	List<ProfileMasterDTO> getProfileListByProfileId(String profileid);

	String updateprofilemaster(Integer profileid, String subcategoryId, Integer lgempno);

	List<Integer> getSubCategoriesByProfileId(String profile_id);

	void deleteMasterListById(Integer profileid, Integer scatid);

	ContractsPanelDetails_DTO getimmidocumentlist(String candidateid);

	CandidateH1BInitiateDetailsDto getinitiatebycandidate(String candidateid);

	/*Integer savebenefits(String applicantincome, String spouseincome, String kidsincome, String ssi, String spouse_ssi,
			String kids_ssi, String tanf, String spouse_tanf, String kids_tanf, String ga, String spouse_ga,
			String kids_ga, String snap, String spouse_snap, String kids_snap, String housing_assistance,
			String spouse_housing_assistance, String kids_housing_assistance, String project_rental_assistance,
			String spouse_project_rental_assistance, String kids_project_rental_assistance, String public_housing_act,
			String spouse_public_housing_act, String kids_public_housing_act, String ffm_medicalemergency,
			String spouse_ffm_medicalemergency, String kids_ffm_medicalemergency, String ffm_ideact,
			String spouse_ffm_ideact, String kids_ffm_ideact, String ffm_schoolbenefits,
			String spouse_ffm_schoolbenefits, String kids_ffm_schoolbenefits, String ffm_uderage21,
			String spouse_ffm_uderage21, String kids_ffm_uderage21, String ffm_pregnant_period60,
			String spouse_ffm_pregnant_period60, String kids_ffm_pregnant_period60, Integer candidateid);*/

	/*PublicBenefitsChecklistDTO updatebenefits(String applicantincome, String spouseincome, String kidsincome,
			String ssi, String spouse_ssi, String kids_ssi, String tanf, String spouse_tanf, String kids_tanf,
			String ga, String spouse_ga, String kids_ga, String snap, String spouse_snap, String kids_snap,
			String housing_assistance, String spouse_housing_assistance, String kids_housing_assistance,
			String project_rental_assistance, String spouse_project_rental_assistance,
			String kids_project_rental_assistance, String public_housing_act, String spouse_public_housing_act,
			String kids_public_housing_act, String ffm_medicalemergency, String spouse_ffm_medicalemergency,
			String kids_ffm_medicalemergency, String ffm_ideact, String spouse_ffm_ideact, String kids_ffm_ideact,
			String ffm_schoolbenefits, String spouse_ffm_schoolbenefits, String kids_ffm_schoolbenefits,
			String ffm_uderage21, String spouse_ffm_uderage21, String kids_ffm_uderage21, String ffm_pregnant_period60,
			String spouse_ffm_pregnant_period60, String kids_ffm_pregnant_period60, Integer candidateid);*/

	List<PublicBenefitsChecklistEntity> getPublicBenefitsSizeByCanId(Integer candidateid);

	PublicBenefitsChecklistDTO PublicBenefitsByCanId(Integer candidateid);

	String updateimmiformstaus(String approveStatus, Integer lgempno, String candidate_id, String form_type,
			String comment, Integer logincanid);

	List<ImmicommentsDTO> viewCommentHistoryBycandId(String candId, String form_type);

	Integer saveH1bApplDeatils(String familyName, String firstName, String middleName, String countryofcitizenship,
			String telephoneNo, String ssnNo, String i94No, String countryofbirth, String cityofbirth,
			String yearsofItExp, String highestEdu, String specialization, String officialemailid,
			String personalemailid, String passportNo, String passportissueDate, String passportexpDate, String line1,
			String line2, String zipcode, String city, String state, String permanentAddr, String immigrantstatus,
			String dob, String dateoffirstEntry, String stausoffirstEntry, String dateofrecentEntry,
			String stausofrecentEntry, String visastamping, String petitionfiled_behalf, Integer candidateid);

	void saveH1bEntryExitDetails(String arrivalDate, String arrivalVisa, String departureDate, String departureVisa,
			Integer h1queid, String beneficiary_type, Integer empno);

	Integer saveH1bSpouseChildlDeatils(String familyName, String firstName, String middleName,
			String countryofcitizenship, String telephoneNo, String ssnNo, String i94No, String countryofbirth,
			String cityofbirth, String personalemailid, String passportNo, String passportissueDate,
			String passportexpDate, String line1, String line2, String zipcode, String city, String state,
			String permanentAddr, String immigrantstatus, String dob, String dateofrecentEntry,
			String stausofrecentEntry, Integer candidateid, String beneficiary_type);

	Integer saveClientVendorLetterQuestionnaire(String benef_full_name, String benef_job_title, String startdate,
			String enddate, String workinglocation, String remote_line1, String remote_city, String remote_state,
			String remote_line2, String remote_zipcode, String reportingTo, String reporting_mgr_name,
			String reporting_mgr_title, String reporting_mgr_contact, String reporting_mgr_email, String jobduties,
			Integer candidateid, String client_name, String line1, String city, String state, String line2,
			String zipcode);

	void saveClientVendorLetterQuestionnaireAddress(Integer client_id, String othr_client_name,
			String othr_client_type, Integer candidateid, String othr_line1, String othr_line2, String othr_city,
			String othr_state, String othr_zipcode);

	ClientVendorLetterQueDto getClientVendorLetterQuestionarieById(Integer candidateid);

	void updateClientVendorLetterQuestionnaireAddress(String client_name, String othrclienttype, String line11,
			String line21, String city1, String state1, String zipcode1, Integer otheraddress_id);

	void updateClientVendorLetterQuestionnaire(String benef_full_name, String benef_job_title, String startdate,
			String enddate, String workinglocation, String remote_line1, String remote_line2, String remote_city,
			String remote_state, String remote_zipcode, String reportingTo, String reporting_mgr_name,
			String reporting_mgr_title, String reporting_mgr_contact, String reporting_mgr_email, String jobduties,
			String line1, String line2, String city, String state, String zipcode, String endclient_name,
			String uaddress_id, Integer client_id);

	ClientVendorLetterQueDto getAllQuestionariesByCandidateId(Integer candidateid);

	void updateH1bEntryExitDetails(String uarrivalDate, String uarrivalVisa, String udepartureDate,
			String udepartureVisa, Integer applEntryid);

	void updateH1bApplDeatils(String familyName, String firstName, String middleName, String countryofcitizenship,
			String telephoneNo, String ssnNo, String i94No, String countryofbirth, String cityofbirth,
			String yearsofItExp, String highestEdu, String specialization, String officialemailid,
			String personalemailid, String passportNo, String passportissueDate, String passportexpDate, String line1,
			String line2, String zipcode, String city, String state, String permanentAddr, String immigrantstatus,
			String dob, String dateoffirstEntry, String stausoffirstEntry, String dateofrecentEntry,
			String stausofrecentEntry, String visastamping, String petitionfiled_behalf, Integer candidateid,
			Integer applh1queid);

	void updateH1bSpouseDeatils(String familyName, String firstName, String middleName, String countryofcitizenship,
			String telephoneNo, String ssnNo, String i94No, String countryofbirth, String cityofbirth,
			String personalemailid, String passportNo, String passportissueDate, String passportexpDate, String line1,
			String line2, String zipcode, String city, String state, String permanentAddr, String immigrantstatus,
			String dob, String dateofrecentEntry, String stausofrecentEntry, Integer candidateid, Integer applh1queid);

	ClientVendorLetterQueDto getchilddetailsbyid(String h1bqueid);

	String saveh1bdocumentdetails(String documentsubtype, String doctype, String candidate_id, String intiateid, String h1RecNumber,
			String h1bvFromDate, String h1bvToDate, String i94Number, String i94vFromDate, String i94vToDate,
			MultipartFile h1bdocument, Integer lgempno, String profileid, String bentype, String isdocshown);

	ContractsPanelDetails_DTO getimmisubdocumentBydocid(String candidateid, String document_id, String intiateid,
			String benficiary_type, String profile_id, String questionnarie_id);



	Integer savebenefitsKids(String kidsincome, String kids_ssi, String kids_tanf, String kids_ga, String kids_snap,
			String kids_housing_assistance, String kids_project_rental_assistance, String kids_public_housing_act,
			String kids_ffm_medicalemergency, String kids_ffm_ideact, String kids_ffm_schoolbenefits,
			String kids_ffm_uderage21, String kids_ffm_pregnant_period60, Integer candidateid);

	Integer savebenefits(String applicantincome, String spouseincome, String ssi, String spouse_ssi, String tanf,
			String spouse_tanf, String ga, String spouse_ga, String snap, String spouse_snap, String housing_assistance,
			String spouse_housing_assistance, String project_rental_assistance, String spouse_project_rental_assistance,
			String public_housing_act, String spouse_public_housing_act, String ffm_medicalemergency,
			String spouse_ffm_medicalemergency, String ffm_ideact, String spouse_ffm_ideact, String ffm_schoolbenefits,
			String spouse_ffm_schoolbenefits, String ffm_uderage21, String spouse_ffm_uderage21,
			String ffm_pregnant_period60, String spouse_ffm_pregnant_period60, Integer candidateid);

	PublicBenefitsChecklistDTO updatebenefits(String applicantincome, String spouseincome, String ssi,
			String spouse_ssi, String tanf, String spouse_tanf, String ga, String spouse_ga, String snap,
			String spouse_snap, String housing_assistance, String spouse_housing_assistance,
			String project_rental_assistance, String spouse_project_rental_assistance, String public_housing_act,
			String spouse_public_housing_act, String ffm_medicalemergency, String spouse_ffm_medicalemergency,
			String ffm_ideact, String spouse_ffm_ideact, String ffm_schoolbenefits, String spouse_ffm_schoolbenefits,
			String ffm_uderage21, String spouse_ffm_uderage21, String ffm_pregnant_period60,
			String spouse_ffm_pregnant_period60, Integer candidateid);

	void updatebenefitsKids(String kidsincome, String kids_ssi, String kids_tanf, String kids_ga, String kids_snap,
			String kids_housing_assistance, String kids_project_rental_assistance, String kids_public_housing_act,
			String kids_ffm_medicalemergency, String kids_ffm_ideact, String kids_ffm_schoolbenefits,
			String kids_ffm_uderage21, String kids_ffm_pregnant_period60, Integer benfitid);

	Integer saveImmiGroupingProfileName(String profilename, String isdependent, Integer lgempno);

	void updateprofileName(String profile_id, String profilename, String isdependent);

	String saveimmidocumentbydocIdinitiateId(String initiateid, String documentid, String[] subdocumentid,
			String candidateId, Integer lgempno, MultipartFile[] filename, String[] h1b_checklist_id, String profile_id, String benf_type);

	String saveimmidocumentbydocIdinitiateId1(String initiateid, Integer lgempno, String documentid, String candidateId,
			String[] input, MultipartFile[] filename, String profile_id, String benf_type, String questionnarie_id);

	String updatefilebydocid(String docid, MultipartFile filename1, String uhisdocshown);

	List<EmpDocumentsEntity> getinputvaluebydocid(String intiateid, String candidateid, 
			String documentid, String benficiary_type, String profile_id, String questionnarie_id);

	String updateformbydocid(String documenttype, String document_id, MultipartFile filenameid, String uhisdocshown);

	List<EmpDocumentsEntity> viewfilehistory(String docid, String subdocid, String initiateid, String candid,
			String checklistid);

	List<DocumentsDTO> getdocumentshistory(String document_id);
	
	List<DocumentHistoryDto> getCandidateDocumentsByIds(String docTypeId, String candidateid, String initiateid,
			String profile_id, String profile_type, String questionnarie_id, String view_type);

	String updateCandDocVerifierStatus(String docTypeId, String candidateid, String initiateid,
			Integer lgempno, String verfierstatus, String verfiercomments,
			String profile_id, String profile_type, String questionnarie_id, Integer lgcandidateid);

	List<commentHistoryDto> getImmiCandidateDocumentsByIds(String docTypeId, String candidateid, 
			String initiateid, String profile_id, String profile_type);

	String getProfileIsDependentById(String profileid);

	String saveimmiSubdocumentstoChecklist(String initiateid, String documentid, String h1DocSelectionId,
			String candidateId, Integer lgempno, MultipartFile h1document, String profile_id, String benf_type);

	/*String updateH1InitiationDetails(Integer loginempno, String uinitiate_id, String spouseh4dependVal,
			String marital_status, String kids_status, String spousefiling, String kidsfiling, String kidsh4dependVal);
*/
	String saveH1InitiationDetails(Integer lgcandidateid, String candidateid, String h1initVal, String marital_status,
			String spousefiling, String spousefilingead, String kids_status, String kidsfiling);

	String saveH1BDocuments(String documentsubtype, String doctype, String[] h1documentInputs,
			CommonsMultipartFile[] rfeh1document, Integer lgempno, String candidate_id, String intiateid,
			String profileid, String bentype, String isdocshown);

	String updateH1InitiationDetails(Integer loginempno, String uinitiate_id, String marital_status,
			String spousefiling, String spousefilingead, String kids_status, String kidsfiling);

	PAFDetailsDto pafDetails(String lcaid);

	List<BasicDetailsDto> getActiveEmployeeList();

	List<SOCcodeMasterEntity> getSocCodeMasterList();

	SOCcodeMasterEntity getSOCDetailsById(String socid);

	String checkSocCode(String soc_code);

	String saveupdatesoc(String soc_code, String soccode_title, String duties, String from_wagerate,
			String to_wagerate, String occ_clasfi, Integer loginempno, String socid);
	
	String checkpetitionPacket(String candidateid, String initiateid);

	List<String> getpetitionPacketDocuments(String candidateid, String initiateid);

	String getProfileNameByinitiateid(String initiateid);

	List<TaskDetailsEntity> getalltaskdetailsbycandidateid(String candidateid);

	String saveh1bdocumentdetails1(String documentsubtype, String doctype, String candidate_id, String intiateid,
			MultipartFile h1bdocument, Integer lgempno, String profileid, String bentype, String isdocshown);

	List<String> getdocumentsByCategoryId(String candidateid, String initiateid, String documenttypeid);

	String getdocumentTypeById(String documenttypeid);

	String updateprintnostatus(String initiateid, String candidateid, String documenttypeid, String profileid,
			String profiletype, String printedvalue, String questionnarie_id);

	String updateprintyesstatus(String initiateid, String candidateid, String documenttypeid, String profileid,
			String profiletype, String printedvalue, String questionnarie_id);

	String scandetailsform(String candidateId, Integer lgcandidateId, String[] input, MultipartFile[] filename,
			String initiateid);

	List<DocumentHistoryDto> getsclist(String initiateid, String candidateId);

	List<String> getScannedDocuments(String candidateid, String initiateid);

	H1BDetailsEntity geth1bDetalsById(String h1bId);

	String updateh1bapproveddocumentdetails(String documentid, String h1bid, String h1bRecieptNumber,
			String h1bvFromDate, String h1bvToDate, String i94Number, String i94vFromDate, String i94vToDate,
			MultipartFile h1bdocument, Integer lgcandidateid, String uhisdocshown);

	String checksubdocsbyids(String initiateid, String candidateId, String profile_id, String benf_type,
			String documentid, String subdocid);

	String checkSelectedFileNameById(String profiletype,String filename, String candidateid, String profile_name, String profileid, String checked);

	List<DocumentHistoryDto> getCandidateDocumentsrepoitoryByIds(String docTypeId, String candidateid,
			String initiateid, String profile_id, String profile_type, String questionnarie_id);

	String saverepodoc(String initiateid, String documentid, String sub_id, String candidateId, Integer lgcandidateid,
			String subfilename, String checklist, String profile_id, String benf_type, String questionnarie_id);

	String saveAdditionalDocs(String initiateid, Integer lgcandidateid, String documentid, String candidateId,
			String[] inputspan, String[] inputfilespan, String profile_id, String benf_type, String questionnarie_id);

	List<DocumentHistoryDto> getmodifiedpaflist(String lcaid, String candidate_id, String paf_type);

	String savemodifiedpafform(String pafdocname, String paflcaid, MultipartFile paffile, String pafcandidateid,
			Integer lgcandidateid, String paf_type);

	String checkpafdocexistornot(String filename, String candidateid, String lcaid, String paf_type);
	H1BQuestionnariesEntity getH1BQuetionnaireById(int h1questionnrie_id);

	List<EntryandExitDatesEntity> getChildEntryListById(int h1questionnrie_id);

	void updateInitiateDetails(CandidateH1BInitiateDetailsEntity initiateObj);

	CandidateH1BInitiateDetailsEntity getInitiateDetailsByInitiateId(String initiateid);

	String inactiveInitiationNo(String initiateid, String comments);

	String deleteInitiationNo(String initiateid, String candidateId);

	void updateH1InitiationStatus(String candidate_id);

	List<DocumentHistoryDto> getCandidatePendingDocs(String docTypeId, String candidateid, String initiateid,
			String profile_id, String profile_type, String questionnarie_id);

	String saveimmidocumentbydocId(String initiateid, String documentid, Integer subdocument_id, String candidateId,
			Integer lgcandidateid, MultipartFile multipartFile, Integer h1bchecklistid, String profile_id, String benf_type, String questionnarie_id);

	Integer saveTempH1bApplDeatils(String familyName, String firstName, String middleName, String countryofcitizenship,
			String telephoneNo, String ssnNo, String i94No, String countryofbirth, String cityofbirth,
			String yearsofItExp, String highestEdu, String specialization, String officialemailid,
			String personalemailid, String passportNo, String passportissueDate, String passportexpDate, String line1,
			String line2, String zipcode, String city, String state, String permanentAddr, String immigrantstatus,
			String dob, String dateoffirstEntry, String stausoffirstEntry, String dateofrecentEntry,
			String stausofrecentEntry, String visastamping, String petitionfiled_behalf, Integer candidateid, String tapplh1que_id);

	void saveTempH1bEntryExitDetails(String arrivalDate, String arrivalVisa, String departureDate, String departureVisa,
			Integer h1queid, String beneficiary_type, Integer candidateid);

	void updateTempH1bEntryExitDetails(String uarrivalDate, String uarrivalVisa, String udepartureDate,
			String udepartureVisa, Integer applEntryid);

	List<ProfileMasterDTO> gettemplatedocsbyprofileid(String profileid);

	Integer saveTempH1bSpouseChildlDeatils(String familyName, String firstName, String middleName,
			String countryofcitizenship, String telephoneNo, String ssnNo, String i94No, String countryofbirth,
			String cityofbirth, String personalemailid, String passportNo, String passportissueDate,
			String passportexpDate, String line1, String line2, String zipcode, String city, String state,
			String permanentAddr, String immigrantstatus, String dob, String dateofrecentEntry,
			String stausofrecentEntry, Integer candidateid, String beneficiary_type, String tspouseh1que_id);
	
	List<DocumentHistoryDto> getCandidateInitiaton();
	List<DocumentHistoryDto> getadminCandidateInitiaton();
	List<DocumentHistoryDto> getadminaprCandidateInitiaton();
	List<DocumentHistoryDto> questionaries();
	List<LCADetailsDto> getpendinglca();

	Integer saveTempClientVendorLetterQuestionnaire(String benef_full_name, String benef_job_title, String startdate,
			String enddate, String workinglocation, String remote_line1, String remote_city, String remote_state,
			String remote_line2, String remote_zipcode, String reportingTo, String reporting_mgr_name,
			String reporting_mgr_title, String reporting_mgr_contact, String reporting_mgr_email, String jobduties,
			Integer candidateid, String client_name, String line1, String city, String state, String line2,
			String zipcode, String cvlclient_id, String taddress_id);

	void updateTempClientVendorLetterQuestionnaireAddress(String oclient_name, String othrclienttype, String line11,
			String line21, String city1, String state1, String zipcode1, Integer otheraddress_id);

	void saveTempClientVendorLetterQuestionnaireAddress(Integer client_id, String othr_client_name,
			String othr_client_type, Integer candidateid, String othr_line1, String othr_line2, String othr_city,
			String othr_state, String othr_zipcode);

	List<DocumentHistoryDto> getPendingdocsbyCandid(Integer candidateid);

	ContractsPanelDetails_DTO getimmidocumentlist1(Integer candidate_id);
	ContractsPanelDetails_DTO getimmihistorydocumentlist(String candidateid, String initiateid);

	PublicBenefitsChecklistDTO PublicBenefitsByCanId1(Integer candidateid, Integer initiateid);

	ClientVendorLetterQueDto getClientVendorLetterQuestionarieById1(Integer candidateid, Integer initiateid);

	ClientVendorLetterQueDto getAllQuestionariesByCandidateId1(Integer candidateid, Integer initiateid);

	ClientVendorLetterQueDto getRejectedFieldsDetailsById(String h1bqueid, String form_type, String benf_type);

	List<FormsRejectionDetailsDto> viewrejectedfieldshistorybyid(String h1bqueid, String form_type, String benf_type);

	void upadteH1bQueDetails(String h1que_id, String benf_type, String rejectedfield, String rejectComments,
			String form_type, String rejstatus, Integer logincanid, String cand_id, Integer lgempno);

	String mapemployee(String qbId, String candId);

}
