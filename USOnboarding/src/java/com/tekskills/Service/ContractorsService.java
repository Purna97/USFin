package com.tekskills.Service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.tekskills.Dto.AttachmentBean;
import com.tekskills.Dto.BasicDetailsDto;
import com.tekskills.Dto.ClientVendorMaster_DTO;
import com.tekskills.Dto.CommonDetailDto;
import com.tekskills.Dto.CompanyDetails_DTO;
import com.tekskills.Dto.CustomerDetails_DTO;
import com.tekskills.Dto.DocumentHistoryDto;
import com.tekskills.Dto.EmployeeDto;
import com.tekskills.Dto.I9SupportingDocumentsDto;
import com.tekskills.Dto.ManagerDto;
import com.tekskills.Dto.ProjectDetailsHistoryDto;
import com.tekskills.Dto.VendorDetails_DTO;
import com.tekskills.Dto.ViewDocBean;
import com.tekskills.Dto.viewDocsBean;
import com.tekskills.Entity.BankPaymentDetailsEntity;
import com.tekskills.Entity.CustomerMasterEntity;
import com.tekskills.Entity.EmpBasicDetailsEntity;
import com.tekskills.Entity.EmpPayRateDetails;
import com.tekskills.Entity.EmpPayRateDetailsHistory;
import com.tekskills.Entity.I9SupportingDocumentsEntity;
import com.tekskills.Entity.PageStatusEntity;
import com.tekskills.Entity.ProductsEntity;
import com.tekskills.Entity.VendorMasterEntity;
import com.tekskills.Entity.WorkAuthorization;

public interface ContractorsService {
	
	EmpBasicDetailsEntity SSNExistOrNot(String ssn_emp);
	
	EmpBasicDetailsEntity getEmployeeDetailsByCandidateId(Integer candidate_id);

	List<WorkAuthorization> getWorkAuthnList();

	List<ManagerDto> getContractTeamList();

	Integer saveContrators(Integer loginempno, CommonDetailDto contractors, String autouname);

	String checkSelectedFileName(String filename);

	Integer saveVendorMaster(String vendorname, String vendorAddress, String v_contactperson, String v_mgr_email,
			String chkVal, MultipartFile venMSA, String executed_irs_w9_form, MultipartFile irsw9form,
			MultipartFile insucerti, String insurance_certificate, MultipartFile certicorp,
			String certificate_incorporation, MultipartFile stdcert, String standing_certificate, String mailprooftype,
			MultipartFile mailproofVendor, Integer empno, String msa_fromdate, String msa_expiry_date,
			String irs_fromdate, String irs_expirydate, String ic_fromdate, String ic_expirydate, String gsc_fromdate, String gsc_expirydate);

	Integer saveCustomerMaster(String custname, String fed_id, String cust_contactperson, String cust_mgr_email,
			MultipartFile customerMSA, String cust_msa, String mailtype, MultipartFile mailproofCustomer, 
			Integer loginempno, String fromdate, String expiry_date, String payment_terms);

	List<CompanyDetails_DTO> getCustomerMasterList();

	List<CompanyDetails_DTO> getVendorMasterList();

	CustomerDetails_DTO getCustomerDetailsById(String custid);

	VendorDetails_DTO getVendorDetailsById(String venid);

	Integer saveClientDetails(String client_name, String fed_id, String client_mgr, String client_mgr_email,
			String client_mgr_extn, String client_emp_email, String client_emp_extn, Integer candidate_id, 
			Integer loginempno, String project_name, String client_type, Integer payrateId,String organization_name,
			String cand_job_title, String education, String workinglocation, String county, String soc_code,
			String reason_lca, String lcastartdate, String lcaenddate, String wageRate, 
			String metro_politan_area, String lcaPostedDate, String wr_option, String job_duties);

