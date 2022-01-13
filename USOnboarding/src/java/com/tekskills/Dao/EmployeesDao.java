package com.tekskills.Dao;

import java.util.List;

import com.tekskills.Dto.BasicDetailsDto;
import com.tekskills.Dto.CandidateDocDto;
import com.tekskills.Dto.ClientVendorMaster_DTO;
import com.tekskills.Dto.CompanyDetails_DTO;
import com.tekskills.Dto.CustomerDetails_DTO;
import com.tekskills.Dto.CustomerDto;
import com.tekskills.Dto.DocEmpBean;
import com.tekskills.Dto.DocumentHistoryDto;
import com.tekskills.Dto.EmployeeDto;
import com.tekskills.Dto.ManagerDto;
import com.tekskills.Dto.MyDashboardDto;
import com.tekskills.Dto.ProjectDetailsHistoryDto;
import com.tekskills.Dto.SearchBean;
import com.tekskills.Dto.VendorDto;
import com.tekskills.Entity.BankDetailsEntity;
import com.tekskills.Entity.BankPaymentDetailsEntity;
import com.tekskills.Entity.CandidateAddress;
import com.tekskills.Entity.CandidateDetailedInfo;
import com.tekskills.Entity.ClientDetailsEntity;
import com.tekskills.Entity.ClientDetailsHistoryEntity;
import com.tekskills.Entity.CompanyAdressEntity;
import com.tekskills.Entity.CustomerMasterEntity;
import com.tekskills.Entity.DepartmentsEntity;
import com.tekskills.Entity.EmpBasicDetailsEntity;
import com.tekskills.Entity.EmpDocumentsEntity;
import com.tekskills.Entity.EmpDocumentsHistoryEntity;
import com.tekskills.Entity.EmpExitDetailsEntity;
import com.tekskills.Entity.EmpJoinHistorty;
import com.tekskills.Entity.EmpPayRateDetails;
import com.tekskills.Entity.EmpPayRateDetailsHistory;
import com.tekskills.Entity.EmpRoles;
import com.tekskills.Entity.EmpTypeMaster;
import com.tekskills.Entity.PageStatusEntity;
import com.tekskills.Entity.ProductsEntity;
import com.tekskills.Entity.ProjectDetailsHistory;
import com.tekskills.Entity.VendorMasterEntity;
import com.tekskills.Entity.WorkAuthorization;

public interface EmployeesDao {

	EmpBasicDetailsEntity checkLogin(String userName, String password);

	Integer saveBasicDetails(EmpBasicDetailsEntity basicObj);

	Integer getEmployeeNo();

	boolean checkEmpExists(int emp_number);

	EmpBasicDetailsEntity checkUserName(String uname);

	void updateFlag(EmpBasicDetailsEntity basicObj);

	EmpBasicDetailsEntity getEmployeeDetailsByCandidateId(Integer userid);

	List<WorkAuthorization> getWorkAuthnList();

	List<EmpTypeMaster> getEmployeeTypeList();

	List<DepartmentsEntity> getdepartmentList();

	List<EmpRoles> getroleList();

	List<ManagerDto> getHRList();

	List<ManagerDto> getrepMagrList();

	EmpBasicDetailsEntity SSNExistOrNot(String ssn_emp);

	List<SearchBean> empsearchbySSN(String ssn_emp);

	List<ManagerDto> getContractTeamList();

	Integer saveVendorMaster(VendorMasterEntity venObj);

	String checkSelectedFileName(String filename);

	void saveDocuments(EmpDocumentsEntity vendocobj);

	Integer saveCustomerMaster(CustomerMasterEntity custObj);

	List<CompanyDetails_DTO> getCustomerMasterList();

	List<CompanyDetails_DTO> getVendorMasterList();

	CustomerMasterEntity getCustomerDetailsById(Integer customerId);

	CustomerDetails_DTO getCustomerDocsById(Integer customerId);

	VendorMasterEntity getVendorDetailsById(Integer vendorId);

	List<DocEmpBean> getVendorDocsById(Integer vendorId);

	Integer saveClientDetails(ClientDetailsEntity clientObj);

	Integer savePayRateBillRateDetails(EmpPayRateDetails payrateObj);

	List<DocEmpBean> viewEmpcustdocumentsByCandidateId(Integer userId, String emptype, String payrate_id);

	List<DocEmpBean> viewEmpvendocumentsByCandidateId(Integer userId, String emptype, String payrate_id);

	List<DocEmpBean> viewEmpvdocumentsByCandidateId(Integer userId, String emptype, String payrate_id, Integer vendorId);

	List<DocEmpBean> viewEmpcdocumentsByCandidateId(Integer userId, String emptype, String payrate_id);

	List<ClientVendorMaster_DTO> viewClientDetailsByCandidateId(Integer userId, Integer payrateId, String emptyp);

	List<ClientVendorMaster_DTO> viewCustomerDetailsByCandidateId(Integer userId, String payrateId, String emptyp);

