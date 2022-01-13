package com.tekskills.ServiceImpl;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import javax.mail.MessagingException;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.sun.org.apache.xerces.internal.impl.dv.util.Base64;
import com.tekskills.Dao.EmployeesDao;
import com.tekskills.Dao.ImmigrationDao;
import com.tekskills.Dto.AttachmentBean;
import com.tekskills.Dto.BasicDetailsDto;
import com.tekskills.Dto.ClientVendorMaster_DTO;
import com.tekskills.Dto.CommonDetailDto;
import com.tekskills.Dto.CompanyDetails_DTO;
import com.tekskills.Dto.CustomerDetails_DTO;
import com.tekskills.Dto.DocEmpBean;
import com.tekskills.Dto.DocumentHistoryDto;
import com.tekskills.Dto.EmployeeDto;
import com.tekskills.Dto.FileBean;
import com.tekskills.Dto.LCADetailsDto;
import com.tekskills.Dto.ManagerDto;
import com.tekskills.Dto.ProjectDetailsHistoryDto;
import com.tekskills.Dto.VendorDetails_DTO;
import com.tekskills.Dto.VendorDocumentsDto;
import com.tekskills.Dto.ViewDocBean;
import com.tekskills.Dto.viewDocsBean;
import com.tekskills.Entity.BankPaymentDetailsEntity;
import com.tekskills.Entity.CandidateAddress;
import com.tekskills.Entity.CandidateDetailedInfo;
import com.tekskills.Entity.ClientDetailsEntity;
import com.tekskills.Entity.ClientDetailsHistoryEntity;
import com.tekskills.Entity.CompanyAdressEntity;
import com.tekskills.Entity.CustomerMasterEntity;
import com.tekskills.Entity.EmpBasicDetailsEntity;
import com.tekskills.Entity.EmpDocumentsEntity;
import com.tekskills.Entity.EmpDocumentsHistoryEntity;
import com.tekskills.Entity.EmpJoinHistorty;
import com.tekskills.Entity.EmpPayRateDetails;
import com.tekskills.Entity.EmpPayRateDetailsHistory;
import com.tekskills.Entity.LCADetailsEntity;
import com.tekskills.Entity.PageStatusEntity;
import com.tekskills.Entity.ProductsEntity;
import com.tekskills.Entity.ProjectDetailsHistory;
import com.tekskills.Entity.TaskDetailsEntity;
import com.tekskills.Entity.VendorMasterEntity;
import com.tekskills.Entity.WorkAuthorization;
import com.tekskills.Service.ContractorsService;
import com.tekskills.Util.Commons;
import com.tekskills.Util.SendHtmlEmailNew;


@Service
public class ContractorsServiceImpl implements ContractorsService {
	private static final Logger logger = Logger.getLogger(ContractorsServiceImpl.class);
	@Autowired
	EmployeesDao empDao;
	@Autowired
	ImmigrationDao immiao;
	
	@Autowired
	private SendHtmlEmailNew sendmail;
	@Autowired
	private Commons commonObj;
		