	Integer savePayRateBillRateDetails(String bill_rate, String pay_rate, String invoice_terms, String proj_startDate,
			String proj_endDate, String p_term, Integer customer_id, Integer vendorId, Integer candidate_id, String bcurrency,
			String pcurrency, MultipartFile cworder, String c_work_order, MultipartFile vworder, String v_work_order,
			MultipartFile cagreement, String cC_Agreement, MultipartFile cCompliance, String c_Compliance,
			MultipartFile mailproofCustomer, String mailproofCust, MultipartFile mailproofVendor, String mailproofVen,
			String emptype, Integer loginempno, String payrolltype, String cwofromdate, String cwoexpirydate, 
			String vwofromdate, String vwoexpirydate, String ccfromdate, String ccexpirydate, String invoice_period);

	List<ClientVendorMaster_DTO> viewClientDetailsByCandidateId(String candidate_id, String payrate_id);

	List<ClientVendorMaster_DTO> viewCustomerDetailsByCandidateId(String candidate_id, String payrate_id);

	List<ClientVendorMaster_DTO> viewVendorDetailsByCandidateId(String candidate_id, String payrate_id);

	List<ClientVendorMaster_DTO> viewEndclientByCandidateId(String candidate_id);

	viewDocsBean viewClientVendorDocsByCandidateId(String candidate_id, String payrate_id);
	
	PageStatusEntity getRedirectPageStatus(Integer candidate_id);

	String updateClientDetails(String client_name , String client_mgr, String client_mgr_email,
			String client_mgr_extn, String client_emp_email, String client_emp_extn, Integer client_id, String candidate_id, 
			String line1, String line2, String city, String state, String zipcode, String companytype,
			Integer loginempno, String fed_id, String project_name, Integer payRate_Id,
			String organization_name,String cand_job_title, String education, String remote_county,String remote_soc_code,
			String workinglocation, String remote_line1, String remote_line2, String remote_city, String remote_state, 
			String remote_zipcode, String work_authorization, String reason_lca, String metro_politan_area);

	String updatepayratedetails(String billrate, String pay_rate, String invoice_terms, String proj_startDate,
			String proj_endDate, String p_term, Integer customer_Id, Integer vendorId, Integer candidate_id, Integer payRateId,
			Integer loginempno, String payrolltype, String invoice_period);

	BasicDetailsDto viewConsultantInfo(String candidate_id);

	String updateConsultantsBasicInfo(String ssn_no, String firstName, String recrutier_name, String cont_team_name,
			String email_id, String phne_no, String dob, String joining_Date, String designation, String middleName,
			String familyName, Integer candidateId, String bgcType, String c2cType, String work_auth, Integer loginempno,
			String phne_no2, String phne_no3, String ctype2, String ctype3, String validateby, String payrolltype);

	String saveConsultantDocs1099(MultipartFile wA_copy, MultipartFile w9_copy, MultipartFile sSNCopy, MultipartFile mgr_mail_proofDoc, String candidate_id,
			Integer loginempno, String wafromdate, String waexpirydate);

	AttachmentBean getFilesByCandidateId(String candidate_id);

	String saveConsultantDocs(CommonsMultipartFile[] othr_1099_file, String filetype, String[] other_1099_doc,
			String candidate_id, Integer loginempno);

	void updatePageStatus(String candidate_id);

	ViewDocBean getConsultantDocsByCandidateId(String candidate_id, String empType);

	String updateDocumentById(MultipartFile editFile, String fileId, String candidate_id, Integer loginempno, String fileType);

	String saveConsultantDoc(MultipartFile addFile, String filetype, String candidate_id, Integer loginempno);

	String saveConsultantBankDetails(String accountNo, String bankname, String swiftcode, String ibancode,
			String routingno, MultipartFile file1, String candidate_id, Integer loginempno, String paymentMode,
			String vendor);

	List<BankPaymentDetailsEntity> viewConsultantBankDetails(String candidate_id);

	String updateConsultantBankDetailsC2C(String accountNo, String bankname, String swiftcode, String ibancode,
			String routingno, MultipartFile bfile1, String candidate_id, Integer loginempno, String paymentMode,
			String vendor, String payment_id);