	List<ClientVendorMaster_DTO> viewVendorDetailsByCandidateId(Integer userId, Integer payrateid);

	List<ClientVendorMaster_DTO> viewEndclientByCandidateId(Integer userId, String emptyp);
	
	PageStatusEntity getRedirectPageStatus(Integer userid);

	void savePageStatus(PageStatusEntity pagestsObj);

	Integer saveEmpbankDetails(BankDetailsEntity bankDtlObj);

	Integer saveExitDetails(EmpExitDetailsEntity exitObj);

	List<ManagerDto> getEmpInfoByEmpType(String sEmp_type);

	List<SearchBean> getemplistBySearch(String username, String fullname, String emptype, String pendingdocs, String sEmp_type, String sempstatus);

	BasicDetailsDto viewEmployeeInfo(Integer candidateId);

	void updateBasicDetails(EmpBasicDetailsEntity basicObj);

	EmpExitDetailsEntity ViewExitDetails(Integer candidate_Id);

	EmpExitDetailsEntity getExitEmployeeByCandidateId(Integer userId);

	void updateExitDetails(EmpExitDetailsEntity exitObj);

	void updateEmpBankDetails(BankDetailsEntity updateBankObj);

	List<BankDetailsEntity> viewEmpBankDetails(Integer userId);

	List<EmpDocumentsEntity> getEmpDocDetailsByCandidateId(Integer userId);

	EmpDocumentsEntity getEmpDocsByCandidateIdFileType(String filetype, Integer userId);

	void updatePageStatus(PageStatusEntity pagestsObj);

	BankDetailsEntity getEmpBankDetailsByBankId(Integer tblpk1);

	List<EmpDocumentsEntity> getEmpDocumentsListByCandidateId(Integer userId);

	List<DocEmpBean> viewDocumentsByCandidateId(Integer userId);

	EmpDocumentsEntity getDocumentByDocId(Integer docId);

	void updateDocument(EmpDocumentsEntity docobj);

	String deleteDocumentByDocId(Integer docId);

	ClientDetailsEntity getClientDetailsById(Integer client_id, String emptype);

	void updateClientDetails(ClientDetailsEntity clientObj);

	EmpPayRateDetails getPayRateDetailsById(Integer payRateId, String emptype);

	void updatePayRateDetails(EmpPayRateDetails payrateObj);

	BasicDetailsDto viewConsultantInfo(Integer candidateId);

	Integer saveConsultantDocs(EmpDocumentsEntity pdocobj);

	List<EmpJoinHistorty> getEmployeeHistoryByCandidateId(Integer userId);

	void saveRejoinDetails(EmpJoinHistorty addhistory);

	List<ClientDetailsEntity> getClientDetailsByCandidateId(Integer userId);

	Integer saveConsultantBankDetails(BankPaymentDetailsEntity bankDtlObj);

    List<BankPaymentDetailsEntity> viewConsultantBankDetails(Integer userId);

    BankPaymentDetailsEntity getConsultantBankDetailsById(int tblpk);

    void updateConsultantBankDetails(BankPaymentDetailsEntity updateBankObj);

	CandidateDetailedInfo getCandidateDetailedInfoById(int candidate_id);

	void saveCandidateAddressDetails(CandidateAddress candAddressObj);

	void saveCandidateDetailedInfo(CandidateDetailedInfo candDetailObj);

	CandidateAddress getCandidateAddressByCandidateId(Integer candidateId);

	void updateCandidateDetailedInfo(CandidateDetailedInfo candidateInfoDBObj);

	void updateCandidateAddressInfo(CandidateAddress candidateAddrDBObj);

	List<WorkAuthorization> getWorkAuthnListForContractors();

	void saveCompanyAddressDetails(CompanyAdressEntity custAddressObj);

	EmployeeDto getCanidateDetailsByCanId(Integer candidateId);

	CompanyAdressEntity getCompanyAdressDetailsById(Integer customerId, String companyType);

	void updateCompanyAddressInfo(CompanyAdressEntity clientAddressObjDB);

	void saveJoinHistory(EmpJoinHistorty joinHistoryObj);

	EmpJoinHistorty getJoinHistoryByCandidateId(Integer history_id);

	void updateJoinHistory(EmpJoinHistorty joinHistoryObj);

	Integer getJoinHistoryId(Integer candidateId);

	String checkPassword(String userName, String bytesCurrepwd);

	String changePassword(String userName, String bytesEncodepwd);

	ClientVendorMaster_DTO viewEndClientDetailsByCandidateId(Integer candidate_Id, String emptyp, Integer payrate_Id);

	EmpBasicDetailsEntity getEmployeeStatusDetailsByCandidateId(Integer candidate_Id);

	String getempTypeByCanId(int id);

	BasicDetailsDto checkPhoneNo(String phoneno);

	String checkEmail(String email);

	void updateClientHistoryDetails(ClientDetailsHistoryEntity clientHistoyObj);

