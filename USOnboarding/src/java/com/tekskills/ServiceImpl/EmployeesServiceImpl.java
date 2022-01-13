package com.tekskills.ServiceImpl;


import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import javax.imageio.ImageIO;
import javax.mail.MessagingException;

import org.apache.log4j.Logger;
import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.pdmodel.PDPage;
import org.apache.pdfbox.rendering.ImageType;
import org.apache.pdfbox.rendering.PDFRenderer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Image;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.PdfCopy;
import com.itextpdf.text.pdf.PdfDocument;
import com.itextpdf.text.pdf.PdfReader;
import com.itextpdf.text.pdf.PdfWriter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.itextpdf.text.Document;
import com.itextpdf.text.Font;
import com.itextpdf.text.Image;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.PdfWriter;
import com.sun.org.apache.xerces.internal.impl.dv.util.Base64;
import com.tekskills.Dao.EmployeesDao;
import com.tekskills.Dto.AttachmentBean;
import com.tekskills.Dto.BasicDetailsDto;
import com.tekskills.Dto.CandidateDocDto;
import com.tekskills.Dto.CustomerDto;
import com.tekskills.Dto.DocEmpBean;
import com.tekskills.Dto.DocumentHistoryDto;
import com.tekskills.Dto.EmployeeDto;
import com.tekskills.Dto.FileBean;
import com.tekskills.Dto.I9SupportingDocumentsDto;
import com.tekskills.Dto.ManagerDto;
import com.tekskills.Dto.MyDashboardDto;
import com.tekskills.Dto.SearchBean;
import com.tekskills.Dto.VendorDto;
import com.tekskills.Entity.BankDetailsEntity;
import com.tekskills.Entity.CandidateAddress;
import com.tekskills.Entity.CandidateDetailedInfo;
import com.tekskills.Entity.ClientDetailsEntity;
import com.tekskills.Entity.DepartmentsEntity;
import com.tekskills.Entity.EmpBasicDetailsEntity;
import com.tekskills.Entity.EmpDocumentsEntity;
import com.tekskills.Entity.EmpDocumentsHistoryEntity;
import com.tekskills.Entity.EmpExitDetailsEntity;
import com.tekskills.Entity.EmpJoinHistorty;
import com.tekskills.Entity.EmpPayRateDetails;
import com.tekskills.Entity.EmpRoles;
import com.tekskills.Entity.EmpTypeMaster;
import com.tekskills.Entity.PageStatusEntity;
import com.tekskills.Entity.WorkAuthorization;
import com.tekskills.Service.EmployeesService;
import com.tekskills.Util.Commons;
import com.tekskills.Util.SendHtmlEmailNew;

@Service
public class EmployeesServiceImpl implements EmployeesService {
	private static final Logger logger = Logger.getLogger(EmployeesServiceImpl.class);
	@Autowired
	EmployeesDao empDao;
	@Autowired
	private SendHtmlEmailNew sendmail;
	@Autowired
	private Commons commonObj;
	@Autowired
	private Environment env;
	