	String updateConsultantBankDetails(String[] accountNo, String[] bankname, String[] swiftcode, String[] ibancode,
			String[] routingno, CommonsMultipartFile[] bfile2, String candidate_id, String[] tblpk1, Integer loginempno);

	List<WorkAuthorization> getWorkAuthnListForContractors();

	void saveCompanyAddress(Integer customer_id, String companytype, Integer loginempno, String line1, String line2, 
			String city, String state, String zipcode, String country);

	void saveClientVendorDocs(MultipartFile cCompliance, String cC_Agreement, String candidate_id, Integer loginempno,
			Integer customer_Id, Integer vendorId);

	String deleteConsultantDocumentByDocId(String fileId);

	EmployeeDto getCanidateDetailsByCanId(String candidate_id);

	ClientVendorMaster_DTO viewEndClientDetailsByCandidateId(String candidate_id, String payrate_id);

	

	String updateProjectStatus(String candidate_id, String empType, String payrate_id, String project_status);

	EmpPayRateDetails getPayrateDetailsByPayrateId(String payrate_id, String candidate_id);

	String updateCustomerDocumentById(MultipartFile editFile, String fileId, String fromdate, String expiry_date,
			String custid, Integer loginempno);

	/*String updateCustomerMaster(String custname, String fed_id, String cust_contactperson, String cust_mgr_email,
			MultipartFile customerMSA, String cust_msa, String mailtype, MultipartFile mailproofCustomer,
			Integer loginempno, String customerid, String address_id, String fileId, String line1, String line2,
			String city, String state, String zipcode, String fromdate, String expiry_date);*/

	String updateVendorMaster(String vendorname, String fed_id, String v_contactperson, String v_mgr_email,
			String mailprooftype, MultipartFile mailproofVendor, Integer loginempno, String vendorid, String address_id,
			String fileId, String line1, String line2, String city, String state, String zipcode);

	List<DocumentHistoryDto> getCustomerDocumentHistiryByCustomerId(String docid);

	String updateCustomerMaster(String custname, String fed_id, String cust_contactperson, String cust_mgr_email,
			MultipartFile customerMSA, String cust_msa, String mailtype, MultipartFile mailproofCustomer,
			Integer loginempno, String customerid, String address_id, String fileId,
			String line1, String line2, String city, String state, String zipcode,
			String fromdate, String expiry_date, String payment_term_id);

	String updateVendorDocumentById(MultipartFile editFile, String fileId, String fromdate, String expiry_date,
			String vendId, Integer loginempno, String efileType, String efileInputVal);

	List<DocumentHistoryDto> getVendorDocumentHistiryById(String docid, String fileType, String inputVal);

	String saveVendorDocument(MultipartFile editFile, String fromdate, String expiry_date, String vendId,
			Integer loginempno, String efileType, String efileInputVal);

	List<ClientVendorMaster_DTO> getCustomerMasterListByCanidateId(Integer candidateid);

	ClientVendorMaster_DTO getCustomerMasterByCanidateId(Integer candidateid);

	String updateMailProofVendorDocumentById(MultipartFile editFile, String fileId, String vendId, Integer loginempno,
			String efileType);

	String saveMailProofVendorDocument(MultipartFile editFile, String vendId, Integer loginempno, String efileType);

	String updateMailProofCustomerDocumentById(MultipartFile editFile, String fileId, String custid,
			String msgefileType, Integer loginempno);

	EmpPayRateDetails getActivePayrateDetailsByPayrateId(String payrateid, String candidate_id);
	
	String updateClientVendorDocumentById(MultipartFile editFile, String fileId, String fromdate, String expiry_date,
			String vendId, Integer loginempno, String efileType, String custmid, String ceCandidateId);

	String updateVendorCCADocumentById(MultipartFile editFile, String fileId, String vendId, String efileType,
			Integer loginempno, String ceCandidateId);