	void savePayRateHistoryDetails(EmpPayRateDetailsHistory payratehistoryObj);

	EmpPayRateDetails getPayrateDetailsByPayrateId(Integer payrateid);

	List<DocumentHistoryDto> getCustomerDocumentHistiryByCustomerId(Integer cust_Id);

	void updateCustomerMaster(CustomerMasterEntity custDBObj);

	void updateVendorMaster(VendorMasterEntity vendDBObj);

	List<DocumentHistoryDto> getVendorDocumentHistiryById(Integer venId, String fileType, String inputVal);

	ClientVendorMaster_DTO getCustomerEndclientByPayrateId(Integer payrateId);

	EmpPayRateDetails payrateDetailsByCandidateId(Integer candidate_Id);

	List<ClientVendorMaster_DTO> getCustomerMasterListByCanidateId(Integer candidateid);

	ClientVendorMaster_DTO getCustomerMasterByCanidateId(Integer candidateid);

	EmpPayRateDetails getActivePayrateDetailsByPayrateId(Integer payrateid);
	
	List<DocumentHistoryDto> getClientCustomerDocumentHistiryById(Integer cust_Id, Integer candidate_Id);

	List<DocumentHistoryDto> getClientVendorDocumentHistiryById(Integer ven_Id, Integer candidate_Id, String fileType);

	List<DocumentHistoryDto> getConsultantDocumentHistiryById(Integer candidate_Id, String fileType, String inputVal);

	Integer getVendorIdByPayrateId(Integer candidate_Id, Integer payrateid);

	List<DocEmpBean> viewEmpcustdocumentsByCandidateId(Integer candidate_Id, String emptype, Integer payrateid);

	List<DocEmpBean> viewEmpvendocumentsByCandidateId(Integer candidate_Id, String emptype, Integer payrateid);

	List<String> geti9SupportDocumentsListByType(String i9sdType);

	List<String> geti9SupportDocumentsListByCandidateIdType(Integer candidate_Id, String i9sdType);

	List<MyDashboardDto> getmyDashboardDocList();

	List<CustomerDto> getmyDashboardCustDocList();

	List<VendorDto> getmyDashboardVendDocList();

	List<CandidateDocDto> getmyDashboardCandidateEmployeeDocList();

	List<CandidateDocDto> getmyDashboardCandidateContractorDocList();

	List<ProjectDetailsHistoryDto> getPayrateHistoryDetailsByPayrateId(Integer payrateId);

	void saveProjectDetailsHistory(ProjectDetailsHistory projectHistoryObj);

	List<CustomerDto> getmyDashboardPrevCustDocList();

	List<VendorDto> getmyDashboardPrevVendDocList();

	List<CandidateDocDto> getmyDashboardPrevCandidateContractorDocList();

	List<CandidateDocDto> getmyDashboardPrevCandidateEmployeeDocList();

	String checkSelectedFileInput(String docInput);

	BasicDetailsDto viewEmployeeNotWithAddress(Integer candidateId);

	void saveDocumentsHistory(EmpDocumentsHistoryEntity formupdate);

	List<ClientVendorMaster_DTO> viewOtherLocationDetailsByCandidateId(Integer candidate_Id, Integer payrate_id,
			String emptyp);

	List<DocumentHistoryDto> getDocTypesByCandId(Integer candidate_Id);


	List<Integer> getchecklistIds(Integer candidate_Id,  Integer subdocId, Integer docId, Integer initiateid);

	List<DocumentHistoryDto> getFilesBychklistid(List<Integer> list);

	List<DocumentHistoryDto> getsubDocTypesBydocId(Integer candidate_Id, Integer profileid);

	ClientDetailsEntity getclientDetailsBypayrateId(Integer payrate_id);

	ClientVendorMaster_DTO getInhouseprojectdetailsbyIds(String payrate_id, Integer candidate_Id);

	List<DocumentHistoryDto> getuserNameBycandId(Integer candidate_Id);

	Integer getactiveclientListByCandidate(Integer candidate_Id, String clienttype);

	List<String> getFiles(Integer candidate_Id, Integer docId, Integer subdocId, Integer initiateid, List<Integer> list);


	Integer getCurrinitiateidBycandId(Integer candidate_Id);

	List<DocumentHistoryDto> getDocumentHistiryById(Integer doc_Id);

	ClientVendorMaster_DTO getPayRateDetailsByCandidateId(Integer candidate_id, Integer payrateid);

	CustomerMasterEntity getCustomerDetailsByName(String customer_name);

	Integer saveProductServices(ProductsEntity psObj);

	ProductsEntity getProductServicesById(Integer product_Id);

	void updateProductServices(ProductsEntity prodDBObj);

	ProductsEntity getProductServicesByPayRateId(Integer payrateId);

	ProductsEntity getProductServicesByPayrateId(Integer payrateId);

	ProductsEntity getProductServicesByQbId(Integer product_id);

	EmpBasicDetailsEntity getEmployeeDetailsByMailnDoB(String dobDate, String mail);

}
