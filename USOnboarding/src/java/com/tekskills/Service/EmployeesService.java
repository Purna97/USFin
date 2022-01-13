package com.tekskills.Service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.tekskills.Dto.AttachmentBean;
import com.tekskills.Dto.BasicDetailsDto;
import com.tekskills.Dto.DocumentHistoryDto;
import com.tekskills.Dto.EmployeeDto;
import com.tekskills.Dto.I9SupportingDocumentsDto;
import com.tekskills.Dto.ManagerDto;
import com.tekskills.Dto.MyDashboardDto;
import com.tekskills.Dto.SearchBean;
import com.tekskills.Entity.BankDetailsEntity;
import com.tekskills.Entity.CandidateDetailedInfo;
import com.tekskills.Entity.DepartmentsEntity;
import com.tekskills.Entity.EmpBasicDetailsEntity;
import com.tekskills.Entity.EmpDocumentsEntity;
import com.tekskills.Entity.EmpExitDetailsEntity;
import com.tekskills.Entity.EmpJoinHistorty;
import com.tekskills.Entity.EmpRoles;
import com.tekskills.Entity.EmpTypeMaster;
import com.tekskills.Entity.PageStatusEntity;
import com.tekskills.Entity.WorkAuthorization;

public interface EmployeesService {

	EmpBasicDetailsEntity checkLogin(String userName, String password);

	Integer saveBasicDetails(String ssn_emp, String firstName, String employee_type, int w2department, String rec_name,
			String hr_name, String email_id, String phne_no1, String dob, String joining_Date, String designation,
			String billingType, String line1, int roleId, int mgr_empid, String autouname, int postedempno,
			String middleName, String familyName, String line2, String zipcode, String city, String state, String bgc,
			String work_auth, String phne_no2, String phne_no3, String ctype2, String ctype3, String validateby, String payrolltype);

	String checkUserName(String fullname, String middleName, String familyName);

	EmpBasicDetailsEntity getEmployeeDetailsByCandidateId(Integer userid);

	List<WorkAuthorization> getWorkAuthnList();

	List<EmpTypeMaster> getEmployeeTypeList();

	List<DepartmentsEntity> getdepartmentList();

	List<EmpRoles> getroleList();

	List<ManagerDto> getHRList();

	List<ManagerDto> getrepMagrList();

	EmpBasicDetailsEntity SSNExistOrNot(String ssn_emp);

	List<SearchBean> empsearchbySSN(String ssn_emp);
	
	String checkSelectedFileName(String filename);

	PageStatusEntity getRedirectPageStatus(Integer userid);

	String saveEmpbankDetails(String accountNo, String bankname, String swiftcode, String ibancode, String routingno, MultipartFile file1, Integer userid, Integer lgempno);

	String saveExitDetails(EmpExitDetailsEntity exitObj, Integer empno);

	List<ManagerDto> getEmpInfoByEmpType(String sEmp_type);

	List<SearchBean> getemplistBySearch(String username, String fullname, String emptype, String pendingdocs, String sEmp_type, String sempstatus);

	BasicDetailsDto viewEmployeeInfo(String candidate_id);

	String updateBasicDetails(String ssn_emp, String firstName, String employee_type, int w2department1,
			String rec_name, String hr_name, String email_id, String phne_no, String dob, String joining_Date,
			String designation, String billingType, String emp_address, int role, int mgr_empid, String autouname,
			Integer loginUserid, String middleName, String familyName, String street, String zipcode, String city,
			String state, String bgc, String work_auth, Integer candidateId, String phne_no2, String phne_no3, String ctype2,
			String ctype3, String validateby, String payrolltype);

	EmpExitDetailsEntity ViewExitDetails(String userid);

	String updateExitDetails(String userid, String lwd, String terminationdate, String exitreason, String comments, Integer lgempno);

	List<BankDetailsEntity> viewEmpBankDetails(String userid);

	//String updateEmpBankDetails(String[] accountNo, String[] bankname, String[] swiftcode, String[] ibancode, String[] routingno, MultipartFile[] file1, String[] bankamount, String[] bankBtnVal, String userid, String[] tblpk, MultipartFile[] ofile);

	String saveEmployeeDocuments(String userid, MultipartFile offerletter, MultipartFile agreement,
			MultipartFile i9_form, MultipartFile w4_form, Integer lgempno);

	String saveEmployeeAddtionalDocuments(MultipartFile i9formFile, String filetype, String i9frominput, String userid,
			Integer lgempno);

	String updateEmpBankDetails(String[] accountNo, String[] bankname, String[] swiftcode, String[] ibancode,
			String[] routingno, CommonsMultipartFile[] file1, String userId, String[] tblpk1,
			Integer lgempno);

	List<EmpDocumentsEntity> getEmployeeDocumentsByCandidateId(String userid);

	AttachmentBean getFilesByCandidateId(String userid);

	void updatePageStatus(String userid);

	String updateDocumentById(MultipartFile editFile, String fileId, String userid, Integer loginempno);

	String deleteDocumentByDocId(String fileId);

	List<EmpJoinHistorty> getEmployeeHistoryByCandidateId(String userid);

	String saveRejoinDetails(String userid, String rjdate, Integer loginempno);

	CandidateDetailedInfo getCandidateDetailedInfoById(int candidate_id);

	EmployeeDto getCanidateDetailsByCanId(Integer candidateId);

	String checkPassword(String userName, String currentPassword);

	String changePassword(String userName, String confirmPassword);

	String getempTypeByCanId(String canid);

	BasicDetailsDto checkPhoneNo(String phoneno);

	String checkEmail(String email);

	String saveEmployeeI9Documents(MultipartFile listAFile, String filetype, String listASelectionInput,
			String candidate_id, Integer lgempno, String fromdate, String expirydate);

	I9SupportingDocumentsDto geti9SupportDocumentsListByType(String i9sdType, String candidateId);

	String updateListADocument(MultipartFile editFile, String waefileId, String fromdate, String expiry_date,
			String waCandidateId, Integer loginempno, String efileType, String waeInputVal);

	String updateEmployeeDocuments(MultipartFile editFile, String waefileId, String waCandidateId, Integer loginempno,
			String efileType, String waeInputVal);

	MyDashboardDto getmyDashboardDocList();

	MyDashboardDto getExpiredDocumentsList();
	

	List<DocumentHistoryDto> getDocTypesByCandId(String candId);

	List<DocumentHistoryDto> getalldocs(String candId,  String subdocid, String docid);

	List<DocumentHistoryDto> getsubDocTypesBydocId(String candId,String docid);

	List<DocumentHistoryDto> getuserNameBycandId(String candId);

	List<String> getdocs(String candId, String subdocname, String subdocid, String docid);

	
}