	public EmpBasicDetailsEntity checkLogin(String userName, String password) {
		EmpBasicDetailsEntity basicObj = null;
		try {
			basicObj = empDao.checkLogin(userName, password);
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return basicObj;
	}

	@Override
	public Integer saveBasicDetails(String ssn_emp, String firstName, String employee_type, int w2department,
			String rec_name, String hr_name, String email_id, String phne_no1, String dob, String joining_Date,
			String designation, String billingType, String line1, int roleId, int mgr_empid,
			String autouname, int postedempno, String middleName, String familyName, 
			String line2, String zipcode,	String city, String state, String bgc, String work_auth,
			String phne_no2, String phne_no3,String ctype2, String ctype3, String validateby, String payrolltype) {
		Integer candidateId = 0;
		try {
			System.out.println("In service");
			EmpBasicDetailsEntity basicObj = new EmpBasicDetailsEntity();
			String bytes_ssn_emp = Base64.encode(ssn_emp.getBytes());
			String password = "asdASD123";
			String bytepwd = Base64.encode(password.getBytes());
			basicObj.setSsn_no(bytes_ssn_emp);
			basicObj.setFullName(firstName+" "+familyName);
			basicObj.setPwd(bytepwd);		
			basicObj.setDob(dob);
			basicObj.setStatus(1);
			basicObj.setSubmit_date(new Date());

			SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
			java.sql.Date joiningDate = null;
			if (joining_Date != null && !joining_Date.isEmpty()) {
				java.util.Date joining_Date1 = (java.util.Date) sdf.parse(joining_Date);
				joiningDate = new java.sql.Date(joining_Date1.getTime());
			}

			basicObj.setUserName(autouname);
			basicObj.setPosted_by(postedempno);
			basicObj.setFirst_name(firstName);
			basicObj.setMiddle_name(middleName);
			basicObj.setFamily_name(familyName);
			basicObj.setContact_no1(phne_no1);
			basicObj.setContact_no_type1("Personal");
			if(!phne_no2.isEmpty()) {
				basicObj.setContact_no2(phne_no2);
				basicObj.setContact_no_type2(ctype2);
			}
			if(!phne_no3.isEmpty()) {
				basicObj.setContact_no3(phne_no2);
				basicObj.setContact_no_type3(ctype3);
			}
			
			basicObj.setEmail(email_id);
			Integer emp_number = 0;
			Integer empno = empDao.getEmployeeNo();
			if (empno != null) {
				emp_number = empno + 1;
				boolean check = empDao.checkEmpExists(emp_number);
				while (check == false) {
					emp_number = empno + 1;
					break;
				}
				basicObj.setEmp_number(emp_number);
			}
			
			
			candidateId = empDao.saveBasicDetails(basicObj);
			if(candidateId>0) {
				CandidateAddress candAddressObj = new CandidateAddress();
				candAddressObj.setLine1(line1);
				candAddressObj.setLine2(line2);
				candAddressObj.setCandidate_id(candidateId);
				candAddressObj.setCity(city);
				candAddressObj.setState(state);
				candAddressObj.setZipcode(zipcode);
				candAddressObj.setStatus("Active");
				candAddressObj.setPosted_by(postedempno);
				candAddressObj.setSubmitted_on(new Date());
				empDao.saveCandidateAddressDetails(candAddressObj);
				
				
			    CandidateDetailedInfo candDetailObj = new CandidateDetailedInfo();
			    candDetailObj.setCandidateInfo(basicObj);
			    candDetailObj.setDepartment_id(w2department);
			    candDetailObj.setRole_id(roleId);
			    candDetailObj.setReporting_head(mgr_empid);
			    candDetailObj.setRecruiter_name(rec_name);
			    candDetailObj.setHr_name(hr_name);
			    candDetailObj.setWork_authorization(work_auth);
			    candDetailObj.setBgc_type(bgc);
			    if(!employee_type.equalsIgnoreCase("W2")) {
			    	candDetailObj.setPayroll_type(payrolltype);
			    }
			   candDetailObj.setEmp_type(employee_type);
			    candDetailObj.setJoining_date(joiningDate);
			    candDetailObj.setDesignation(designation);
			    candDetailObj.setStatus("Active");
			    candDetailObj.setPosted_by(postedempno);
			    candDetailObj.setSubmitted_on(new Date());
			    candDetailObj.setEmp_billing(billingType);
			    
			    Integer validateby_flag=0;
			    if(!validateby.isEmpty()) {
			    	validateby_flag=Integer.parseInt(validateby);
			    }
			    candDetailObj.setValidateby_flag(validateby_flag);
			    
			    
			    empDao.saveCandidateDetailedInfo(candDetailObj);
			    
			    if(joiningDate!=null) {
			    	 EmpJoinHistorty joinHistoryObj=new EmpJoinHistorty();
					 joinHistoryObj.setJoindate(joiningDate);
					 joinHistoryObj.setEstatus("Joined");
					 joinHistoryObj.setPosted_by(postedempno);
					 joinHistoryObj.setSubmitted_on(new Date());
					 joinHistoryObj.setCandidate_id(candidateId);
					 empDao.saveJoinHistory(joinHistoryObj);
			    }
				
			PageStatusEntity pagestsObj = new PageStatusEntity();
			pagestsObj.setCandidate_id(candidateId);
			pagestsObj.setPostedBy(postedempno);
			pagestsObj.setBasicinfo_status(1);
			pagestsObj.setDocument_status(0);
			pagestsObj.setClient_status(0);
			pagestsObj.setBank_status(0);
			pagestsObj.setExit_status(0);
			pagestsObj.setBasic_submitdate(new Date());
			empDao.savePageStatus(pagestsObj);
			}
			// sendmail.sendMail(frommail, toemail, toName, comments, subject);
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return candidateId;
	}

	@Override
	public String checkUserName(String fullname, String middleName, String familyName) {
		String unamenoSpace = null;
		try {
			String firstLetter = String.valueOf(familyName.charAt(0));
			String uname = fullname.trim() + "." + firstLetter;
			EmpBasicDetailsEntity basicObj = empDao.checkUserName(uname);
			if (basicObj != null) {
				Integer flag = 0;
				if (basicObj.getFlag() != null) {
					flag = basicObj.getFlag() + 1;
				} else {
					flag = 1;
				}
				String uname1 = basicObj.getUserName() + flag;
				basicObj.setFlag(1);
				empDao.updateFlag(basicObj);
				String userName = uname1;
				unamenoSpace = userName.replaceAll("\\s", "");
			} else {
				unamenoSpace =uname.replaceAll("\\s", "");
			}
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return unamenoSpace;
	}

	@Override
	public EmpBasicDetailsEntity getEmployeeDetailsByCandidateId(Integer candidate_id) {
		EmpBasicDetailsEntity basicObj = null;
		try {
			basicObj = empDao.getEmployeeDetailsByCandidateId(candidate_id);
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return basicObj;
	}

	@Override
	public List<WorkAuthorization> getWorkAuthnList() {
		List<WorkAuthorization> waList = null;
		try {
			waList = empDao.getWorkAuthnList();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return waList;
	}

	@Override
	public List<EmpTypeMaster> getEmployeeTypeList() {
		List<EmpTypeMaster> emptypeList = null;
		try {
			emptypeList = empDao.getEmployeeTypeList();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return emptypeList;
	}

	@Override
	public List<DepartmentsEntity> getdepartmentList() {
		List<DepartmentsEntity> deptList = null;
		try {
			deptList = empDao.getdepartmentList();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return deptList;
	}

	@Override
	public List<EmpRoles> getroleList() {
		List<EmpRoles> roleList = null;
		try {
			roleList = empDao.getroleList();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return roleList;
	}

	@Override
	public List<ManagerDto> getHRList() {
		List<ManagerDto> hrList = null;
		try {
			hrList = empDao.getHRList();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return hrList;
	}

	@Override
	public List<ManagerDto> getrepMagrList() {
		List<ManagerDto> repMagrList = null;
		try {
			repMagrList = empDao.getrepMagrList();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return repMagrList;
	}

	@Override
	public EmpBasicDetailsEntity SSNExistOrNot(String ssn_emp) {
		EmpBasicDetailsEntity ssn = null;
		try {
			ssn = empDao.SSNExistOrNot(ssn_emp);
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return ssn;
	}

	@Override
	public List<SearchBean> empsearchbySSN(String ssn_emp) {
		List<SearchBean> ssnSearch = null;
		try {
			ssnSearch = empDao.empsearchbySSN(ssn_emp);
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return ssnSearch;
	}

	@Override
	public String checkSelectedFileName(String filename) {
		String fName = null;
		try {
			fName = empDao.checkSelectedFileName(filename);
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return fName;
	}

	@Override
	public PageStatusEntity getRedirectPageStatus(Integer candidate_id) {
		PageStatusEntity pageStsObj = null;
		try {
			pageStsObj = empDao.getRedirectPageStatus(candidate_id);
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return pageStsObj;
	}

	@Override
	public String saveEmpbankDetails(String accountNo, String bankname, String swiftcode, String ibancode,
			String routingno, MultipartFile bankfilename, Integer candidate_id, Integer lgempno) {
		String message = null;
		try {
			BankDetailsEntity bankDtlObj = new BankDetailsEntity();
			bankDtlObj.setAccountNo(accountNo);
			bankDtlObj.setBank_name(bankname);
			bankDtlObj.setSwift_Code(swiftcode);
			bankDtlObj.setIban_Code(ibancode);
			bankDtlObj.setBankRoutingNo(routingno);
			bankDtlObj.setCandidate_id(candidate_id);
			bankDtlObj.setSubmitted_date(new Date());
			bankDtlObj.setPosted_by(lgempno);
			bankDtlObj.setStatus("Active");
			
			/*Integer bankAmount = 0;
			if (bankamount != "") {
				bankAmount = Integer.parseInt(bankamount);
				bankDtlObj.setAmount(bankAmount);
			}*/
			
			if (bankfilename != null) {
				bankDtlObj.setBankfilename(bankfilename.getOriginalFilename());
				commonObj.fileToDirectory(candidate_id, bankfilename, null, null);
			}
			Integer bankpkId = empDao.saveEmpbankDetails(bankDtlObj);

			if (bankpkId != null) {
				PageStatusEntity pagestsObj = empDao.getRedirectPageStatus(candidate_id);
				pagestsObj.setBank_status(1);
				pagestsObj.setBank_submitdate(new Date());
				pagestsObj.setPostedBy(lgempno);
				empDao.updatePageStatus(pagestsObj);

				message = "Employee Bank Details Added Successfully";
			} else {
				message = "Something Went Wrong";
			}
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return message;
	}

	@Override
	public String saveExitDetails(EmpExitDetailsEntity exitObj, Integer empno) {
		String message = null;
		try {
			exitObj.setPostedBy(empno);
			exitObj.setStatus("Active");
			exitObj.setSubmit_date(new Date());
			Integer exitId = empDao.saveExitDetails(exitObj);
			if (exitId != null) {
				PageStatusEntity pagestsObj = empDao.getRedirectPageStatus(exitObj.getCandidate_id());
				pagestsObj.setExit_status(1);
				pagestsObj.setExit_submitdate(new Date());
				pagestsObj.setPostedBy(empno);
				empDao.updatePageStatus(pagestsObj);
				message = "Exit Details Added Successfully";
				java.sql.Date exitDate=null;
				 SimpleDateFormat sdf=new SimpleDateFormat("MM/dd/yyyy");  
			      if(exitObj.getExit_lwd() != null && !exitObj.getExit_lwd().isEmpty()) {
			          java.util.Date exitDate1 = (java.util.Date)sdf.parse(exitObj.getExit_lwd());        
			             exitDate = new java.sql.Date(exitDate1.getTime());
			       }
			      
				  Integer history_id=empDao.getJoinHistoryId(exitObj.getCandidate_id());
				  if(history_id!=null){
					    EmpJoinHistorty joinHistoryObjDb=empDao.getJoinHistoryByCandidateId(history_id);
						if(joinHistoryObjDb!=null) {
							     joinHistoryObjDb.setExitdate(exitDate);
							     //joinHistoryObjDb.setEstatus("Exit");
								 empDao.updateJoinHistory(joinHistoryObjDb);
						    }
				  }else {
					     EmpJoinHistorty joinHistoryObj=new EmpJoinHistorty();
						 joinHistoryObj.setExitdate(exitDate);
						 joinHistoryObj.setEstatus("Exit");
						 joinHistoryObj.setPosted_by(empno);
						 joinHistoryObj.setSubmitted_on(new Date());
						 joinHistoryObj.setCandidate_id(exitObj.getCandidate_id());
						 empDao.saveJoinHistory(joinHistoryObj);
				     }
				
			} else {
				message = "Something Went Wrong";
			}
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return message;
	}

	@Override
	public List<ManagerDto> getEmpInfoByEmpType(String sEmp_type) {
		List<ManagerDto> userList = null;
		try {
			userList = empDao.getEmpInfoByEmpType(sEmp_type);
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return userList;
	}

	@Override
	public List<SearchBean> getemplistBySearch(String username, String fullname, String emptype, String pendingdocs,String sEmp_type,String sempstatus) {
		List<SearchBean> searchlist = null;Integer status=null;
		try {
			searchlist = empDao.getemplistBySearch(username, fullname, emptype, pendingdocs, sEmp_type,sempstatus);
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return searchlist;
	}

	@Override
	public BasicDetailsDto viewEmployeeInfo(String candidate_id) {
		BasicDetailsDto basicObj = null;
		try {
			Integer candidateId = Integer.parseInt(candidate_id);
			
			CandidateAddress addressObj= empDao.getCandidateAddressByCandidateId(candidateId);
			if(addressObj!=null) {
				basicObj = empDao.viewEmployeeInfo(candidateId);
			}else {
				basicObj = empDao.viewEmployeeNotWithAddress(candidateId);
			}
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return basicObj;
	}

	@Override
	public String updateBasicDetails(String ssn_emp, String firstName, String employee_type, int w2department1,
			String rec_name, String hr_name, String email_id, String phne_no, String dob, String joining_Date,
			String designation, String billingType, String line1, int role, int mgr_empid, String autouname,
			Integer postedempno, String middleName, String familyName, String line2, String zipcode, String city,
			String state, String bgc, String work_auth, Integer candidateId,
			String phne_no2, String phne_no3,String ctype2, String ctype3, String validateby, String payrolltype) {
		String message = null;
		try {
			EmpBasicDetailsEntity basicDetailDBObj = empDao.getEmployeeDetailsByCandidateId(candidateId);
			CandidateDetailedInfo candidateInfoDBObj = empDao.getCandidateDetailedInfoById(candidateId);
			CandidateAddress candidateAddrDBObj = empDao.getCandidateAddressByCandidateId(candidateId);
		//	BasicDetailsDto basicObj = empDao.viewEmployeeInfo(candidateId);
			String bytes_ssn_emp = Base64.encode(ssn_emp.getBytes());
			
			 Integer validateby_flag=0;
			    if(!validateby.isEmpty()) {
			    	validateby_flag=Integer.parseInt(validateby);
			    }
			    
			    SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
				java.sql.Date joiningDate = null;
				if(joining_Date!= null && !joining_Date.isEmpty()) {
					System.out.println("in ifffffffffffff-----------");
						java.util.Date joining_Date1 = (java.util.Date) sdf.parse(joining_Date);
						joiningDate = new java.sql.Date(joining_Date1.getTime());
						
				   }
				
	  /*if(!basicDetailDBObj.getFirst_name().equalsIgnoreCase(firstName) || !basicDetailDBObj.getFamily_name().equalsIgnoreCase(familyName) 
			  || !basicDetailDBObj.getDob().equalsIgnoreCase(dob) || !basicDetailDBObj.getEmail().equalsIgnoreCase(email_id) 
			  || !basicDetailDBObj.getSsn_no().equalsIgnoreCase(bytes_ssn_emp) || !basicDetailDBObj.getContact_no1().equalsIgnoreCase(phne_no) 
			  || !phne_no2.isEmpty() || !phne_no3.isEmpty()  || ctype2!=null  || ctype3!=null || middleName!=null){*/
	if(basicDetailDBObj!=null) {
				System.out.println("Insided basic info changes");
				basicDetailDBObj.setSsn_no(bytes_ssn_emp);
				basicDetailDBObj.setFullName(firstName+" "+familyName);
				basicDetailDBObj.setDob(dob);
				basicDetailDBObj.setStatus(1);
				basicDetailDBObj.setSubmit_date(new Date());
				basicDetailDBObj.setUserName(basicDetailDBObj.getUserName());
				basicDetailDBObj.setPosted_by(postedempno);
				basicDetailDBObj.setFirst_name(firstName);
				if(basicDetailDBObj.getMiddle_name()!=null) {
					if(!basicDetailDBObj.getMiddle_name().equalsIgnoreCase(middleName)) {
						basicDetailDBObj.setMiddle_name(middleName);
					}
				}else {
					basicDetailDBObj.setMiddle_name(middleName);
				}
				
				basicDetailDBObj.setFamily_name(familyName);
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
				empDao.updateBasicDetails(basicDetailDBObj);
				message = "Basic Details Updated Successfuly";
			}
	  else {
		  message = "Basic Details Not Updated";
	  }
	/*  if(!candidateInfoDBObj.getEmp_type().equals(employee_type) || !candidateInfoDBObj.getDesignation().equals(designation) 
					|| !candidateInfoDBObj.getHr_name().equals(hr_name) || !candidateInfoDBObj.getRecruiter_name().equals(rec_name) 
					|| candidateInfoDBObj.getReporting_head()!=mgr_empid || candidateInfoDBObj.getDepartment_id()!=w2department1 
					|| candidateInfoDBObj.getRole_id()!=role || !candidateInfoDBObj.getBgc_type().equals(bgc) 
					|| !candidateInfoDBObj.getEmp_billing().equals(billingType) || !candidateInfoDBObj.getWork_authorization().equals(work_auth)
					|| (candidateInfoDBObj.getPayroll_type()==null || !candidateInfoDBObj.getPayroll_type().equals(payrolltype)) 
					|| (candidateInfoDBObj.getValidateby_flag()==null) || candidateInfoDBObj.getValidateby_flag()!=validateby_flag
					|| (!candidateInfoDBObj.getJoining_date().equals(joiningDate))) {*/
	  if(candidateInfoDBObj!=null) {
				 
				System.out.println("Insided candidate info changes---------");
				/*SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
				java.sql.Date joiningDate = null;*/
				CandidateDetailedInfo candDetailObj = new CandidateDetailedInfo();
				/*if(joining_Date!= null && !joining_Date.isEmpty()) {
					System.out.println("in ifffffffffffff-----------");
						java.util.Date joining_Date1 = (java.util.Date) sdf.parse(joining_Date);
						joiningDate = new java.sql.Date(joining_Date1.getTime());
						candDetailObj.setJoining_date(joiningDate);
				   }else {
					   System.out.println("in else-----------");
						  candDetailObj.setJoining_date(candDetailObj.getJoining_date());
					  }*/
				candDetailObj.setJoining_date(joiningDate);
				  Date joinDateDb=candidateInfoDBObj.getJoining_date();
				  if(joinDateDb!=null && joiningDate!=null) {
					  if(joinDateDb.compareTo(joiningDate) == 0){
							 
					  }else {
						  Integer history_id=empDao.getJoinHistoryId(candidateId);
						  if(history_id!=null) {
							  EmpJoinHistorty joinHistoryObjDb=empDao.getJoinHistoryByCandidateId(history_id);
								if(joinHistoryObjDb!=null) {
									     joinHistoryObjDb.setJoindate(joinDateDb);
										 empDao.updateJoinHistory(joinHistoryObjDb);
								 }
						  }else {
							    EmpJoinHistorty joinHistoryObj=new EmpJoinHistorty();
								 joinHistoryObj.setJoindate(joiningDate);
								 joinHistoryObj.setEstatus("Joined");
								 joinHistoryObj.setPosted_by(postedempno);
								 joinHistoryObj.setSubmitted_on(new Date());
								 joinHistoryObj.setCandidate_id(candidateId);
								 empDao.saveJoinHistory(joinHistoryObj);
						     }
					    }
				    }
				
				
				    candDetailObj.setCandidateInfo(basicDetailDBObj);
				    candDetailObj.setDepartment_id(w2department1);
				    candDetailObj.setRole_id(role);
				    candDetailObj.setReporting_head(mgr_empid);
				    candDetailObj.setRecruiter_name(rec_name);
				    candDetailObj.setHr_name(hr_name);
				    candDetailObj.setWork_authorization(work_auth);
				    candDetailObj.setBgc_type(bgc);
				    candDetailObj.setEmp_type(employee_type);
				    candDetailObj.setDesignation(designation);
				    candDetailObj.setStatus("Active");
				    candDetailObj.setPosted_by(postedempno);
				    candDetailObj.setSubmitted_on(new Date());
				    candDetailObj.setEmp_billing(billingType);
				    candDetailObj.setValidateby_flag(validateby_flag); 
				    if(employee_type.equalsIgnoreCase("W2 Admin")) {
				    	 candDetailObj.setPayroll_type(payrolltype);
					}
				   
				    
				    empDao.saveCandidateDetailedInfo(candDetailObj);
				    candidateInfoDBObj.setStatus("InActive");
				    empDao.updateCandidateDetailedInfo(candidateInfoDBObj);
				    message = "Basic Details Updated Successfuly";
			}else {
				  message = "Basic Details Not Updated";
			  }
	  if(candidateAddrDBObj!=null) {
			if(!candidateAddrDBObj.getLine1().equals(line1) || line2!=null || !candidateAddrDBObj.getCity().equals(city)
					|| !candidateAddrDBObj.getState().equals(state) || !candidateAddrDBObj.getZipcode().equalsIgnoreCase(zipcode)) {
				CandidateAddress candAddressObj = new CandidateAddress();
				candAddressObj.setLine1(line1);
				if(candidateAddrDBObj.getLine2()!=null) {
					if(!candidateAddrDBObj.getLine2().equalsIgnoreCase(line2)) {
						candAddressObj.setLine2(line2);
					}
				}else {
					candAddressObj.setLine2(line2);
				}
				candAddressObj.setCandidate_id(candidateId);
				candAddressObj.setCity(city);
				candAddressObj.setState(state);
				candAddressObj.setZipcode(zipcode);
				candAddressObj.setStatus("Active");
				candAddressObj.setPosted_by(postedempno);
				candAddressObj.setSubmitted_on(new Date());
				empDao.saveCandidateAddressDetails(candAddressObj);
				candidateAddrDBObj.setStatus("InActive");
			    empDao.updateCandidateAddressInfo(candidateAddrDBObj);
			    message = "Basic Details Updated Successfuly";
			 }
			else {
				  message = "Basic Details Not Updated";
			  }
	    }else {
	    	CandidateAddress candAddressObj = new CandidateAddress();
			candAddressObj.setLine1(line1);
			candAddressObj.setLine2(line2);
			candAddressObj.setCandidate_id(candidateId);
			candAddressObj.setCity(city);
			candAddressObj.setState(state);
			candAddressObj.setZipcode(zipcode);
			candAddressObj.setStatus("Active");
			candAddressObj.setPosted_by(postedempno);
			candAddressObj.setSubmitted_on(new Date());
			empDao.saveCandidateAddressDetails(candAddressObj);
			 message = "Basic Details Updated Successfuly";
	       }
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return message;
	}

	@Override
	public EmpExitDetailsEntity ViewExitDetails(String candidate_id) {
		EmpExitDetailsEntity exitObj = null;
		try {
			Integer candidate_Id = Integer.parseInt(candidate_id);
			exitObj = empDao.ViewExitDetails(candidate_Id);
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return exitObj;
	}

	@Override
	public String updateExitDetails(String candidate_id, String lwd, String terminationdate, String exitreason,
			String comments, Integer lgempno) {
		String message = null;
		try {
			Integer candidate_Id = Integer.parseInt(candidate_id);
			EmpExitDetailsEntity exitObj = empDao.getExitEmployeeByCandidateId(candidate_Id);
			if (exitObj != null) {
				exitObj.setExit_lwd(lwd);
				exitObj.setTermMailRecievedOn(terminationdate);
				exitObj.setReasons(exitreason);
				exitObj.setComments(comments);
				empDao.updateExitDetails(exitObj);
				message = "Basic Details Updated Successfuly";
				
				java.sql.Date exitDate=null;
				 SimpleDateFormat sdf=new SimpleDateFormat("MM/dd/yyyy");  
			      if(exitObj.getExit_lwd() != null && !exitObj.getExit_lwd().isEmpty()) {
			          java.util.Date exitDate1 = (java.util.Date)sdf.parse(exitObj.getExit_lwd());        
			             exitDate = new java.sql.Date(exitDate1.getTime());
			       }
			      
				  Integer history_id=empDao.getJoinHistoryId(exitObj.getCandidate_id());
				  if(history_id!=null){
					    EmpJoinHistorty joinHistoryObjDb=empDao.getJoinHistoryByCandidateId(history_id);
						if(joinHistoryObjDb!=null) {
							     joinHistoryObjDb.setExitdate(exitDate);
							     joinHistoryObjDb.setEstatus("Exit");
								 empDao.updateJoinHistory(joinHistoryObjDb);
						    }
				  }else {
					     EmpJoinHistorty joinHistoryObj=new EmpJoinHistorty();
						 joinHistoryObj.setExitdate(exitDate);
						 joinHistoryObj.setEstatus("Exit");
						 joinHistoryObj.setPosted_by(lgempno);
						 joinHistoryObj.setSubmitted_on(new Date());
						 joinHistoryObj.setCandidate_id(exitObj.getCandidate_id());
						 empDao.saveJoinHistory(joinHistoryObj);
				     }
				
			} else {
				message = "Something Went Wrong";
			}
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return message;
	}

	@Override
	public List<BankDetailsEntity> viewEmpBankDetails(String candidate_id) {
		List<BankDetailsEntity> viewbankList = null;
		try {
			Integer candidate_Id = Integer.parseInt(candidate_id);
			viewbankList = empDao.viewEmpBankDetails(candidate_Id);
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return viewbankList;
	}

	@Override
	public String updateEmpBankDetails(String[] accountNo, String[] bankname, String[] swiftcode, String[] ibancode,
			String[] routingno, CommonsMultipartFile[] file1, String candidate_id, String[] tblpk1,
			Integer lgempno) {
		String message = null;
		try {
			Integer candidate_Id = Integer.parseInt(candidate_id);
			for (int i = 0; i < tblpk1.length; i++) {
				int tblpk = Integer.parseInt(tblpk1[i]);
				BankDetailsEntity updateBankObj = empDao.getEmpBankDetailsByBankId(tblpk);
				if (updateBankObj != null) {
					updateBankObj.setAccountNo(accountNo[i]);
					updateBankObj.setBank_name(bankname[i]);
					updateBankObj.setSwift_Code(swiftcode[i]);
					updateBankObj.setIban_Code(ibancode[i]);
					updateBankObj.setBankRoutingNo(routingno[i]);

					/*if (bankamount[i] != "") {
						String amnt = bankamount[i].trim();
						int ammount = Integer.parseInt(amnt);
						updateBankObj.setAmount(ammount);
					}*/
					if (file1[i] != null) {
						if (!file1[i].getOriginalFilename().isEmpty()) {
							updateBankObj.setBankfilename(file1[i].getOriginalFilename());
							commonObj.fileToDirectory(candidate_Id, file1[i], null, null);
						}
					}
					empDao.updateEmpBankDetails(updateBankObj);
					message = "Employee Bank Details Updated Successfully";
				} else {
					message = "Something Went Wrong";
				}
			}
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return message;

	}

	@Override
	public String saveEmployeeDocuments(String candidate_id, MultipartFile offerletter, MultipartFile agreement,
			MultipartFile i9_form, MultipartFile w4_form, Integer lgempno) {
		String message = null;
		try {
			Integer candidate_Id = Integer.parseInt(candidate_id);
			EmpDocumentsEntity empDocBoj = new EmpDocumentsEntity();
			empDocBoj.setCandidate_id(candidate_Id);
			empDocBoj.setPostedBy(lgempno);
			empDocBoj.setSubmit_date(new Date());
			empDocBoj.setStatus("Active");

			// EmpDocumentsEntity docObj=empDao.getEmpDocsByCandidateIdFileType(filetype,candidate_id);
			if (offerletter != null) {
				if (!offerletter.getOriginalFilename().isEmpty()) {
					empDocBoj.setFiletype("offerletter");
					empDocBoj.setFile_name(offerletter.getOriginalFilename());
					empDao.saveDocuments(empDocBoj);
					commonObj.fileToDirectory(candidate_Id, offerletter, null, null);
					message = "Documents Uploaded Successfully";
				}
			} else {
				System.out.println("else in offerletter");
			}
			if (agreement != null) {
				if (!agreement.getOriginalFilename().isEmpty()) {
					empDocBoj.setFiletype("empagreement");
					empDocBoj.setFile_name(agreement.getOriginalFilename());
					empDao.saveDocuments(empDocBoj);
					commonObj.fileToDirectory(candidate_Id, agreement, null, null);
					message = "Documents Uploaded Successfully";
				}
			} else {
				System.out.println("else in agreement");
			}

			if (i9_form != null) {
				if (!i9_form.getOriginalFilename().isEmpty()) {
					empDocBoj.setFile_name(i9_form.getOriginalFilename());
					empDocBoj.setFiletype("i9_form");
					empDao.saveDocuments(empDocBoj);
					commonObj.fileToDirectory(candidate_Id, i9_form, null, null);
					message = "Documents Uploaded Successfully";
				}
			} else {
				System.out.println("else in i9_form");
			}

			if (w4_form != null) {
				if (!w4_form.getOriginalFilename().isEmpty()) {
					empDocBoj.setFiletype("w4_form");
					empDocBoj.setFile_name(w4_form.getOriginalFilename());
					empDao.saveDocuments(empDocBoj);
					commonObj.fileToDirectory(candidate_Id, w4_form, null, null);
					message = "Documents Uploaded Successfully";
				}
			} else {
				System.out.println("else in w4_form");
			}

		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return message;
	}

	@Override
	public String saveEmployeeAddtionalDocuments(MultipartFile addtionalfile, String filetype, String inputVal,
			String candidate_id, Integer lgempno) {
		String message = null;
		try {
			Integer candidate_Id = Integer.parseInt(candidate_id);
			EmpDocumentsEntity empDocBoj = new EmpDocumentsEntity();
			empDocBoj.setCandidate_id(candidate_Id);
			empDocBoj.setPostedBy(lgempno);
			empDocBoj.setSubmit_date(new Date());
			empDocBoj.setStatus("Active");
			if (addtionalfile != null) {
				if (!addtionalfile.getOriginalFilename().isEmpty()) {
					empDocBoj.setFile_name(addtionalfile.getOriginalFilename());
					empDocBoj.setInputvalue(inputVal);
					empDocBoj.setFiletype(filetype);
					empDao.saveDocuments(empDocBoj);
					commonObj.fileToDirectory(candidate_Id, addtionalfile, null, null);
					message = "Documents Uploaded Successfully";
				} else {
					message = "Documents not updated";
				}
			}
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return message;
	}

	@Override
	public List<EmpDocumentsEntity> getEmployeeDocumentsByCandidateId(String candidate_id) {
		List<EmpDocumentsEntity> empDocList = null;
		try {
			Integer candidate_Id = Integer.parseInt(candidate_id);
			empDocList = empDao.getEmpDocumentsListByCandidateId(candidate_Id);
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return empDocList;
	}

	@Override
	public AttachmentBean getFilesByCandidateId(String candidate_id) {
		AttachmentBean filebean = new AttachmentBean();
		try {
			Integer candidate_Id = 0;
			if (candidate_id != "") {
				candidate_Id = Integer.parseInt(candidate_id);
			}

			List<FileBean> i9adddoclist = new LinkedList<FileBean>();
			List<FileBean> i9supportdoclist = new LinkedList<FileBean>();
			List<FileBean> i9Otherdoclist = new LinkedList<FileBean>();
			List<FileBean> i9supportdoclist2 = new LinkedList<FileBean>();

			List<DocEmpBean> empdocsList = empDao.viewDocumentsByCandidateId(candidate_Id);
			for (DocEmpBean docObj : empdocsList) {
				String filetype = docObj.getFiletype();
				String filename = docObj.getFile_name();

				switch (filetype) {
				case "offerletter":
					filebean.setOfferletter(filename);
					filebean.setFileId(docObj.getDocument_id());
					break;
				case "empagreement":
					filebean.setAgreement(filename);
					filebean.setAfile(docObj.getDocument_id());
					break;
				case "i9_form":
					filebean.setI9(filename);
					filebean.setIfile(docObj.getDocument_id());
					break;
				case "w4_form":
					filebean.setW4(filename);
					filebean.setWfile(docObj.getDocument_id());
					break;
				case "i9Formdocs":
					FileBean fBean = new FileBean();
					fBean.setFileId(docObj.getDocument_id());
					fBean.setInputval(docObj.getInputval());
					fBean.setFileType(docObj.getFiletype());
					fBean.setFileName(docObj.getFile_name());
					i9adddoclist.add(fBean);
					filebean.setI9addlist(i9adddoclist);
					break;

				case "i9Supportdocs":
					FileBean fBean1 = new FileBean();
					fBean1.setFileId(docObj.getDocument_id());
					fBean1.setInputval(docObj.getInputval());
					fBean1.setFileType(docObj.getFiletype());
					fBean1.setFileName(docObj.getFile_name());
					i9supportdoclist.add(fBean1);
					filebean.setI9suplist(i9supportdoclist);
					break;
				case "OtherAdditionaldocs":
					FileBean fBean2 = new FileBean();
					fBean2.setFileId(docObj.getDocument_id());
					fBean2.setInputval(docObj.getInputval());
					fBean2.setFileType(docObj.getFiletype());
					fBean2.setFileName(docObj.getFile_name());
					i9Otherdoclist.add(fBean2);
					filebean.setOthersuplist(i9Otherdoclist);
					break;
				case "ListA":
					FileBean fBean3 = new FileBean();
					fBean3.setFileId(docObj.getDocument_id());
					fBean3.setInputval(docObj.getInputval());
					fBean3.setFileType(docObj.getFiletype());
					fBean3.setFileName(docObj.getFile_name());
					fBean3.setStartdate(docObj.getStartdate());
					fBean3.setExpirydate(docObj.getExpirydate());
					i9supportdoclist2.add(fBean3);
					filebean.setI9suplist2(i9supportdoclist2);
					break;
				case "ListB":
					FileBean fBean4 = new FileBean();
					fBean4.setFileId(docObj.getDocument_id());
					fBean4.setInputval(docObj.getInputval());
					fBean4.setFileType(docObj.getFiletype());
					fBean4.setFileName(docObj.getFile_name());
					fBean4.setStartdate(docObj.getStartdate());
					fBean4.setExpirydate(docObj.getExpirydate());
					i9supportdoclist2.add(fBean4);
					filebean.setI9suplist2(i9supportdoclist2);
					break;
				case "ListC":
					FileBean fBean5 = new FileBean();
					fBean5.setFileId(docObj.getDocument_id());
					fBean5.setInputval(docObj.getInputval());
					fBean5.setFileType(docObj.getFiletype());
					fBean5.setFileName(docObj.getFile_name());
					fBean5.setStartdate(docObj.getStartdate());
					fBean5.setExpirydate(docObj.getExpirydate());
					i9supportdoclist2.add(fBean5);
					filebean.setI9suplist2(i9supportdoclist2);
					break;
				default:
					System.out.println("default");

				}
			}
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return filebean;
	}

	@Override
	public void updatePageStatus(String candidate_id) {
		try {
			Integer candidate_Id = 0;
			if (candidate_id != "") {
				candidate_Id = Integer.parseInt(candidate_id);
			}
			PageStatusEntity pagestsObj = empDao.getRedirectPageStatus(candidate_Id);
			pagestsObj.setDocument_status(1);
			pagestsObj.setDocument_submitdate(new Date());
			empDao.updatePageStatus(pagestsObj);
			// sendmail.sendMail(frommail, toemail, toName, comments, subject);
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
	}

	@Override
	public String updateDocumentById(MultipartFile editFile, String fileId, String candidate_id, Integer loginempno) {
		String msg = null;
		try {
			Integer candidate_Id = 0;
			if (candidate_id != "") {
				candidate_Id = Integer.parseInt(candidate_id);
			}
			Integer docId = 0;
			if (fileId != "") {
				docId = Integer.parseInt(fileId);
			}

			EmpDocumentsEntity docobj = empDao.getDocumentByDocId(docId);
			if (docobj != null) {
				docobj.setFile_name(editFile.getOriginalFilename());
				docobj.setSubmit_date(new Date());
				docobj.setPostedBy(loginempno);
				commonObj.fileToDirectory(candidate_Id, editFile, null, null);
				empDao.updateDocument(docobj);
				msg = "Success";
			}
			// sendmail.sendMail(frommail, toemail, toName, comments, subject);
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return msg;
	}

	@Override
	public String deleteDocumentByDocId(String fileId) {
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
	public List<EmpJoinHistorty> getEmployeeHistoryByCandidateId(String candidate_id) {
		List<EmpJoinHistorty> historyList = null;
		try {
			Integer candidate_Id = 0;
			if (candidate_id != "") {
				candidate_Id = Integer.parseInt(candidate_id);
			}
			historyList = empDao.getEmployeeHistoryByCandidateId(candidate_Id);
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return historyList;
	}

	@Override
	public String saveRejoinDetails(String candidate_id, String rjdate, Integer posted_by) {
		String message = null;
		try {
			Integer candidate_Id = 0;
			if (candidate_id != "") {
				candidate_Id = Integer.parseInt(candidate_id);
			}
		/*	SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
			java.util.Date rjoining = (java.util.Date) sdf.parse(rjdate);
			java.sql.Date rjdate1 = new java.sql.Date(rjoining.getTime());*/
			
			java.sql.Date rj_date1=null;
			 SimpleDateFormat sdf=new SimpleDateFormat("MM/dd/yyyy");  
		      if(rjdate!=null && !rjdate.isEmpty()) {
		          java.util.Date rjdate1 = (java.util.Date)sdf.parse(rjdate);        
		          rj_date1 = new java.sql.Date(rjdate1.getTime());
		       }

			EmpBasicDetailsEntity empBasicObj = empDao.getEmployeeStatusDetailsByCandidateId(candidate_Id);
			CandidateDetailedInfo candidateinfoObj = empDao.getCandidateDetailedInfoById(candidate_Id);
			EmpExitDetailsEntity exitObj = empDao.getExitEmployeeByCandidateId(candidate_Id);
			if (empBasicObj!= null) {
				EmpJoinHistorty addhistory = new EmpJoinHistorty();
				addhistory.setJoindate(rj_date1);
				addhistory.setEstatus("Rejoin");
				addhistory.setSubmitted_on(new Date());
				addhistory.setCandidate_id(candidate_Id);
				addhistory.setPosted_by(posted_by);
				empDao.saveJoinHistory(addhistory);
				candidateinfoObj.setJoining_date(rj_date1);
				empBasicObj.setStatus(1);
				empDao.updateBasicDetails(empBasicObj);
				empDao.updateCandidateDetailedInfo(candidateinfoObj);
				
				exitObj.setStatus("InActive");
				empDao.updateExitDetails(exitObj);
			}
			PageStatusEntity pagestatusObj = empDao.getRedirectPageStatus(candidate_Id);
			if (pagestatusObj != null) {
				//pagestatusObj.setBank_status(0);
				//pagestatusObj.setDocument_status(0);
				//pagestatusObj.setClient_status(0);
				pagestatusObj.setExit_status(0);
				empDao.updatePageStatus(pagestatusObj);
			}
			/*
			List<EmpDocumentsEntity>  documentList=empDao.getEmpDocumentsListByCandidateId(candidate_Id);
			for (EmpDocumentsEntity docobj : documentList) {
				int docId=docobj.getDocument_id();
				EmpDocumentsEntity documentObj=empDao.getDocumentByDocId(docId);
				documentObj.setStatus("InActive");
				empDao.updateDocument(documentObj);
			}
			
			EmpPayRateDetails payrateObj = empDao.getPayRateDetailsById(candidate_Id,null);
			if (payrateObj != null) {
				payrateObj.setStatus("InActive");
				empDao.updatePayRateDetails(payrateObj);
			}
			
			List<ClientDetailsEntity>  clietndetailsList=empDao.getClientDetailsByCandidateId(candidate_Id);
			for (ClientDetailsEntity clientobj : clietndetailsList) {
				int clientid=clientobj.getClient_id();
				ClientDetailsEntity clientDetilsObj=empDao.getClientDetailsById(clientid,null);
				clientDetilsObj.setStatus(0);
				empDao.updateClientDetails(clientDetilsObj);
			}*/

		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return message;
	}

	@Override
	public CandidateDetailedInfo getCandidateDetailedInfoById(int candidate_id) {
		CandidateDetailedInfo detailObj = null;
		try {
			detailObj = empDao.getCandidateDetailedInfoById(candidate_id);
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return detailObj;
	}

	@Override
    public EmployeeDto getCanidateDetailsByCanId(Integer candidateId) {
           EmployeeDto basicObj = null;
           try {
                  basicObj = empDao.getCanidateDetailsByCanId(candidateId);
           } catch (Exception e) {
                  logger.info(e.getMessage(), e);
           }
           return basicObj;
    }
	@Override
	public String checkPassword(String userName, String bytesCurrepwd) {
		String msg = "";
		try {
			msg = empDao.checkPassword(userName, bytesCurrepwd);
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return msg;
	}

	@Override
	public String changePassword(String userName, String bytesEncodepwd) {
		String msg2 = "";
		try {
			msg2 = empDao.changePassword(userName, bytesEncodepwd);
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return msg2;
	}

	@Override
	public String getempTypeByCanId(String canid) {
		String msg2 = "";
		try {
			int id=0;
			if(!canid.isEmpty()) {
				id=Integer.parseInt(canid);
			}
			msg2 = empDao.getempTypeByCanId(id);
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return msg2;
	}

	@Override
	public BasicDetailsDto checkPhoneNo(String phoneno) {
		BasicDetailsDto pno = null;
		try {
			pno = empDao.checkPhoneNo(phoneno);
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return pno;
	}

	@Override
	public String checkEmail(String email) {
		String emailid = null;
		try {
			emailid = empDao.checkEmail(email);
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return emailid;
	}

	@Override
	public String saveEmployeeI9Documents(MultipartFile listAFile, String filetype, String listASelectionInput,
			String candidate_id, Integer lgempno, String fromdate, String expirydate) {
		String message = null;
		try {
			Integer candidate_Id = Integer.parseInt(candidate_id);
			EmpDocumentsEntity empDocBoj = new EmpDocumentsEntity();
			empDocBoj.setCandidate_id(candidate_Id);
			empDocBoj.setPostedBy(lgempno);
			empDocBoj.setSubmit_date(new Date());
			empDocBoj.setStatus("Active");
			if (listAFile != null) {
				if (!listAFile.getOriginalFilename().isEmpty()) {
					empDocBoj.setFile_name(listAFile.getOriginalFilename());
					empDocBoj.setInputvalue(listASelectionInput);
					empDocBoj.setFiletype(filetype);
					if(fromdate!="") {
						empDocBoj.setFrom_date(fromdate);
					}
					if(expirydate!="") {
						empDocBoj.setExpiry_date(expirydate);
					}
					empDao.saveDocuments(empDocBoj);
					commonObj.fileToDirectory(candidate_Id, listAFile, null, null);
					message = "Documents Uploaded Successfully";
				} else {
					message = "Documents not updated";
				}
			}
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return message;
	}

	@Override
	public I9SupportingDocumentsDto geti9SupportDocumentsListByType(String i9sdType, String candidateId) {
		I9SupportingDocumentsDto i9Listto=new I9SupportingDocumentsDto();
		try {
			Integer candidate_Id=0;
			if(!candidateId.isEmpty()) {
				candidate_Id=Integer.parseInt(candidateId);
			}
			if(i9sdType.equalsIgnoreCase("ListA")) {
				List<String>  ListA=null;
				ListA= empDao.geti9SupportDocumentsListByType(i9sdType);
				 System.out.println("ListA******"+ListA.size());
				
				 List<String>  ListA2=empDao.geti9SupportDocumentsListByCandidateIdType(candidate_Id,i9sdType);
				 if(ListA2.size()>0) {
					 List<String> union = new ArrayList<String>(ListA);
					 union.addAll(ListA2);
					 List<String> intersection = new ArrayList<String>(ListA);
					 intersection.retainAll(ListA2);
					 List<String> afinalList = new ArrayList<String>(union);
					 afinalList.removeAll(intersection);
					 System.out.println("----***afinalList****-------"+afinalList.size());
					 i9Listto.setLista(afinalList);
				 }else {
					 i9Listto.setLista(ListA);
				 }
			}else {
				
				String i9Type="ListB";
				List<String>  ListB=null;
				ListB= empDao.geti9SupportDocumentsListByType(i9Type);
				 System.out.println("ListB******"+ListB.size());
				
				 List<String>  ListB2=empDao.geti9SupportDocumentsListByCandidateIdType(candidate_Id,i9Type);
				 if(ListB2.size()>0) {
					 List<String> union = new ArrayList<String>(ListB);
					 union.addAll(ListB2);
					 List<String> intersection = new ArrayList<String>(ListB);
					 intersection.retainAll(ListB2);
					 List<String> bfinalList = new ArrayList<String>(union);
					 bfinalList.removeAll(intersection);
					 System.out.println("----***bfinalList****-------"+bfinalList.size());
					 i9Listto.setListb(bfinalList);
				 }else {
					 i9Listto.setListb(ListB);
				 }
				
				 String i9Typec="ListC";
					List<String>  ListC=null;
					ListC= empDao.geti9SupportDocumentsListByType(i9Typec);
					 System.out.println("ListC******"+ListC.size());
					 List<String>  ListC2=empDao.geti9SupportDocumentsListByCandidateIdType(candidate_Id,i9Typec);
					 if(ListC2.size()>0) {
						 List<String> union = new ArrayList<String>(ListC);
						 union.addAll(ListC2);
						 List<String> intersection = new ArrayList<String>(ListC);
						 intersection.retainAll(ListC2);
						 List<String> cfinalList = new ArrayList<String>(union);
						 cfinalList.removeAll(intersection);
						 System.out.println("----***cfinalList****-------"+cfinalList.size());
						 i9Listto.setListc(cfinalList);
					 }else {
						 i9Listto.setListc(ListC);
					 }
				
			}
			
			
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return i9Listto;
	}

	@Override
	public String updateListADocument(MultipartFile editFile, String waefileId, String fromdate, String expiry_date,
			String waCandidateId, Integer loginempno, String efileType, String waeInputVal) {
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
					
				vendocDBdobj.setCandidate_id(candidate_Id);
				vendocDBdobj.setFile_name(editFile.getOriginalFilename());
				vendocDBdobj.setFiletype(efileType);
				vendocDBdobj.setInputvalue(waeInputVal);
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
					logger.info(e.getMessage(), e);
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
					docHistoryObj.setInputvalue(vendocDBdobj.getInputvalue());
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
						vendocDBdobj.setInputvalue(vendocDBdobj.getInputvalue());
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
				}else if(vendocDBdobj.getFrom_date()!=null && vendocDBdobj.getExpiry_date()==null) {
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
	public String updateEmployeeDocuments(MultipartFile editFile, String fileId, String CandidateId,
			Integer loginempno, String fileType, String InputVal) {
		String message="";
		try {
		Integer docId=0;
		if (fileId!="") {
			docId = Integer.parseInt(fileId);
		}
		Integer candidate_Id=0;
		if(!CandidateId.isEmpty()) {
			candidate_Id=Integer.parseInt(CandidateId);
		}
		EmpDocumentsEntity vendocDBdobj=empDao.getDocumentByDocId(docId);
		if(editFile!=null) {
			if(!editFile.getOriginalFilename().isEmpty()) {
				System.out.println("-------**************"+editFile.getOriginalFilename());
				/*vendocobj.setCandidate_id(candidate_Id);
				vendocobj.setFile_name(editFile.getOriginalFilename());
				vendocobj.setFiletype(fileType);
				if(!InputVal.isEmpty()) {
					vendocobj.setInputvalue(InputVal);
				}
				vendocobj.setPostedBy(loginempno);
				vendocobj.setSubmit_date(new Date());
				vendocobj.setStatus("Active");
				empDao.saveDocuments(vendocobj);*/
				EmpDocumentsHistoryEntity docHistoryObj=new EmpDocumentsHistoryEntity();
				docHistoryObj.setDocument_id(vendocDBdobj.getDocument_id());
				docHistoryObj.setCandidate_id(vendocDBdobj.getCandidate_id());
				docHistoryObj.setFile_name(vendocDBdobj.getFile_name());
				docHistoryObj.setFiletype(vendocDBdobj.getFiletype());
				docHistoryObj.setPostedBy(vendocDBdobj.getPostedBy());
				docHistoryObj.setSubmit_date(vendocDBdobj.getSubmit_date());
				docHistoryObj.setStatus(vendocDBdobj.getStatus());
				docHistoryObj.setInputvalue(vendocDBdobj.getInputvalue());
				empDao.saveDocumentsHistory(docHistoryObj);
				vendocDBdobj.setFile_name(editFile.getOriginalFilename());
				if(!InputVal.isEmpty()) {
					vendocDBdobj.setInputvalue(InputVal);
				}
				vendocDBdobj.setPostedBy(loginempno);
				vendocDBdobj.setSubmit_date(new Date());
				empDao.updateDocument(vendocDBdobj);
				message="Success";
				try {
					commonObj.fileToDirectory(candidate_Id, editFile, null, null);
				} catch (MessagingException e) {
					logger.info(e.getMessage(), e);
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
	public MyDashboardDto getmyDashboardDocList() {
		MyDashboardDto myDashboardDto = new MyDashboardDto();
		try {
			//myDashboardList = empDao.getmyDashboardDocList();
			 int size=0;
			List<CustomerDto> custlist=empDao.getmyDashboardCustDocList();
			List<VendorDto> venlist=empDao.getmyDashboardVendDocList();
			List<CandidateDocDto> candClist=empDao.getmyDashboardCandidateContractorDocList();
			List<CandidateDocDto> candElist=empDao.getmyDashboardCandidateEmployeeDocList();
			
			/*List<CustomerDto> prevcustlist=empDao.getmyDashboardPrevCustDocList();
			List<VendorDto> prevvenlist=empDao.getmyDashboardPrevVendDocList();
			List<CandidateDocDto> prevcandClist=empDao.getmyDashboardPrevCandidateContractorDocList();
			List<CandidateDocDto> prevcandElist=empDao.getmyDashboardPrevCandidateEmployeeDocList();
			
			if(custlist.size()>0 || venlist.size()>0 || candElist.size()>0 || candClist.size()>0 ||prevcustlist.size()>0 || prevvenlist.size()>0 || prevcandClist.size()>0 || prevcandElist.size()>0) {
				size=custlist.size()+venlist.size()+candElist.size()+candClist.size()+prevcustlist.size()+prevvenlist.size()+prevcandElist.size()+prevcandClist.size();
			}*/
			
			if(custlist.size()>0 || venlist.size()>0 || candElist.size()>0 || candClist.size()>0) {
				size=custlist.size()+venlist.size()+candElist.size()+candClist.size();
			}
			myDashboardDto.setCustlist(custlist);
			myDashboardDto.setVenlist(venlist);
			myDashboardDto.setCandClist(candClist);
			myDashboardDto.setCandElist(candElist);
			
			
			/*myDashboardDto.setPrevcustlist(prevcustlist);
			myDashboardDto.setPrevvenlist(prevvenlist);
			myDashboardDto.setPrevcandElist(prevcandElist);
			myDashboardDto.setPrevcandClist(prevcandClist);
			*/
			myDashboardDto.setCount(size);
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return myDashboardDto;
	}

	@Override
	public MyDashboardDto getExpiredDocumentsList() {
		MyDashboardDto myDashboardDto = new MyDashboardDto();
		try {
			List<CustomerDto> prevcustlist=empDao.getmyDashboardPrevCustDocList();
			List<VendorDto> prevvenlist=empDao.getmyDashboardPrevVendDocList();
			List<CandidateDocDto> prevcandClist=empDao.getmyDashboardPrevCandidateContractorDocList();
			List<CandidateDocDto> prevcandElist=empDao.getmyDashboardPrevCandidateEmployeeDocList();
			
			 int size=0;
				if(prevcustlist.size()>0 || prevvenlist.size()>0 || prevcandElist.size()>0 || prevcandClist.size()>0) {
					size=prevcustlist.size()+prevvenlist.size()+prevcandElist.size()+prevcandClist.size();
				}
			
			myDashboardDto.setPrevcustlist(prevcustlist);
			myDashboardDto.setPrevvenlist(prevvenlist);
			myDashboardDto.setPrevcandElist(prevcandElist);
			myDashboardDto.setPrevcandClist(prevcandClist);
			myDashboardDto.setExpcount(size);
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return myDashboardDto;
     }
	
	
	@Override
	public List<DocumentHistoryDto> getuserNameBycandId(String candId) {
		 List<DocumentHistoryDto> users=null;
		 System.out.println("getuserNameBycandId IMPL----");
	try {
		Integer candidate_Id = 0;
		if (candId!="") {
			candidate_Id = Integer.parseInt(candId);
		}
		users=empDao.getuserNameBycandId(candidate_Id);
	} catch (Exception e) {
		logger.info(e.getMessage(),e);
	}
	return users;
}

	
	@Override
	public List<DocumentHistoryDto> getDocTypesByCandId(String candId) {
		 List<DocumentHistoryDto> docList=null;
		 System.out.println("getDocTypesByCandId IMPL----");
	try {
		Integer candidate_Id = 0;
		if (candId!="") {
			candidate_Id = Integer.parseInt(candId);
		}
		
		docList=empDao.getDocTypesByCandId(candidate_Id);
		System.out.println(docList.size());
	} catch (Exception e) {
		logger.info(e.getMessage(),e);
	}
	return docList;
}
	@Override
	public List<DocumentHistoryDto> getsubDocTypesBydocId(String candId, String docid) {
		 List<DocumentHistoryDto> subdocList=null;
		 System.out.println("getsubDocTypesBydocId IMPL----");
	try {
		Integer candidate_Id = 0;
		if (candId!="") {
			candidate_Id = Integer.parseInt(candId);
		}
		/*Integer profileid = 0;
		if (profileId!="") {
			profileid = Integer.parseInt(profileId);
		}*/
		Integer docId = 0;
		if (docid!="") {
			docId = Integer.parseInt(docid);
		}
		subdocList=empDao.getsubDocTypesBydocId(candidate_Id,docId);
		//System.out.println(docList.size());
	} catch (Exception e) {
		logger.info(e.getMessage(),e);
	}
	return subdocList;
	}
	@Override
	public List<DocumentHistoryDto> getalldocs(String candId, String subdocid,String docid) {
		// List<DocumentHistoryDto> docList=null;
		List<Integer> list=new ArrayList<Integer>();
		List<DocumentHistoryDto> getalldocs=new ArrayList<DocumentHistoryDto>();
		 System.out.println("getalldocs IMPL----");
	try {
		
		System.out.println(candId+"--"+subdocid+"-"+docid);
		


		Integer candidate_Id = 0;
		if (candId!="") {
			candidate_Id = Integer.parseInt(candId);
		}
		/*Integer profileid = 0;
		if (profileId!="") {
			profileid = Integer.parseInt(profileId);
		}*/
		
		Integer docId = 0;
		if (docid!="") {
			docId = Integer.parseInt(docid);
		}
		
		Integer subdocId = 0;
		if (subdocid!="") {
			 subdocId = Integer.parseInt(subdocid);
		}
	
		System.out.println("IMPL"+candidate_Id+"--"+subdocId+"-"+docId);
		Integer initiateid=empDao.getCurrinitiateidBycandId(candidate_Id);
		
		List<Integer> checklistids=empDao.getchecklistIds(candidate_Id,subdocId,docId,initiateid);
		 for ( Integer chklistid: checklistids) {
			 list.add(chklistid);
		 }
		 System.out.println(list+"-list");
		 if(!list.isEmpty()) {
			 getalldocs=empDao.getFilesBychklistid(list);
				 }
		
	} catch (Exception e) {
		logger.info(e.getMessage(),e);
	}
	return getalldocs;
	}
	@Override
	public List<String> getdocs(String candId,String subdocname, String subdocid, String docid) {
		List<Integer> list=new ArrayList<Integer>();
		List<String> getdocs=new ArrayList<String>();
	
		 Document document = new Document();

	try {
		Integer candidate_Id = 0;
		if (candId!="") {
			candidate_Id = Integer.parseInt(candId);
		}
		Integer docId = 0;
		if (docid!="") {
			docId = Integer.parseInt(docid);
		}
		Integer subdocId = 0;
		if (subdocid!="") {
			 subdocId = Integer.parseInt(subdocid);
		}
		
		Integer initiateid=empDao.getCurrinitiateidBycandId(candidate_Id);
			
		List<Integer> checklistids=empDao.getchecklistIds(candidate_Id,subdocId,docId,initiateid);
		 for ( Integer chklistid: checklistids) {
			 list.add(chklistid);
		 }
		 
		 getdocs=empDao.getFiles(candidate_Id,docId,subdocId,initiateid,list);
		 String directorypath =env.getProperty("documents");
  		String directorypath2  = null;
  		String directorypath3  = null;
  		String filetype="H-1B";
  		String merge="merged";
  		String subdoc=subdocname+".pdf";
  	
  		directorypath3 = directorypath + File.separator + candId +  File.separator + filetype +  File.separator + merge ;
  		if (!new File(directorypath3).exists()) {
			new File(directorypath3).mkdir();
  		}
  		directorypath3 = directorypath + File.separator + candId +  File.separator + filetype +  File.separator + merge +  File.separator + subdoc;
  	
  		File filename = new File(directorypath3);
  		 if(filename.exists()) {
  			filename.delete();
  		 }
  		PdfWriter.getInstance(document, new FileOutputStream(new File(directorypath3)));
  		
        
        document.open();
      
    	 for ( String file: getdocs) {
    		 String f1 = file.substring(file.indexOf(".")+1);
    		 f1.trim();
    		 
    		 if(f1.contains("png") || f1.contains("jpg")  || f1.contains("jpeg")  || f1.contains("PNG") ){
    			 directorypath2 = directorypath + File.separator + candId +  File.separator + filetype +  File.separator + file;
    	  		    Image image = Image.getInstance(directorypath2);
    	  		  image.scaleToFit(545,792);
    	  		  document.setPageSize(PageSize.A4);
  	            document.newPage();
  	  		    document.add(image);
                 }
    		
                 if(f1.contains("pdf")){
    			 directorypath2 = directorypath + File.separator + candId +  File.separator + filetype +  File.separator + file;
    			 String sourceDir =directorypath2;
    	         File sourceFile = new File(sourceDir);
    	            PDDocument doc = PDDocument.load(sourceFile);
                    PDFRenderer pdfRenderer = new PDFRenderer(doc);

                    int numberOfPages = doc.getNumberOfPages();

                    String fileName = sourceFile.getName().replace(".pdf", "");             
                    String fileExtension= "png";
                    int dpi = 300;
                    for (int i = 0; i < numberOfPages; ++i) {
                        File outPutFile = new File(fileName+"."+fileExtension);
                        BufferedImage bImage = pdfRenderer.renderImageWithDPI(i, dpi, ImageType.RGB);
                        ImageIO.write(bImage, fileExtension, outPutFile);
              
                        ByteArrayOutputStream baos = new ByteArrayOutputStream();
                        ImageIO.write(bImage, "png", baos);
                        Image image = Image.getInstance(baos.toByteArray());
                        image.scaleToFit(545,792);
        	  		    document.setPageSize(PageSize.A4);
        	            document.newPage();
        	  		    document.add(image);
                    }
                    doc.close();
    		 }
		 }
    	 document.close();
    	 System.out.println("Documents merged");
         
	} catch (Exception e) {
		e.printStackTrace();
		logger.info(e.getMessage(),e);
	}
	return getdocs;
	}






	

}