	@Override
	public List<WorkAuthorization> getWorkAuthnList() {
		List<WorkAuthorization> waList = null;
		try {
			waList = empDao.getWorkAuthnList();
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return waList;
	}
	
	@Override
	public EmpBasicDetailsEntity SSNExistOrNot(String ssn_emp) {
		EmpBasicDetailsEntity ssn = null;
		try {
			ssn = empDao.SSNExistOrNot(ssn_emp);
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return ssn;
	}
	
	@Override
	public List<ManagerDto> getContractTeamList() {
		List<ManagerDto> contList = null;
		try {
			contList = empDao.getContractTeamList();
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return contList;
	}
	
	@Override
	public EmpBasicDetailsEntity getEmployeeDetailsByCandidateId(Integer candidate_id) {
		EmpBasicDetailsEntity basicObj = null;
		try {
			basicObj = empDao.getEmployeeDetailsByCandidateId(candidate_id);
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return basicObj;
	}
	
	@Override
	public Integer saveContrators(Integer postedempno, CommonDetailDto commonObj,String autouname) {
			Integer candidateId= 0;
			try {
				Integer emp_number=0;
				System.out.println("In service");
			    EmpBasicDetailsEntity basicObj =commonObj.getEmpbasic() ;
			    CandidateDetailedInfo candDetailObj = commonObj.getCandidateInfo();
				String bytes_ssn_emp = Base64.encode(commonObj.getEmpbasic().getSsn_no().getBytes());
				String password="asdASD123";
			    String bytepwd = Base64.encode(password.getBytes());
				basicObj.setSsn_no(bytes_ssn_emp);
				basicObj.setPwd(bytepwd);
				basicObj.setUserName(autouname);
				basicObj.setStatus(1);
				basicObj.setSubmit_date(new Date());
				basicObj.setPosted_by(postedempno);
				basicObj.setEmp_number(emp_number);
				candidateId = empDao.saveBasicDetails(basicObj);
				
				if(candidateId!=0) {
				PageStatusEntity pagestsObj=new PageStatusEntity();
				pagestsObj.setCandidate_id(candidateId);
				pagestsObj.setPostedBy(postedempno);
				pagestsObj.setBasicinfo_status(1);
				pagestsObj.setDocument_status(0);
				pagestsObj.setClient_status(0);
				pagestsObj.setBank_status(0);
				pagestsObj.setExit_status(0);
				pagestsObj.setBasic_submitdate(new Date());
				empDao.savePageStatus(pagestsObj);
				
				 candDetailObj.setCandidateInfo(basicObj);
				 
				 candDetailObj.setStatus("Active");
				 candDetailObj.setPosted_by(postedempno);
				 candDetailObj.setSubmitted_on(new Date());
				 empDao.saveCandidateDetailedInfo(candDetailObj);
				 
				 if(commonObj.getCandidateInfo().getJoining_date()!=null) {
					 EmpJoinHistorty joinHistoryObj=new EmpJoinHistorty();
					 joinHistoryObj.setJoindate(commonObj.getCandidateInfo().getJoining_date());
					 joinHistoryObj.setEstatus("Joined");
					 joinHistoryObj.setPosted_by(postedempno);
					 joinHistoryObj.setSubmitted_on(new Date());
					 joinHistoryObj.setCandidate_id(candidateId);
					 empDao.saveJoinHistory(joinHistoryObj);
				     }
				}
				//sendmail.sendMail(frommail, toemail, toName, comments, subject);
			} catch (Exception e) {
				logger.info(e.getMessage(),e);
			}
			return candidateId;
	}
	@Override
	public Integer saveVendorMaster(String vendorname, String fed_id, String v_contactperson, String v_mgr_email,
			String ven_msa, MultipartFile venMSA, String executed_irs_w9_form, MultipartFile irsw9form,
			MultipartFile insucerti, String insurance_certificate, MultipartFile certicorp,
			String certificate_incorporation, MultipartFile stdcert, String standing_certificate, String mailprooftype,
			MultipartFile mailproofVendor, Integer empno, String msa_fromdate, String msa_expiry_date,
			String irs_fromdate, String irs_expirydate, String ic_fromdate, String ic_expirydate, String gsc_fromdate, String gsc_expirydate) {
		Integer venId = 0;
		try {
			VendorMasterEntity venObj = new VendorMasterEntity();
			venObj.setVendorname(vendorname);
			venObj.setFed_id(fed_id);
			venObj.setVendor_contact_no(v_contactperson);
			venObj.setVendor_mgr_email(v_mgr_email);
			venObj.setSubmittedOn(new Date());
			venObj.setPostedBy(empno);
			venObj.setVstatus("Active");
			
			venId=empDao.saveVendorMaster(venObj);
			
			String fileType="Business Compliance";
			
			
			
			if(venMSA!=null) {
			if(!venMSA.getOriginalFilename().isEmpty()) {
				EmpDocumentsEntity vendocobj=new EmpDocumentsEntity();
				vendocobj.setVendorid(venId);
				vendocobj.setPostedBy(empno);
				vendocobj.setSubmit_date(new Date());
				vendocobj.setStatus("Active");
				vendocobj.setFile_name(venMSA.getOriginalFilename());
				vendocobj.setFiletype(ven_msa);
				commonObj.fileToDirectory(null,venMSA,vendorname,null);
				if(!msa_fromdate.isEmpty()) {
					vendocobj.setFrom_date(msa_fromdate);
				}
				if(msa_expiry_date!=null) {
				if(!msa_expiry_date.isEmpty()) {
					vendocobj.setExpiry_date(msa_expiry_date);
				  }
				}
				empDao.saveDocuments(vendocobj);
			   }
			}
			if(mailproofVendor!=null) {
			if(!mailproofVendor.getOriginalFilename().isEmpty()) {
				EmpDocumentsEntity vendocobj=new EmpDocumentsEntity();
				vendocobj.setVendorid(venId);
				vendocobj.setPostedBy(empno);
				vendocobj.setSubmit_date(new Date());
				vendocobj.setStatus("Active");
				vendocobj.setFile_name(mailproofVendor.getOriginalFilename());
				vendocobj.setFiletype(mailprooftype);
				commonObj.fileToDirectory(null,mailproofVendor,vendorname,null);
				empDao.saveDocuments(vendocobj);
			     }
			}
			if(irsw9form!=null) {
			if(!irsw9form.getOriginalFilename().isEmpty()) {
				EmpDocumentsEntity vendocobj=new EmpDocumentsEntity();
				vendocobj.setVendorid(venId);
				vendocobj.setPostedBy(empno);
				vendocobj.setSubmit_date(new Date());
				vendocobj.setStatus("Active");
				vendocobj.setFile_name(irsw9form.getOriginalFilename());
				vendocobj.setInputvalue(executed_irs_w9_form);
				vendocobj.setFiletype(fileType);
				commonObj.fileToDirectory(null,irsw9form,vendorname,null);
				if(!irs_fromdate.isEmpty()) {
					vendocobj.setFrom_date(irs_fromdate);
				}
				if(msa_expiry_date!=null) {
				if(!irs_expirydate.isEmpty()) {
					vendocobj.setExpiry_date(irs_expirydate);
				}}
				empDao.saveDocuments(vendocobj);
				}
			}
			if(insucerti!=null) {
			if(!insucerti.getOriginalFilename().isEmpty()) {
				EmpDocumentsEntity vendocobj=new EmpDocumentsEntity();
				vendocobj.setVendorid(venId);
				vendocobj.setPostedBy(empno);
				vendocobj.setSubmit_date(new Date());
				vendocobj.setStatus("Active");
				//vendocobj.setFrom_date(fromdate);
				//vendocobj.setExpiry_date(expiry_date);
				vendocobj.setFile_name(insucerti.getOriginalFilename());
				vendocobj.setInputvalue(insurance_certificate);
				vendocobj.setFiletype(fileType);
				commonObj.fileToDirectory(null,insucerti,vendorname,null);
				if(!ic_fromdate.isEmpty()) {
					vendocobj.setFrom_date(ic_fromdate);
				}
				if(msa_expiry_date!=null) {
				if(!ic_expirydate.isEmpty()) {
					vendocobj.setExpiry_date(ic_expirydate);
				}
				}
				empDao.saveDocuments(vendocobj);
				}
			}
			if(certicorp!=null) {
			if(!certicorp.getOriginalFilename().isEmpty()) {
				EmpDocumentsEntity vendocobj=new EmpDocumentsEntity();
				vendocobj.setVendorid(venId);
				vendocobj.setPostedBy(empno);
				vendocobj.setSubmit_date(new Date());
				vendocobj.setStatus("Active");
				vendocobj.setFile_name(certicorp.getOriginalFilename());
				vendocobj.setInputvalue(certificate_incorporation);
				vendocobj.setFiletype(fileType);
				commonObj.fileToDirectory(null,certicorp,vendorname,null);
				empDao.saveDocuments(vendocobj);
				}
			}
			if(stdcert!=null) {
			if(!stdcert.getOriginalFilename().isEmpty()) {
				EmpDocumentsEntity vendocobj=new EmpDocumentsEntity();
				vendocobj.setVendorid(venId);
				vendocobj.setPostedBy(empno);
				vendocobj.setSubmit_date(new Date());
				vendocobj.setStatus("Active");
				vendocobj.setFile_name(stdcert.getOriginalFilename());
				vendocobj.setInputvalue(standing_certificate);
				vendocobj.setFiletype(fileType);
				commonObj.fileToDirectory(null,stdcert,vendorname,null);
				if(!gsc_fromdate.isEmpty()) {
					vendocobj.setFrom_date(gsc_fromdate);
				}
				if(msa_expiry_date!=null) {
				if(!gsc_expirydate.isEmpty()) {
					vendocobj.setExpiry_date(gsc_expirydate);
				}
				}
				empDao.saveDocuments(vendocobj);
				}
			}
			
			//sendmail.sendMail(frommail, toemail, toName, comments, subject);
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return venId;
	}
	@Override
	public String checkSelectedFileName(String filename) {
		String fName=null;
		try {
			fName=empDao.checkSelectedFileName(filename);
		}catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return fName;
	}
	@Override
	public Integer saveCustomerMaster(String custname, String fed_id, String cust_contactperson,
			String cust_mgr_email, MultipartFile customerMSA, String cust_msa, String mailtype,
			MultipartFile mailproofCustomer,Integer loginempno, 
			String fromdate, String expiry_date, String payment_terms) {
		Integer custId = 0;
		try {
			CustomerMasterEntity custObj = new CustomerMasterEntity();
			custObj.setCustomer_name(custname);
			custObj.setFed_id(fed_id);
			custObj.setCustomer_contact_no(cust_contactperson);
			custObj.setMgr_email(cust_mgr_email);
			custObj.setPayment_terms(payment_terms);
			custObj.setSubmittedOn(new Date());
			custObj.setStatus("Active");
			custObj.setPostedBy(loginempno);
			custId=empDao.saveCustomerMaster(custObj);
			
			EmpDocumentsEntity custdocobj=new EmpDocumentsEntity();
			custdocobj.setPostedBy(loginempno);
			custdocobj.setSubmit_date(new Date());
			custdocobj.setStatus("Active");
			
			System.out.println("customerMSA******"+customerMSA);
			System.out.println(fromdate+"******"+expiry_date);
			if(customerMSA!=null) {
				if(!customerMSA.getOriginalFilename().isEmpty()) {
					custdocobj.setCustomer_id(custId);
					custdocobj.setFile_name(customerMSA.getOriginalFilename());
					custdocobj.setFiletype(cust_msa);
					commonObj.fileToDirectory(null,customerMSA,null,custname);
					if(!fromdate.isEmpty()) {
						custdocobj.setFrom_date(fromdate);
					}
					if(expiry_date!=null) {
					if(!expiry_date.isEmpty()) {
						custdocobj.setExpiry_date(expiry_date);
					}}
					empDao.saveDocuments(custdocobj);
				}
			}
			if(mailproofCustomer!=null) {
			if(!mailproofCustomer.getOriginalFilename().isEmpty()) {
				custdocobj.setCustomer_id(custId);
				custdocobj.setFile_name(mailproofCustomer.getOriginalFilename());
				custdocobj.setFiletype(mailtype);
				commonObj.fileToDirectory(null,mailproofCustomer,null,custname);
				empDao.saveDocuments(custdocobj);
			   }
			}
			//sendmail.sendMail(frommail, toemail, toName, comments, subject);
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return custId;
	}
	@Override
	public List<CompanyDetails_DTO> getCustomerMasterList() {
		List<CompanyDetails_DTO> customerList = null;
		try {
			 customerList=empDao.getCustomerMasterList();
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return customerList;
	}
	@Override
	public List<CompanyDetails_DTO> getVendorMasterList() {
		List<CompanyDetails_DTO> vendorList = null;
		try {
			vendorList = empDao.getVendorMasterList();
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return vendorList;
	}
	@Override
	public CustomerDetails_DTO getCustomerDetailsById(String custid) {
		CustomerDetails_DTO customerObj = new CustomerDetails_DTO();
		try {
			Integer customerId = 0;
			if (custid!="") {
				customerId = Integer.parseInt(custid);
			}
	    CustomerMasterEntity custDetObj=empDao.getCustomerDetailsById(customerId);
	    String companyType="Customer";
	    CompanyAdressEntity companyAdressObj=empDao.getCompanyAdressDetailsById(customerId,companyType);
	    //customerObj=empDao.getCustomerDocsById(customerId);
	    CustomerDetails_DTO customerDocObj=empDao.getCustomerDocsById(customerId);
	   
	    customerObj.setCustObj(custDetObj);
	    customerObj.setCustAddressObj(companyAdressObj);
	    if(customerDocObj!=null) {	    
	    	customerObj.setFileName(customerDocObj.getFileName());
	    	customerObj.setFileId(customerDocObj.getFileId());
	    	customerObj.setFileType(customerDocObj.getFileType());
	    	customerObj.setStartdate(customerDocObj.getStartdate());
	    	customerObj.setExpirydate(customerDocObj.getExpirydate());
	    }
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return customerObj;
	}
	@Override
	public VendorDetails_DTO getVendorDetailsById(String venid) {
		VendorDetails_DTO vendorObj = new VendorDetails_DTO();
		try {
			Integer vendorId = 0;
			if (venid!="") {
				vendorId = Integer.parseInt(venid);
			}
		VendorDocumentsDto viewcvbean = new VendorDocumentsDto();
	    VendorMasterEntity venDetObj=empDao.getVendorDetailsById(vendorId);
	    String companyType="Vendor";
	    CompanyAdressEntity companyAdressObj=empDao.getCompanyAdressDetailsById(vendorId,companyType);
	    vendorObj.setVendorAddressObj(companyAdressObj);
	    List<DocEmpBean> venDocs=empDao.getVendorDocsById(vendorId);
	  //  VendorDocumentsDto viewcvbean = empDao.getVendorDocumentsById(vendorId);
	    if(venDocs!=null) {
			 for (DocEmpBean venMdoc : venDocs) {
				 
				    String filetype=venMdoc.getFiletype();
					String filename=venMdoc.getFile_name();
					String inputVal=venMdoc.getInputval();
					
					if(filetype.equalsIgnoreCase("Vendor_MSA")) {
						 viewcvbean.setVmsafileid(venMdoc.getDocument_id());
						 viewcvbean.setVen_msa(filename);
						 viewcvbean.setMsafiletype(venMdoc.getFiletype());
						 System.out.println("venMdoc.getDocument_id()"+venMdoc.getDocument_id()+"getStartdate()***Vendor_MSA*********"+venMdoc.getStartdate()+"getExpirydate******"+venMdoc.getExpirydate());
						 viewcvbean.setVmsastartdate(venMdoc.getStartdate());
						 viewcvbean.setVmsaexpirydate(venMdoc.getExpirydate());
					}
					else if(filetype.equalsIgnoreCase("Manager_Approved_Email_VMSA")) {
						  viewcvbean.setVmgrfileid(venMdoc.getDocument_id());
						  System.out.println("venMdoc.getDocument_id()"+venMdoc.getDocument_id()+"filetype**********"+filetype);
						  viewcvbean.setVen_mgr_apr_mail_proof(filename);
						  viewcvbean.setMgrfiletype(venMdoc.getFiletype());
					}
					else if(filetype.equalsIgnoreCase("Business Compliance")) {
						if(inputVal.equalsIgnoreCase("Executed_irs_w9_form")) {
							 viewcvbean.setIrsfileid(venMdoc.getDocument_id());
							 viewcvbean.setIrsfilename(filename);
							 viewcvbean.setBcfiletype(venMdoc.getFiletype());
							 viewcvbean.setIrsinputval(venMdoc.getInputval());
							 System.out.println("venMdoc.getDocument_id()"+venMdoc.getDocument_id()+"getStartdate()***Executed_irs_w9_form*********"+venMdoc.getStartdate()+"getExpirydate******"+venMdoc.getExpirydate());
							 viewcvbean.setIrsstartdate(venMdoc.getStartdate());
							 viewcvbean.setIrsexpirydate(venMdoc.getExpirydate());
						}
						else if(inputVal.equalsIgnoreCase("insurance_certificate")) {
							 viewcvbean.setIcfileid(venMdoc.getDocument_id());
							viewcvbean.setIcfilename(filename);
							viewcvbean.setBcfiletype(venMdoc.getFiletype());
							viewcvbean.setIcinputval(venMdoc.getInputval());
							System.out.println("venMdoc.getDocument_id()"+venMdoc.getDocument_id()+"getStartdate()***insurance_certificate*********"+venMdoc.getStartdate()+"getExpirydate******"+venMdoc.getExpirydate());
							 viewcvbean.setIcstartdate(venMdoc.getStartdate());
							 viewcvbean.setIcexpirydate(venMdoc.getExpirydate());
							}
						else if(inputVal.equalsIgnoreCase("certificate_incorporation")) {
							 viewcvbean.setCifileid(venMdoc.getDocument_id());
							viewcvbean.setCifilename(filename);
							viewcvbean.setBcfiletype(venMdoc.getFiletype());
							viewcvbean.setCiinputval(venMdoc.getInputval());
							System.out.println("venMdoc.getDocument_id()"+venMdoc.getDocument_id()+"getStartdate()***certificate_incorporation*********"+venMdoc.getStartdate()+"getExpirydate******"+venMdoc.getExpirydate());
							 viewcvbean.setCistartdate(venMdoc.getStartdate());
							 viewcvbean.setCiexpirydate(venMdoc.getExpirydate());
						}else if(inputVal.equalsIgnoreCase("standing_certificate")){
							viewcvbean.setGscfileid(venMdoc.getDocument_id());
							viewcvbean.setGscfilename(filename);
							viewcvbean.setBcfiletype(venMdoc.getFiletype());
							viewcvbean.setGscinputval(venMdoc.getInputval());
							System.out.println("venMdoc.getDocument_id()"+venMdoc.getDocument_id()+"getStartdate()***standing_certificate*********"+venMdoc.getStartdate()+"getExpirydate******"+venMdoc.getExpirydate());
							 viewcvbean.setGscstartdate(venMdoc.getStartdate());
							 viewcvbean.setGscexpirydate(venMdoc.getExpirydate());
						}
					  }
					
			  }
		}
	    vendorObj.setVendObj(venDetObj);
	    vendorObj.setVenDocsObj(viewcvbean);
	    vendorObj.setVendorDocs(venDocs);
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return vendorObj;
	}
	@Override
	public Integer saveClientDetails(String client_name, String fed_id, String client_mgr,
			String client_mgr_email, String client_mgr_extn, String client_emp_email, String client_emp_extn,
			Integer candidate_id, Integer loginempno,String project_name, String client_type, Integer payrateId,
			String organization_name, String cand_job_title, String education,String workinglocation,
			String county, String soc_code, String reason_lca, String lcastartdate, 
			String lcaenddate, String wageRate , String metro_politan_area,
			String lcaPostedDate, String wr_option, String job_duties) {
		Integer clientId=0;
		try {
			String emptype=null;
			CandidateDetailedInfo candidateObj=empDao.getCandidateDetailedInfoById(candidate_id);
			if(candidateObj!=null) {
				emptype=candidateObj.getEmp_type();
			}
			ClientDetailsEntity clientObj = new ClientDetailsEntity();
			clientObj.setProject_name(project_name);
			clientObj.setClientName(client_name);
			//clientObj.setClientAdd(othr_client_addr);
			clientObj.setFed_id(fed_id);
			clientObj.setClient_mgr(client_mgr);
			clientObj.setClient_mgr_email(client_mgr_email);
			clientObj.setClient_mgr_extn(client_mgr_extn);
			clientObj.setEmp_mailat_client(client_emp_email);
			clientObj.setEmp_extnat_client(client_emp_extn);
			clientObj.setCandidate_id(candidate_id);
			clientObj.setPosted_by(loginempno);
			clientObj.setSubmittedOn(new Date());
			clientObj.setStatus(1);
			clientObj.setClient_type(client_type);
			//if(emptype.equalsIgnoreCase("W2")) {
			clientObj.setPayrate_id(payrateId);
			clientObj.setOrganization_name(organization_name);
			clientObj.setCand_job_title(cand_job_title);
			clientObj.setEducation(education);
			clientObj.setWorkinglocation(workinglocation);
			clientObj.setCounty(county);
			clientObj.setSoc_code(soc_code);
			clientObj.setReason_lca(reason_lca);
			clientObj.setMetro_politan_area(metro_politan_area);
			//}
			clientId=empDao.saveClientDetails(clientObj);
			//sendmail.sendMail(frommail, toemail, toName, comments, subject);
			String[] tasks = {"Upload LCA Questionnaire","Upload Approved LCA","Upload Executed LCA"};
			if(organization_name!=null && clientId!=0) {
				Integer lcaId=0;Integer candId=0;
				 LCADetailsDto lcaDtoObj=immiao.getLcaTopRecord(candId);
				 System.out.println("lcaDtoObj*******"+lcaDtoObj);
				 if(lcaDtoObj!=null) {
					 Integer referenceLca=lcaDtoObj.getLca_reference();
					 System.out.println("referenceLca*******"+referenceLca);
					 referenceLca=referenceLca+1;
					 System.out.println("referenceLca after increment"+referenceLca);
					 //referenceLca++;
					 ClientDetailsEntity endlcientObj= immiao.getEndclientByClientId(clientId);
					 if(endlcientObj!=null) {
					 LCADetailsEntity lcaOBj=new LCADetailsEntity();
					 lcaOBj.setClient_id(clientId);
					 lcaOBj.setCandidate_id(candidate_id);
					 lcaOBj.setCandidate_id(endlcientObj.getCandidate_id());
					 lcaOBj.setPayrate_id(endlcientObj.getPayrate_id());
					 lcaOBj.setLca_begin_date(lcastartdate);
					 lcaOBj.setLca_end_date(lcaenddate);
					// lcaOBj.setLcaPostedDate(lcaPostedDate);
					 lcaOBj.setLca_submitted_date(lcaPostedDate);
					 lcaOBj.setWage_rate(wageRate);
					 lcaOBj.setWr_option(wr_option);
					 lcaOBj.setJob_duties(job_duties);
					 lcaOBj.setPosted_by(loginempno);
					 lcaOBj.setLcastatus("Active");
					 lcaOBj.setLca_reference(referenceLca++);
					 lcaId=immiao.saveLCADetails(lcaOBj);
					 }
				 }else {
					 ClientDetailsEntity endlcientObj= immiao.getEndclientByClientId(clientId);
					 if(endlcientObj!=null) {
						Integer referenceLca=1;
					 LCADetailsEntity lcaOBj=new LCADetailsEntity();
					 lcaOBj.setClient_id(clientId);
					 lcaOBj.setCandidate_id(candidate_id);
					 lcaOBj.setCandidate_id(endlcientObj.getCandidate_id());
					 lcaOBj.setPayrate_id(endlcientObj.getPayrate_id());
					 lcaOBj.setPosted_by(loginempno);
					 lcaOBj.setLca_begin_date(lcastartdate);
					 lcaOBj.setLca_end_date(lcaenddate);
					// lcaOBj.setLcaPostedDate(lcaPostedDate);
					 lcaOBj.setLca_submitted_date(lcaPostedDate);
					 lcaOBj.setWage_rate(wageRate);
					 lcaOBj.setWr_option(wr_option);
					 lcaOBj.setJob_duties(job_duties);
					 lcaOBj.setLcastatus("Active");
					 lcaOBj.setLca_reference(referenceLca);
					 lcaId=immiao.saveLCADetails(lcaOBj);
					  }
				 }
				
				 for(int i=0; i< tasks.length; i++){
				      System.out.println(tasks[i]);
				      TaskDetailsEntity taskObj=new TaskDetailsEntity();
				      taskObj.setImmigration_id(lcaId);
				      taskObj.setTask_name(tasks[i]);
				      taskObj.setTask_description(tasks[i]);
				      taskObj.setCreated_date(new Date());
				      SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
				      Calendar c = Calendar.getInstance();
				      c.setTime(new Date()); // Now use today date.
				      c.add(Calendar.DATE, 7); // Adding 7 days
				      String date = sdf.format(c.getTime());
				      taskObj.setDue_date(date);
				      taskObj.setTask_status("Open");
				      taskObj.setDocumenttype_name("LCA");
				      taskObj.setPosted_by(loginempno);
				      taskObj.setPayrate_id(payrateId);
				      taskObj.setCandidate_id(candidate_id);
				      taskObj.setClient_id(clientId);
				      immiao.saveTaskDetails(taskObj);
				    }
				 Integer docmaster= immiao.checkDocsExitsorNot(candidate_id);
				 if(docmaster!=null) {
				 }else {
				 /*String[] h1btasks;
				 if(reason_lca.equalsIgnoreCase("H1B CAP")) {
					 h1btasks = new String[]{"Latest passport copy", "I-94 copy", "LCA Questionnaire", "H1B Questionnaire", "Client and vendor letter Questionnaire","Public benefits checklist","Education documents","Experience letters","SSN","Paystubs","W2s","EAD Cards and I-120"};
			      }else {
			    	  h1btasks = new String[]{"Latest passport copy", "I-94 copy", "LCA Questionnaire", "H1B Questionnaire", "Client and vendor letter Questionnaire","Public benefits checklist","Education documents","Experience letters","SSN","Paystubs","W2s","EAD Cards and I-120","Prior H1 approval copies"};
			    	  
			      }*/
			   ///EAD Cards and I-120(If any)-- ead card and i-120 both are differecnt?
				 
			/*	 for(int i=0; i< h1btasks.length; i++){
					 
				      System.out.println(h1btasks[i]);
				      TaskDetailsEntity taskObj=new TaskDetailsEntity();
				      
				      taskObj.setTask_name(h1btasks[i]);
				      taskObj.setTask_description(h1btasks[i]);
				      taskObj.setCreated_date(new Date());
				      SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
				      Calendar c = Calendar.getInstance();
				      c.setTime(new Date()); // Now use today date.
				      c.add(Calendar.DATE, 7); // Adding 7 days
				      String date = sdf.format(c.getTime());
				      
				      taskObj.setDue_date(date);
				      taskObj.setTask_status("Open");
				      taskObj.setDocumenttype_name("H-1B");
				      taskObj.setPosted_by(loginempno);
				      taskObj.setPayrate_id(payrateId);
				      taskObj.setCandidate_id(candidate_id);
				      taskObj.setClient_id(clientId);
				      immiao.saveTaskDetails(taskObj);
				    }
				 
				 for(int i=0; i< h1btasks.length; i++){
				      System.out.println(h1btasks[i]);
				      DocumentListMasterEntity docmasterObj=new DocumentListMasterEntity();
				      
				      docmasterObj.setDocument_name(h1btasks[i]);
				      docmasterObj.setPosted_by(loginempno);
				      docmasterObj.setCandidate_id(candidate_id);
				      docmasterObj.setClient_id(clientId);
				      docmasterObj.setCandidate_status("");
				      docmasterObj.setApproval_status("");
				      immiao.saveDocumentListMaster(docmasterObj);
				    }*/
				 }
			}
			
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return clientId;
	}


	@Override
	public Integer savePayRateBillRateDetails(String bill_rate, String pay_rate, String invoice_terms,
			String proj_startDate, String proj_endDate, String p_term, Integer customer_id, Integer vendorId,
			Integer candidate_id, String bcurrency, String pcurrency, MultipartFile cworder, String c_work_order,
			MultipartFile vworder, String v_work_order, MultipartFile cagreement, String cC_Agreement,
			MultipartFile cCompliance, String c_Compliance, MultipartFile mailproofCustomer, String mailproofCust,
			MultipartFile mailproofVendor, String mailproofVen, String emptype,Integer loginempno,String payrolltype,
			String cwofromdate, String cwoexpirydate, String vwofromdate, String vwoexpirydate, String ccfromdate, String ccexpirydate, String invoice_period) {
		String msg="";
		Integer pdayrateId=0;
		//Integer invoiceperiod=0;
		try {
			/*if (!invoice_period.isEmpty()) {
				invoiceperiod = Integer.parseInt(invoice_period);
			 }*/
			
			EmpPayRateDetails payrateObj = new EmpPayRateDetails();
			payrateObj.setBillrate(bill_rate);
			payrateObj.setPayrate(pay_rate);
			payrateObj.setPayment_terms(p_term);
			payrateObj.setInvoice_terms(invoice_terms);
			payrateObj.setProj_startDate(proj_startDate);
			payrateObj.setProj_endDate(proj_endDate);
			payrateObj.setCustomer_id(customer_id);
			payrateObj.setVendorid(vendorId);
			payrateObj.setCandidate_id(candidate_id);
			payrateObj.setSubmittedOn(new Date());
			payrateObj.setPostedBy(loginempno);
			payrateObj.setProject_status("Active");
			payrateObj.setStatus("Active");
			payrateObj.setPayroll_type(payrolltype);
			payrateObj.setInvoice_period(invoice_period);
			pdayrateId=empDao.savePayRateBillRateDetails(payrateObj);
			
			ProjectDetailsHistory projectHistoryObj=new ProjectDetailsHistory();
			projectHistoryObj.setPayrate_id(pdayrateId);
			projectHistoryObj.setCustomer_id(customer_id);
			projectHistoryObj.setVendorid(vendorId);
			projectHistoryObj.setCandidate_id(candidate_id);
			projectHistoryObj.setProj_startDate(proj_startDate);
			projectHistoryObj.setProj_endDate(proj_endDate);
			projectHistoryObj.setPostedBy(loginempno);
			projectHistoryObj.setSubmittedOn(new Date());
			//projectHistoryObj.setInvoice_period(invoice_period);
			empDao.saveProjectDetailsHistory(projectHistoryObj);
			
			if(cworder!=null) {
			if(!cworder.getOriginalFilename().isEmpty()) {
				EmpDocumentsEntity pdocobj=new EmpDocumentsEntity();
				pdocobj.setFile_name(cworder.getOriginalFilename());
				pdocobj.setFiletype(c_work_order);
				pdocobj.setCustomer_id(customer_id);
				pdocobj.setCandidate_id(candidate_id);
				pdocobj.setStatus("Active");
				pdocobj.setPostedBy(loginempno);
				pdocobj.setSubmit_date(new Date());
				pdocobj.setFrom_date(cwofromdate);
				pdocobj.setExpiry_date(cwoexpirydate);
				commonObj.fileToDirectory(candidate_id,cworder,null,null);
				empDao.saveDocuments(pdocobj);
			   }
			}
			if(mailproofCustomer!=null) {
			if(!mailproofCustomer.getOriginalFilename().isEmpty()) {
				EmpDocumentsEntity pdocobj=new EmpDocumentsEntity();
				pdocobj.setFile_name(mailproofCustomer.getOriginalFilename());
				pdocobj.setFiletype(mailproofCust);
				pdocobj.setCustomer_id(customer_id);
				pdocobj.setCandidate_id(candidate_id);
				pdocobj.setStatus("Active");
				pdocobj.setPostedBy(loginempno);
				pdocobj.setSubmit_date(new Date());
				commonObj.fileToDirectory(candidate_id,mailproofCustomer,null,null);
				empDao.saveDocuments(pdocobj);
			   }
			}
			if(vworder!=null) {
			if(!vworder.getOriginalFilename().isEmpty()) {
				EmpDocumentsEntity pdocobj=new EmpDocumentsEntity();
				pdocobj.setFile_name(vworder.getOriginalFilename());
				pdocobj.setFiletype(v_work_order);
				pdocobj.setVendorid(vendorId);
				pdocobj.setCandidate_id(candidate_id);
				pdocobj.setStatus("Active");
				pdocobj.setPostedBy(loginempno);
				pdocobj.setSubmit_date(new Date());
				pdocobj.setFrom_date(vwofromdate);
				pdocobj.setExpiry_date(vwoexpirydate);
				commonObj.fileToDirectory(candidate_id,vworder,null,null);
				empDao.saveDocuments(pdocobj);
			    }
			}
			if(cagreement!=null) {
			if(!cagreement.getOriginalFilename().isEmpty()) {
				EmpDocumentsEntity pdocobj=new EmpDocumentsEntity();
				pdocobj.setFile_name(cagreement.getOriginalFilename());
				pdocobj.setFiletype(cC_Agreement);
				pdocobj.setVendorid(vendorId);
				pdocobj.setCandidate_id(candidate_id);
				pdocobj.setStatus("Active");
				pdocobj.setPostedBy(loginempno);
				pdocobj.setSubmit_date(new Date());
				commonObj.fileToDirectory(candidate_id,cagreement,null,null);
				empDao.saveDocuments(pdocobj);
			   }
			}
			if(cCompliance!=null) {
			if(!cCompliance.getOriginalFilename().isEmpty()) {
				EmpDocumentsEntity pdocobj=new EmpDocumentsEntity();
				pdocobj.setFile_name(cCompliance.getOriginalFilename());
				pdocobj.setFiletype(c_Compliance);
				pdocobj.setVendorid(vendorId);
				pdocobj.setCandidate_id(candidate_id);
				pdocobj.setStatus("Active");
				pdocobj.setPostedBy(loginempno);
				pdocobj.setSubmit_date(new Date());
				pdocobj.setFrom_date(ccfromdate);
				if(ccexpirydate!=null) {
				pdocobj.setExpiry_date(ccexpirydate);
				}
				commonObj.fileToDirectory(candidate_id,cCompliance,null,null);
				empDao.saveDocuments(pdocobj);
			  }
			}
			if(mailproofVendor!=null) {
			if(!mailproofVendor.getOriginalFilename().isEmpty()) {
				EmpDocumentsEntity pdocobj=new EmpDocumentsEntity();
				pdocobj.setFile_name(mailproofVendor.getOriginalFilename());
				pdocobj.setFiletype(mailproofVen);
				pdocobj.setVendorid(vendorId);
				pdocobj.setCandidate_id(candidate_id);
				pdocobj.setStatus("Active");
				pdocobj.setPostedBy(loginempno);
				pdocobj.setSubmit_date(new Date());
				commonObj.fileToDirectory(candidate_id,mailproofVendor,null,null);
				empDao.saveDocuments(pdocobj);
			   }
			}
			if(pdayrateId!=0) {
				PageStatusEntity pagestsObj=empDao.getRedirectPageStatus(candidate_id);
				if(pagestsObj.getClient_status()==0) {
					pagestsObj.setClient_status(1);
					pagestsObj.setClient_submitdate(new Date());
					empDao.updatePageStatus(pagestsObj);
				}
				
				msg="Success";
			}else {
				msg="Error";
			}
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return pdayrateId;
	}
	
	@Override
	public List<ClientVendorMaster_DTO> viewClientDetailsByCandidateId(String candidate_id,String payrateId) {
		List<ClientVendorMaster_DTO> clientlist = null;
		try {
			Integer candidate_Id=0;
			if (candidate_id!="") {
				candidate_Id = Integer.parseInt(candidate_id);
			}
			Integer payrateid = 0;
			
			if (!payrateId.isEmpty()) {
				payrateid = Integer.parseInt(payrateId);
			}else {
				EmpPayRateDetails parateOb=empDao.payrateDetailsByCandidateId(candidate_Id);
				if(parateOb!=null) {
					payrateid=parateOb.getPayrate_id();
				}
			}
			
			CandidateDetailedInfo candiObj=empDao.getCandidateDetailedInfoById(candidate_Id);
			if(candiObj!=null) {
				String emptyp=candiObj.getEmp_type();
				clientlist = empDao.viewClientDetailsByCandidateId(candidate_Id,payrateid,emptyp);
			}
			
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return clientlist;
	}
	@Override
	public List<ClientVendorMaster_DTO> viewCustomerDetailsByCandidateId(String candidate_id,String payrateId) {
		List<ClientVendorMaster_DTO> custlist = null;
		try {
			Integer candidate_Id=0;
			if (candidate_id!="") {
				candidate_Id = Integer.parseInt(candidate_id);
			}
			CandidateDetailedInfo candiObj=empDao.getCandidateDetailedInfoById(candidate_Id);
			if(candiObj!=null) {
				String emptyp=candiObj.getEmp_type();
			custlist = empDao.viewCustomerDetailsByCandidateId(candidate_Id, payrateId, emptyp);
			}
		} catch (Exception e) {
			
			logger.info(e.getMessage(),e);
		}
		return custlist;
	}
	@Override
	public List<ClientVendorMaster_DTO> viewVendorDetailsByCandidateId(String candidate_id,String payrateId) {
		List<ClientVendorMaster_DTO> vendorlist = null;
		try {
			Integer candidate_Id=0;
			Integer payrateid = 0;
			if (candidate_id!="") {
				candidate_Id = Integer.parseInt(candidate_id);
			}
			if (!payrateId.isEmpty()) {
				payrateid = Integer.parseInt(payrateId);
			}else {
				EmpPayRateDetails parateOb=empDao.payrateDetailsByCandidateId(candidate_Id);
				if(parateOb!=null) {
					payrateid=parateOb.getPayrate_id();
				}
			}
			vendorlist = empDao.viewVendorDetailsByCandidateId(candidate_Id,payrateid);
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return vendorlist;
	}
	
	@Override
	public List<ClientVendorMaster_DTO> viewEndclientByCandidateId(String candidate_id) {
		List<ClientVendorMaster_DTO> ccvlist = null;
		try {
			Integer candidate_Id=0;
			if (candidate_id!="") {
				candidate_Id = Integer.parseInt(candidate_id);
			}
			CandidateDetailedInfo candiObj=empDao.getCandidateDetailedInfoById(candidate_Id);
			if(candiObj!=null) {
				String emptyp=candiObj.getEmp_type();
					ccvlist = empDao.viewEndclientByCandidateId(candidate_Id,emptyp);
			}
			
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return ccvlist;
	}
	@Override
	public viewDocsBean viewClientVendorDocsByCandidateId(String candidate_id, String payrate_id) {
			viewDocsBean viewcvbean = new viewDocsBean();
			List<FileBean> vendorDocslist=new LinkedList<>();
		try {
			Integer candidate_Id=0;
			if (candidate_id!="") {
				candidate_Id = Integer.parseInt(candidate_id);
			}String emptype=null;
			CandidateDetailedInfo candiObj=empDao.getCandidateDetailedInfoById(candidate_Id);
			if(candiObj!=null) {
				emptype=candiObj.getEmp_type();
			}
			
			Integer payrateid = 0;
			if (!payrate_id.isEmpty()) {
				payrateid = Integer.parseInt(payrate_id);
			}
			Integer vendorId=empDao.getVendorIdByPayrateId(candidate_Id,payrateid);
			
	  		 List<DocEmpBean> viewdocscust=empDao.viewEmpcustdocumentsByCandidateId(candidate_Id,emptype,payrate_id);
			 List<DocEmpBean> viewdocsven=empDao.viewEmpvendocumentsByCandidateId(candidate_Id,emptype,payrate_id);
			 List<DocEmpBean> vendordocs=empDao.viewEmpvdocumentsByCandidateId(candidate_Id,emptype,payrate_id,vendorId); 
			 List<DocEmpBean> customerdocs=empDao.viewEmpcdocumentsByCandidateId(candidate_Id,emptype,payrate_id);
			 
			 if(viewdocscust!=null) {
				 for (DocEmpBean custdoc : viewdocscust) {
					    String filetype=custdoc.getFiletype();
						String filename=custdoc.getFile_name();
						candidate_Id=custdoc.getCandidate_id();
						
						if(filetype.equalsIgnoreCase("cust_work_order")) {
							 viewcvbean.setCust_w_order(filename);
							 viewcvbean.setC_edid(custdoc.getDocument_id());
							 viewcvbean.setCwostartdate(custdoc.getStartdate());
							 viewcvbean.setCwoexpirydate(custdoc.getExpirydate());
						}
						else if(filetype.equalsIgnoreCase("Manager_Approved_Email_CWO")) {
							 viewcvbean.setMgr_apr_mail_cwo(filename);
							 viewcvbean.setCmgr_edid(custdoc.getDocument_id());
						}
				 }}
				 if(viewdocsven!=null) {
				 for (DocEmpBean vendoc : viewdocsven) {
					 
					    String filetype=vendoc.getFiletype();
						String filename=vendoc.getFile_name();
						candidate_Id=vendoc.getCandidate_id();
						System.out.println("filename*****filename******"+filetype+filename);
						if(filetype.equalsIgnoreCase("Manager_Approved_Email_VWO")) {
							 viewcvbean.setMgr_apr_mail_vwo(filename);
							 viewcvbean.setVmgr_edid(vendoc.getDocument_id());
						}else if(filetype.equalsIgnoreCase("ven_work_order")) {
						     viewcvbean.setVen_w_order(filename);
							 viewcvbean.setV_edid(vendoc.getDocument_id());
							 viewcvbean.setVwostartdate(vendoc.getStartdate());
							 viewcvbean.setVwoexpirydate(vendoc.getExpirydate());
						}
						else if(filetype.equalsIgnoreCase("Consultant_Consent_Agreement")) {
							 viewcvbean.setCagreement(filename);
							 viewcvbean.setCca_edid(vendoc.getDocument_id());
						}
						else if(filetype.equalsIgnoreCase("Consultant_Compliance")) {
							 viewcvbean.setcCompliance(filename);
							 viewcvbean.setCc_edid(vendoc.getDocument_id());
							 viewcvbean.setCcstartdate(vendoc.getStartdate());
							 viewcvbean.setCcexpirydate(vendoc.getExpirydate());
						} 
				 }}
				 if(customerdocs!=null) {
				 for (DocEmpBean custMdoc : customerdocs) {
					 
					    String filetype=custMdoc.getFiletype();
						String filename=custMdoc.getFile_name();
						candidate_Id=custMdoc.getCandidate_id();
						
						if(filetype.equalsIgnoreCase("Customer_MSA")) {
							 viewcvbean.setCmsafileid(custMdoc.getDocument_id());
							 viewcvbean.setCust_msa(filename);
							 viewcvbean.setCustname(custMdoc.getCustname());
							 viewcvbean.setCmsastartdate(custMdoc.getStartdate());
							 viewcvbean.setCmsaexpirydate(custMdoc.getExpirydate());
						}else if(filetype.equalsIgnoreCase("Manager_Approved_Email_CMSA")) {
							 viewcvbean.setCmgrfileid(custMdoc.getDocument_id());
							 viewcvbean.setCmsamgr_apr_mail(filename);
							 viewcvbean.setCustname(custMdoc.getCustname());
						}
				 }}
				 if(vendordocs!=null) {
				 for (DocEmpBean venMdoc : vendordocs) {
					 
					    String filetype=venMdoc.getFiletype();
						String filename=venMdoc.getFile_name();
						candidate_Id=venMdoc.getCandidate_id();
						
						if(filetype.equalsIgnoreCase("Vendor_MSA")) {
							 viewcvbean.setVmsafileid(venMdoc.getDocument_id());
							 viewcvbean.setVen_msa(filename);
							 viewcvbean.setVendorname(venMdoc.getVendorname());
							 viewcvbean.setVmsastartdate(venMdoc.getStartdate());
							 viewcvbean.setVmsaexpirydate(venMdoc.getExpirydate());
						}
						else if(filetype.equalsIgnoreCase("Business Compliance")) {
								FileBean fBean=new FileBean();
								String fileType=venMdoc.getFiletype();
								String inputval=venMdoc.getInputval();
								fBean.setFileId(venMdoc.getDocument_id());
								fBean.setFileType(fileType);
								fBean.setFileName(filename);
								fBean.setInputval(inputval);
								fBean.setStartdate(venMdoc.getStartdate());
								fBean.setExpirydate(venMdoc.getExpirydate());
								vendorDocslist.add(fBean);
								viewcvbean.setVendorname(venMdoc.getVendorname());
								viewcvbean.setVendordocs(vendorDocslist); 
							}
						else if(filetype.equalsIgnoreCase("Manager_Approved_Email_VMSA")) {
							viewcvbean.setVmgrfileid(venMdoc.getDocument_id());
							viewcvbean.setVmsamgr_apr_mail(filename);
							viewcvbean.setVendorname(venMdoc.getVendorname());
						}
				 }
				 }
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return viewcvbean;
	}
	
	@Override
	public PageStatusEntity getRedirectPageStatus(Integer candidate_id) {
		PageStatusEntity pageStsObj = null;
		try {
			pageStsObj = empDao.getRedirectPageStatus(candidate_id);
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return pageStsObj;
	}
	
	@Override
	public String updateClientDetails(String client_name, String client_mgr, String client_mgr_email, String client_mgr_extn,
			String client_emp_email, String client_emp_extn, Integer client_id,	String candidate_id,
			String line1, String line2, String city, String state, String zipcode, 
			String companytype,	Integer loginempno, String fed_id, String project_name, Integer payRate_Id,
			String organization_name,String cand_job_title, String education, String remote_county,String remote_soc_code, 
			String workinglocation , String remote_line1, String remote_line2, String remote_city,
			String remote_state, String remote_zipcode, String work_authorization, String reason_lca, String metro_politan_area) {
		String msg=null;
		String emptype=null;
		Integer candidate_Id=0;
		try {
		if (candidate_id!="") {
			candidate_Id = Integer.parseInt(candidate_id);
		}
		CandidateDetailedInfo candiObj=empDao.getCandidateDetailedInfoById(candidate_Id);
		if(candiObj!=null) {
			emptype=candiObj.getEmp_type();
		}
		ClientDetailsEntity clientObjDB=empDao.getClientDetailsById(client_id,emptype);
		System.out.println("***client type from DB in END client details*****"+clientObjDB.getClient_type());
		if(clientObjDB!=null) {
		CompanyAdressEntity clientAddressObjDB=empDao.getCompanyAdressDetailsById(client_id, clientObjDB.getClient_type());
		//System.out.println("***client type from DB in client Address details*****"+clientObjDB.getClient_type());
		//if(!clientObjDB.getClientName().equalsIgnoreCase(client_name) || !clientObjDB.getClient_mgr().equalsIgnoreCase(client_mgr) || !clientObjDB.getClient_mgr_email().equalsIgnoreCase(client_mgr_email) || !clientObjDB.getClient_mgr_extn().equalsIgnoreCase(client_mgr_extn) || !clientObjDB.getEmp_mailat_client().equalsIgnoreCase(client_emp_email) || !clientObjDB.getEmp_extnat_client().equalsIgnoreCase(client_emp_extn) || clientObjDB.getFed_id().equalsIgnoreCase(fed_id) || clientObjDB.getProject_name().equalsIgnoreCase(project_name)) {
		
		ClientDetailsHistoryEntity clientHistoyObj=new ClientDetailsHistoryEntity();
		clientHistoyObj.setClient_id(client_id);
		clientHistoyObj.setClientName(clientObjDB.getClientName());
		clientHistoyObj.setProject_name(clientObjDB.getProject_name());
		clientHistoyObj.setFed_id(clientObjDB.getFed_id());
		clientHistoyObj.setClient_mgr(clientObjDB.getClient_mgr());
		clientHistoyObj.setClient_mgr_email(clientObjDB.getClient_mgr_email());
		clientHistoyObj.setClient_mgr_extn(clientObjDB.getClient_mgr_extn());
		clientHistoyObj.setEmp_mailat_client(clientObjDB.getEmp_mailat_client());
		clientHistoyObj.setEmp_extnat_client(clientObjDB.getEmp_extnat_client());
		clientHistoyObj.setSubmittedOn(clientObjDB.getSubmittedOn());
		clientHistoyObj.setOrganization_name(clientObjDB.getOrganization_name());
		clientHistoyObj.setCand_job_title(clientObjDB.getCand_job_title());
		clientHistoyObj.setEducation(clientObjDB.getEducation());
		clientHistoyObj.setClient_type(clientObjDB.getClient_type());
		clientHistoyObj.setWorkinglocation(clientObjDB.getWorkinglocation());
		clientHistoyObj.setReason_lca(clientObjDB.getReason_lca());
		clientHistoyObj.setMetro_politan_area(clientObjDB.getMetro_politan_area());
		//if(emptype.equalsIgnoreCase("W2")) {
		clientHistoyObj.setPayrate_id(clientObjDB.getPayrate_id());
		//}
		empDao.updateClientHistoryDetails(clientHistoyObj);
		
		clientObjDB.setClientName(client_name);
		clientObjDB.setProject_name(project_name);
		clientObjDB.setFed_id(fed_id);
		clientObjDB.setClient_mgr(client_mgr);
		clientObjDB.setClient_mgr_email(client_mgr_email);
		clientObjDB.setClient_mgr_extn(client_mgr_extn);
		clientObjDB.setEmp_mailat_client(client_emp_email);
		clientObjDB.setEmp_extnat_client(client_emp_extn);
		//clientObjDB.setPayrate_id(payRate_Id);
		clientObjDB.setSubmittedOn(new Date());
		clientObjDB.setPosted_by(loginempno);
		clientObjDB.setOrganization_name(organization_name);
		clientObjDB.setCand_job_title(cand_job_title);
		clientObjDB.setEducation(education);
		if (workinglocation!=null) {
			clientObjDB.setWorkinglocation(workinglocation);
		}else {
			clientObjDB.setWorkinglocation(clientObjDB.getWorkinglocation());	
		}
		clientObjDB.setCounty(remote_county);
		clientObjDB.setSoc_code(remote_soc_code);
		clientObjDB.setReason_lca(reason_lca);
		clientObjDB.setMetro_politan_area(metro_politan_area);
		clientObjDB.setClient_type(companytype);
		empDao.updateClientDetails(clientObjDB);
		msg="Success";
		//System.out.println("Success Success"+msg);
     //  }else {
   	  //  msg="Error";
     //  }
		//System.out.println("work_authorization&&&&&&"+work_authorization);
		if (workinglocation!=null) {
		if (workinglocation.equalsIgnoreCase("Remote/Home")) {
			String companytype1="Remote/Home";
			CompanyAdressEntity remoteAddressObjDB=empDao.getCompanyAdressDetailsById(client_id, companytype1);
			if(remoteAddressObjDB!=null) {
			if((remote_line2=="" || remote_line2!="") && remoteAddressObjDB.getLine2()!=null) {
				if(!remoteAddressObjDB.getLine1().equalsIgnoreCase(remote_line1) || !remoteAddressObjDB.getLine2().equalsIgnoreCase(remote_line2) || !remoteAddressObjDB.getCity().equalsIgnoreCase(remote_city) || !remoteAddressObjDB.getState().equalsIgnoreCase(remote_state) || !remoteAddressObjDB.getZipcode().equals(remote_zipcode)) {
				//	System.out.println("Insided  remote candidate Address changes"); || !remoteAddressObjDB.getSoc_code().equalsIgnoreCase(remote_soc_code) || !remoteAddressObjDB.getCounty().equals(remote_county)
					CompanyAdressEntity remoteAddressObj = new CompanyAdressEntity();
					remoteAddressObj.setLine1(remote_line1);
					remoteAddressObj.setLine2(remote_line2);
					remoteAddressObj.setCompany_id(client_id);
					remoteAddressObj.setCompany_type(companytype1);
					remoteAddressObj.setCity(remote_city);
					remoteAddressObj.setState(remote_state);
					remoteAddressObj.setZipcode(remote_zipcode);
					/*remoteAddressObj.setCounty(remote_county);
					remoteAddressObj.setSoc_code(remote_soc_code);*/
					remoteAddressObj.setStatus("Active");
					remoteAddressObj.setPostedBy(loginempno);
					remoteAddressObj.setSubmitted_on(new Date());
					empDao.saveCompanyAddressDetails(remoteAddressObj);
					remoteAddressObjDB.setStatus("InActive");
				    empDao.updateCompanyAddressInfo(remoteAddressObjDB);
				    msg="Success";
				}else {
		    	   // msg="Error";
				}	
			 }else if((remote_line2=="" || remote_line2!="") && remoteAddressObjDB.getLine2()==null) {
					if(!remoteAddressObjDB.getLine1().equalsIgnoreCase(remote_line1) || !remoteAddressObjDB.getCity().equalsIgnoreCase(remote_city) || !remoteAddressObjDB.getState().equalsIgnoreCase(remote_state) || !remoteAddressObjDB.getZipcode().equals(remote_zipcode)) {
							
							// System.out.println("Insided  remote candidate Address changes");  || !remoteAddressObjDB.getSoc_code().equalsIgnoreCase(remote_soc_code) || !remoteAddressObjDB.getCounty().equals(remote_county)
								CompanyAdressEntity remoteAddressObj = new CompanyAdressEntity();
								remoteAddressObj.setLine1(remote_line1);
								 if(remote_line2!="") {
									 remoteAddressObj.setLine2(remote_line2);
							     }
								remoteAddressObj.setCompany_id(client_id);
								remoteAddressObj.setCompany_type(companytype1);
								remoteAddressObj.setCity(remote_city);
								remoteAddressObj.setState(remote_state);
								remoteAddressObj.setZipcode(remote_zipcode);
								/*remoteAddressObj.setCounty(remote_county);
								remoteAddressObj.setSoc_code(remote_soc_code);*/
								remoteAddressObj.setStatus("Active");
								remoteAddressObj.setPostedBy(loginempno);
								remoteAddressObj.setSubmitted_on(new Date());
								empDao.saveCompanyAddressDetails(remoteAddressObj);
								remoteAddressObjDB.setStatus("InActive");
							    empDao.updateCompanyAddressInfo(remoteAddressObjDB);
						    msg="Success";
						}else {
				    	  //  msg="Error";
						}	
			       }
			   }else {
				 //  System.out.println("Insided new remote candidate Address adding");
				   CompanyAdressEntity remoteAddressObj = new CompanyAdressEntity();
					remoteAddressObj.setLine1(remote_line1);
					 if(remote_line2!="") {
						 remoteAddressObj.setLine2(remote_line2);
				     }
					remoteAddressObj.setCompany_id(client_id);
					remoteAddressObj.setCompany_type(companytype1);
					remoteAddressObj.setCity(remote_city);
					remoteAddressObj.setState(remote_state);
					remoteAddressObj.setZipcode(remote_zipcode);
				/*	remoteAddressObj.setCounty(remote_county);
					remoteAddressObj.setSoc_code(remote_soc_code);*/
					remoteAddressObj.setStatus("Active");
					remoteAddressObj.setPostedBy(loginempno);
					remoteAddressObj.setSubmitted_on(new Date());
					empDao.saveCompanyAddressDetails(remoteAddressObj);
			        msg="Success";
			   }
		   }else {
				//System.out.println("Insided  remote candidate Address changes");
			    String companytype1="Remote/Home";
				CompanyAdressEntity remoteAddressObjDB1=empDao.getCompanyAdressDetailsById(client_id, companytype1);
				if(remoteAddressObjDB1!=null) {
					remoteAddressObjDB1.setStatus("InActive");
				    empDao.updateCompanyAddressInfo(remoteAddressObjDB1);
				}
		    }
		}
	if(clientAddressObjDB!=null) {
		//System.out.println("Insided client Address");
     if((line2=="" || line2!="") && clientAddressObjDB.getLine2()!=null) {	
	     if(!clientAddressObjDB.getLine1().equalsIgnoreCase(line1) || !clientAddressObjDB.getLine2().equalsIgnoreCase(line2) || !clientAddressObjDB.getCity().equalsIgnoreCase(city) || !clientAddressObjDB.getState().equalsIgnoreCase(state) || !clientAddressObjDB.getZipcode().equals(zipcode)) {
			//System.out.println("Insided candidate client Address changes");
			CompanyAdressEntity clientAddressObj = new CompanyAdressEntity();
			clientAddressObj.setLine1(line1);
			clientAddressObj.setLine2(line2);
			clientAddressObj.setCompany_id(client_id);
			clientAddressObj.setCompany_type(companytype);
			clientAddressObj.setCity(city);
			clientAddressObj.setState(state);
			clientAddressObj.setZipcode(zipcode);
			clientAddressObj.setStatus("Active");
			clientAddressObj.setPostedBy(loginempno);
			clientAddressObj.setSubmitted_on(new Date());
			empDao.saveCompanyAddressDetails(clientAddressObj);
			clientAddressObjDB.setStatus("InActive");
		    empDao.updateCompanyAddressInfo(clientAddressObjDB);
		    msg="Success";
		  }else {
			//	System.out.println("Insided candidate client Address no changes");
    	        //msg="Error";
		    }
		 }else if((line2=="" || line2!="") && clientAddressObjDB.getLine2()==null) {
			 if(!clientAddressObjDB.getLine1().equalsIgnoreCase(line1) || !clientAddressObjDB.getCity().equalsIgnoreCase(city) || !clientAddressObjDB.getState().equalsIgnoreCase(state) || !clientAddressObjDB.getZipcode().equals(zipcode)) {
				//	System.out.println("Insided candidate client Address changes");
					CompanyAdressEntity clientAddressObj = new CompanyAdressEntity();
					clientAddressObj.setLine1(line1);
					clientAddressObj.setLine2(line2);
					clientAddressObj.setCompany_id(client_id);
					clientAddressObj.setCompany_type(companytype);
					clientAddressObj.setCity(city);
					clientAddressObj.setState(state);
					clientAddressObj.setZipcode(zipcode);
					clientAddressObj.setStatus("Active");
					clientAddressObj.setPostedBy(loginempno);
					clientAddressObj.setSubmitted_on(new Date());
					empDao.saveCompanyAddressDetails(clientAddressObj);
					clientAddressObjDB.setStatus("InActive");
				    empDao.updateCompanyAddressInfo(clientAddressObjDB);
				    msg="Success";
				  }else {
					//	System.out.println("Insided candidate client Address no changes");
		    	        //msg="Error";
				    } 
		      } 
	      }
		}
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
      return msg;
      
      
      
	}
	
	@Override
	public String updateOtherClientDetails(String client_name, String client_mgr, String client_mgr_email,
			String client_mgr_extn, String client_emp_email, String client_emp_extn, Integer client_id,
			String candidate_id, String line1, String line2, String city, String state, String zipcode,
			String clienttype, Integer loginempno, String fed_id, Integer payRate_Id) {
		String msg=null;
		String emptype=null;
		Integer candidate_Id=0;
		try {
		if (candidate_id!="") {
			candidate_Id = Integer.parseInt(candidate_id);
		}
		CandidateDetailedInfo candiObj=empDao.getCandidateDetailedInfoById(candidate_Id);
		if(candiObj!=null) {
			emptype=candiObj.getEmp_type();
		}
		
		System.out.println("***client type OTHER*****"+client_id+clienttype);
		ClientDetailsEntity clientObjDB=empDao.getClientDetailsById(client_id,emptype);
	//	System.out.println("***client type from DB in other client details*****"+clientObjDB.getClient_type());
		if(clientObjDB!=null) {
		CompanyAdressEntity clientAddressObjDB=empDao.getCompanyAdressDetailsById(client_id, clientObjDB.getClient_type());
	//	System.out.println("***client type from DB in other client Address details*****"+clientObjDB.getClient_type());
		//if(!clientObjDB.getClientName().equalsIgnoreCase(client_name) || !clientObjDB.getClient_mgr().equalsIgnoreCase(client_mgr) || !clientObjDB.getClient_mgr_email().equalsIgnoreCase(client_mgr_email) || !clientObjDB.getClient_mgr_extn().equalsIgnoreCase(client_mgr_extn) || !clientObjDB.getEmp_mailat_client().equalsIgnoreCase(client_emp_email) || !clientObjDB.getEmp_extnat_client().equalsIgnoreCase(client_emp_extn) || clientObjDB.getFed_id().equalsIgnoreCase(fed_id) || clientObjDB.getProject_name().equalsIgnoreCase(project_name)) {
		
		ClientDetailsHistoryEntity clientHistoyObj=new ClientDetailsHistoryEntity();
		clientHistoyObj.setClient_id(client_id);
		clientHistoyObj.setClientName(clientObjDB.getClientName());
		clientHistoyObj.setFed_id(clientObjDB.getFed_id());
		clientHistoyObj.setClient_mgr(clientObjDB.getClient_mgr());
		clientHistoyObj.setClient_mgr_email(clientObjDB.getClient_mgr_email());
		clientHistoyObj.setClient_mgr_extn(clientObjDB.getClient_mgr_extn());
		clientHistoyObj.setEmp_mailat_client(clientObjDB.getEmp_mailat_client());
		clientHistoyObj.setEmp_extnat_client(clientObjDB.getEmp_extnat_client());
		clientHistoyObj.setSubmittedOn(clientObjDB.getSubmittedOn());
		clientHistoyObj.setClient_type(clientObjDB.getClient_type());
		/*clientHistoyObj.setCounty(clientObjDB.getCounty());
		clientHistoyObj.setSoc_code(clientObjDB.getSoc_code());*/
		//if(emptype.equalsIgnoreCase("W2")) {
		clientHistoyObj.setPayrate_id(clientObjDB.getPayrate_id());
		//}
		empDao.updateClientHistoryDetails(clientHistoyObj);

		clientObjDB.setClientName(client_name);
		clientObjDB.setFed_id(fed_id);
		clientObjDB.setClient_mgr(client_mgr);
		clientObjDB.setClient_mgr_email(client_mgr_email);
		clientObjDB.setClient_mgr_extn(client_mgr_extn);
		clientObjDB.setEmp_mailat_client(client_emp_email);
		clientObjDB.setEmp_extnat_client(client_emp_extn);
		clientObjDB.setPosted_by(loginempno);
		clientObjDB.setSubmittedOn(new Date());
		clientObjDB.setClient_type(clienttype);
		empDao.updateClientDetails(clientObjDB);
		msg="Success";
		
     //  }else {
   	  //  msg="Error";
     //  }
		//System.out.println("work_authorization&&&&&&"+work_authorization);
	if(clientAddressObjDB!=null) {
		//System.out.println("Insided other client Address");
     if((line2=="" || line2!="") && clientAddressObjDB.getLine2()!=null) {	
	     if(!clientAddressObjDB.getLine1().equalsIgnoreCase(line1) || !clientAddressObjDB.getLine2().equalsIgnoreCase(line2) || !clientAddressObjDB.getCity().equalsIgnoreCase(city) || !clientAddressObjDB.getState().equalsIgnoreCase(state) || !clientAddressObjDB.getZipcode().equals(zipcode)) {
		//	System.out.println("Insided other client Address changes");
			CompanyAdressEntity clientAddressObj = new CompanyAdressEntity();
			clientAddressObj.setLine1(line1);
			clientAddressObj.setLine2(line2);
			clientAddressObj.setCompany_id(client_id);
			clientAddressObj.setCompany_type(clienttype);
			clientAddressObj.setCity(city);
			clientAddressObj.setState(state);
			clientAddressObj.setZipcode(zipcode);
			clientAddressObj.setStatus("Active");
			clientAddressObj.setPostedBy(loginempno);
			clientAddressObj.setSubmitted_on(new Date());
			empDao.saveCompanyAddressDetails(clientAddressObj);
			clientAddressObjDB.setStatus("InActive");
		    empDao.updateCompanyAddressInfo(clientAddressObjDB);
		    msg="Success";
		  }else {
			//	System.out.println("Insided other client Address no changes");
    	        //msg="Error";
		    }
		 }else if((line2=="" || line2!="") && clientAddressObjDB.getLine2()==null) {
			 if(!clientAddressObjDB.getLine1().equalsIgnoreCase(line1) || !clientAddressObjDB.getLine2().equalsIgnoreCase(line2) || !clientAddressObjDB.getCity().equalsIgnoreCase(city) || !clientAddressObjDB.getState().equalsIgnoreCase(state) || !clientAddressObjDB.getZipcode().equals(zipcode)) {
					//System.out.println("Insided other client Address changes");
					CompanyAdressEntity clientAddressObj = new CompanyAdressEntity();
					clientAddressObj.setLine1(line1);
					clientAddressObj.setLine2(line2);
					clientAddressObj.setCompany_id(client_id);
					clientAddressObj.setCompany_type(clienttype);
					clientAddressObj.setCity(city);
					clientAddressObj.setState(state);
					clientAddressObj.setZipcode(zipcode);
					clientAddressObj.setStatus("Active");
					clientAddressObj.setPostedBy(loginempno);
					clientAddressObj.setSubmitted_on(new Date());
					empDao.saveCompanyAddressDetails(clientAddressObj);
					clientAddressObjDB.setStatus("InActive");
				    empDao.updateCompanyAddressInfo(clientAddressObjDB);
				    msg="Success";
				  }else {
					//	System.out.println("Insided other client Address no changes");
		    	        //msg="Error";
				    } 
		       }
	         }
		 }
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
      return msg;
	}
	
	@Override
	public String updatepayratedetails(String billrate, String pay_rate, String invoice_terms, String proj_startDate,
			String proj_endDate, String p_term, Integer customer_Id, Integer vendorId, Integer candidate_id,
			Integer payRateId, Integer loginmpno, String payrolltype, String invoice_period) {
		String msg=null;
		try {
			String emptype=null;
			/*Integer invoiceperiod=0;
			if (!invoice_period.isEmpty()) {
				invoiceperiod = Integer.parseInt(invoice_period);
			 }*/
			
			CandidateDetailedInfo candidateObj=empDao.getCandidateDetailedInfoById(candidate_id);
			if(candidateObj!=null) {
				emptype=candidateObj.getEmp_type();
			}
		EmpPayRateDetails payrateObjDB=empDao.getPayRateDetailsById(payRateId,emptype);
		if(payrateObjDB!=null) {
		EmpPayRateDetailsHistory payratehistoryObj=new EmpPayRateDetailsHistory();
		payratehistoryObj.setPayrate_id(payRateId);
		payratehistoryObj.setPayrate(payrateObjDB.getPayrate());
		payratehistoryObj.setBillrate(payrateObjDB.getBillrate());
		payratehistoryObj.setCustomer_id(payrateObjDB.getCustomer_id());
		payratehistoryObj.setVendorid(payrateObjDB.getVendorid());
		payratehistoryObj.setPayment_terms(payrateObjDB.getPayment_terms());
		payratehistoryObj.setInvoice_terms(payrateObjDB.getInvoice_terms());
		payratehistoryObj.setProj_startDate(payrateObjDB.getProj_startDate());
		payratehistoryObj.setProj_endDate(payrateObjDB.getProj_endDate());
		payratehistoryObj.setStatus(payrateObjDB.getStatus());
		payratehistoryObj.setCandidate_id(payrateObjDB.getCandidate_id());
		payratehistoryObj.setSubmittedOn(payrateObjDB.getSubmittedOn());
		payratehistoryObj.setPostedBy(payrateObjDB.getPostedBy());
		payratehistoryObj.setProject_status(payrateObjDB.getProject_status());
		payratehistoryObj.setPayroll_type(payrateObjDB.getPayroll_type());
		payratehistoryObj.setInvoice_period(invoice_period);
		empDao.savePayRateHistoryDetails(payratehistoryObj);
			
		//EmpPayRateDetails payrateObj=new EmpPayRateDetails();
		payrateObjDB.setPayrate(pay_rate);
		payrateObjDB.setBillrate(billrate);
		payrateObjDB.setCustomer_id(customer_Id);
		payrateObjDB.setVendorid(vendorId);
		payrateObjDB.setPayment_terms(p_term);
		payrateObjDB.setInvoice_terms(invoice_terms);
		payrateObjDB.setInvoice_period(invoice_period);
		System.out.println("invoice period ***************"+invoice_period);
		if(!payrateObjDB.getProj_startDate().equals(proj_startDate) || !payrateObjDB.getProj_endDate().equals(proj_endDate)) {
			System.out.println("project date changes inside if ***************");
			ProjectDetailsHistory projectHistoryObj=new ProjectDetailsHistory();
			projectHistoryObj.setPayrate_id(payRateId);
			projectHistoryObj.setCustomer_id(customer_Id);
			projectHistoryObj.setVendorid(vendorId);
			projectHistoryObj.setCandidate_id(candidate_id);
			projectHistoryObj.setProj_startDate(proj_startDate);
			projectHistoryObj.setProj_endDate(proj_endDate);
			projectHistoryObj.setPostedBy(loginmpno);
			projectHistoryObj.setSubmittedOn(new Date());
			empDao.saveProjectDetailsHistory(projectHistoryObj);
			payrateObjDB.setProj_startDate(proj_startDate);
			payrateObjDB.setProj_endDate(proj_endDate);
		}else {
			System.out.println("project date don't changed inside else ***************");
			payrateObjDB.setProj_startDate(proj_startDate);
			payrateObjDB.setProj_endDate(proj_endDate);
		}
		payrateObjDB.setStatus(payrateObjDB.getStatus());
		//payrateObjDB.setStatus("Active");
		payrateObjDB.setCandidate_id(candidate_id);
		payrateObjDB.setSubmittedOn(new Date());
		payrateObjDB.setPostedBy(loginmpno);
		//empDao.savePayRateBillRateDetails(payrateObj);
		payrateObjDB.setProject_status(payrateObjDB.getProject_status());
		payrateObjDB.setPayroll_type(payrolltype);
		//payrateObjDB.setStatus("InActive");
		empDao.updatePayRateDetails(payrateObjDB);
		   msg="Success";
	      }
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return msg;
	}
	@Override
	public BasicDetailsDto viewConsultantInfo(String candidate_id) {
		BasicDetailsDto consultantObj=null;
		try {
			Integer candidateId = 0;
			if (candidate_id!="") {
				candidateId = Integer.parseInt(candidate_id);
			}
			consultantObj = empDao.viewConsultantInfo(candidateId);
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return consultantObj;
	}
	@Override
	public String updateConsultantsBasicInfo(String ssn_no, String firstName, String recrutier_name,
			String cont_team_name, String email_id, String phne_no, String dob, String joining_Date, String designation,
			String middleName, String familyName, Integer candidateId, String bgcType, String c2cType, String work_auth,
			Integer loginempno,String phne_no2, String phne_no3, String ctype2, String ctype3, String validateby, String payrolltype) {
		 String message=null;
         try {
  EmpBasicDetailsEntity basicDetailDBObj=empDao.getEmployeeDetailsByCandidateId(candidateId);
  CandidateDetailedInfo candidateInfoDBObj = empDao.getCandidateDetailedInfoById(candidateId);
  
  
  Integer validateby_flag=0;
  if(!validateby.isEmpty()) {
  	validateby_flag=Integer.parseInt(validateby);
  }
  
  if(!ssn_no.isEmpty() || !firstName.isEmpty() || !middleName.isEmpty() || !familyName.isEmpty() || !email_id.isEmpty() 
		  || !dob.isEmpty() || !phne_no.isEmpty() || !phne_no2.isEmpty() || !phne_no3.isEmpty()  || !ctype2.isEmpty() 
		  || !ctype3.isEmpty()) {
    String bytes_ssn_emp = Base64.encode(ssn_no.getBytes());
    basicDetailDBObj.setSsn_no(bytes_ssn_emp);
    basicDetailDBObj.setFirst_name(firstName);
    basicDetailDBObj.setMiddle_name(middleName);
    basicDetailDBObj.setFamily_name(familyName);
    basicDetailDBObj.setFullName(firstName+" "+familyName);
      basicDetailDBObj.setEmail(email_id);
      basicDetailDBObj.setContact_no1(phne_no);
      if(!phne_no2.isEmpty()) {
					basicDetailDBObj.setContact_no2(phne_no2);
					basicDetailDBObj.setContact_no_type2(ctype2);
				}else {
					basicDetailDBObj.setContact_no2("");
					basicDetailDBObj.setContact_no_type2("");
				}
				if(!phne_no3.isEmpty()) {
					basicDetailDBObj.setContact_no3(phne_no3);
					basicDetailDBObj.setContact_no_type3(ctype3);
				}else {
					basicDetailDBObj.setContact_no3("");
					basicDetailDBObj.setContact_no_type3("");
				}
      basicDetailDBObj.setPosted_by(loginempno);
      basicDetailDBObj.setDob(dob);
      basicDetailDBObj.setSubmit_date(new Date());
      empDao.updateBasicDetails(basicDetailDBObj);
     }
  if(!designation.isEmpty() || !cont_team_name.isEmpty() || !recrutier_name.isEmpty() || !bgcType.isEmpty() 
		  || !c2cType.isEmpty() || !work_auth.isEmpty() ||  !payrolltype.isEmpty()|| validateby_flag!=0) {
	  CandidateDetailedInfo candDetailObj = new CandidateDetailedInfo();
	  java.sql.Date joiningDate=null;
	  SimpleDateFormat sdf=new SimpleDateFormat("MM/dd/yyyy");  
      if(joining_Date != null && !joining_Date.isEmpty()) {
          java.util.Date joining_Date1 = (java.util.Date)sdf.parse(joining_Date);        
          joiningDate = new java.sql.Date(joining_Date1.getTime());
       }
      candDetailObj.setCandidateInfo(basicDetailDBObj);
      candDetailObj.setJoining_date(joiningDate);
      candDetailObj.setRecruiter_name(recrutier_name);
      candDetailObj.setContact_team_person(cont_team_name);
      candDetailObj.setDesignation(designation);
      candDetailObj.setBgc_type(bgcType);
      candDetailObj.setC2c_type(c2cType);
      candDetailObj.setWork_authorization(work_auth);
      candDetailObj.setStatus("Active");
      candDetailObj.setEmp_type(candidateInfoDBObj.getEmp_type());
	  candDetailObj.setPosted_by(loginempno);
	  candDetailObj.setSubmitted_on(new Date());
	  candDetailObj.setValidateby_flag(validateby_flag); 
	  //candDetailObj.setPayroll_type(payrolltype);
	  empDao.saveCandidateDetailedInfo(candDetailObj);
	  
	  Date joinDateDb=candidateInfoDBObj.getJoining_date();
	  if(joinDateDb!=null && joiningDate!=null) {
		  if(joinDateDb.compareTo(joiningDate) == 0){
				 
		  }else {
			  Integer history_id=empDao.getJoinHistoryId(candidateId);
			  if(history_id!=null){
				    EmpJoinHistorty joinHistoryObjDb=empDao.getJoinHistoryByCandidateId(history_id);
					if(joinHistoryObjDb!=null) {
						     joinHistoryObjDb.setJoindate(joinDateDb);
							 empDao.updateJoinHistory(joinHistoryObjDb);
					    }
			  }else {
				    EmpJoinHistorty joinHistoryObj=new EmpJoinHistorty();
					 joinHistoryObj.setJoindate(joiningDate);
					 joinHistoryObj.setEstatus("Joined");
					 joinHistoryObj.setPosted_by(loginempno);
					 joinHistoryObj.setSubmitted_on(new Date());
					 joinHistoryObj.setCandidate_id(candidateId);
					 empDao.saveJoinHistory(joinHistoryObj);
			     }
		  }
	  }
	  candidateInfoDBObj.setStatus("InActive");
	  empDao.updateCandidateDetailedInfo(candidateInfoDBObj);
    }
  
  message="Basic Details Updated Successfuly";

  } catch (Exception e) {
         logger.info(e.getMessage(),e);
  }
         return message;
	}
	
	@Override
	public String saveConsultantDocs1099(MultipartFile wA_copy, MultipartFile w9_copy, MultipartFile sSNCopy,
			MultipartFile mgr_mail_proofDoc,String candidate_id, Integer loginempno, String wafromdate, String waexpirydate) {
		String msg=null;
		try {
			Integer candidate_Id=0;
			Integer docId=0;
			if (candidate_id!="") {
				candidate_Id = Integer.parseInt(candidate_id);
			}
			EmpDocumentsEntity pdocobj=new EmpDocumentsEntity();
			pdocobj.setCandidate_id(candidate_Id);
			pdocobj.setStatus("Active");
			pdocobj.setPostedBy(loginempno);
			pdocobj.setSubmit_date(new Date());
			if(wA_copy!=null) {
			if(!wA_copy.getOriginalFilename().isEmpty()) {
				pdocobj.setFile_name(wA_copy.getOriginalFilename());
				pdocobj.setFiletype("Work_Authorization_Copy");
				pdocobj.setFrom_date(wafromdate);
				pdocobj.setExpiry_date(waexpirydate);
				commonObj.fileToDirectory(candidate_Id,wA_copy,null,null);
				docId=empDao.saveConsultantDocs(pdocobj);
			   }
			}
			if(w9_copy!=null) {
			if(!w9_copy.getOriginalFilename().isEmpty()) {
				pdocobj.setFile_name(w9_copy.getOriginalFilename());
				pdocobj.setFiletype("W_9_Copy");
				commonObj.fileToDirectory(candidate_Id,w9_copy,null,null);
				docId=empDao.saveConsultantDocs(pdocobj);
			  }
			}
			if(sSNCopy!=null) {
			if(!sSNCopy.getOriginalFilename().isEmpty()) {
				pdocobj.setFile_name(sSNCopy.getOriginalFilename());
				pdocobj.setFiletype("SSN_Copy");
				commonObj.fileToDirectory(candidate_Id,sSNCopy,null,null);
				docId=empDao.saveConsultantDocs(pdocobj);
			   }
			}
			if(mgr_mail_proofDoc!=null) {
			if(!mgr_mail_proofDoc.getOriginalFilename().isEmpty()) {
				pdocobj.setFile_name(mgr_mail_proofDoc.getOriginalFilename());
				pdocobj.setFiletype("Manager_Approved_Email_Doc");
				commonObj.fileToDirectory(candidate_Id,mgr_mail_proofDoc,null,null);
				docId=empDao.saveConsultantDocs(pdocobj);
			   }
			}
			
		if(docId!=0) {
			msg="Success";
			/*PageStatusEntity pagestsObj=empDao.getRedirectPageStatus(candidate_id);
			pagestsObj.setDocument_status(1);
			pagestsObj.setDocument_submitdate(new Date());
			empDao.updatePageStatus(pagestsObj);*/
		     }
		   //sendmail.sendMail(frommail, toemail, toName, comments, subject);
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return msg;
	}
	
	@Override
	public AttachmentBean getFilesByCandidateId(String candidate_id) {
		 AttachmentBean filebean = new AttachmentBean();
		try {
			Integer candidate_Id=0;
			if (candidate_id!="") {
				candidate_Id = Integer.parseInt(candidate_id);
			}
			List<FileBean> otherdoclist1099=new LinkedList<>();
			 List<DocEmpBean> view1099docs=empDao.viewDocumentsByCandidateId(candidate_Id);
			 for (DocEmpBean docObj : view1099docs) {
				    String filetype=docObj.getFiletype();
					String filename=docObj.getFile_name();
					
					  switch (filetype) {
                      case "Work_Authorization_Copy":
                    	   filebean.setWorkauthcopy(filename);
                    	   filebean.setWastartdate(docObj.getStartdate());
                    	   filebean.setWaenddate(docObj.getExpirydate());
                            break;
                      case "SSN_Copy":
                    	    filebean.setSsncopy(filename);
                            break;
                      case "W_9_Copy":
                    	    filebean.setW9copy(filename);
                            break;
                      case "Manager_Approved_Email_Doc":
                    	   filebean.setMgmtaproval(filename);
                           break;
                      case "additionaldocs_1099":
        					FileBean fBean = new FileBean();
        					fBean.setFileId(docObj.getDocument_id());
        					fBean.setInputval(docObj.getInputval());
        					fBean.setFileType(docObj.getFiletype());
        					fBean.setFileName(docObj.getFile_name());
        					otherdoclist1099.add(fBean);
        					filebean.setAdddocs1099(otherdoclist1099);
        					break;
                      default:
                            System.out.println("default");
                   }

					  
				/*	if(filetype.equalsIgnoreCase("Work_Authorization_Copy")) {
						 filebean.setWorkauthcopy(filename);
					}
					else if(filetype.equalsIgnoreCase("SSN_Copy")) {
						filebean.setSsncopy(filename);
					}
					else if(filetype.equalsIgnoreCase("W_9_Copy")) {
						filebean.setW9copy(filename);
					}else if(filetype.equalsIgnoreCase("Manager_Approved_Email_Doc")) {
						filebean.setMgmtaproval(filename);
			        }else if(filetype.equalsIgnoreCase("additionaldocs_C2C")) {
			        	
			        }else if(filetype.equalsIgnoreCase("additionaldocs_1099")) {
						filebean.setMgmtaproval(filename);
			        }*/
			 }
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return filebean;
	}
	@Override
	public String saveConsultantDocs(CommonsMultipartFile[] othr_1099_file, String filetype, String[] other_1099_doc,
			String candidate_id, Integer loginempno) {
		String msg=null;
		Integer docId=0;
		try {
			Integer candidateId=0;
			if (candidate_id!="") {
				candidateId = Integer.parseInt(candidate_id);
			}
			
			 if(othr_1099_file!=null) {
			 for (int i=0;i<othr_1099_file.length;i++) {
				 if(!othr_1099_file[i].getOriginalFilename().isEmpty()) {
          	     EmpDocumentsEntity docobj=new EmpDocumentsEntity();
 			     docobj.setCandidate_id(candidateId);
 			     docobj.setPostedBy(loginempno);
 			     docobj.setSubmit_date(new Date());
 			     docobj.setStatus("Active");
 			     docobj.setFile_name(othr_1099_file[i].getOriginalFilename());
 			     docobj.setFiletype(filetype);
 			     docobj.setInputvalue(other_1099_doc[i]);
 			     commonObj.fileToDirectory(candidateId,othr_1099_file[i],null,null);
 			     docId=empDao.saveConsultantDocs(docobj);
                    } 
			     }
			 }
	if(docId!=0) {
			msg="Success";
			/*PageStatusEntity pagestsObj=empDao.getRedirectPageStatus(candidate_id);
			pagestsObj.setDocument_status(1);
			pagestsObj.setDocument_submitdate(new Date());
			empDao.updatePageStatus(pagestsObj);*/
		  }
			//sendmail.sendMail(frommail, toemail, toName, comments, subject);
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return msg;
	}
	@Override
	public void updatePageStatus(String candidate_id) {
		try {
			Integer candidate_Id=0;
			if (candidate_id!="") {
				candidate_Id = Integer.parseInt(candidate_id);
			}
			PageStatusEntity pagestsObj=empDao.getRedirectPageStatus(candidate_Id);
			pagestsObj.setDocument_status(1);
			pagestsObj.setDocument_submitdate(new Date());
			empDao.updatePageStatus(pagestsObj);
			//sendmail.sendMail(frommail, toemail, toName, comments, subject);
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
	}
	@Override
	public ViewDocBean getConsultantDocsByCandidateId(String candidate_id, String empType) {
		   ViewDocBean viewdocObj = new ViewDocBean();
		   List<DocEmpBean> view1099docs=null;
			try {
				Integer candidateId=0;
				if (candidate_id!="") {
					candidateId = Integer.parseInt(candidate_id);
				}
				 List<FileBean> othreodclistc2c=new LinkedList<>();
				 List<FileBean> otherdoclist1099=new LinkedList<>();
				 view1099docs=empDao.viewDocumentsByCandidateId(candidateId);
				 
				 if(empType.equalsIgnoreCase("C2C")) {
					 for (DocEmpBean docObj : view1099docs) {
						 String filetype=docObj.getFiletype();
						 if(filetype.equalsIgnoreCase("additionaldocs_C2C")) {
					        	FileBean fBean=new FileBean();
								fBean.setFileId(docObj.getDocument_id());
								fBean.setFileName(docObj.getFile_name());
								fBean.setFileType(docObj.getFiletype());
								fBean.setInputval(docObj.getInputval());
								othreodclistc2c.add(fBean);
								viewdocObj.setAdddocsC2C(othreodclistc2c); 
					        }
					 }
					 
				 }else if(empType.equalsIgnoreCase("1099")){
					 for (DocEmpBean docObj : view1099docs) {
						    String filetype=docObj.getFiletype();
							
						    switch (filetype) {
		                      case "Work_Authorization_Copy":
		                    	    viewdocObj.setWafilename(docObj.getFile_name());
									viewdocObj.setWafileid(docObj.getDocument_id());
									viewdocObj.setWastartdate(docObj.getStartdate());
									viewdocObj.setWaenddate(docObj.getExpirydate());
		                            break;
		                      case "SSN_Copy":
		                    	    viewdocObj.setSsnfilename(docObj.getFile_name());
									viewdocObj.setSsnfileid(docObj.getDocument_id());
		                            break;
		                      case "W_9_Copy":
		                    	    viewdocObj.setW9filename(docObj.getFile_name());
									viewdocObj.setW9fileid(docObj.getDocument_id());
		                            break;
		                      case "Manager_Approved_Email_Doc":
		                    	    viewdocObj.setMgr_apr_mail(docObj.getFile_name());
		                    	    viewdocObj.setMgrfileid(docObj.getDocument_id());
		                            break;		                      
		                      case "additionaldocs_1099":
		                    	    FileBean fBean=new FileBean();
									fBean.setFileId(docObj.getDocument_id());
									fBean.setFileName(docObj.getFile_name());
									fBean.setFileType(docObj.getFiletype());
									fBean.setInputval(docObj.getInputval());
									otherdoclist1099.add(fBean);
									viewdocObj.setAdddocs1099(otherdoclist1099);
		                            break;
		                      default:
		                            System.out.println("default");
		                   }						    					
					 }
				 }else {
					 
				 }
				
			} catch (Exception e) {
				logger.info(e.getMessage(),e);
			}
		return viewdocObj;
	 }
	@Override
	public String updateDocumentById(MultipartFile editFile, String fileId, String candidate_id,Integer loginempno,String fileType) {
		String msg=null;
		try {
			Integer candidateId=0;
			if (candidate_id!="") {
				candidateId = Integer.parseInt(candidate_id);
			}
			Integer docId=0;
			if (fileId!="") {
				docId = Integer.parseInt(fileId);
			}
	EmpDocumentsEntity doOobjDB=empDao.getDocumentByDocId(docId);
	if(editFile!=null) {
		if(!editFile.getOriginalFilename().isEmpty()) {
			System.out.println("-------**************"+editFile.getOriginalFilename());
			EmpDocumentsHistoryEntity docHistoryObj=new EmpDocumentsHistoryEntity();
			docHistoryObj.setDocument_id(doOobjDB.getDocument_id());
			docHistoryObj.setCandidate_id(doOobjDB.getCandidate_id());
			docHistoryObj.setFile_name(doOobjDB.getFile_name());
			docHistoryObj.setFiletype(doOobjDB.getFiletype());
			docHistoryObj.setPostedBy(doOobjDB.getPostedBy());
			docHistoryObj.setSubmit_date(doOobjDB.getSubmit_date());
			docHistoryObj.setStatus(doOobjDB.getStatus());
			empDao.saveDocumentsHistory(docHistoryObj);
			doOobjDB.setFile_name(editFile.getOriginalFilename());
			doOobjDB.setFiletype(fileType);
			doOobjDB.setPostedBy(loginempno);
			doOobjDB.setSubmit_date(new Date());
			empDao.updateDocument(doOobjDB);
			msg="Success";
			try {
				commonObj.fileToDirectory(candidateId, editFile, null, null);
			} catch (MessagingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	/*	docobj.setFile_name(editFile.getOriginalFilename());
		docobj.setSubmit_date(new Date());
		docobj.setPostedBy(loginempno);
		commonObj.fileToDirectory(candidateId,editFile,null,null);
		empDao.updateDocument(docobj);
		msg="Success";*/
	   }
			//sendmail.sendMail(frommail, toemail, toName, comments, subject);
	  } catch (Exception e) {
			logger.info(e.getMessage(),e);
	   }
		return msg;
	}
	@Override
	public String saveConsultantDoc(MultipartFile addFile, String filetype, String candidate_id, Integer loginempno) {
		String msg=null;
		Integer docId=0;
		try {
			Integer candidate_Id=0;
			if (candidate_id!="") {
				candidate_Id = Integer.parseInt(candidate_id);
			 }
			     EmpDocumentsEntity docobj=new EmpDocumentsEntity();
			     docobj.setCandidate_id(candidate_Id);
			     docobj.setPostedBy(loginempno);
			     docobj.setSubmit_date(new Date());
			     docobj.setStatus("Active");
			 if(addFile!=null) {
				 if(!addFile.getOriginalFilename().isEmpty()) {
 			     docobj.setFile_name(addFile.getOriginalFilename());
 			     docobj.setFiletype(filetype);
 			     commonObj.fileToDirectory(candidate_Id,addFile,null,null);
 			     docId=empDao.saveConsultantDocs(docobj);
			     }
			 }
	if(docId!=0) {
			msg="Success";
		  }
	} catch (Exception e) {
		logger.info(e.getMessage(),e);
	}
	return msg;
   }

	@Override
	public String saveConsultantBankDetails(String accountNo, String bankname, String swiftcode, String ibancode,
			String routingno, MultipartFile file1, String candidate_id, Integer loginempno,String paymentMode,String vendor) {
		String message = null;
		try {
			Integer candidate_Id=0;
			if (candidate_id!="") {
				candidate_Id = Integer.parseInt(candidate_id);
			}
			Integer vendorid=0;
			if(vendor!=null){
				vendorid=Integer.parseInt(vendor);	
			}
			BankPaymentDetailsEntity bankDtlObj = new BankPaymentDetailsEntity();
			bankDtlObj.setCandidate_id(candidate_Id);
			bankDtlObj.setSubmitted_date(new Date());
			bankDtlObj.setPosted_by(loginempno);
			bankDtlObj.setStatus("Active");
			bankDtlObj.setVendorid(vendorid);
			bankDtlObj.setAccountNo(accountNo);
			bankDtlObj.setBank_name(bankname);
			bankDtlObj.setSwift_Code(swiftcode);
			bankDtlObj.setIban_Code(ibancode);
			bankDtlObj.setBankRoutingNo(routingno);
			if(paymentMode!=null){
				// int ammount = Integer.parseInt(bankamount);
				//Integer ammount = Integer.parseInt(bankamount);
				bankDtlObj.setPayment_mode(paymentMode);
			   }
				if(file1!=null) {
					if (!file1.getOriginalFilename().isEmpty()) {
						bankDtlObj.setBankfilename(file1.getOriginalFilename());
						commonObj.fileToDirectory(candidate_Id, file1, null, null);
					}
				}
			
			Integer bankpkId = empDao.saveConsultantBankDetails(bankDtlObj);
						
			if (bankpkId!=null) {
				PageStatusEntity pagestsObj=empDao.getRedirectPageStatus(candidate_Id);
				pagestsObj.setBank_status(1);
				pagestsObj.setBank_submitdate(new Date());
				pagestsObj.setPostedBy(loginempno);
				empDao.updatePageStatus(pagestsObj);
				message = "Success";
			} else {
				message = "Error";
			}
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return message;
	}

	@Override
	public List<BankPaymentDetailsEntity> viewConsultantBankDetails(String candidate_id) {
		List<BankPaymentDetailsEntity> viewbankList = null;
		try {
			Integer candidate_Id = Integer.parseInt(candidate_id);
			viewbankList = empDao.viewConsultantBankDetails(candidate_Id);
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return viewbankList;
	}

	/*@Override
	public BankDetails_DTO viewConsultantBankDetailsByCandidateId(String candidate_id) {
		BankDetails_DTO bankObj = null;
		try {
			Integer candidate_id = Integer.parseInt(candidate_id);
			bankObj = empDao.viewConsultantBankDetailsByCandidateId(candidate_id);
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return bankObj;
	}*/

	@Override
	public String updateConsultantBankDetails(String[] accountNo, String[] bankname, String[] swiftcode,
			String[] ibancode, String[] routingno, CommonsMultipartFile[] bfile2, String candidate_id,
			String[] payment_idb, Integer loginempno) {
		   String message = null;
			try {
				        Integer candidate_Id = Integer.parseInt(candidate_id);
				        for (int i = 0; i < payment_idb.length; i++) {
							int payment_id=Integer.parseInt(payment_idb[i]);
							BankPaymentDetailsEntity updateBankObj = empDao.getConsultantBankDetailsById(payment_id);
							if(updateBankObj!=null) {
							updateBankObj.setAccountNo(accountNo[i]);
							updateBankObj.setBank_name(bankname[i]);
							updateBankObj.setSwift_Code(swiftcode[i]);
							updateBankObj.setIban_Code(ibancode[i]);
							updateBankObj.setBankRoutingNo(routingno[i]);
							if(bfile2[i]!=null) {
							if (!bfile2[i].getOriginalFilename().isEmpty()) {
									updateBankObj.setBankfilename(bfile2[i].getOriginalFilename());
									commonObj.fileToDirectory(candidate_Id, bfile2[i], null, null);
								}
							}
							empDao.updateConsultantBankDetails(updateBankObj);
							message = "Consultant Bank Details Updated Successfully";
						}
						else {
							message = "Something Went Wrong";
					      }
				    }
			} catch (Exception e) {
				logger.info(e.getMessage(), e);
			}
			return message;

	}

	@Override
	public String updateConsultantBankDetailsC2C(String accountNo, String bankname, String swiftcode, String ibancode,
			String routingno, MultipartFile file, String candidate_id, Integer loginempno, String paymentMode, String vendor,
			String payment_id) {
		 String message = null;
			try {
				        	Integer candidate_Id = Integer.parseInt(candidate_id);
							int paymentId=Integer.parseInt(payment_id);
							Integer	vendorid=Integer.parseInt(vendor);	
							BankPaymentDetailsEntity updateBankObj = empDao.getConsultantBankDetailsById(paymentId);
							if(updateBankObj!=null) {
								if(paymentMode.equalsIgnoreCase("DirectDeposit")) {
									updateBankObj.setAccountNo(accountNo);
									updateBankObj.setBank_name(bankname);
									updateBankObj.setSwift_Code(swiftcode);
									updateBankObj.setIban_Code(ibancode);
									updateBankObj.setBankRoutingNo(routingno);
									if(file!=null) {
										if (!file.getOriginalFilename().isEmpty()) {
												updateBankObj.setBankfilename(file.getOriginalFilename());
												commonObj.fileToDirectory(candidate_Id, file, null, null);
											}
										}
								}else {
									updateBankObj.setAccountNo(null);
									updateBankObj.setBank_name(null);
									updateBankObj.setSwift_Code(null);
									updateBankObj.setIban_Code(null);
									updateBankObj.setBankRoutingNo(null);
									updateBankObj.setBankfilename(null);
								}
							updateBankObj.setPayment_mode(paymentMode);
							updateBankObj.setVendorid(vendorid);
							empDao.updateConsultantBankDetails(updateBankObj);
							message = "Consultant Bank Details Updated Successfully";
							}
						else {
							message = "Something Went Wrong";
					      }
			} catch (Exception e) {
				logger.info(e.getMessage(), e);
			}
			return message;
	  }

	@Override
	public List<WorkAuthorization> getWorkAuthnListForContractors() {
		List<WorkAuthorization> waList = null;
		try {
			waList = empDao.getWorkAuthnListForContractors();
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return waList;
	}

	@Override
	public void saveCompanyAddress(Integer company_id, String companytype, Integer loginempno,
			String line1, String line2, String city, String state,  String zipcode, String country) {
		try {
			CompanyAdressEntity companyAddressObj = new CompanyAdressEntity();
			companyAddressObj.setLine1(line1);
			companyAddressObj.setLine2(line2);
			companyAddressObj.setCity(city);
			companyAddressObj.setState(state);
			companyAddressObj.setZipcode(zipcode);
			companyAddressObj.setCompany_id(company_id);
			companyAddressObj.setCompany_type(companytype);
			if(!country.isEmpty()) {
				companyAddressObj.setCountry(country);	
			}
			companyAddressObj.setStatus("Active");
			companyAddressObj.setPostedBy(loginempno);
			companyAddressObj.setSubmitted_on(new Date());
			empDao.saveCompanyAddressDetails(companyAddressObj);
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
	   }

	@Override
	public void saveClientVendorDocs(MultipartFile fileName, String fileType, String candidate_id,
			Integer loginempno, Integer customer_Id, Integer vendorId) {
		try {
			Integer candidate_Id = Integer.parseInt(candidate_id);
			if(!fileName.getOriginalFilename().isEmpty()) {
				EmpDocumentsEntity pdocobj=new EmpDocumentsEntity();
				pdocobj.setFile_name(fileName.getOriginalFilename());
				pdocobj.setFiletype(fileType);
				if(customer_Id!=null) {
					pdocobj.setCustomer_id(customer_Id);
				}
				if(vendorId!=null) {
					pdocobj.setVendorid(vendorId);
				}
				pdocobj.setCandidate_id(candidate_Id);
				pdocobj.setStatus("Active");
				pdocobj.setPostedBy(loginempno);
				pdocobj.setSubmit_date(new Date());
				commonObj.fileToDirectory(candidate_Id,fileName,null,null);
				empDao.saveDocuments(pdocobj);
			}
					
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		  }
    	}

	@Override
	public String deleteConsultantDocumentByDocId(String fileId) {
		String msg = null;
		try {
			Integer docId = 0;
			if (fileId != "") {
				docId = Integer.parseInt(fileId);
			}
			msg = empDao.deleteDocumentByDocId(docId);
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return msg;
	}

	@Override
	public EmployeeDto getCanidateDetailsByCanId(String candidate_id) {
		 EmployeeDto basicObj = null;
         try {
        	 Integer candidateId = 0;
 			if (candidate_id!="") {
 				candidateId = Integer.parseInt(candidate_id);
 			   }
                basicObj = empDao.getCanidateDetailsByCanId(candidateId);
         } catch (Exception e) {
                logger.info(e.getMessage(), e);
         }
         return basicObj;
	}

	@Override
	public ClientVendorMaster_DTO viewEndClientDetailsByCandidateId(String candidate_id,String payrateId) {
		ClientVendorMaster_DTO endClient = null;
		try {
			Integer candidate_Id=0;
			if (candidate_id!="") {
				candidate_Id = Integer.parseInt(candidate_id);
			}
			CandidateDetailedInfo candiObj=empDao.getCandidateDetailedInfoById(candidate_Id);
			if(candiObj!=null) {
				String emptyp=candiObj.getEmp_type();
				/*
				if(!emptyp.equalsIgnoreCase("W2")) {
					EmpPayRateDetails parateOb=empDao.payrateDetailsByCandidateId(candidate_Id);
					if(parateOb!=null) {
						payrate_Id=parateOb.getPayrate_id();
					}
				}else {
					if(payrateId!="") {
						payrate_Id = Integer.parseInt(payrateId);
					}
				}*/
				
				Integer payrateid = 0;
				
				if (!payrateId.isEmpty()) {
					payrateid = Integer.parseInt(payrateId);
				}else {
					EmpPayRateDetails parateOb=empDao.payrateDetailsByCandidateId(candidate_Id);
					if(parateOb!=null) {
						payrateid=parateOb.getPayrate_id();
					}
				}
				endClient = empDao.viewEndClientDetailsByCandidateId(candidate_Id,emptyp,payrateid);
				String companyType="Remote/Home";
				CompanyAdressEntity remoteAddress=empDao.getCompanyAdressDetailsById(endClient.getClientid(),companyType);
				endClient.setRemoteAddress(remoteAddress);
			 Integer lcaid=immiao.getlcaIdByCandidateClientId(candidate_Id, endClient.getClientid());
			 if(!emptyp.equalsIgnoreCase("W2")) {
			 if(lcaid!=0) {
			       Integer docCount=immiao.getDocumentCountByLcaId(lcaid);	
			       endClient.setLcadocCount(docCount);
			    }
			  }
			}
			
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return endClient;
	}

	@Override
	public String updateProjectStatus(String candidate_id, String empType, String payrate_id, String project_status) {
		String message = "";
		try {
			int candidateid=0;int payrateid=0;
			if(!candidate_id.isEmpty()) {
				candidateid=Integer.parseInt(candidate_id);
			}if(!payrate_id.isEmpty()) {
				payrateid=Integer.parseInt(payrate_id);
			}
			EmpPayRateDetails payrateObj=empDao.getPayRateDetailsById(payrateid,empType);
			if(payrateObj!=null) {
				EmpPayRateDetails payrateObjDB=empDao.getPayRateDetailsById(payrateid,empType);
				
				if(payrateObjDB!=null) {
					EmpPayRateDetailsHistory payratehistoryObj=new EmpPayRateDetailsHistory();
					payratehistoryObj.setPayrate_id(payrateid);
					payratehistoryObj.setPayrate(payrateObjDB.getPayrate());
					payratehistoryObj.setBillrate(payrateObjDB.getBillrate());
					payratehistoryObj.setCustomer_id(payrateObjDB.getCustomer_id());
					payratehistoryObj.setVendorid(payrateObjDB.getVendorid());
					payratehistoryObj.setPayment_terms(payrateObjDB.getPayment_terms());
					payratehistoryObj.setInvoice_terms(payrateObjDB.getInvoice_terms());
					payratehistoryObj.setProj_startDate(payrateObjDB.getProj_startDate());
					payratehistoryObj.setProj_endDate(payrateObjDB.getProj_endDate());
					payratehistoryObj.setStatus(payrateObjDB.getStatus());
					payratehistoryObj.setCandidate_id(payrateObjDB.getCandidate_id());
					payratehistoryObj.setSubmittedOn(payrateObjDB.getSubmittedOn());
					payratehistoryObj.setPostedBy(payrateObjDB.getPostedBy());
					payratehistoryObj.setProject_status(payrateObjDB.getProject_status());
					payratehistoryObj.setPayroll_type(payrateObjDB.getPayroll_type());
					empDao.savePayRateHistoryDetails(payratehistoryObj);
					
					if(project_status.equalsIgnoreCase("InActive")) {
						
						payrateObj.setProject_status("Active");
						payrateObj.setStatus("Active");
					}else {
						payrateObj.setProject_status("InActive");
						payrateObj.setStatus("InActive");	
					}
					
					empDao.updatePayRateDetails(payrateObj);
				      }
				
				message="updated";
			}else {
				
			}
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return message;
	}

	@Override
	public EmpPayRateDetails getPayrateDetailsByPayrateId(String payrate_id,String candidate_id) {
		EmpPayRateDetails payrateObj=null;
		try {
			Integer payrateid = 0;
			if (!payrate_id.isEmpty()) {
				payrateid = Integer.parseInt(payrate_id);
				payrateObj=empDao.getPayrateDetailsByPayrateId(payrateid);
			}else {
				Integer candidateid=0;
				if (candidate_id!="") {
					candidateid = Integer.parseInt(candidate_id);
				}
				EmpPayRateDetails parateOb=empDao.payrateDetailsByCandidateId(candidateid);
				if(parateOb!=null) {
					payrateid=parateOb.getPayrate_id();
				}
				payrateObj=empDao.getPayrateDetailsByPayrateId(payrateid);
			}
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return payrateObj;
	}
	
	@Override
	public EmpPayRateDetails getActivePayrateDetailsByPayrateId(String payrate_id,String candidate_id) {
		EmpPayRateDetails payrateObj=null;
		try {
			Integer payrateid = 0;
			if (!payrate_id.isEmpty()) {
				payrateid = Integer.parseInt(payrate_id);
				payrateObj=empDao.getActivePayrateDetailsByPayrateId(payrateid);
			}else {
				Integer candidateid=0;
				if (candidate_id!="") {
					candidateid = Integer.parseInt(candidate_id);
				}
				EmpPayRateDetails parateOb=empDao.payrateDetailsByCandidateId(candidateid);
				if(parateOb!=null) {
					payrateid=parateOb.getPayrate_id();
				}
				payrateObj=empDao.getActivePayrateDetailsByPayrateId(payrateid);
			}
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return payrateObj;
	}
	
	@Override
	public String updateCustomerMaster(String custname, String fed_id, String cust_contactperson, String cust_mgr_email,
			MultipartFile customerMSA, String cust_msa, String mailtype, MultipartFile mailproofCustomer,
			Integer loginempno, String customerid, String address_id,String fileId,
			String line1, String line2, String city, String state, String zipcode,
			String fromdate, String expiry_date, String payment_term_id) {
		String message="";
		
		try {
			int custId=0;
			int fileid=0;
			if(!customerid.isEmpty()) {
				custId=Integer.parseInt(customerid);
			}
			if(!fileId.isEmpty()) {
				fileid=Integer.parseInt(fileId);
			}
			
			System.out.println("*****fed_id*****"+fed_id);
			
			CustomerMasterEntity custDBObj =empDao.getCustomerDetailsById(custId);
			if((fed_id=="" || fed_id!="") && custDBObj.getFed_id()!=null) {
			if(!custDBObj.getCustomer_name().equals(custname) || !custDBObj.getCustomer_contact_no().equals(cust_contactperson)
					|| !custDBObj.getMgr_email().equals(cust_mgr_email) || !custDBObj.getFed_id().equalsIgnoreCase(fed_id)) {
				//CustomerMasterEntity custObj=new CustomerMasterEntity();
				/*if(custDBObj.getFed_id()!=null) {*/
				custDBObj.setFed_id(fed_id);
				custDBObj.setCustomer_name(custname);
				custDBObj.setCustomer_contact_no(cust_contactperson);
				custDBObj.setMgr_email(cust_mgr_email);
				custDBObj.setSubmittedOn(new Date());
				empDao.updateCustomerMaster(custDBObj);
				message = "Customer Details Updated Successfuly";
		       }
		   else {
			   System.out.println("--Customer Details not Updated----");
			    //message = "Customer Details Not Updated";
		    }
		 }else if((fed_id=="" || fed_id!="") && custDBObj.getFed_id()==null) {
			 if(!custDBObj.getCustomer_name().equals(custname) || !custDBObj.getCustomer_contact_no().equals(cust_contactperson)
						|| !custDBObj.getMgr_email().equals(cust_mgr_email)) {
				    if(fed_id!="") {
					 custDBObj.setFed_id(fed_id);
				    }
					custDBObj.setCustomer_name(custname);
					custDBObj.setCustomer_contact_no(cust_contactperson);
					custDBObj.setMgr_email(cust_mgr_email);
					custDBObj.setSubmittedOn(new Date());
					empDao.updateCustomerMaster(custDBObj);
					message = "Customer Details Updated Successfuly";
			       } 
			  else {
						  //message = "Customer Details Not Updated";
				  System.out.println("--Customer Details not Updated----");
				    }
		   }
			
		//	EmpDocumentsEntity custdocobj=new EmpDocumentsEntity();
			EmpDocumentsEntity custdocDBdobj=empDao.getDocumentByDocId(fileid);
			/*System.out.println("*****custdocDBdobj******"+custdocDBdobj);
			custdocobj.setPostedBy(loginempno);
			custdocobj.setSubmit_date(new Date());
			custdocobj.setStatus("Active");*/
			if(customerMSA!=null) {
				if(!customerMSA.getOriginalFilename().isEmpty()) {
					EmpDocumentsHistoryEntity docHistoryObj=new EmpDocumentsHistoryEntity();
					docHistoryObj.setDocument_id(custdocDBdobj.getDocument_id());
					docHistoryObj.setCustomer_id(custdocDBdobj.getCustomer_id());
					docHistoryObj.setCandidate_id(custdocDBdobj.getCandidate_id());
					docHistoryObj.setFile_name(custdocDBdobj.getFile_name());
					docHistoryObj.setFiletype(custdocDBdobj.getFiletype());
					docHistoryObj.setPostedBy(custdocDBdobj.getPostedBy());
					docHistoryObj.setSubmit_date(custdocDBdobj.getSubmit_date());
					docHistoryObj.setStatus(custdocDBdobj.getStatus());
					docHistoryObj.setFrom_date(custdocDBdobj.getFrom_date());
					docHistoryObj.setExpiry_date(custdocDBdobj.getExpiry_date());
					empDao.saveDocumentsHistory(docHistoryObj);
					
					custdocDBdobj.setCustomer_id(custId);
					custdocDBdobj.setFile_name(customerMSA.getOriginalFilename());
					custdocDBdobj.setFiletype(cust_msa);
					commonObj.fileToDirectory(null,customerMSA,null,custname);
					if(!fromdate.isEmpty()) {
						custdocDBdobj.setFrom_date(fromdate);
					}else {
						custdocDBdobj.setFrom_date("");
					}
					if(expiry_date!=null) {
					if(!expiry_date.isEmpty()) {
						custdocDBdobj.setExpiry_date(expiry_date);
					}else {
						custdocDBdobj.setExpiry_date("");
					  }
					}
					empDao.updateDocument(custdocDBdobj);
					message = "Customer Details Updated Successfuly";
				}
			}
			
			
		  if(mailproofCustomer!=null) {
			if(!mailproofCustomer.getOriginalFilename().isEmpty()) {
				EmpDocumentsHistoryEntity docHistoryObj=new EmpDocumentsHistoryEntity();
				docHistoryObj.setDocument_id(custdocDBdobj.getDocument_id());
				docHistoryObj.setCustomer_id(custdocDBdobj.getCustomer_id());
				docHistoryObj.setCandidate_id(custdocDBdobj.getCandidate_id());
				docHistoryObj.setFile_name(custdocDBdobj.getFile_name());
				docHistoryObj.setFiletype(custdocDBdobj.getFiletype());
				docHistoryObj.setPostedBy(custdocDBdobj.getPostedBy());
				docHistoryObj.setSubmit_date(custdocDBdobj.getSubmit_date());
				docHistoryObj.setStatus(custdocDBdobj.getStatus());
				docHistoryObj.setFrom_date(custdocDBdobj.getFrom_date());
				docHistoryObj.setExpiry_date(custdocDBdobj.getExpiry_date());
				empDao.saveDocumentsHistory(docHistoryObj);
				if(!fromdate.isEmpty()) {
					custdocDBdobj.setFrom_date(fromdate);
				}else {
					custdocDBdobj.setFrom_date("");
				}
				if(!expiry_date.isEmpty()) {
					custdocDBdobj.setExpiry_date(expiry_date);
				}else {
					custdocDBdobj.setExpiry_date("");
				}
				custdocDBdobj.setCustomer_id(custId);
				custdocDBdobj.setFile_name(mailproofCustomer.getOriginalFilename());
				custdocDBdobj.setFiletype(mailtype);
				commonObj.fileToDirectory(null,mailproofCustomer,custname,null);
				empDao.updateDocument(custdocDBdobj);
				message = "Customer Details Updated Successfuly";
			   }
			}
			String companyType="Customer";
			CompanyAdressEntity CompanyAddressDBObj = empDao.getCompanyAdressDetailsById(custId, companyType);		
			if((line2=="" || line2!="") && CompanyAddressDBObj.getLine2()!=null) {
			   System.out.println("---if---"+line2);
				if(!CompanyAddressDBObj.getLine1().equals(line1) || !CompanyAddressDBObj.getCity().equals(city)
						|| !CompanyAddressDBObj.getState().equals(state) || !CompanyAddressDBObj.getZipcode().equalsIgnoreCase(zipcode) || !CompanyAddressDBObj.getLine2().equalsIgnoreCase(line2)) {
					CompanyAdressEntity companyAddressObj = new CompanyAdressEntity();
					companyAddressObj.setLine1(line1);
					companyAddressObj.setCompany_id(custId);
					companyAddressObj.setCity(city);
					companyAddressObj.setState(state);
					companyAddressObj.setZipcode(zipcode);
					companyAddressObj.setStatus("Active");
					companyAddressObj.setPostedBy(loginempno);
					companyAddressObj.setCompany_type(companyType);
					companyAddressObj.setSubmitted_on(new Date());
					companyAddressObj.setLine2(line2);
					empDao.saveCompanyAddressDetails(companyAddressObj);
					CompanyAddressDBObj.setStatus("InActive");
				    empDao.updateCompanyAddressInfo(CompanyAddressDBObj);
				      message = "Customer Details Updated Successfuly";
				     }else {
				    	 System.out.println("--Customer Adrress Details not Updated----");
				    	// message = "Customer Details Not Updated";
				     }
			}else if((line2=="" || line2!="") && CompanyAddressDBObj.getLine2()==null) {
				if(!CompanyAddressDBObj.getLine1().equals(line1) || !CompanyAddressDBObj.getCity().equals(city)
						|| !CompanyAddressDBObj.getState().equals(state) || !CompanyAddressDBObj.getZipcode().equalsIgnoreCase(zipcode)) {
					 
					CompanyAdressEntity companyAddressObj = new CompanyAdressEntity();
					companyAddressObj.setLine1(line1);
					companyAddressObj.setCompany_id(custId);
					companyAddressObj.setCity(city);
					companyAddressObj.setState(state);
					companyAddressObj.setZipcode(zipcode);
					companyAddressObj.setStatus("Active");
					companyAddressObj.setPostedBy(loginempno);
					companyAddressObj.setCompany_type(companyType);
					companyAddressObj.setSubmitted_on(new Date());
					if(line2!="") {
						 companyAddressObj.setLine2(line2);
					 }
					empDao.saveCompanyAddressDetails(companyAddressObj);
					CompanyAddressDBObj.setStatus("InActive");
				    empDao.updateCompanyAddressInfo(CompanyAddressDBObj);
				    message = "Customer Details Updated Successfuly";
				     }else {
				    	// message = "Customer Details Not Updated";
				    	 System.out.println("--Customer Adrress Details not Updated----");
				     }
				System.out.println("--else----"+line2);
			}
			//sendmail.sendMail(frommail, toemail, toName, comments, subject);
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return message;
	}

	@Override
	public String updateCustomerDocumentById(MultipartFile editFile, String fileId, String fromdate,
			String expiry_date,String custmid, Integer loginempno) {
		String message="";
		try {
	//	EmpDocumentsEntity custdocobj=new EmpDocumentsEntity();
		Integer custId=0;
		if(!custmid.isEmpty()) {
			custId=Integer.parseInt(custmid);
		}
		
		Integer docId=0;
		if (fileId!="") {
			docId = Integer.parseInt(fileId);
		}
		System.out.println("new file"+editFile);
		EmpDocumentsEntity custdocDBdobj=empDao.getDocumentByDocId(docId);
	//	System.out.println("--------"+fromdate+"***************"+expiry_date+"-------------"+custdocDBdobj.getFrom_date()+custdocDBdobj.getExpiry_date());
		if(editFile!=null) {
			CustomerMasterEntity custDBObj =empDao.getCustomerDetailsById(custId);
			String custname = custDBObj.getCustomer_name();
			System.out.println("file name is there"+editFile.getOriginalFilename());
			if(!editFile.getOriginalFilename().isEmpty()) {
				EmpDocumentsHistoryEntity docHistoryObj=new EmpDocumentsHistoryEntity();
				docHistoryObj.setDocument_id(custdocDBdobj.getDocument_id());
				docHistoryObj.setCustomer_id(custdocDBdobj.getCustomer_id());
				docHistoryObj.setCandidate_id(custdocDBdobj.getCandidate_id());
				docHistoryObj.setFile_name(custdocDBdobj.getFile_name());
				docHistoryObj.setFiletype(custdocDBdobj.getFiletype());
				docHistoryObj.setPostedBy(custdocDBdobj.getPostedBy());
				docHistoryObj.setSubmit_date(custdocDBdobj.getSubmit_date());
				docHistoryObj.setStatus(custdocDBdobj.getStatus());
				docHistoryObj.setFrom_date(custdocDBdobj.getFrom_date());
				docHistoryObj.setExpiry_date(custdocDBdobj.getExpiry_date());
				empDao.saveDocumentsHistory(docHistoryObj);
				if(!fromdate.isEmpty()) {
					custdocDBdobj.setFrom_date(fromdate);
				}else {
					custdocDBdobj.setFrom_date("");
				}
				if(!expiry_date.isEmpty()) {
					custdocDBdobj.setExpiry_date(expiry_date);
				}else {
					custdocDBdobj.setExpiry_date("");
				}
				custdocDBdobj.setCustomer_id(custId);
				custdocDBdobj.setFile_name(editFile.getOriginalFilename());
				custdocDBdobj.setFiletype("Customer_MSA");
				custdocDBdobj.setPostedBy(loginempno);
				custdocDBdobj.setSubmit_date(new Date());
				//custdocobj.setStatus("Active");
				try {
					commonObj.fileToDirectory(null, editFile, null, custname);
				} catch (MessagingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				//custdocDBdobj.setStatus("InActive");
				empDao.updateDocument(custdocDBdobj);
				//empDao.saveDocuments(custdocobj);
				message="Success";
			}else {
				System.out.println("file name is not there"+editFile.getOriginalFilename());
			if(!fromdate.isEmpty() || !expiry_date.isEmpty()) {
				EmpDocumentsHistoryEntity docHistoryObj=new EmpDocumentsHistoryEntity();
				docHistoryObj.setDocument_id(custdocDBdobj.getDocument_id());
				docHistoryObj.setCustomer_id(custdocDBdobj.getCustomer_id());
				docHistoryObj.setCandidate_id(custdocDBdobj.getCandidate_id());
				docHistoryObj.setFile_name(custdocDBdobj.getFile_name());
				docHistoryObj.setFiletype(custdocDBdobj.getFiletype());
				docHistoryObj.setPostedBy(custdocDBdobj.getPostedBy());
				docHistoryObj.setSubmit_date(custdocDBdobj.getSubmit_date());
				docHistoryObj.setStatus(custdocDBdobj.getStatus());
				docHistoryObj.setFrom_date(custdocDBdobj.getFrom_date());
				docHistoryObj.setExpiry_date(custdocDBdobj.getExpiry_date());
				empDao.saveDocumentsHistory(docHistoryObj);
			if(custdocDBdobj.getFrom_date()!=null && custdocDBdobj.getExpiry_date()!=null) {
				if(!custdocDBdobj.getFrom_date().equals(fromdate) || !custdocDBdobj.getExpiry_date().equals(expiry_date)) {
					if(!expiry_date.isEmpty()) {
						custdocDBdobj.setExpiry_date(expiry_date);
					}
					if(!fromdate.isEmpty()) {
						custdocDBdobj.setFrom_date(fromdate);
					}
					custdocDBdobj.setFrom_date(fromdate);
					custdocDBdobj.setCustomer_id(custId);
					custdocDBdobj.setFile_name(custdocDBdobj.getFile_name());
					custdocDBdobj.setFiletype(custdocDBdobj.getFiletype());
					//custdocobj.setStatus("Active");
					custdocDBdobj.setPostedBy(loginempno);
					custdocDBdobj.setSubmit_date(new Date());
					//empDao.saveDocuments(custdocobj);
					//custdocDBdobj.setStatus("InActive");
					empDao.updateDocument(custdocDBdobj);
					message = "Success";
				}else {
					//message = "Error";
				}
			}
			else if(custdocDBdobj.getFrom_date()!=null && custdocDBdobj.getExpiry_date()==null) {
				if(!custdocDBdobj.getFrom_date().equals(fromdate)) {
					if(!expiry_date.isEmpty()) {
						custdocDBdobj.setExpiry_date(expiry_date);
					}
					custdocDBdobj.setFrom_date(fromdate);
					custdocDBdobj.setCustomer_id(custId);
					custdocDBdobj.setFile_name(custdocDBdobj.getFile_name());
					custdocDBdobj.setFiletype(custdocDBdobj.getFiletype());
					//custdocobj.setStatus("Active");
					custdocDBdobj.setPostedBy(loginempno);
					custdocDBdobj.setSubmit_date(new Date());
					/*empDao.saveDocuments(custdocobj);
					custdocDBdobj.setStatus("InActive");*/
					empDao.updateDocument(custdocDBdobj);
				}else {
					if(!expiry_date.isEmpty()) {
						custdocDBdobj.setExpiry_date(expiry_date);
					}
					custdocDBdobj.setFrom_date(fromdate);
					custdocDBdobj.setCustomer_id(custId);
					custdocDBdobj.setFile_name(custdocDBdobj.getFile_name());
					custdocDBdobj.setFiletype(custdocDBdobj.getFiletype());
					//custdocobj.setStatus("Active");
					custdocDBdobj.setPostedBy(loginempno);
					custdocDBdobj.setSubmit_date(new Date());
					/*empDao.saveDocuments(custdocobj);
					custdocDBdobj.setStatus("InActive");*/
					empDao.updateDocument(custdocDBdobj);
				}
				message = "Success";
			}
			else if(custdocDBdobj.getFrom_date()==null && custdocDBdobj.getExpiry_date()!=null) {
				
				if(!custdocDBdobj.getExpiry_date().equals(expiry_date)) {
					if(!fromdate.isEmpty()) {
						custdocDBdobj.setFrom_date(fromdate);
					}
					custdocDBdobj.setExpiry_date(expiry_date);
					custdocDBdobj.setCustomer_id(custId);
					custdocDBdobj.setFile_name(custdocDBdobj.getFile_name());
					custdocDBdobj.setFiletype(custdocDBdobj.getFiletype());
					//custdocobj.setStatus("Active");
					custdocDBdobj.setPostedBy(loginempno);
					custdocDBdobj.setSubmit_date(new Date());
					/*empDao.saveDocuments(custdocobj);
					custdocDBdobj.setStatus("InActive");*/
					empDao.updateDocument(custdocDBdobj);
				}else {
					if(!fromdate.isEmpty()) {
						custdocDBdobj.setFrom_date(fromdate);
					}
					custdocDBdobj.setExpiry_date(expiry_date);
					custdocDBdobj.setCustomer_id(custId);
					custdocDBdobj.setFile_name(custdocDBdobj.getFile_name());
					custdocDBdobj.setFiletype(custdocDBdobj.getFiletype());
				//	custdocobj.setStatus("Active");
					custdocDBdobj.setPostedBy(loginempno);
					custdocDBdobj.setSubmit_date(new Date());
					/*empDao.saveDocuments(custdocobj);
					custdocDBdobj.setStatus("InActive");*/
					empDao.updateDocument(custdocDBdobj);
				}
				message = "Success";
			}else {
				if(!fromdate.isEmpty()) {
					custdocDBdobj.setFrom_date(fromdate);
				}
				if(!expiry_date.isEmpty()) {
					custdocDBdobj.setExpiry_date(expiry_date);
				}
				custdocDBdobj.setCustomer_id(custId);
				custdocDBdobj.setFile_name(custdocDBdobj.getFile_name());
				custdocDBdobj.setFiletype(custdocDBdobj.getFiletype());
				//custdocobj.setStatus("Active");
				custdocDBdobj.setPostedBy(loginempno);
				custdocDBdobj.setSubmit_date(new Date());
				/*empDao.saveDocuments(custdocobj);
				custdocDBdobj.setStatus("InActive");*/
				empDao.updateDocument(custdocDBdobj);
				message = "Success";
			  }
		   }
		}
	  }
	} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return message;
	}

	@Override
	public String updateVendorMaster(String vendorname, String fed_id, String v_contactperson, String v_mgr_email,
			String mailprooftype, MultipartFile mailproofVendor, Integer loginempno, String vendorid, String address_id,
			String fileId, String line1, String line2, String city, String state, String zipcode) {
			String message="";
		try {
			int venId=0;
			int fileid=0;
			if(!vendorid.isEmpty()) {
				venId=Integer.parseInt(vendorid);
			}
			if(!fileId.isEmpty()) {
				fileid=Integer.parseInt(fileId);
			}
			
			System.out.println("*****fed_id*****"+fed_id);
			
			VendorMasterEntity vendDBObj =empDao.getVendorDetailsById(venId);
			if((fed_id=="" || fed_id!="") && vendDBObj.getFed_id()!=null) {
			if(!vendDBObj.getVendorname().equals(vendorname) || !vendDBObj.getVendor_contact_no().equals(v_contactperson)
					|| !vendDBObj.getVendor_mgr_email().equals(v_mgr_email) || !vendDBObj.getFed_id().equalsIgnoreCase(fed_id)) {
				//CustomerMasterEntity custObj=new CustomerMasterEntity();
				/*if(custDBObj.getFed_id()!=null) {*/
				vendDBObj.setVendorname(vendorname);
				vendDBObj.setFed_id(fed_id);
				vendDBObj.setVendor_contact_no(v_contactperson);
				vendDBObj.setVendor_mgr_email(v_mgr_email);
				vendDBObj.setSubmittedOn(new Date());
				empDao.updateVendorMaster(vendDBObj);
				 message = "Vendor Details Updated Successfuly";
		       }
		   else {
			  message = "Vendor Details Not Updated";
		    }
		 }else if((fed_id=="" || fed_id!="") && vendDBObj.getFed_id()==null) {
				if(!vendDBObj.getVendorname().equals(vendorname) || !vendDBObj.getVendor_contact_no().equals(v_contactperson)
						|| !vendDBObj.getVendor_mgr_email().equals(v_mgr_email)) {
				 if(fed_id!="") {
					 vendDBObj.setFed_id(fed_id);
				   }
				 	vendDBObj.setVendorname(vendorname);
					vendDBObj.setVendor_contact_no(v_contactperson);
					vendDBObj.setVendor_mgr_email(v_mgr_email);
					vendDBObj.setSubmittedOn(new Date());
					empDao.updateVendorMaster(vendDBObj);
					message = "Vendor Details Updated Successfuly";
			       }
				else {
						  message = "Vendor Details Not Updated";
				    }
		   }
			
			EmpDocumentsEntity custdocobj=new EmpDocumentsEntity();
			
			EmpDocumentsEntity custdocDBdobj=empDao.getDocumentByDocId(fileid);
			System.out.println("*****custdocDBdobj******"+custdocDBdobj);
			
			custdocobj.setPostedBy(loginempno);
			custdocobj.setSubmit_date(new Date());
			custdocobj.setStatus("Active");
		
		if(mailproofVendor!=null) {
			if(!mailproofVendor.getOriginalFilename().isEmpty()) {
				custdocobj.setCustomer_id(venId);
				custdocobj.setFile_name(mailproofVendor.getOriginalFilename());
				custdocobj.setFiletype(mailprooftype);
				commonObj.fileToDirectory(null,mailproofVendor,vendorname,null);
				custdocDBdobj.setStatus("InActive");
				empDao.updateDocument(custdocDBdobj);
				empDao.saveDocuments(custdocobj);
				message = "Vendor Details Updated Successfuly";
			   }
			}
			String companyType="Vendor";
			CompanyAdressEntity CompanyAddressDBObj = empDao.getCompanyAdressDetailsById(venId, companyType);
			System.out.println("---sssssss---"+CompanyAddressDBObj.getLine2());
			if((line2=="" || line2!="") && CompanyAddressDBObj.getLine2()!=null) {
			System.out.println("---if---"+line2);
				if(!CompanyAddressDBObj.getLine1().equals(line1) || !CompanyAddressDBObj.getCity().equals(city)
						|| !CompanyAddressDBObj.getState().equals(state) || !CompanyAddressDBObj.getZipcode().equalsIgnoreCase(zipcode) || !CompanyAddressDBObj.getLine2().equalsIgnoreCase(line2)) {
					CompanyAdressEntity companyAddressObj = new CompanyAdressEntity();
					companyAddressObj.setLine1(line1);
					companyAddressObj.setCompany_id(venId);
					companyAddressObj.setCity(city);
					companyAddressObj.setState(state);
					companyAddressObj.setZipcode(zipcode);
					companyAddressObj.setStatus("Active");
					companyAddressObj.setPostedBy(loginempno);
					companyAddressObj.setCompany_type(companyType);
					companyAddressObj.setSubmitted_on(new Date());
					companyAddressObj.setLine2(line2);
					empDao.saveCompanyAddressDetails(companyAddressObj);
					CompanyAddressDBObj.setStatus("InActive");
				    empDao.updateCompanyAddressInfo(CompanyAddressDBObj);
				    message = "Vendor Details Updated Successfuly";
				     }else {
				    	 System.out.println("--Vendor Adrress Details not Updated----");
				    	 message = "Vendor Details Not Updated";
				     }
			}else if((line2=="" || line2!="") && (CompanyAddressDBObj.getLine2()==null || CompanyAddressDBObj.getLine2()=="")) {
				if(!CompanyAddressDBObj.getLine1().equals(line1) || !CompanyAddressDBObj.getCity().equals(city)
						|| !CompanyAddressDBObj.getState().equals(state) || !CompanyAddressDBObj.getZipcode().equalsIgnoreCase(zipcode)) {
					System.out.println("--else----"+line2);
					CompanyAdressEntity companyAddressObj = new CompanyAdressEntity();
					companyAddressObj.setLine1(line1);
					companyAddressObj.setCompany_id(venId);
					companyAddressObj.setCity(city);
					companyAddressObj.setState(state);
					companyAddressObj.setZipcode(zipcode);
					companyAddressObj.setStatus("Active");
					companyAddressObj.setPostedBy(loginempno);
					companyAddressObj.setCompany_type(companyType);
					companyAddressObj.setSubmitted_on(new Date());
					if(line2!="") {
						 companyAddressObj.setLine2(line2);
					 }
					empDao.saveCompanyAddressDetails(companyAddressObj);
					CompanyAddressDBObj.setStatus("InActive");
				    empDao.updateCompanyAddressInfo(CompanyAddressDBObj);
				    message = "Vendor Details Updated Successfuly";
				     }else {
				    	 System.out.println("--Vendor Adrress Details not Updated----");
				    	 message = "Vendor Details Not Updated";
				     }
				
			}
			//sendmail.sendMail(frommail, toemail, toName, comments, subject);
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return message;
	}

	@Override
	public List<DocumentHistoryDto> getCustomerDocumentHistiryByCustomerId(String docid) {
		 List<DocumentHistoryDto> customerdocs=null;
		try {
			Integer doc_Id=0;
			if(!docid.isEmpty()) {
				doc_Id=Integer.parseInt(docid);
			}
			//customerdocs=empDao.getCustomerDocumentHistiryByCustomerId(cust_Id);
			customerdocs=empDao.getDocumentHistiryById(doc_Id);
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return customerdocs;
	}

	@Override
	public String updateVendorDocumentById(MultipartFile editFile, String fileId, String fromdate, String expiry_date,
			String vendId, Integer loginempno, String efileType, String efileInputVal) {
		String message="";
		try {
		//EmpDocumentsEntity vendocobj=new EmpDocumentsEntity();
		Integer venId=0;
		if(!vendId.isEmpty()) {
			venId=Integer.parseInt(vendId);
		}
		
		Integer docId=0;
		if (fileId!="") {
			docId = Integer.parseInt(fileId);
		}
		
		EmpDocumentsEntity vendocDBdobj=empDao.getDocumentByDocId(docId);
	//	System.out.println("--------"+fromdate+"***************"+expiry_date+"-------------"+custdocDBdobj.getFrom_date()+custdocDBdobj.getExpiry_date());
		if(editFile!=null) {
			System.out.println("No New Document"+efileType+efileInputVal);
			
			VendorMasterEntity venDBObj =empDao.getVendorDetailsById(venId);
			String vendorname = venDBObj.getVendorname();
			if(!editFile.getOriginalFilename().isEmpty()) {
				EmpDocumentsHistoryEntity docHistoryObj=new EmpDocumentsHistoryEntity();
				docHistoryObj.setDocument_id(vendocDBdobj.getDocument_id());
				docHistoryObj.setCustomer_id(vendocDBdobj.getVendorid());
				docHistoryObj.setCandidate_id(vendocDBdobj.getCandidate_id());
				docHistoryObj.setFile_name(vendocDBdobj.getFile_name());
				docHistoryObj.setFiletype(vendocDBdobj.getFiletype());
				docHistoryObj.setPostedBy(vendocDBdobj.getPostedBy());
				docHistoryObj.setSubmit_date(vendocDBdobj.getSubmit_date());
				docHistoryObj.setStatus(vendocDBdobj.getStatus());
				docHistoryObj.setFrom_date(vendocDBdobj.getFrom_date());
				docHistoryObj.setExpiry_date(vendocDBdobj.getExpiry_date());
				docHistoryObj.setInputvalue(vendocDBdobj.getInputvalue());
				empDao.saveDocumentsHistory(docHistoryObj);
				System.out.println("-------**************"+editFile.getOriginalFilename());
				if(!fromdate.isEmpty()) {
					vendocDBdobj.setFrom_date(fromdate);
				}else {
					vendocDBdobj.setFrom_date("");
				}
				if(!expiry_date.isEmpty()) {
					vendocDBdobj.setExpiry_date(expiry_date);
				}else {
					vendocDBdobj.setExpiry_date("");
				}
				vendocDBdobj.setVendorid(venId);
				vendocDBdobj.setFile_name(editFile.getOriginalFilename());
				vendocDBdobj.setFiletype(efileType);
				if(!efileInputVal.isEmpty()) {
					vendocDBdobj.setInputvalue(efileInputVal);
				}
				vendocDBdobj.setPostedBy(loginempno);
				vendocDBdobj.setSubmit_date(new Date());
				/*vendocobj.setStatus("Active");
				empDao.saveDocuments(vendocobj);
				vendocDBdobj.setStatus("InActive");*/
				empDao.updateDocument(vendocDBdobj);
				message="Success";
				try {
					commonObj.fileToDirectory(null, editFile, null, vendorname);
				} catch (MessagingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}else {
				if(!fromdate.isEmpty() || !expiry_date.isEmpty()) {
					EmpDocumentsHistoryEntity docHistoryObj=new EmpDocumentsHistoryEntity();
					docHistoryObj.setDocument_id(vendocDBdobj.getDocument_id());
					docHistoryObj.setCustomer_id(vendocDBdobj.getVendorid());
					docHistoryObj.setCandidate_id(vendocDBdobj.getCandidate_id());
					docHistoryObj.setFile_name(vendocDBdobj.getFile_name());
					docHistoryObj.setFiletype(vendocDBdobj.getFiletype());
					docHistoryObj.setPostedBy(vendocDBdobj.getPostedBy());
					docHistoryObj.setSubmit_date(vendocDBdobj.getSubmit_date());
					docHistoryObj.setStatus(vendocDBdobj.getStatus());
					docHistoryObj.setFrom_date(vendocDBdobj.getFrom_date());
					docHistoryObj.setExpiry_date(vendocDBdobj.getExpiry_date());
					empDao.saveDocumentsHistory(docHistoryObj);
					System.out.println("No New Document"+fromdate+expiry_date);
				if(vendocDBdobj.getFrom_date()!=null && vendocDBdobj.getExpiry_date()!=null) {
					System.out.println("sd & ed are not null in DB"+vendocDBdobj.getFrom_date()+vendocDBdobj.getExpiry_date());
					if(!vendocDBdobj.getFrom_date().equals(fromdate) || !vendocDBdobj.getExpiry_date().equals(expiry_date)) {
						if(!expiry_date.isEmpty()) {
							vendocDBdobj.setExpiry_date(expiry_date);
						}
						if(!fromdate.isEmpty()) {
							vendocDBdobj.setFrom_date(fromdate);
						}
						vendocDBdobj.setFrom_date(fromdate);
						vendocDBdobj.setVendorid(venId);
						vendocDBdobj.setFile_name(vendocDBdobj.getFile_name());
						vendocDBdobj.setFiletype(vendocDBdobj.getFiletype());
						if(!efileInputVal.isEmpty()) {
							vendocDBdobj.setInputvalue(efileInputVal);
						}
						//vendocobj.setStatus("Active");
						vendocDBdobj.setPostedBy(loginempno);
						vendocDBdobj.setSubmit_date(new Date());
						/*empDao.saveDocuments(vendocobj);
						vendocDBdobj.setStatus("InActive");*/
						empDao.updateDocument(vendocDBdobj);
						message = "Success";
					}else {
						//message = "Error";
					}
				}
				else if(vendocDBdobj.getFrom_date()!=null && vendocDBdobj.getExpiry_date()==null) {
					System.out.println("sd isnot null in DB && ed is null"+vendocDBdobj.getFrom_date()+vendocDBdobj.getExpiry_date());
					if(!vendocDBdobj.getFrom_date().equals(fromdate)) {
						System.out.println("if********");
						if(!expiry_date.isEmpty()) {
							vendocDBdobj.setExpiry_date(expiry_date);
						}
						vendocDBdobj.setFrom_date(fromdate);
						vendocDBdobj.setVendorid(venId);
						vendocDBdobj.setFile_name(vendocDBdobj.getFile_name());
						vendocDBdobj.setFiletype(vendocDBdobj.getFiletype());
						if(!efileInputVal.isEmpty()) {
							vendocDBdobj.setInputvalue(efileInputVal);
						}
						//vendocobj.setStatus("Active");
						vendocDBdobj.setPostedBy(loginempno);
						vendocDBdobj.setSubmit_date(new Date());
						/*empDao.saveDocuments(vendocobj);
						vendocDBdobj.setStatus("InActive");*/
						empDao.updateDocument(vendocDBdobj);
					}else {
						System.out.println("else********");
						if(!expiry_date.isEmpty()) {
							vendocDBdobj.setExpiry_date(expiry_date);
						}
						vendocDBdobj.setFrom_date(fromdate);
						vendocDBdobj.setVendorid(venId);
						vendocDBdobj.setFile_name(vendocDBdobj.getFile_name());
						vendocDBdobj.setFiletype(vendocDBdobj.getFiletype());
						if(!efileInputVal.isEmpty()) {
							vendocDBdobj.setInputvalue(efileInputVal);
						}
						//vendocobj.setStatus("Active");
						vendocDBdobj.setPostedBy(loginempno);
						vendocDBdobj.setSubmit_date(new Date());
						/*empDao.saveDocuments(vendocobj);
						vendocDBdobj.setStatus("InActive");*/
						empDao.updateDocument(vendocDBdobj);
					}
					message = "Success";
				}
				else if(vendocDBdobj.getFrom_date()==null && vendocDBdobj.getExpiry_date()!=null) {
					System.out.println("ed is not null in DB && sd is null"+vendocDBdobj.getFrom_date()+vendocDBdobj.getExpiry_date());
					if(!vendocDBdobj.getExpiry_date().equals(expiry_date)) {
						if(!fromdate.isEmpty()) {
							vendocDBdobj.setFrom_date(fromdate);
						}
						vendocDBdobj.setExpiry_date(expiry_date);
						vendocDBdobj.setVendorid(venId);
						vendocDBdobj.setFile_name(vendocDBdobj.getFile_name());
						vendocDBdobj.setFiletype(vendocDBdobj.getFiletype());
						if(!efileInputVal.isEmpty()) {
							vendocDBdobj.setInputvalue(efileInputVal);
						}
						//vendocobj.setStatus("Active");
						vendocDBdobj.setPostedBy(loginempno);
						vendocDBdobj.setSubmit_date(new Date());
						/*empDao.saveDocuments(vendocobj);
						vendocDBdobj.setStatus("InActive");*/
						empDao.updateDocument(vendocDBdobj);
					}else {
						if(!fromdate.isEmpty()) {
							vendocDBdobj.setFrom_date(fromdate);
						}
						vendocDBdobj.setExpiry_date(expiry_date);
						vendocDBdobj.setVendorid(venId);
						vendocDBdobj.setFile_name(vendocDBdobj.getFile_name());
						vendocDBdobj.setFiletype(vendocDBdobj.getFiletype());
						if(!efileInputVal.isEmpty()) {
							vendocDBdobj.setInputvalue(efileInputVal);
						}
						//vendocobj.setStatus("Active");
						vendocDBdobj.setPostedBy(loginempno);
						vendocDBdobj.setSubmit_date(new Date());
						/*empDao.saveDocuments(vendocobj);
						vendocDBdobj.setStatus("InActive");*/
						empDao.updateDocument(vendocDBdobj);
					}
					message = "Success";
				}else {
					System.out.println("ed sd are null in DB"+vendocDBdobj.getFrom_date()+vendocDBdobj.getExpiry_date());
					if(!fromdate.isEmpty()) {
						vendocDBdobj.setFrom_date(fromdate);
					}
					if(!expiry_date.isEmpty()) {
						vendocDBdobj.setExpiry_date(expiry_date);
					}
					vendocDBdobj.setVendorid(venId);
					vendocDBdobj.setFile_name(vendocDBdobj.getFile_name());
					vendocDBdobj.setFiletype(vendocDBdobj.getFiletype());
					if(!efileInputVal.isEmpty()) {
						vendocDBdobj.setInputvalue(efileInputVal);
					}
				//	vendocobj.setStatus("Active");
					vendocDBdobj.setPostedBy(loginempno);
					vendocDBdobj.setSubmit_date(new Date());
					/*empDao.saveDocuments(vendocobj);
					vendocDBdobj.setStatus("InActive");*/
					empDao.updateDocument(vendocDBdobj);
					message = "Success";
				}
			  }	
			}
		}
	} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return message;
	}

	@Override
	public List<DocumentHistoryDto> getVendorDocumentHistiryById(String docid, String fileType, String inputVal) {
		 List<DocumentHistoryDto> vendordocs=null;
			try {
				/*Integer venId=0;
				if(!vendId.isEmpty()) {
					venId=Integer.parseInt(vendId);
				}*/
				Integer doc_Id=0;
				if(!docid.isEmpty()) {
					doc_Id=Integer.parseInt(docid);
				}
				//vendordocs=empDao.getVendorDocumentHistiryById(venId,fileType,inputVal);
				vendordocs=empDao.getDocumentHistiryById(doc_Id);
				
			} catch (Exception e) {
				logger.info(e.getMessage(),e);
			}
			return vendordocs;
		}

	@Override
	public String saveVendorDocument(MultipartFile editFile, String fromdate, String expiry_date, String vendId,
			Integer loginempno, String efileType, String efileInputVal) {
		String msg=null;
		try {
			Integer ven_Id=0;
			if (!vendId.isEmpty()) {
				ven_Id = Integer.parseInt(vendId);
			 }
			EmpDocumentsEntity vendocobj=new EmpDocumentsEntity();
			if(editFile!=null) {
				VendorMasterEntity venDBObj =empDao.getVendorDetailsById(ven_Id);
				String vendorname = venDBObj.getVendorname();
				if(!editFile.getOriginalFilename().isEmpty()) {
					if(!fromdate.isEmpty()) {
						vendocobj.setFrom_date(fromdate);
					}
					if(!expiry_date.isEmpty()) {
						vendocobj.setExpiry_date(expiry_date);
					}
					vendocobj.setVendorid(ven_Id);
					vendocobj.setFile_name(editFile.getOriginalFilename());
					vendocobj.setFiletype(efileType);
					if(!efileInputVal.isEmpty()) {
						vendocobj.setInputvalue(efileInputVal);
					}
					vendocobj.setPostedBy(loginempno);
					vendocobj.setSubmit_date(new Date());
					vendocobj.setStatus("Active");
					try {
						commonObj.fileToDirectory(null, editFile, null, vendorname);
					} catch (MessagingException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					empDao.saveDocuments(vendocobj);
					msg="Success";
				}
			}
	} catch (Exception e) {
		logger.info(e.getMessage(),e);
	}
	return msg;
	}

	@Override
	public String updateMailProofVendorDocumentById(MultipartFile editFile, String fileId, String vendId,
			Integer loginempno, String efileType) {
		String message="";
		try {
		EmpDocumentsEntity vendocobj=new EmpDocumentsEntity();
		Integer venId=0;
		if(!vendId.isEmpty()) {
			venId=Integer.parseInt(vendId);
		}
		Integer docId=0;
		if (fileId!="") {
			docId = Integer.parseInt(fileId);
		}
		EmpDocumentsEntity vendocDBdobj=empDao.getDocumentByDocId(docId);
		if(editFile!=null) {
			System.out.println("New MSG Document"+efileType);
			VendorMasterEntity venDBObj =empDao.getVendorDetailsById(venId);
			String vendorname = venDBObj.getVendorname();
			if(!editFile.getOriginalFilename().isEmpty()) {
				vendocobj.setVendorid(venId);
				vendocobj.setFile_name(editFile.getOriginalFilename());
				vendocobj.setFiletype(efileType);
				vendocobj.setPostedBy(loginempno);
				vendocobj.setSubmit_date(new Date());
				vendocobj.setStatus("Active");
				empDao.saveDocuments(vendocobj);
				vendocDBdobj.setStatus("InActive");
				empDao.updateDocument(vendocDBdobj);
				message="Success";
				try {
					commonObj.fileToDirectory(null, editFile, null, vendorname);
				} catch (MessagingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
	} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return message;
	}

	@Override
	public String saveMailProofVendorDocument(MultipartFile editFile, String vendId, Integer loginempno, String efileType) {
		String msg=null;
		try {
			Integer ven_Id=0;
			if (!vendId.isEmpty()) {
				ven_Id = Integer.parseInt(vendId);
			 }
			EmpDocumentsEntity vendocobj=new EmpDocumentsEntity();
			if(editFile!=null) {
				VendorMasterEntity venDBObj =empDao.getVendorDetailsById(ven_Id);
				String vendorname = venDBObj.getVendorname();
				if(!editFile.getOriginalFilename().isEmpty()) {
					vendocobj.setVendorid(ven_Id);
					vendocobj.setFile_name(editFile.getOriginalFilename());
					vendocobj.setFiletype(efileType);
					vendocobj.setPostedBy(loginempno);
					vendocobj.setSubmit_date(new Date());
					vendocobj.setStatus("Active");
					try {
						commonObj.fileToDirectory(null, editFile, null, vendorname);
					} catch (MessagingException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					empDao.saveDocuments(vendocobj);
					msg="Success";
				}
			}
	} catch (Exception e) {
		logger.info(e.getMessage(),e);
	}
	return msg;
	}

	@Override
	public String updateMailProofCustomerDocumentById(MultipartFile editFile, String fileId, String custmid,
			String msgefileType, Integer loginempno) {
		String message="";
		try {
		
		EmpDocumentsEntity custdocobj=new EmpDocumentsEntity();
		Integer custId=0;
		if(!custmid.isEmpty()) {
			custId=Integer.parseInt(custmid);
		}
		Integer docId=0;
		if (fileId!="") {
			docId = Integer.parseInt(fileId);
		}
		EmpDocumentsEntity custdocDBdobj=empDao.getDocumentByDocId(docId);
		if(editFile!=null) {
			CustomerMasterEntity custDBObj =empDao.getCustomerDetailsById(custId);
			String custname = custDBObj.getCustomer_name();
			System.out.println("file name is there"+editFile.getOriginalFilename());
			if(!editFile.getOriginalFilename().isEmpty()) {
				custdocobj.setCustomer_id(custId);
				custdocobj.setFile_name(editFile.getOriginalFilename());
				custdocobj.setFiletype(msgefileType);
				custdocobj.setPostedBy(loginempno);
				custdocobj.setSubmit_date(new Date());
				custdocobj.setStatus("Active");
				try {
					commonObj.fileToDirectory(null, editFile, null, custname);
				} catch (MessagingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				custdocDBdobj.setStatus("InActive");
				empDao.updateDocument(custdocDBdobj);
				empDao.saveDocuments(custdocobj);
				message="Success";
			}
	  }
	} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return message;
	}

	@Override
	public List<ClientVendorMaster_DTO> getCustomerMasterListByCanidateId(Integer candidateid) {
		List<ClientVendorMaster_DTO> customerList = null;
		try {
			customerList = empDao.getCustomerMasterListByCanidateId(candidateid);
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return customerList;
	}

	@Override
	public ClientVendorMaster_DTO getCustomerMasterByCanidateId(Integer candidateid) {
		ClientVendorMaster_DTO msg = null;
		try {
			msg = empDao.getCustomerMasterByCanidateId(candidateid);
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return msg;
	}

	@Override
	public String updateClientVendorDocumentById(MultipartFile editFile, String fileId, String fromdate,
			String expiry_date, String vendId, Integer loginempno, String efileType, String custmid,
			String candidateId) {
		String message="";
		try {
		//EmpDocumentsEntity vendocobj=new EmpDocumentsEntity();
		Integer venId=0;
		if(!vendId.isEmpty()) {
			venId=Integer.parseInt(vendId);
		}
		
		Integer docId=0;
		if (fileId!="") {
			docId = Integer.parseInt(fileId);
		}
		
		Integer cust_Id=0;
		if (custmid!="") {
			cust_Id = Integer.parseInt(custmid);
		}
		
		Integer candidate_Id=0;
		if(!candidateId.isEmpty()) {
			candidate_Id=Integer.parseInt(candidateId);
		}
		
		EmpDocumentsEntity vendocDBdobj=empDao.getDocumentByDocId(docId);
		
	//	System.out.println("--------"+fromdate+"***************"+expiry_date+"-------------"+custdocDBdobj.getFrom_date()+custdocDBdobj.getExpiry_date());
		if(editFile!=null) {
			System.out.println("No New Document"+efileType);
			
			
			if(!editFile.getOriginalFilename().isEmpty()) {
				EmpDocumentsHistoryEntity docHistoryObj=new EmpDocumentsHistoryEntity();
				docHistoryObj.setDocument_id(vendocDBdobj.getDocument_id());
				docHistoryObj.setCandidate_id(vendocDBdobj.getCandidate_id());
				docHistoryObj.setCustomer_id(vendocDBdobj.getCustomer_id());
				docHistoryObj.setVendorid(vendocDBdobj.getVendorid());
				docHistoryObj.setFile_name(vendocDBdobj.getFile_name());
				docHistoryObj.setFiletype(vendocDBdobj.getFiletype());
				docHistoryObj.setPostedBy(vendocDBdobj.getPostedBy());
				docHistoryObj.setSubmit_date(vendocDBdobj.getSubmit_date());
				docHistoryObj.setStatus(vendocDBdobj.getStatus());
				docHistoryObj.setFrom_date(vendocDBdobj.getFrom_date());
				docHistoryObj.setExpiry_date(vendocDBdobj.getExpiry_date());
				empDao.saveDocumentsHistory(docHistoryObj);
				System.out.println("-------**************"+editFile.getOriginalFilename());
				if(!fromdate.isEmpty()) {
					vendocDBdobj.setFrom_date(fromdate);
				}else {
					vendocDBdobj.setFrom_date("");
				}
				if(!expiry_date.isEmpty()) {
					vendocDBdobj.setExpiry_date(expiry_date);
				}else {
					vendocDBdobj.setExpiry_date("");
				}
				vendocDBdobj.setVendorid(venId);
				vendocDBdobj.setCustomer_id(cust_Id);
				vendocDBdobj.setCandidate_id(candidate_Id);
				vendocDBdobj.setFile_name(editFile.getOriginalFilename());
				vendocDBdobj.setFiletype(efileType);
				vendocDBdobj.setPostedBy(loginempno);
				vendocDBdobj.setSubmit_date(new Date());
				/*vendocobj.setStatus("Active");
				empDao.saveDocuments(vendocobj);
				vendocDBdobj.setStatus("InActive");*/
				empDao.updateDocument(vendocDBdobj);
				message="Success";
				try {
					commonObj.fileToDirectory(candidate_Id, editFile, null, null);
				} catch (MessagingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}else {
				if(!fromdate.isEmpty() || !expiry_date.isEmpty()) {
					EmpDocumentsHistoryEntity docHistoryObj=new EmpDocumentsHistoryEntity();
					docHistoryObj.setDocument_id(vendocDBdobj.getDocument_id());
					docHistoryObj.setCandidate_id(vendocDBdobj.getCandidate_id());
					docHistoryObj.setCustomer_id(vendocDBdobj.getCustomer_id());
					docHistoryObj.setVendorid(vendocDBdobj.getVendorid());
					docHistoryObj.setFile_name(vendocDBdobj.getFile_name());
					docHistoryObj.setFiletype(vendocDBdobj.getFiletype());
					docHistoryObj.setPostedBy(vendocDBdobj.getPostedBy());
					docHistoryObj.setSubmit_date(vendocDBdobj.getSubmit_date());
					docHistoryObj.setStatus(vendocDBdobj.getStatus());
					docHistoryObj.setFrom_date(vendocDBdobj.getFrom_date());
					docHistoryObj.setExpiry_date(vendocDBdobj.getExpiry_date());
					empDao.saveDocumentsHistory(docHistoryObj);
					
					System.out.println("No New Document"+fromdate+expiry_date);
				if(vendocDBdobj.getFrom_date()!=null && vendocDBdobj.getExpiry_date()!=null) {
					System.out.println("sd & ed are not null in DB"+vendocDBdobj.getFrom_date()+vendocDBdobj.getExpiry_date());
					if(!vendocDBdobj.getFrom_date().equals(fromdate) || !vendocDBdobj.getExpiry_date().equals(expiry_date)) {
						if(!expiry_date.isEmpty()) {
							vendocDBdobj.setExpiry_date(expiry_date);
						}
						if(!fromdate.isEmpty()) {
							vendocDBdobj.setFrom_date(fromdate);
						}
						vendocDBdobj.setFrom_date(fromdate);
						vendocDBdobj.setVendorid(venId);
						vendocDBdobj.setCustomer_id(cust_Id);
						vendocDBdobj.setCandidate_id(candidate_Id);
						vendocDBdobj.setFile_name(vendocDBdobj.getFile_name());
						vendocDBdobj.setFiletype(vendocDBdobj.getFiletype());
						//vendocobj.setStatus("Active");
						vendocDBdobj.setPostedBy(loginempno);
						vendocDBdobj.setSubmit_date(new Date());
						/*empDao.saveDocuments(vendocobj);
						vendocDBdobj.setStatus("InActive");*/
						empDao.updateDocument(vendocDBdobj);
						message = "Success";
					}else {
						//message = "Error";
					}
				}
				else if(vendocDBdobj.getFrom_date()!=null && vendocDBdobj.getExpiry_date()==null) {
					System.out.println("sd isnot null in DB && ed is null"+vendocDBdobj.getFrom_date()+vendocDBdobj.getExpiry_date());
					if(!vendocDBdobj.getFrom_date().equals(fromdate)) {
						System.out.println("if********");
						if(!expiry_date.isEmpty()) {
							vendocDBdobj.setExpiry_date(expiry_date);
						}
						vendocDBdobj.setFrom_date(fromdate);
						vendocDBdobj.setVendorid(venId);
						vendocDBdobj.setCustomer_id(cust_Id);
						vendocDBdobj.setCandidate_id(candidate_Id);
						vendocDBdobj.setFile_name(vendocDBdobj.getFile_name());
						vendocDBdobj.setFiletype(vendocDBdobj.getFiletype());
						//vendocobj.setStatus("Active");
						vendocDBdobj.setPostedBy(loginempno);
						vendocDBdobj.setSubmit_date(new Date());
						/*empDao.saveDocuments(vendocobj);
						vendocDBdobj.setStatus("InActive");*/
						empDao.updateDocument(vendocDBdobj);
					}else {
						System.out.println("else********");
						if(!expiry_date.isEmpty()) {
							vendocDBdobj.setExpiry_date(expiry_date);
						}
						vendocDBdobj.setFrom_date(fromdate);
						vendocDBdobj.setVendorid(venId);
						vendocDBdobj.setCustomer_id(cust_Id);
						vendocDBdobj.setCandidate_id(candidate_Id);
						vendocDBdobj.setFile_name(vendocDBdobj.getFile_name());
						vendocDBdobj.setFiletype(vendocDBdobj.getFiletype());
						//vendocobj.setStatus("Active");
						vendocDBdobj.setPostedBy(loginempno);
						vendocDBdobj.setSubmit_date(new Date());
						/*empDao.saveDocuments(vendocobj);
						vendocDBdobj.setStatus("InActive");*/
						empDao.updateDocument(vendocDBdobj);
					}
					message = "Success";
				}
				else if(vendocDBdobj.getFrom_date()==null && vendocDBdobj.getExpiry_date()!=null) {
					System.out.println("ed is not null in DB && sd is null"+vendocDBdobj.getFrom_date()+vendocDBdobj.getExpiry_date());
					if(!vendocDBdobj.getExpiry_date().equals(expiry_date)) {
						if(!fromdate.isEmpty()) {
							vendocDBdobj.setFrom_date(fromdate);
						}
						vendocDBdobj.setExpiry_date(expiry_date);
						vendocDBdobj.setVendorid(venId);
						vendocDBdobj.setCustomer_id(cust_Id);
						vendocDBdobj.setCandidate_id(candidate_Id);
						vendocDBdobj.setFile_name(vendocDBdobj.getFile_name());
						vendocDBdobj.setFiletype(vendocDBdobj.getFiletype());
						//vendocobj.setStatus("Active");
						vendocDBdobj.setPostedBy(loginempno);
						vendocDBdobj.setSubmit_date(new Date());
						/*empDao.saveDocuments(vendocobj);
						vendocDBdobj.setStatus("InActive");*/
						empDao.updateDocument(vendocDBdobj);
					}else {
						if(!fromdate.isEmpty()) {
							vendocDBdobj.setFrom_date(fromdate);
						}
						vendocDBdobj.setExpiry_date(expiry_date);
						vendocDBdobj.setVendorid(venId);
						vendocDBdobj.setCustomer_id(cust_Id);
						vendocDBdobj.setCandidate_id(candidate_Id);
						vendocDBdobj.setFile_name(vendocDBdobj.getFile_name());
						vendocDBdobj.setFiletype(vendocDBdobj.getFiletype());
					//	vendocobj.setStatus("Active");
						vendocDBdobj.setPostedBy(loginempno);
						vendocDBdobj.setSubmit_date(new Date());
						/*empDao.saveDocuments(vendocobj);
						vendocDBdobj.setStatus("InActive");*/
						empDao.updateDocument(vendocDBdobj);
					}
					message = "Success";
				}else {
					System.out.println("ed sd are null in DB"+vendocDBdobj.getFrom_date()+vendocDBdobj.getExpiry_date());
					if(!fromdate.isEmpty()) {
						vendocDBdobj.setFrom_date(fromdate);
					}
					if(!expiry_date.isEmpty()) {
						vendocDBdobj.setExpiry_date(expiry_date);
					}
					vendocDBdobj.setVendorid(venId);
					vendocDBdobj.setCustomer_id(cust_Id);
					vendocDBdobj.setCandidate_id(candidate_Id);
					vendocDBdobj.setFile_name(vendocDBdobj.getFile_name());
					vendocDBdobj.setFiletype(vendocDBdobj.getFiletype());
					//vendocobj.setStatus("Active");
					vendocDBdobj.setPostedBy(loginempno);
					vendocDBdobj.setSubmit_date(new Date());
					/*empDao.saveDocuments(vendocobj);
					vendocDBdobj.setStatus("InActive");*/
					empDao.updateDocument(vendocDBdobj);
					message = "Success";
				}
			  }	
			}
		}
	} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return message;
	}

	@Override
	public String updateVendorCCADocumentById(MultipartFile editFile, String fileId, String vendId, String efileType,
			Integer loginempno, String candidateId) {

		String message="";
		try {
		//EmpDocumentsEntity vendocobj=new EmpDocumentsEntity();
		Integer venId=0;
		if(!vendId.isEmpty()) {
			venId=Integer.parseInt(vendId);
		}
		Integer docId=0;
		if (fileId!="") {
			docId = Integer.parseInt(fileId);
		}
		
		Integer candidate_Id=0;
		if(!candidateId.isEmpty()) {
			candidate_Id=Integer.parseInt(candidateId);
		}
		
		EmpDocumentsEntity vendocDBdobj=empDao.getDocumentByDocId(docId);
		if(editFile!=null) {
			if(!editFile.getOriginalFilename().isEmpty()) {
				EmpDocumentsHistoryEntity docHistoryObj=new EmpDocumentsHistoryEntity();
				docHistoryObj.setDocument_id(vendocDBdobj.getDocument_id());
				docHistoryObj.setCandidate_id(vendocDBdobj.getCandidate_id());
				docHistoryObj.setCustomer_id(vendocDBdobj.getCustomer_id());
				docHistoryObj.setVendorid(vendocDBdobj.getVendorid());
				docHistoryObj.setFile_name(vendocDBdobj.getFile_name());
				docHistoryObj.setFiletype(vendocDBdobj.getFiletype());
				docHistoryObj.setPostedBy(vendocDBdobj.getPostedBy());
				docHistoryObj.setSubmit_date(vendocDBdobj.getSubmit_date());
				docHistoryObj.setStatus(vendocDBdobj.getStatus());
				docHistoryObj.setFrom_date(vendocDBdobj.getFrom_date());
				docHistoryObj.setExpiry_date(vendocDBdobj.getExpiry_date());
				empDao.saveDocumentsHistory(docHistoryObj);
				
				
				vendocDBdobj.setVendorid(venId);
				vendocDBdobj.setCandidate_id(candidate_Id);
				vendocDBdobj.setFile_name(editFile.getOriginalFilename());
				vendocDBdobj.setFiletype(efileType);
				vendocDBdobj.setPostedBy(loginempno);
				vendocDBdobj.setSubmit_date(new Date());
				/*vendocDBdobj.setStatus("Active");
				empDao.saveDocuments(vendocDBdobj);
				vendocDBdobj.setStatus("InActive");*/
				empDao.updateDocument(vendocDBdobj);
				message="Success";
				try {
					commonObj.fileToDirectory(candidate_Id, editFile, null, null);
				} catch (MessagingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
	} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return message;
	
	}

	@Override
	public String updateClientCustomerDocumentById(MultipartFile editFile, String fileId, String custmid,
			String efileType, Integer loginempno, String candidateId) {

		String message="";
		try {
		EmpDocumentsEntity vendocobj=new EmpDocumentsEntity();
		Integer cust_Id=0;
		if(!custmid.isEmpty()) {
			cust_Id=Integer.parseInt(custmid);
		}
		Integer docId=0;
		if (fileId!="") {
			docId = Integer.parseInt(fileId);
		}
		Integer candidate_Id=0;
		if(!candidateId.isEmpty()) {
			candidate_Id=Integer.parseInt(candidateId);
		}
		
		EmpDocumentsEntity vendocDBdobj=empDao.getDocumentByDocId(docId);
		if(editFile!=null) {
			System.out.println("New MSG Document"+efileType);
			if(!editFile.getOriginalFilename().isEmpty()) {
				vendocobj.setCustomer_id(cust_Id);
				vendocobj.setCandidate_id(candidate_Id);
				vendocobj.setFile_name(editFile.getOriginalFilename());
				vendocobj.setFiletype(efileType);
				vendocobj.setPostedBy(loginempno);
				vendocobj.setSubmit_date(new Date());
				vendocobj.setStatus("Active");
				empDao.saveDocuments(vendocobj);
				vendocDBdobj.setStatus("InActive");
				empDao.updateDocument(vendocDBdobj);
				message="Success";
				try {
					commonObj.fileToDirectory(candidate_Id, editFile, null, null);
				} catch (MessagingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
	} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return message;
	}

	@Override
	public String saveMailProofClientVendorDocument(MultipartFile editFile, String vendId, Integer loginempno,
			String efileType, String candidateId) {
		String msg=null;
		try {
			Integer ven_Id=0;
			if (!vendId.isEmpty()) {
				ven_Id = Integer.parseInt(vendId);
			 }
			Integer candidate_Id=0;
			if(!candidateId.isEmpty()) {
				candidate_Id=Integer.parseInt(candidateId);
			}
			EmpDocumentsEntity vendocobj=new EmpDocumentsEntity();
			if(editFile!=null) {
				if(!editFile.getOriginalFilename().isEmpty()) {
					vendocobj.setVendorid(ven_Id);
					vendocobj.setCandidate_id(candidate_Id);
					vendocobj.setFile_name(editFile.getOriginalFilename());
					vendocobj.setFiletype(efileType);
					vendocobj.setPostedBy(loginempno);
					vendocobj.setSubmit_date(new Date());
					vendocobj.setStatus("Active");
					try {
						commonObj.fileToDirectory(candidate_Id, editFile, null, null);
					} catch (MessagingException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					empDao.saveDocuments(vendocobj);
					msg="Success";
				}
			}
	} catch (Exception e) {
		logger.info(e.getMessage(),e);
	}
	return msg;
	}

	@Override
	public String saveMailProofClientCustomerDocument(MultipartFile editFile, String cmsgacustmid, Integer loginempno,
			String efileType, String candidateId) {
		String msg=null;
		try {
			Integer cust_Id=0;
			if (!cmsgacustmid.isEmpty()) {
				cust_Id = Integer.parseInt(cmsgacustmid);
			 }
			Integer candidate_Id=0;
			if(!candidateId.isEmpty()) {
				candidate_Id=Integer.parseInt(candidateId);
			}
			EmpDocumentsEntity vendocobj=new EmpDocumentsEntity();
			if(editFile!=null) {
				if(!editFile.getOriginalFilename().isEmpty()) {
					vendocobj.setCustomer_id(cust_Id);
					vendocobj.setCandidate_id(candidate_Id);
					vendocobj.setFile_name(editFile.getOriginalFilename());
					vendocobj.setFiletype(efileType);
					vendocobj.setPostedBy(loginempno);
					vendocobj.setSubmit_date(new Date());
					vendocobj.setStatus("Active");
					try {
						commonObj.fileToDirectory(candidate_Id, editFile, null, null);
					} catch (MessagingException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					empDao.saveDocuments(vendocobj);
					msg="Success";
				}
			}
	} catch (Exception e) {
		logger.info(e.getMessage(),e);
	}
	return msg;
	}

	@Override
	public String saveClientVendorDocument(MultipartFile editFile, String fromdate, String expiry_date, String vendId,
			Integer loginempno, String efileType, String candidateId) {
		String msg=null;
		try {
			Integer ven_Id=0;
			if (!vendId.isEmpty()) {
				ven_Id = Integer.parseInt(vendId);
			 }
			Integer candidate_Id=0;
			if(!candidateId.isEmpty()) {
				candidate_Id=Integer.parseInt(candidateId);
			}
			EmpDocumentsEntity vendocobj=new EmpDocumentsEntity();
			if(editFile!=null) {
				if(!editFile.getOriginalFilename().isEmpty()) {
					if(!fromdate.isEmpty()) {
						vendocobj.setFrom_date(fromdate);
					}
					if(!expiry_date.isEmpty()) {
						vendocobj.setExpiry_date(expiry_date);
					}
					vendocobj.setVendorid(ven_Id);
					vendocobj.setCandidate_id(candidate_Id);
					vendocobj.setFile_name(editFile.getOriginalFilename());
					vendocobj.setFiletype(efileType);
					vendocobj.setPostedBy(loginempno);
					vendocobj.setSubmit_date(new Date());
					vendocobj.setStatus("Active");
					try {
						commonObj.fileToDirectory(candidate_Id, editFile, null, null);
					} catch (MessagingException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					empDao.saveDocuments(vendocobj);
					msg="Success";
				}
			}
	} catch (Exception e) {
		logger.info(e.getMessage(),e);
	}
	return msg;
	}
	
	@Override
	public String saveClientCustomerDocument(MultipartFile editFile, String fromdate, String expiry_date, String custId,
			Integer loginempno, String efileType, String candidateId) {
		String msg=null;
		try {
			Integer cust_Id=0;
			if (!custId.isEmpty()) {
				cust_Id = Integer.parseInt(custId);
			 }
			Integer candidate_Id=0;
			if(!candidateId.isEmpty()) {
				candidate_Id=Integer.parseInt(candidateId);
			}
			EmpDocumentsEntity vendocobj=new EmpDocumentsEntity();
			if(editFile!=null) {
				if(!editFile.getOriginalFilename().isEmpty()) {
					if(!fromdate.isEmpty()) {
						vendocobj.setFrom_date(fromdate);
					}
					if(!expiry_date.isEmpty()) {
						vendocobj.setExpiry_date(expiry_date);
					}
					vendocobj.setCustomer_id(cust_Id);
					vendocobj.setCandidate_id(candidate_Id);
					vendocobj.setFile_name(editFile.getOriginalFilename());
					vendocobj.setFiletype(efileType);
					vendocobj.setPostedBy(loginempno);
					vendocobj.setSubmit_date(new Date());
					vendocobj.setStatus("Active");
					try {
						commonObj.fileToDirectory(candidate_Id, editFile, null, null);
					} catch (MessagingException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					empDao.saveDocuments(vendocobj);
					msg="Success";
				}
			}
	} catch (Exception e) {
		logger.info(e.getMessage(),e);
	}
	return msg;
	}

	@Override
	public List<DocumentHistoryDto> getClientCustomerDocumentHistiryById(String custid, String candidateId) {
		 List<DocumentHistoryDto> customerdocs=null;
			try {
				Integer cust_Id=0;
				if(!custid.isEmpty()) {
					cust_Id=Integer.parseInt(custid);
				}
				Integer candidate_Id=0;
				if(!candidateId.isEmpty()) {
					candidate_Id=Integer.parseInt(candidateId);
				}
				customerdocs=empDao.getClientCustomerDocumentHistiryById(cust_Id,candidate_Id);
				
			} catch (Exception e) {
				logger.info(e.getMessage(),e);
			}
			return customerdocs;	
		}

	@Override
	public List<DocumentHistoryDto> getClientVendorDocumentHistiryById(String vendId, String candidateId,
			String fileType) {
		List<DocumentHistoryDto> customerdocs=null;
		try {
			Integer ven_Id=0;
			if(!vendId.isEmpty()) {
				ven_Id=Integer.parseInt(vendId);
			}
			Integer candidate_Id=0;
			if(!candidateId.isEmpty()) {
				candidate_Id=Integer.parseInt(candidateId);
			}
			customerdocs=empDao.getClientVendorDocumentHistiryById(ven_Id,candidate_Id,fileType);
			
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return customerdocs;	
	}

	@Override
	public List<DocumentHistoryDto> getConsultantDocumentHistiryById(String docid, String fileType, String InputVal) {
		List<DocumentHistoryDto> consultantdocs=null;
		try {
		  /* Integer candidate_Id=0;
			if(!candidateId.isEmpty()) {
				candidate_Id=Integer.parseInt(candidateId);
			}
			consultantdocs=empDao.getConsultantDocumentHistiryById(candidate_Id,fileType,InputVal);
			*/
			Integer doc_Id=0;
			if(!docid.isEmpty()) {
				doc_Id=Integer.parseInt(docid);
			}
			//customerdocs=empDao.getCustomerDocumentHistiryByCustomerId(cust_Id);
			consultantdocs=empDao.getDocumentHistiryById(doc_Id);
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return consultantdocs;
	}

	@Override
	public String updateConsultantWADocument(MultipartFile editFile, String waefileId, String fromdate,
			String expiry_date, String waCandidateId, Integer loginempno, String efileType) {
		String message="";
		try {
		//EmpDocumentsEntity vendocobj=new EmpDocumentsEntity();
		Integer docId=0;
		if (waefileId!="") {
			docId = Integer.parseInt(waefileId);
		}
		
		Integer candidate_Id=0;
		if(!waCandidateId.isEmpty()) {
			candidate_Id=Integer.parseInt(waCandidateId);
		}
		
		EmpDocumentsEntity vendocDBdobj=empDao.getDocumentByDocId(docId);
		
	//	System.out.println("--------"+fromdate+"***************"+expiry_date+"-------------"+custdocDBdobj.getFrom_date()+custdocDBdobj.getExpiry_date());
		if(editFile!=null) {
			System.out.println("No New Document"+efileType);
			if(!editFile.getOriginalFilename().isEmpty()) {
				EmpDocumentsHistoryEntity docHistoryObj=new EmpDocumentsHistoryEntity();
				docHistoryObj.setDocument_id(vendocDBdobj.getDocument_id());
				docHistoryObj.setCandidate_id(vendocDBdobj.getCandidate_id());
				docHistoryObj.setFile_name(vendocDBdobj.getFile_name());
				docHistoryObj.setFiletype(vendocDBdobj.getFiletype());
				docHistoryObj.setPostedBy(vendocDBdobj.getPostedBy());
				docHistoryObj.setSubmit_date(vendocDBdobj.getSubmit_date());
				docHistoryObj.setStatus(vendocDBdobj.getStatus());
				docHistoryObj.setFrom_date(vendocDBdobj.getFrom_date());
				docHistoryObj.setExpiry_date(vendocDBdobj.getExpiry_date());
				empDao.saveDocumentsHistory(docHistoryObj);
				
				System.out.println("-------**************"+editFile.getOriginalFilename());
				if(!fromdate.isEmpty()) {
					vendocDBdobj.setFrom_date(fromdate);
				}else {
					vendocDBdobj.setFrom_date("");
				}
				if(!expiry_date.isEmpty()) {
					vendocDBdobj.setExpiry_date(expiry_date);
				}else {
					vendocDBdobj.setExpiry_date("");
				}
				vendocDBdobj.setCandidate_id(candidate_Id);
				vendocDBdobj.setFile_name(editFile.getOriginalFilename());
				vendocDBdobj.setFiletype(efileType);
				vendocDBdobj.setPostedBy(loginempno);
				vendocDBdobj.setSubmit_date(new Date());
				//vendocDBdobj.setStatus("Active");
				//empDao.saveDocuments(vendocobj);
				//vendocDBdobj.setStatus("InActive");
				empDao.updateDocument(vendocDBdobj);
				message="Success";
				try {
					commonObj.fileToDirectory(candidate_Id, editFile, null, null);
				} catch (MessagingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}else {
				if(!fromdate.isEmpty() || !expiry_date.isEmpty()) {
					EmpDocumentsHistoryEntity docHistoryObj=new EmpDocumentsHistoryEntity();
					docHistoryObj.setDocument_id(vendocDBdobj.getDocument_id());
					docHistoryObj.setCandidate_id(vendocDBdobj.getCandidate_id());
					docHistoryObj.setFile_name(vendocDBdobj.getFile_name());
					docHistoryObj.setFiletype(vendocDBdobj.getFiletype());
					docHistoryObj.setPostedBy(vendocDBdobj.getPostedBy());
					docHistoryObj.setSubmit_date(vendocDBdobj.getSubmit_date());
					docHistoryObj.setStatus(vendocDBdobj.getStatus());
					docHistoryObj.setFrom_date(vendocDBdobj.getFrom_date());
					docHistoryObj.setExpiry_date(vendocDBdobj.getExpiry_date());
					empDao.saveDocumentsHistory(docHistoryObj);
					System.out.println("No New Document"+fromdate+expiry_date);
				if(vendocDBdobj.getFrom_date()!=null && vendocDBdobj.getExpiry_date()!=null) {
					System.out.println("sd & ed are not null in DB"+vendocDBdobj.getFrom_date()+vendocDBdobj.getExpiry_date());
					if(!vendocDBdobj.getFrom_date().equals(fromdate) || !vendocDBdobj.getExpiry_date().equals(expiry_date)) {
						if(!expiry_date.isEmpty()) {
							vendocDBdobj.setExpiry_date(expiry_date);
						}
						if(!fromdate.isEmpty()) {
							vendocDBdobj.setFrom_date(fromdate);
						}
						vendocDBdobj.setFrom_date(fromdate);
						vendocDBdobj.setCandidate_id(candidate_Id);
						vendocDBdobj.setFile_name(vendocDBdobj.getFile_name());
						vendocDBdobj.setFiletype(vendocDBdobj.getFiletype());
						//vendocDBdobj.setStatus("Active");
						vendocDBdobj.setPostedBy(loginempno);
						vendocDBdobj.setSubmit_date(new Date());
						//empDao.saveDocuments(vendocobj);
						//vendocDBdobj.setStatus("InActive");
						empDao.updateDocument(vendocDBdobj);
						message = "Success";
					}else {
						//message = "Error";
					}
				}
				else if(vendocDBdobj.getFrom_date()!=null && vendocDBdobj.getExpiry_date()==null) {
					System.out.println("sd isnot null in DB && ed is null"+vendocDBdobj.getFrom_date()+vendocDBdobj.getExpiry_date());
					if(!vendocDBdobj.getFrom_date().equals(fromdate)) {
						System.out.println("if********");
						if(!expiry_date.isEmpty()) {
							vendocDBdobj.setExpiry_date(expiry_date);
						}
						vendocDBdobj.setFrom_date(fromdate);
						vendocDBdobj.setCandidate_id(candidate_Id);
						vendocDBdobj.setFile_name(vendocDBdobj.getFile_name());
						vendocDBdobj.setFiletype(vendocDBdobj.getFiletype());
						//vendocDBdobj.setStatus("Active");
						vendocDBdobj.setPostedBy(loginempno);
						vendocDBdobj.setSubmit_date(new Date());
						//empDao.saveDocuments(vendocDBdobj);
						//vendocDBdobj.setStatus("InActive");
						empDao.updateDocument(vendocDBdobj);
					}else {
						System.out.println("else********");
						if(!expiry_date.isEmpty()) {
							vendocDBdobj.setExpiry_date(expiry_date);
						}
						vendocDBdobj.setFrom_date(fromdate);
						vendocDBdobj.setCandidate_id(candidate_Id);
						vendocDBdobj.setFile_name(vendocDBdobj.getFile_name());
						vendocDBdobj.setFiletype(vendocDBdobj.getFiletype());
						//vendocDBdobj.setStatus("Active");
						vendocDBdobj.setPostedBy(loginempno);
						vendocDBdobj.setSubmit_date(new Date());
						//empDao.saveDocuments(vendocDBdobj);
						//vendocDBdobj.setStatus("InActive");
						empDao.updateDocument(vendocDBdobj);
					}
					message = "Success";
				}
				else if(vendocDBdobj.getFrom_date()==null && vendocDBdobj.getExpiry_date()!=null) {
					System.out.println("ed is not null in DB && sd is null"+vendocDBdobj.getFrom_date()+vendocDBdobj.getExpiry_date());
					if(!vendocDBdobj.getExpiry_date().equals(expiry_date)) {
						if(!fromdate.isEmpty()) {
							vendocDBdobj.setFrom_date(fromdate);
						}
						vendocDBdobj.setExpiry_date(expiry_date);
						vendocDBdobj.setCandidate_id(candidate_Id);
						vendocDBdobj.setFile_name(vendocDBdobj.getFile_name());
						vendocDBdobj.setFiletype(vendocDBdobj.getFiletype());
						//vendocDBdobj.setStatus("Active");
						vendocDBdobj.setPostedBy(loginempno);
						vendocDBdobj.setSubmit_date(new Date());
						//empDao.saveDocuments(vendocDBdobj);
						//vendocDBdobj.setStatus("InActive");
						empDao.updateDocument(vendocDBdobj);
					}else {
						if(!fromdate.isEmpty()) {
							vendocDBdobj.setFrom_date(fromdate);
						}
						vendocDBdobj.setExpiry_date(expiry_date);
						vendocDBdobj.setCandidate_id(candidate_Id);
						vendocDBdobj.setFile_name(vendocDBdobj.getFile_name());
						vendocDBdobj.setFiletype(vendocDBdobj.getFiletype());
						//vendocDBdobj.setStatus("Active");
						vendocDBdobj.setPostedBy(loginempno);
						vendocDBdobj.setSubmit_date(new Date());
						//empDao.saveDocuments(vendocDBdobj);
						//vendocDBdobj.setStatus("InActive");
						empDao.updateDocument(vendocDBdobj);
					}
					message = "Success";
				}else {
					System.out.println("ed sd are null in DB"+vendocDBdobj.getFrom_date()+vendocDBdobj.getExpiry_date());
					if(!fromdate.isEmpty()) {
						vendocDBdobj.setFrom_date(fromdate);
					}
					if(!expiry_date.isEmpty()) {
						vendocDBdobj.setExpiry_date(expiry_date);
					}
					vendocDBdobj.setCandidate_id(candidate_Id);
					vendocDBdobj.setFile_name(vendocDBdobj.getFile_name());
					vendocDBdobj.setFiletype(vendocDBdobj.getFiletype());
					//vendocDBdobj.setStatus("Active");
					vendocDBdobj.setPostedBy(loginempno);
					vendocDBdobj.setSubmit_date(new Date());
					//empDao.saveDocuments(vendocDBdobj);
					//vendocDBdobj.setStatus("InActive");
					empDao.updateDocument(vendocDBdobj);
					message = "Success";
				}
			  }	
			}
		}
	} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return message;
	}

	@Override
	public void saveClientVendorDocs(MultipartFile fileName, String fileType, String candidate_id,
			Integer loginempno, Integer customer_Id, Integer vendorId, String fromdate,
			String expirydate,Integer vendorIdDb, Integer customerIdDb, String emptype, String payRate_Id) {
		try {
			Integer candidate_Id = Integer.parseInt(candidate_id);
			if(!fileName.getOriginalFilename().isEmpty()) {
				EmpDocumentsEntity pdocobj=new EmpDocumentsEntity();
				pdocobj.setFile_name(fileName.getOriginalFilename());
				pdocobj.setFiletype(fileType);
				
				Integer payrateid = 0;
				if (!payRate_Id.isEmpty()) {
					payrateid = Integer.parseInt(payRate_Id);
				}
				if(vendorId!=vendorIdDb) {
					 List<DocEmpBean> viewdocsven=empDao.viewEmpvendocumentsByCandidateId(candidate_Id,emptype,payrateid);
						 if(viewdocsven!=null) {
						 for (DocEmpBean vendoc : viewdocsven) {
							    String filetype=vendoc.getFiletype();
								if(filetype.equalsIgnoreCase("ven_work_order")) {
									 EmpDocumentsEntity docObjDb=empDao.getDocumentByDocId(vendoc.getDocument_id());
									docObjDb.setStatus("InActive");
									empDao.updateDocument(docObjDb);
								}
								else if(filetype.equalsIgnoreCase("Consultant_Consent_Agreement")) {
									 EmpDocumentsEntity docObjDb=empDao.getDocumentByDocId(vendoc.getDocument_id());
										docObjDb.setStatus("InActive");
										empDao.updateDocument(docObjDb);
								}
								else if(filetype.equalsIgnoreCase("Consultant_Compliance")) {
									 EmpDocumentsEntity docObjDb=empDao.getDocumentByDocId(vendoc.getDocument_id());
										docObjDb.setStatus("InActive");
										empDao.updateDocument(docObjDb);
								}else if(filetype.equalsIgnoreCase("Manager_Approved_Email_VWO")) {
									 EmpDocumentsEntity docObjDb=empDao.getDocumentByDocId(vendoc.getDocument_id());
										docObjDb.setStatus("InActive");
										empDao.updateDocument(docObjDb);
								}
						 }
						}
				}
				if(customer_Id!=customerIdDb) {
					System.out.println("****if**customer**"+customer_Id+"((((("+customerIdDb);
					
					 List<DocEmpBean> viewdocscust=empDao.viewEmpcustdocumentsByCandidateId(candidate_Id,emptype,payrateid);
					 if(viewdocscust!=null) {
						 for (DocEmpBean custdoc : viewdocscust) {
							    String filetype=custdoc.getFiletype();
								if(filetype.equalsIgnoreCase("cust_work_order")) {
									 EmpDocumentsEntity custdocObjDb=empDao.getDocumentByDocId(custdoc.getDocument_id());
									 	custdocObjDb.setStatus("InActive");
										empDao.updateDocument(custdocObjDb);
								}
								else if(filetype.equalsIgnoreCase("Manager_Approved_Email_CWO")) {
									 EmpDocumentsEntity custdocObjDb=empDao.getDocumentByDocId(custdoc.getDocument_id());
									 	custdocObjDb.setStatus("InActive");
										empDao.updateDocument(custdocObjDb);
								}
						 }}
				}
				
				if(customer_Id!=null) {
					pdocobj.setCustomer_id(customer_Id);
				}
				if(vendorId!=null) {
					pdocobj.setVendorid(vendorId);
				}
				System.out.println("*********"+fromdate+"**********"+expirydate);
				if(fromdate!=null) {
					pdocobj.setFrom_date(fromdate);
				}
				if(expirydate!=null) {
					pdocobj.setExpiry_date(expirydate);
				}
				pdocobj.setCandidate_id(candidate_Id);
				pdocobj.setStatus("Active");
				pdocobj.setPostedBy(loginempno);
				pdocobj.setSubmit_date(new Date());
				commonObj.fileToDirectory(candidate_Id,fileName,null,null);
				empDao.saveDocuments(pdocobj);
			}
					
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		  }
    	}

	@Override
	public List<ProjectDetailsHistoryDto> getPayrateHistoryDetailsByPayrateId(String payrate_id) {
		List<ProjectDetailsHistoryDto> prhistoryList=null;
		try {
			Integer payrateId=0;
			if(!payrate_id.isEmpty()) {
				payrateId=Integer.parseInt(payrate_id);
			}
			prhistoryList=empDao.getPayrateHistoryDetailsByPayrateId(payrateId);
			
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return prhistoryList;
	}

	@Override
	public Integer saveOtherClientDetails(String client_name, String fed_id, String client_mgr,
			String client_mgr_email, String client_mgr_extn, String client_emp_email, String client_emp_extn,
			Integer candidate_id, Integer loginempno, String client_type, Integer payrateId) {
		Integer clientId=0;
		try {
			/*String emptype=null;
			CandidateDetailedInfo candidateObj=empDao.getCandidateDetailedInfoById(candidate_id);
			if(candidateObj!=null) {
				emptype=candidateObj.getEmp_type();
			}*/
			ClientDetailsEntity clientObj = new ClientDetailsEntity();
			clientObj.setClientName(client_name);
			//clientObj.setClientAdd(othr_client_addr);
			clientObj.setFed_id(fed_id);
			clientObj.setClient_mgr(client_mgr);
			clientObj.setClient_mgr_email(client_mgr_email);
			clientObj.setClient_mgr_extn(client_mgr_extn);
			clientObj.setEmp_mailat_client(client_emp_email);
			clientObj.setEmp_extnat_client(client_emp_extn);
			clientObj.setCandidate_id(candidate_id);
			clientObj.setPosted_by(loginempno);
			clientObj.setSubmittedOn(new Date());
			clientObj.setStatus(1);
			clientObj.setClient_type(client_type);
			//if(emptype.equalsIgnoreCase("W2")) {
			clientObj.setPayrate_id(payrateId);
			//}
			clientId=empDao.saveClientDetails(clientObj);
			//sendmail.sendMail(frommail, toemail, toName, comments, subject);
		/*	String[] tasks = {"Upload LCA", "Upload LCA Questionnaire", "Upload PAF"};
			if(organization_name!=null && clientId!=0) {
				 for(int i=0; i< tasks.length; i++){
				      System.out.println(tasks[i]);
				      TaskDetailsEntity taskObj=new TaskDetailsEntity();
				      taskObj.setTask_name(tasks[i]);
				      taskObj.setTask_description(tasks[i]);
				      taskObj.setCreated_date(new Date());
				      SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
				      Calendar c = Calendar.getInstance();
				      c.setTime(new Date()); // Now use today date.
				      c.add(Calendar.DATE, 7); // Adding 7 days
				      String date = sdf.format(c.getTime());
				      taskObj.setDue_date(date);
				      taskObj.setTask_status("Open");
				      taskObj.setDocumenttype_name("LCA");
				      taskObj.setPosted_by(loginempno);
				      taskObj.setPayrate_id(payrateId);
				      taskObj.setCandidate_id(candidate_id);
				      taskObj.setClient_id(clientId);
				      immiao.saveTaskDetails(taskObj);
				    }
			}*/
			
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return clientId;
	}

	@Override
	public List<ClientVendorMaster_DTO> viewOtherClientDetailsByCandidateId(String candidate_id, String payrateid) {
			List<ClientVendorMaster_DTO> clientlist = null;
			try {
				Integer candidate_Id=0;
				if (candidate_id!="") {
					candidate_Id = Integer.parseInt(candidate_id);
				}
				Integer payrate_id = 0;
				if (!payrateid.isEmpty()) {
					payrate_id = Integer.parseInt(payrateid);
				}else {
					EmpPayRateDetails parateOb=empDao.payrateDetailsByCandidateId(candidate_Id);
					if(parateOb!=null) {
						payrate_id=parateOb.getPayrate_id();
					}
				}
				
				CandidateDetailedInfo candiObj=empDao.getCandidateDetailedInfoById(candidate_Id);
				if(candiObj!=null) {
					String emptyp=candiObj.getEmp_type();
					clientlist = empDao.viewOtherLocationDetailsByCandidateId(candidate_Id,payrate_id,emptyp);
				}
				
			} catch (Exception e) {
				logger.info(e.getMessage(),e);
			}
			return clientlist;
	}
	
	@Override
	public String saveupdateinhouseproject(String projectname, String startdate, String enddate, String payrolltype,
			String line1, String line2, String city, String state, String zipcode, Integer lgempno,
			Integer lgcandidateid, String candidateid, String emptype, String payrateid) {
		String msg="";
		
		try {
			
			Integer candidate_Id=0;Integer payrate_id=0;
			if (candidateid!="") {
				candidate_Id = Integer.parseInt(candidateid);
			}if (payrateid!="") {
				payrate_id = Integer.parseInt(payrateid);
			}
			
			if(payrate_id>0) {
				EmpPayRateDetails payrateObj=empDao.getPayrateDetailsByPayrateId(payrate_id);
				payrateObj.setProj_startDate(startdate);
				payrateObj.setProj_endDate(enddate);
				payrateObj.setPayroll_type(payrolltype);
				
				empDao.updatePayRateDetails(payrateObj);
				
				ClientDetailsEntity clientObj =empDao.getclientDetailsBypayrateId(payrate_id);
				clientObj.setProject_name(projectname);
				empDao.updateClientDetails(clientObj);
				
				CompanyAdressEntity compnayadress=empDao.getCompanyAdressDetailsById(clientObj.getClient_id(), "In-house");
				compnayadress.setLine1(line1);
				compnayadress.setCity(city);
				compnayadress.setState(state);
				compnayadress.setZipcode(zipcode);
				compnayadress.setStatus("Active");
				if(line2!="") {
					compnayadress.setLine2(line2);
				 }
				empDao.updateCompanyAddressInfo(compnayadress);
				msg="In-house project details updated";
				
			}else {
				EmpPayRateDetails payrateObj = new EmpPayRateDetails();
				payrateObj.setProj_startDate(startdate);
				System.out.println("enddate****"+enddate);
				if(!enddate.isEmpty()) {
					payrateObj.setProj_endDate(enddate);
				}else {
					payrateObj.setProj_endDate(commonObj.getSQLDateToMMDDYYYY(new Date()));
					System.out.println("enddate****"+commonObj.getSQLDateToMMDDYYYY(new Date()));
				}
				
				payrateObj.setCustomer_id(0);
				payrateObj.setVendorid(0);
				payrateObj.setCandidate_id(candidate_Id);
				payrateObj.setPostedBy(lgempno);
				payrateObj.setProject_status("Active");
				payrateObj.setStatus("Active");
				payrateObj.setPayroll_type(payrolltype);
				payrateObj.setSubmittedOn(new Date());
				//Integer payrate_Id=0;
				Integer payrate_Id=empDao.savePayRateBillRateDetails(payrateObj);
				if(payrate_Id>0) {

					ClientDetailsEntity clientObj = new ClientDetailsEntity();
					clientObj.setProject_name(projectname);
					clientObj.setCandidate_id(candidate_Id);
					clientObj.setPosted_by(lgempno);
					clientObj.setSubmittedOn(new Date());
					clientObj.setStatus(1);
					clientObj.setClient_type("In-house");
					clientObj.setPayrate_id(payrate_Id);
					Integer clientId=empDao.saveClientDetails(clientObj);
				if(clientId>0) {
					CompanyAdressEntity companyAddressObj = new CompanyAdressEntity();
					companyAddressObj.setLine1(line1);
					companyAddressObj.setCompany_id(clientId);
					companyAddressObj.setCity(city);
					companyAddressObj.setState(state);
					companyAddressObj.setZipcode(zipcode);
					companyAddressObj.setStatus("Active");
					companyAddressObj.setPostedBy(lgempno);
					companyAddressObj.setCompany_type("In-house");
					companyAddressObj.setSubmitted_on(new Date());
					if(line2!="") {
						 companyAddressObj.setLine2(line2);
					 }
					empDao.saveCompanyAddressDetails(companyAddressObj);
					}
				CandidateDetailedInfo empDetailedObj=empDao.getCandidateDetailedInfoById(candidate_Id);
				if(empDetailedObj!=null) {
					empDetailedObj.setEmp_billing("nonbillable");
					empDao.updateCandidateDetailedInfo(empDetailedObj);
				}
					msg="In-house project details added successfully";
				}else {
					msg="In-house project details not added";
				}
				PageStatusEntity pagestsObj=empDao.getRedirectPageStatus(candidate_Id);
				if(pagestsObj.getClient_status()==0) {
					pagestsObj.setClient_status(1);
					pagestsObj.setClient_submitdate(new Date());
					empDao.updatePageStatus(pagestsObj);
				}
			
			}
			
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return msg;
	
	}

	@Override
	public ClientVendorMaster_DTO viewInhouseproject(String candidate_id, String empType, String payrate_id) {
		ClientVendorMaster_DTO inhousedetails=null;
		try {
			Integer payrateid=0;Integer candidate_Id=0;
			if (payrate_id!="") {
				payrateid = Integer.parseInt(payrate_id);
			}
			if (candidate_id!="") {
				candidate_Id = Integer.parseInt(candidate_id);
			}
			inhousedetails=empDao.getInhouseprojectdetailsbyIds(payrate_id,candidate_Id);
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return inhousedetails;
		
	}

	@Override
	public ClientVendorMaster_DTO getclientsizebybillingtype(String candidate_id,String billingtype) {
		ClientVendorMaster_DTO countObj=new ClientVendorMaster_DTO();
		try {
			Integer candidate_Id=0;
			if (candidate_id!="") {
				candidate_Id = Integer.parseInt(candidate_id);
			}
			
			//if(billingtype.equalsIgnoreCase("billable")) {
			
				Integer clientList = empDao.getactiveclientListByCandidate(candidate_Id,"client");
				if(clientList!=null) {
					countObj.setClientcount(clientList);
				}else {
					countObj.setClientcount(0);
				}
				Integer nonclientList = empDao.getactiveclientListByCandidate(candidate_Id,"inhouse");
				
				if(nonclientList!=null) {
					countObj.setInhousecount(nonclientList);
				}else {
					countObj.setInhousecount(0);
				}
			//}
		
		
		
		
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return countObj;
	}

	@Override
	public void updateCustomerMasterQBCustomerId(Integer customer_id, Integer qbcustomerid) {
		try {
			CustomerMasterEntity custDBObj =empDao.getCustomerDetailsById(customer_id);
			if(custDBObj!=null) {
				 custDBObj.setQb_customerid(qbcustomerid);
				 custDBObj.setSubmittedOn(new Date());
				 empDao.updateCustomerMaster(custDBObj);
		       }
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
	}

	@Override
	public Integer saveProductServices(String productName, String bill_rate, Integer payrateId, String desc, String qbproductid) {
		Integer productId = 0;
		try {
			ProductsEntity prodDBObj =empDao.getProductServicesByPayrateId(payrateId);
			if(prodDBObj!=null) {
				prodDBObj.setStatus("InActive");
				empDao.updateProductServices(prodDBObj);
			}
			
			ProductsEntity psObj = new ProductsEntity();
			psObj.setProduct_name(productName);
			psObj.setPayrate_id(payrateId);
			psObj.setUnitprice(Integer.parseInt(bill_rate));
			psObj.setDescription(desc);
			psObj.setStatus("Active");
			if(qbproductid!="") {
				Integer qbproduct_id = Integer.parseInt(qbproductid);
				psObj.setQb_productid(qbproduct_id);
			}
			productId=empDao.saveProductServices(psObj);
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return productId;
		
	}

	@Override
	public String updateQBProductId(Integer productId, Integer qbproductid) {
		String message="";
		try {
           
			ProductsEntity prodDBObj =empDao.getProductServicesById(productId);
			prodDBObj.setQb_productid(qbproductid);
		    empDao.updateProductServices(prodDBObj);
			//sendmail.sendMail(frommail, toemail, toName, comments, subject);
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return message;
	}

	@Override
	public ProductsEntity getProductServicesByPayRateId(String payrate_id) {
		ProductsEntity prodObj=null;
		try {
			Integer payrateId=0;
			if(!payrate_id.isEmpty()) {
				payrateId=Integer.parseInt(payrate_id);
			}
			prodObj=empDao.getProductServicesByPayRateId(payrateId);
			
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return prodObj;
	}

	@Override
	public String checkCustomerName(String cust_name) {
		String msg = null;
		try {
			CustomerMasterEntity custObj = empDao.getCustomerDetailsByName(cust_name);
			if(custObj!=null) {
				msg="Exist";
			}else {
				msg="Not Exist";
			  }
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return msg;
	}
	
	@Override
	public String checkQbProduct(String productid) {
		String msg = null;
		try {
			Integer product_id=0;
			if(!productid.isEmpty()) {
				product_id=Integer.parseInt(productid);
			}
			ProductsEntity prodDBObj =empDao.getProductServicesByQbId(product_id);
			if(prodDBObj!=null) {
				msg="Exist";
			}else {
				msg="Not Exist";
			  }
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return msg;
	}

	@Override
	public void saveEndClientDetails(String client_name, Integer candidate_Id, Integer loginempno, String client_type,
			Integer payrateId) {
		try {
			ClientDetailsEntity clientObj = new ClientDetailsEntity();
			clientObj.setClientName(client_name);
			//clientObj.setClientAdd(othr_client_addr);
			clientObj.setCandidate_id(candidate_Id);
			clientObj.setPosted_by(loginempno);
			clientObj.setSubmittedOn(new Date());
			clientObj.setStatus(1);
			clientObj.setClient_type(client_type);
			//if(emptype.equalsIgnoreCase("W2")) {
			clientObj.setPayrate_id(payrateId);
			//}
			Integer clientId=empDao.saveClientDetails(clientObj);
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
	}

	@Override
	public Integer saveBillRateDetails(String bill_rate, String invoice_terms, String proj_startDate,
			String proj_endDate, Integer customer_Id, Integer candidate_Id, String bcurrency,
			String invoice_period, String payrolltype, Integer loginempno) {
		Integer payrateId=0;
		try {
			EmpPayRateDetails payrateObj = new EmpPayRateDetails();
			payrateObj.setBillrate(bill_rate);
			payrateObj.setInvoice_terms(invoice_terms);
			payrateObj.setProj_startDate(proj_startDate);
			payrateObj.setProj_endDate(proj_endDate);
			payrateObj.setCustomer_id(customer_Id);
			payrateObj.setVendorid(0);
			payrateObj.setCandidate_id(candidate_Id);
			payrateObj.setSubmittedOn(new Date());
			payrateObj.setPostedBy(loginempno);
			payrateObj.setProject_status("Active");
			payrateObj.setStatus("Active");
			payrateObj.setPayroll_type(payrolltype);
			payrateObj.setInvoice_period(invoice_period);
			payrateId=empDao.savePayRateBillRateDetails(payrateObj);
			
			ProjectDetailsHistory projectHistoryObj=new ProjectDetailsHistory();
			projectHistoryObj.setPayrate_id(payrateId);
			projectHistoryObj.setCustomer_id(customer_Id);
			projectHistoryObj.setVendorid(0);
			projectHistoryObj.setCandidate_id(candidate_Id);
			projectHistoryObj.setProj_startDate(proj_startDate);
			projectHistoryObj.setProj_endDate(proj_endDate);
			projectHistoryObj.setPostedBy(loginempno);
			projectHistoryObj.setSubmittedOn(new Date());
			//projectHistoryObj.setInvoice_period(invoice_period);
			empDao.saveProjectDetailsHistory(projectHistoryObj);
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return payrateId;
	}

	@Override
	public void saveQBEmpDetailsToUsObt(String firstname, String middlename, String familyname, String hiredate,
			String birthdate, String phone, String mobile, String mail, String line1, String city, String state,
			String zipcode, String qbEmpID) {
		try {
			System.out.println("In service");
			EmpBasicDetailsEntity basicObjDb=null;
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd");
		//	SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
			String dobDate = null;
			System.out.println("birthdate***"+birthdate);
			if (birthdate!= null && !birthdate.isEmpty()) {
				java.util.Date birthdate1 = (java.util.Date) sdf.parse(birthdate);
				System.out.println("birthdate1***"+birthdate1);
				dobDate = commonObj.getSQLDateToMMDDYYYY(birthdate1);
			}
			System.out.println(mail+"dobDate***"+dobDate);
			if(mail!="") {
				basicObjDb=empDao.getEmployeeDetailsByMailnDoB(dobDate,mail);
				System.out.println("basicObjDb***"+basicObjDb);
				if(basicObjDb!=null) {
					System.out.println(""+basicObjDb.getFullName());
					basicObjDb.setQbEmpID(qbEmpID);
					empDao.updateBasicDetails(basicObjDb);
				}else {
				EmpBasicDetailsEntity basicObj = new EmpBasicDetailsEntity();
				//String bytes_ssn_emp = Base64.encode(ssn_emp.getBytes());
				String password = "asdASD123";
				String bytepwd = Base64.encode(password.getBytes());
				//basicObj.setSsn_no(bytes_ssn_emp);
				basicObj.setFullName(firstname+" "+familyname);
				basicObj.setPwd(bytepwd);	
				basicObj.setDob(dobDate);
				basicObj.setStatus(1);
				basicObj.setSubmit_date(new Date());

				java.sql.Date joiningDate = null;
				if (hiredate!= null && !hiredate.isEmpty()) {
					java.util.Date joining_Date1 = (java.util.Date) sdf.parse(hiredate);
					joiningDate = new java.sql.Date(joining_Date1.getTime());
				}

				//basicObj.setUserName(autouname);
				//basicObj.setPosted_by(postedempno);
				basicObj.setFirst_name(firstname);
				basicObj.setMiddle_name(middlename);
				basicObj.setFamily_name(familyname);
				basicObj.setContact_no1(mobile);
				basicObj.setContact_no_type1("Personal");
				if(!phone.isEmpty()) {
					basicObj.setContact_no2(phone);
					basicObj.setContact_no_type2("Other");
				  }
				basicObj.setEmail(mail);
				Integer emp_number = 0;
				basicObj.setEmp_number(emp_number);
				/*Integer empno = empDao.getEmployeeNo();
				if (empno != null) {
					emp_number = empno + 1;
					boolean check = empDao.checkEmpExists(emp_number);
					while (check == false) {
						emp_number = empno + 1;
						break;
					}
					basicObj.setEmp_number(emp_number);
				}*/
				basicObj.setQbEmpID(qbEmpID);
				Integer candidateId = empDao.saveBasicDetails(basicObj);
				System.out.println("saveBasicDetails******"+candidateId);
				if(candidateId>0) {
					CandidateAddress candAddressObj = new CandidateAddress();
					candAddressObj.setLine1(line1);
					candAddressObj.setCandidate_id(candidateId);
					candAddressObj.setCity(city);
					candAddressObj.setState(state);
					candAddressObj.setZipcode(zipcode);
					candAddressObj.setStatus("Active");
					candAddressObj.setSubmitted_on(new Date());
					empDao.saveCandidateAddressDetails(candAddressObj);
					
					System.out.println("saveCandidateAddressDetails******");
					
				    CandidateDetailedInfo candDetailObj = new CandidateDetailedInfo();
				    candDetailObj.setCandidateInfo(basicObj);
				    candDetailObj.setDepartment_id(0);
				    candDetailObj.setRole_id(0);
				    candDetailObj.setReporting_head(0);
				    candDetailObj.setWork_authorization("");
				    candDetailObj.setJoining_date(joiningDate);
				    candDetailObj.setEmp_type("W2");
				    candDetailObj.setStatus("Active");
				    candDetailObj.setSubmitted_on(new Date());
				    empDao.saveCandidateDetailedInfo(candDetailObj);
				    System.out.println("saveCandidateDetailedInfo******");
				    
				    PageStatusEntity pagestsObj = new PageStatusEntity();
					pagestsObj.setCandidate_id(candidateId);
					//pagestsObj.setPostedBy(lgempno);
					pagestsObj.setBasicinfo_status(1);
					pagestsObj.setDocument_status(0);
					pagestsObj.setClient_status(0);
					pagestsObj.setBank_status(0);
					pagestsObj.setExit_status(0);
					pagestsObj.setBasic_submitdate(new Date());
					empDao.savePageStatus(pagestsObj);
				 }
			  }
			}
			
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
	}
}