package com.tekskills.Dao;

import java.util.List;

import com.tekskills.Dto.BasicDetailsDto;
import com.tekskills.Dto.ClientVendorMaster_DTO;
import com.tekskills.Dto.DocEmpBean;
import com.tekskills.Dto.DocumentTypeDto;
import com.tekskills.Dto.LCADetailsDto;
import com.tekskills.Dto.TaskDetailsDto;
import com.tekskills.Dto.TempCandidateDetailsDTO;
import com.tekskills.Entity.ClientDetailsEntity;
import com.tekskills.Entity.CompanyAdressEntity;
import com.tekskills.Entity.ImmiDocumentSubTypeEntity;
import com.tekskills.Entity.ImmiDocumentTypeEntity;
import com.tekskills.Entity.LCADetailsEntity;
import com.tekskills.Entity.TaskDetailsEntity;

public interface ImmigrationDao {

	List<BasicDetailsDto> getW2CandidateList();
	List<BasicDetailsDto> getW2CandidateListrepo();

	List<ClientVendorMaster_DTO> getEndclientListByCandidateId(Integer candidateId);

	ClientDetailsEntity getEndClientDetailsById(Integer candidate_Id, Integer client_id);

	CompanyAdressEntity getEndclientAddressByclientId(Integer client_id);

	CompanyAdressEntity getRemoteAddressByclientId(Integer client_id);

	List<TaskDetailsDto> gettaskdetailsbyids(Integer candidate_Id, Integer client_id, String type);

	TaskDetailsEntity getTaskdetailsById(Integer task_Id);

	void updatetask(TaskDetailsEntity taskObj);

	Integer addtask(TaskDetailsEntity taskObj);

	List<DocEmpBean> getLCAHistory(Integer candidate_Id, Integer client_id);

	ClientDetailsEntity getEndclientByClientId(Integer client_id);

	void saveTaskDetails(TaskDetailsEntity taskObj);
	
	Integer saveLCADetails(LCADetailsEntity lcaObj);

	String checkLCANumber(String lcaNumber);

	LCADetailsDto getLcaTopRecord(Integer candidateid);

	List<LCADetailsDto> getAllLCAList(Integer candidate_Id, Integer clientidId);

	List<DocumentTypeDto> getsubdocsbydoclcaid(Integer lca_id);

	Integer getDocumentCountByLcaId(Integer lca_id);

	List<DocumentTypeDto> getsubdoctypesbydocid(Integer doc_id, Integer docCount);

	LCADetailsEntity getLcaDetailsById(Integer lca_Id);

	void updateLCADetails(LCADetailsEntity lcaObj);

	List<LCADetailsDto> getAllLCAListByClientId(Integer client_id);

	List<DocEmpBean> lcaDetailsByLcaId(Integer lca_id);

	Integer checksubdocsbydoclcaid(Integer lca_id, Integer doc_id, Integer subdoc_id);

	Integer checkDocsExitsorNot(Integer candidate_id);

	//List<DocEmpBean> getDocumentListByCandidateId(Integer candidate_Id, int documenttype_id, Integer client_id);

	List<DocEmpBean> getdochistorybyId(Integer lca_id, Integer docsub_Id);

	Integer getlcaIdByCandidateClientId(Integer candidate_Id, Integer client_id);

	CompanyAdressEntity getCompanyAdressDetailsByAddressId(Integer endaddressId);

	ClientDetailsEntity getClientDetailsByClientId(Integer endclientId);

	List<DocumentTypeDto> getsubdoctypesbylcaid(Integer lca_id);

	void inactiveRefNo(LCADetailsEntity lcaObj);

	void deleteRefNo(Integer lca_id);

	List<TempCandidateDetailsDTO> getImmiCandidateList();

	ImmiDocumentTypeEntity getDocumentTypeById(Integer doc_id);

	void updateDocumentType(ImmiDocumentTypeEntity docObj);

	String checkDocumentType(String docname);

	List<ImmiDocumentTypeEntity> getDocumentTypeList();

	Integer savedocumentType(ImmiDocumentTypeEntity docObj);

	List<DocumentTypeDto> getDocumentsList();

	String checkDocumentSubType(String docname);

	ImmiDocumentSubTypeEntity getDocumentSubTypeById(Integer subdocTpyeId);

	void updateSubDocumentType(ImmiDocumentSubTypeEntity docObj);

	Integer savedocumentSubType(ImmiDocumentSubTypeEntity docObj);

	Integer getSubDocIdByName(String string);

	String getcertifiedfileByIds(Integer lca_Id, int candidate_id, Integer subdocid);

	Integer immicheckDocumentTypeIssame(Integer docType_id);

	Integer immicheckDocumentTypeSubocTypeCount(Integer docType_id);

	List<LCADetailsDto> getActiveInactiveLCAList(Integer candidate_Id, Integer clientidId);

	List<CompanyAdressEntity> getlcaLocationListByclientId(int client_id);


}
