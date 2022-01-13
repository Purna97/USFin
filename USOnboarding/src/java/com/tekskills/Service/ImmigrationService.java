package com.tekskills.Service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.tekskills.Dto.BasicDetailsDto;
import com.tekskills.Dto.ClientVendorMaster_DTO;
import com.tekskills.Dto.DocEmpBean;
import com.tekskills.Dto.DocumentTypeDto;
import com.tekskills.Dto.EndClientDetialDto;
import com.tekskills.Dto.LCADetailsDto;
import com.tekskills.Dto.TaskDetailsDto;
import com.tekskills.Dto.TempCandidateDetailsDTO;
import com.tekskills.Entity.ClientDetailsEntity;
import com.tekskills.Entity.ImmiDocumentTypeEntity;
import com.tekskills.Entity.LCADetailsEntity;
import com.tekskills.Entity.TaskDetailsEntity;

public interface ImmigrationService {

	List<BasicDetailsDto> getW2CandidateList();
	List<BasicDetailsDto> getW2CandidateListrepo();

	List<ClientVendorMaster_DTO> getEndclientListByCandidateId(String candidateid);

	EndClientDetialDto getlcaquestionaries(String candidateid, String clientid);

	List<TaskDetailsDto> gettaskdetailsbyids(String candidateid, String clientid, String type);

	TaskDetailsEntity getTaskdetailsById(String taskid);

	String updatetask(String taskid, String taskstatus, String duedate, String description, String comments, String emailid);

	String addtask(String taskname, String duedate, String description, Integer empno, String client_id, String candidateid);

	List<DocEmpBean> getLCAHistory(String candidateid, String clientid);

	String saveAmendment(String candidateid, String clientid, String amendment, Integer loginempno);

	ClientDetailsEntity getEndclientByClientId(String clientid);
	
	/*Integer saveuploadLCADetails(String lcaDocName,MultipartFile lcaDocument, String lcaNumber,
			String county, String lcaBeginDate, String lcaEndDate,String caseType, String lcaCertifiedDate, 
			String soc_code, String job_title, String wageRate, String wageLevel, String prevailingWage,
			String lcaSubDate, Integer lgempno, String lcapayrateId, String lcacandidateId, 
			String lcaclientId, String documenttype, String documentsubtype, String lcaId);
	*/
	String checkImmigrationSelectedFileName(String lcapayrateId, String docInput, String docType);

	void saveImmigrationDocument(String lcaDocName, MultipartFile lcaDocument, String startdate, String enddate,
			Integer lgempno, String lcapayrateId, String lcacandidateId, String lcaclientId, String documenttype,
			String documentsubtype, String fileType, String lcaId);

	String checkLCANumber(String lcaNumber);

	List<LCADetailsDto> getAllLCAList(String candidateid, String clientid);

	EndClientDetialDto getsubdocsbydoclcaid(String lcaid, String docid);

	void updateLCADetails(String docinput, MultipartFile document, String lcaNumber, String county, 
			String lcastartdate, String lcaenddate, String caseType, String lcaCertifiedDate,
			String soc_code, String job_title, String wageRate, String wageLevel, String prevailingWage,
			String lcaSubDate, Integer lgempno,	String lcapayrateId, String lcacandidateId, String lcaclientId,
			String documenttype, String documentsubtype, String lcaId, Integer lgcandidateid);

	List<DocEmpBean> lcaDetailsByLcaId(String lcaid);

	String checksubdocsbydoclcaid(String lcaid, String docid, String subdocid);

	List<DocEmpBean> getdochistorybyId(String lcaid, String docsubtypeid);

	Integer getlcaIdByCandidateClientId(String candidateid, String clientid);

	String updateLCADocuments(MultipartFile lcaeditFile, Integer loginempno, String candidateid, String documentid,
			String docName, String startdate, String enddate);

	EndClientDetialDto getLcaQuestionnaireBylcaid(String lcaid);

	String updatelcaqetails(String endclient_name, String endclient_id, String end_addressId, String endline1,
			String endline2, String endcity, String endstate, String endzipcode, Integer lgempno,
			String organization_name, String cand_job_title, String education, String remote_county,
			String remote_soc_code, String workinglocation, String remote_addressId, String remote_line1,
			String remote_line2, String remote_city, String remote_state, String remote_zipcode, String remote_merto,
			String reason_lca, String lcaid, String lcastartdate, String lcaenddate, 
			String wageRate, String lcaPostedDate, String metro_politan_area, String wr_option, String u_duties);

	List<LCADetailsDto> getPendingLCAList(String candidateid, String clientid);

	String inactiveRefNo(String lcaid);

	String saveInitiateLCADetails(String endclient_name, String endline1, String endline2, String endcity,
			String endstate, String endzipcode, Integer lgempno, String organization_name, String cand_job_title,
			String education, String remote_county, String remote_soc_code, String workinglocation, String remote_line1,
			String remote_line2, String remote_city, String remote_state, String remote_zipcode, 
			String reason_lca, String init_candidateid, String lcastartdate,
			String lcaenddate, String wageRate, String init_lcaPostedDate, String init_metro_politan_area, String wr_option);

	String updateInitiateLCADetails(String endclient_name, String endclient_id, String end_addressId, String endline1,
			String endline2, String endcity, String endstate, String endzipcode, String end_metro_politan_area,
			Integer lgempno, String organization_name, String cand_job_title, String education, String remote_county,
			String remote_soc_code, String workinglocation, String remote_addressId, String remote_line1,
			String remote_line2, String remote_city, String remote_state, String remote_zipcode,
			String remote_metro_politan_area, String reason_lca, String lcastartdate, String lcaenddate,
			String wageRate, String init_lcaPostedDate, String wr_option, String init_duties);

	String deleteRefNo(String lcaid);

	Integer saveImmiCandidate(String fname, String ssn, String phne_no, String emailid, Integer lgempno, String lname, String uname);

	List<TempCandidateDetailsDTO> getImmiCandidateList();

	String updateImmiCandidate(String candidateId, String fname, String lname, String phne_no, String emailid,
			Integer lgempno, String uname);

	String onboardcandidate(String candidateId, String employee_type, String work_auth);

	List<ImmiDocumentTypeEntity> getDocumentTypeList();

	List<DocumentTypeDto> getDocumentsList();

	String updatedoctype(String docname, String docid);

	String checkDocumentType(String docname);

	String savedoctype(String docname, Integer lgempno);

	String checkDocumentSubType(String docname);

	String updateSubdocType(String usubdocname, String doctypeid, String usubdocid, String issubbycand);

	String savesubdoctype(String doctypeid, String subdocname, Integer lgempno, 
			String issubbycand, String sameas_doctype);

	LCADetailsEntity getLcaDetailsById(String lcaid);

	String getSubDocDetailsByName(String string, String lcaid, int candidate_id);

	Integer getDocumentCountByLcaId(String lcaid);

	String addh1task(String taskname, String duedate, String description, Integer empno, String candidateid);

	DocumentTypeDto immicheckDocumentTypeIssame(String docTypeid);

	LCADetailsDto getTopLcaByCandidateId(Integer candidateid);

	List<LCADetailsDto> getActiveInactiveLCAList(String candidateid, String clientid);

	void saveCompanyAddress(Integer endclientId, String companytype, Integer lgempno, String othr_line1,
			String othr_line2, String othr_city, String othr_state, String othr_zipcode, String othr_metro);

	String updateCompanyAddress(Integer lcaaddr_id, Integer loginempno, String lca_line1, String lca_line2,
			String lca_city, String lca_state, String lca_zipcode, String lca_othermetro);
	
}