	String updateClientCustomerDocumentById(MultipartFile editFile, String fileId, String msgcustmid, String efileType,
			Integer loginempno, String ceCandidateId);

	String saveMailProofClientVendorDocument(MultipartFile editFile, String vendId, Integer loginempno,
			String efileType, String ceCandidateId);

	String saveMailProofClientCustomerDocument(MultipartFile editFile, String cmsgacustmid, Integer loginempno,
			String efileType, String ceCandidateId);

	String saveClientVendorDocument(MultipartFile editFile, String fromdate, String expiry_date, String custId,
			Integer loginempno, String efileType, String ceCandidateId);

	List<DocumentHistoryDto> getClientCustomerDocumentHistiryById(String custid, String candidateId);

	String saveClientCustomerDocument(MultipartFile editFile, String fromdate, String expiry_date, String custId,
			Integer loginempno, String efileType, String ceCandidateId);

	List<DocumentHistoryDto> getClientVendorDocumentHistiryById(String vendId, String candidateId, String fileType);

	List<DocumentHistoryDto> getConsultantDocumentHistiryById(String docid, String fileType, String inputVal);

	String updateConsultantWADocument(MultipartFile editFile, String waefileId, String fromdate, String expiry_date,
			String waCandidateId, Integer loginempno, String efileType);

	void saveClientVendorDocs(MultipartFile cCompliance, String cC_Agreement, String candidate_id, Integer loginempno,
			Integer customer_Id, Integer vendorId, String cwofromdate, String cwoexpirydate, Integer vendorIdDb,
			Integer customerIdDb, String emptype, String payRate_Id);

	List<ProjectDetailsHistoryDto> getPayrateHistoryDetailsByPayrateId(String payrate_id);

	String updateOtherClientDetails(String client_name, String client_mgr, String client_mgr_email,
			String client_mgr_extn, String client_emp_email, String client_emp_extn, Integer otherclient_id,
			String candidate_id, String line11, String line21, String city1, String state1, String zipcode1,
			String othrclienttype, Integer loginempno, String fed_id, Integer payRate_Id);

	Integer saveOtherClientDetails(String othr_client_name, String othr_fed_id, String othr_client_mgr,
			String othr_client_mgr_email, String othr_client_mgr_extn, String othr_emp_email_client,
			String othr_emp_client_extn, Integer candidateId, Integer loginempno, String othr_client_type,
			Integer payRate_Id);

	List<ClientVendorMaster_DTO> viewOtherClientDetailsByCandidateId(String candidate_id, String payrate_id);
	String saveupdateinhouseproject(String projectname, String startdate, String enddate, String payrolltype, String line1,
			String line2, String city, String state, String zipcode, Integer lgempno, Integer lgcandidateid,
			String candidateid, String emptype, String payrateid);

	ClientVendorMaster_DTO viewInhouseproject(String candidate_id, String empType, String payrate_id);

	ClientVendorMaster_DTO getclientsizebybillingtype(String candidate_id, String billingtype);

	void updateCustomerMasterQBCustomerId(Integer customer_id, Integer qbcustomerid);

	Integer saveProductServices(String productName, String bill_rate, Integer payrateId, String desc, String qbproductid);

	String updateQBProductId(Integer productId, Integer qbproductid);

	ProductsEntity getProductServicesByPayRateId(String payrate_id);

	String checkCustomerName(String cust_name);

	String checkQbProduct(String productid);

	void saveEndClientDetails(String client_name, Integer candidate_Id, Integer loginempno, String client_type,
			Integer payrateId);

	Integer saveBillRateDetails(String bill_rate, String invoice_terms, String proj_startDate, String proj_endDate,
			Integer customer_Id, Integer candidate_Id, String bcurrency, String invoice_period, String payrolltype, Integer loginempno);

	void saveQBEmpDetailsToUsObt(String firstname, String middlename, String familyname, String hiredate,
			String birthdate, String phone, String mobile, String mail, String line1, String city, String state,
			String zipcode, String qbempId);
	
}
