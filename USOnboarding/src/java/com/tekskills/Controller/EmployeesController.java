package com.tekskills.Controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.tekskills.Dto.AttachmentBean;
import com.tekskills.Dto.BasicDetailsDto;
import com.tekskills.Dto.ContractsPanelDetails_DTO;
import com.tekskills.Dto.DocumentHistoryDto;
import com.tekskills.Dto.EmployeeDto;
import com.tekskills.Dto.I9SupportingDocumentsDto;
import com.tekskills.Dto.LCADetailsDto;
import com.tekskills.Dto.ManagerDto;
import com.tekskills.Dto.MyDashboardDto;
import com.tekskills.Dto.SearchBean;
import com.tekskills.Dto.TimesheetDto;
import com.tekskills.Entity.BankDetailsEntity;
import com.tekskills.Entity.CandidateDetailedInfo;
import com.tekskills.Entity.DepartmentsEntity;
import com.tekskills.Entity.EmpBasicDetailsEntity;
import com.tekskills.Entity.EmpExitDetailsEntity;
import com.tekskills.Entity.EmpJoinHistorty;
import com.tekskills.Entity.EmpRoles;
import com.tekskills.Entity.EmpTypeMaster;
import com.tekskills.Entity.PageStatusEntity;
import com.tekskills.Entity.WorkAuthorization;
import com.tekskills.Service.ContractorsService;
import com.tekskills.Service.EmployeesService;
import com.tekskills.Service.H1BService;
import com.tekskills.Service.ImmigrationService;
import com.tekskills.Service.TimesheetService;

@Controller
@PropertySource("/WEB-INF/mail.properties")
public class EmployeesController {
	private static final Logger logger = Logger.getLogger(EmployeesController.class);
	@Autowired
	private EmployeesService empService;
	@Autowired
	private TimesheetService tsServie;
	@Autowired
	private Environment env;
	@Autowired
	private H1BService h1bService;
	@Autowired
	private ImmigrationService immiService;
	@Autowired
	private ContractorsService contService;

	@RequestMapping(value = { "/loginpage" }, method = RequestMethod.GET)
	public String Loginform(HttpServletRequest req) {
		return "login";
	}

	@RequestMapping(value = { "/logout" }, method = RequestMethod.GET)
	public String logout(HttpServletRequest req) {
		HttpSession session = req.getSession(true);
		try {
			String userName = (String) req.getSession().getAttribute("username");
			if (userName != null) {
				session.invalidate();
				return "redirect:/loginpage";
			} else {
				return "redirect:/loginpage";
			}
		} catch (Exception e) {
			logger.error("Error in logout EmployeesController source" + e);
		}
		return "redirect:/loginpage";
	}

	@RequestMapping("/ChangePassword")
	public String changePwd(Model model, HttpServletRequest request, HttpServletResponse response) {
		try {
			String userName = (String) request.getSession().getAttribute("username");
			if (userName == null) {
				return "redirect:/loginpage";
			} else {
				return "ChangePwd";
			}
		} catch (Exception e) {
			logger.error("Error in changePwd " + e);
		}
		return null;
	}

	@RequestMapping(value = { "/ChangeLoginPassword" }, method = RequestMethod.POST)
	@ResponseBody
	public String changeLoginPassword(Map<String, Object> map, Model model, HttpServletRequest req,
			HttpServletResponse res) throws IOException {
		String message = null;
		try {
			String userName = (String) req.getSession().getAttribute("username");
			if (userName != null) {
				String currentPassword = req.getParameter("currentPwd");
				String confirmPassword = req.getParameter("confirmPassword");
				String checkPassword = empService.checkPassword(userName, currentPassword);
				if (checkPassword == null) {
					message = "Current password is not Correct";
				} else {
					String msg = empService.changePassword(userName, confirmPassword);
					if (msg.equalsIgnoreCase("success")) {
						message = "password changed Successfully";
					} else {
						message = "password not changed";
					}
				}
			} else {
				message = null;
			}
		} catch (Exception e) {
			logger.error("Error in ChangePassword" + e);
		}
		return message;
	}

	@RequestMapping(value = { "/validateLogin" }, method = RequestMethod.POST)
	public String validateLogin(Model model, HttpServletRequest request, HttpServletResponse response) {
		String UserName = request.getParameter("username").trim();
		String Password = request.getParameter("password").trim();
		HttpSession session = request.getSession(true);
		
				EmpBasicDetailsEntity basicObj = empService.checkLogin(UserName, Password);
				if (basicObj != null) {
					MyDashboardDto myDashboard = null;
					CandidateDetailedInfo detailObj = empService
							.getCandidateDetailedInfoById(basicObj.getCandidate_id());
					myDashboard = empService.getmyDashboardDocList();
					List<TimesheetDto> timesheetList = null;
					if (detailObj.getRole_id() != 0) {
						if(detailObj.getRole_id() == 1 && detailObj.getEmp_type().equalsIgnoreCase("W2")) {
							String status = "Submitted";
							String month = "";
							String customertype = "";
							LocalDate currentDate = LocalDate.now();
							Integer curyear = currentDate.getYear();
							String year = String.valueOf(curyear);
							timesheetList = tsServie.getPendingViewTimesheet(year, status, detailObj.getRole_id(),
									basicObj.getCandidate_id(), detailObj.getEmp_type(), month, customertype);
						}else if (detailObj.getEmp_type().equalsIgnoreCase("W2 Admin") || detailObj.getEmp_type().equalsIgnoreCase("Admin")) {
							if(detailObj.getRole_id() == 1 || detailObj.getRole_id() == 2) {
								System.out.println(detailObj.getRole_id()+"detailObj.getRole_id()***"+detailObj.getEmp_type());
								String status = "Submitted";
								String month = "";
								String customertype = "";
								LocalDate currentDate = LocalDate.now();
								Integer curyear = currentDate.getYear();
								String year = String.valueOf(curyear);
								timesheetList = tsServie.getPendingViewTimesheet(year, status, detailObj.getRole_id(),
										basicObj.getCandidate_id(), detailObj.getEmp_type(), month, customertype);
							}else {
							String status = "Submitted";
							String month = "";
							String customertype = "";
							LocalDate currentDate = LocalDate.now();
							Integer curyear = currentDate.getYear();
							String year = String.valueOf(curyear);
							Integer candidateId = 0;
							timesheetList = tsServie.getPendingViewTimesheet(year, status, detailObj.getRole_id(),
									candidateId, detailObj.getEmp_type(), month, customertype);
							}
						}
					}
					session.setAttribute("timesheetList", timesheetList);

					session.setAttribute("username", basicObj.getUserName());
					session.setAttribute("lgfullname", basicObj.getFullName());
					session.setAttribute("emptype", detailObj.getEmp_type());
					session.setAttribute("role", detailObj.getRole_id());
					session.setAttribute("dept", detailObj.getDepartment_id());
					session.setAttribute("desg", detailObj.getDesignation());
					session.setAttribute("loginUserid", basicObj.getCandidate_id());
					session.setAttribute("empno", basicObj.getEmp_number());
					session.setAttribute("lgworkAuth", detailObj.getWork_authorization());
					session.setAttribute("payrollType", detailObj.getPayroll_type());
					session.setAttribute("validateby", detailObj.getValidateby_flag());
					session.setAttribute("candidateid", basicObj.getCandidate_id());
					session.setAttribute("joiningdate", detailObj.getJoining_date());
					session.setAttribute("myDashboard", myDashboard);
					session.setAttribute("emailid", basicObj.getEmail());
					session.setAttribute("personaldetails", null);
					session.setAttribute("lgemailid", null);
					session.setAttribute("invalid", null);

					session.setAttribute("emailid", basicObj.getEmail());
					session.setAttribute("personaldetails", null);
				/*	if (detailObj.getRole_id() == 4) {*/
						List<DocumentHistoryDto> pendingdocs = null;
						pendingdocs = h1bService.getCandidateInitiaton();

						List<DocumentHistoryDto> adminpendingdocs = null;
						adminpendingdocs = h1bService.getadminCandidateInitiaton();

						List<DocumentHistoryDto> adminaprpendingdocs = null;
						adminaprpendingdocs = h1bService.getadminaprCandidateInitiaton();

						List<DocumentHistoryDto> questionaries = null;
						questionaries = h1bService.questionaries();

						List<LCADetailsDto> pendinglca = null;
						pendinglca = h1bService.getpendinglca();

						Integer dasboardcount = pendingdocs.size() + adminpendingdocs.size()
								+ adminaprpendingdocs.size() + questionaries.size() + pendinglca.size();

						session.setAttribute("dasboardcount", dasboardcount);
					//}
					if (detailObj.getRole_id() == 1) {
						Integer count1 = null, count2 = null, count3 = null, usercount = 0;
						List<DocumentHistoryDto> userpendingdocs = null;
						userpendingdocs = h1bService.getPendingdocsbyCandid(basicObj.getCandidate_id());
						ContractsPanelDetails_DTO docandimmiformDto1 = h1bService
								.getimmidocumentlist1(basicObj.getCandidate_id());
						if (docandimmiformDto1.getCandidatedocTypeList() != null) {
							if (docandimmiformDto1.getCandidatedocTypeList().size() > 0) {
								//System.out.println("docandimmiformDto1.getH1bObj()"+docandimmiformDto1.getH1bObj()+"Status"+docandimmiformDto1.getH1bObj().getCandidate_status());
								if (docandimmiformDto1.getH1bObj() == null) {
									count1 = 1;
								} else {
									if(docandimmiformDto1.getH1bObj().getCandidate_status().equalsIgnoreCase("Pending")) {
										count1 = 1;
									}else {
										count1 = 0;
									}
									//count1 = 0;
								}
							//	System.out.println("docandimmiformDto1.getH1bObj()"+docandimmiformDto1.getClientObj()+"Status"+docandimmiformDto1.getClientObj().getCandidate_status());
								if (docandimmiformDto1.getClientObj() == null) {
									count2 = 1;
								} else {
									count2 = 0;
								}
								//System.out.println("docandimmiformDto1.getH1bObj()"+docandimmiformDto1.getPbcObj()+"Status"+docandimmiformDto1.getPbcObj().getCandidate_status());
								if (docandimmiformDto1.getPbcObj() == null) {
									count3 = 1;
								} else {
									if(docandimmiformDto1.getPbcObj().getCandidate_status().equalsIgnoreCase("Pending")) {
										count3 = 1;
									}else {
										count3 = 0;
									}
								}
								usercount = count1 + count2 + count3 + userpendingdocs.size();
							}
						}
						session.setAttribute("usercount", usercount);
					}

					if (detailObj.getRole_id() > 0) {
						return "Dashboard";
					} else {
						session.setAttribute("invalid", "Please contact to employer");
						return "redirect:/loginpage";
					}
				} else {
					session.setAttribute("invalid", "Invalid User Name or Password");
					return "redirect:/loginpage";
				}

	}

	@RequestMapping(value = { "/myDashboard" }, method = RequestMethod.GET)
	public String myDashboard(HttpServletRequest request, HttpServletResponse response) {
		String userName = (String) request.getSession().getAttribute("username");
		try {
			if (userName == null) {
				return "redirect:/loginpage";
			} else {
				MyDashboardDto myDashboard = null;
				HttpSession session = request.getSession(true);
				myDashboard = empService.getmyDashboardDocList();
				String mdashboard = "mdashboard";
				session.setAttribute("mdashboard", mdashboard);
				session.setAttribute("candidates", null);
				session.setAttribute("templates", null);
				session.setAttribute("stsreports", null);
				session.setAttribute("timesheet", null);
				session.setAttribute("bgc", null);
				session.setAttribute("candidates", null);
				session.setAttribute("myDashboard", myDashboard);
				session.setAttribute("immigration", null);
				session.setAttribute("myimmidocs", null);
				session.setAttribute("invoice", null);
				return "myDashboard";
			}
		} catch (Exception e) {
			logger.error("Error in myDashboard " + e);
		}
		return null;

	}

	@RequestMapping(value = { "/expiredDocuments" }, method = RequestMethod.GET)
	public String ExpiredDocuments(HttpServletRequest request, HttpServletResponse response) {
		String userName = (String) request.getSession().getAttribute("username");
		try {
			if (userName == null) {
				return "redirect:/loginpage";
			} else {
				MyDashboardDto myDashboard = null;
				HttpSession session = request.getSession(true);
				myDashboard = empService.getExpiredDocumentsList();
				String mdashboard = "mdashboard";
				session.setAttribute("mdashboard", mdashboard);
				session.setAttribute("candidates", null);
				session.setAttribute("templates", null);
				session.setAttribute("stsreports", null);
				session.setAttribute("timesheet", null);
				session.setAttribute("bgc", null);
				session.setAttribute("candidates", null);
				session.setAttribute("myDashboard", myDashboard);
				return "ExpiredDocuments";
			}
		} catch (Exception e) {
			logger.error("Error in myDashboard " + e);
		}
		return null;

	}

	@RequestMapping(value = { "/dashboard" }, method = RequestMethod.GET)
	public String Dashboard(HttpServletRequest request, HttpServletResponse response) {
		String userName = (String) request.getSession().getAttribute("username");
		Integer role = (Integer) request.getSession().getAttribute("role");
		Integer lgcandidateid = (Integer) request.getSession().getAttribute("candidateid");
		String lgemptype = (String) request.getSession().getAttribute("emptype");
		try {
			if (userName == null) {
				return "redirect:/loginpage";
			} else {
				MyDashboardDto myDashboard = null;

				HttpSession session = request.getSession(true);
				myDashboard = empService.getmyDashboardDocList();

				List<TimesheetDto> timesheetList = null;
				System.out.println("role****" + role);
				if (role == 1 && lgemptype.equalsIgnoreCase("W2")) {

					String status = "Submitted";
					String month = "";
					String customertype = "";
					LocalDate currentDate = LocalDate.now();
					Integer curyear = currentDate.getYear();
					String year = String.valueOf(curyear);
					timesheetList = tsServie.getPendingViewTimesheet(year, status, role, lgcandidateid, lgemptype,
							month, customertype);
					session.setAttribute("timesheetList", timesheetList);

					Integer count1 = null, count2 = null, count3 = null, usercount = 0;
					List<DocumentHistoryDto> userpendingdocs = null;
					userpendingdocs = h1bService.getPendingdocsbyCandid(lgcandidateid);
					ContractsPanelDetails_DTO docandimmiformDto1 = h1bService.getimmidocumentlist1(lgcandidateid);
					if (docandimmiformDto1.getCandidatedocTypeList() != null) {
						if (docandimmiformDto1.getCandidatedocTypeList().size() > 0) {
							if (docandimmiformDto1.getH1bObj() == null) {
								count1 = 1;
							} else {
								count1 = 0;
							}
							if (docandimmiformDto1.getClientObj() == null) {
								count2 = 1;
							} else {
								count2 = 0;
							}
							if (docandimmiformDto1.getPbcObj() == null) {
								count3 = 1;
							} else {
								count3 = 0;
							}
							usercount = count1 + count2 + count3 + userpendingdocs.size();
						}
					}
					session.setAttribute("usercount", usercount);

					session.setAttribute("immigration", null);
					session.setAttribute("candidates", null);
					session.setAttribute("templates", null);
					session.setAttribute("stsreports", null);
					session.setAttribute("timesheet", null);
					session.setAttribute("bgc", null);
					session.setAttribute("mydocuments", null);
					session.setAttribute("myimmidocs", null);
					session.setAttribute("mdashboard", null);
					session.setAttribute("invoice", null);
					session.setAttribute("myDashboard", myDashboard);
					return "Dashboard";

				} else {
					// if(detailObj.getRole_id()==4) {
					List<DocumentHistoryDto> pendingdocs = null;
					pendingdocs = h1bService.getCandidateInitiaton();

					List<DocumentHistoryDto> adminpendingdocs = null;
					adminpendingdocs = h1bService.getadminCandidateInitiaton();

					List<DocumentHistoryDto> adminaprpendingdocs = null;
					adminaprpendingdocs = h1bService.getadminaprCandidateInitiaton();

					List<DocumentHistoryDto> questionaries = null;
					questionaries = h1bService.questionaries();

					List<LCADetailsDto> pendinglca = null;
					pendinglca = h1bService.getpendinglca();

					Integer dasboardcount = pendingdocs.size() + adminpendingdocs.size() + adminaprpendingdocs.size()
							+ questionaries.size() + pendinglca.size();

					session.setAttribute("dasboardcount", dasboardcount);
					// }

					String status = "Submitted";
					String month = "";
					String customertype = "";
					LocalDate currentDate = LocalDate.now();
					Integer curyear = currentDate.getYear();
					String year = String.valueOf(curyear);
					Integer candidateId = 0;
					timesheetList = tsServie.getPendingViewTimesheet(year, status, role, candidateId, lgemptype, month,
							customertype);
					List<TimesheetDto> candPendingTList = new ArrayList<TimesheetDto>();
					List<SearchBean> searchemployee = empService.getemplistBySearch("", "", "", "", "W2 Admin","Active");
					for (SearchBean empObj : searchemployee) {
						CandidateDetailedInfo candObj = empService
								.getCandidateDetailedInfoById(empObj.getCandidate_id());
						TimesheetDto timesheetDto = tsServie.getPeningTimesheetByCandidateId(candObj.getCandidateInfo().getCandidate_id(),
								candObj.getPayroll_type(), candObj.getEmp_type(), null);
						candPendingTList.add(timesheetDto);
					}
					session.setAttribute("candPendingTList", candPendingTList);
					// }
					session.setAttribute("timesheetList", timesheetList);

					session.setAttribute("immigration", null);
					session.setAttribute("candidates", null);
					session.setAttribute("templates", null);
					session.setAttribute("stsreports", null);
					session.setAttribute("timesheet", null);
					session.setAttribute("bgc", null);
					session.setAttribute("mydocuments", null);
					session.setAttribute("myimmidocs", null);
					session.setAttribute("mdashboard", null);
					session.setAttribute("invoice", null);
					session.setAttribute("myDashboard", myDashboard);
					return "Dashboard";

				}
			}
		} catch (Exception e) {
			logger.error("Error in dashboard " + e);
		}
		return null;

	}

	@RequestMapping(value = { "/addEmployees" }, method = RequestMethod.GET)
	public String basicDetails(Model model, HttpServletRequest request, HttpServletResponse response) {
		try {
	
		String userName = (String) request.getSession().getAttribute("username");
		if (userName == null) {
			return "redirect:/loginpage";
		} else {
			HttpSession session = request.getSession(true);
			List<WorkAuthorization> workAuthList = empService.getWorkAuthnList();
			List<EmpTypeMaster> empTypeList = empService.getEmployeeTypeList();
			List<DepartmentsEntity> deptList = empService.getdepartmentList();
			List<EmpRoles> roleList = empService.getroleList();
			List<ManagerDto> hrList = empService.getHRList();
			List<ManagerDto> repMagrList = empService.getrepMagrList();

			session.setAttribute("waList", workAuthList);
			session.setAttribute("empTypeList", empTypeList);
			session.setAttribute("deptList", deptList);
			session.setAttribute("roleList", roleList);
			session.setAttribute("hrList", hrList);
			session.setAttribute("repMagrList", repMagrList);

			String candidates = "candidates";
			session.setAttribute("candidates", candidates);
			session.setAttribute("templates", null);
			session.setAttribute("stsreports", null);
			session.setAttribute("timesheet", null);
			session.setAttribute("mdashboard", null);
			session.setAttribute("bgc", null);
			session.setAttribute("mydocuments", null);
			session.setAttribute("immigration", null);
			session.setAttribute("myimmidocs", null);
		//	return "AddEmployees";
		}
		} catch (Exception e) {
			logger.error("Error in addEmployees " + e);
		}
		return "AddEmployees";
		
	}

	@RequestMapping(value = { "/ssncheck" }, method = RequestMethod.GET)
	@ResponseBody
	public EmpBasicDetailsEntity ssncheck(Model model, HttpServletRequest request, HttpServletResponse response) {
		String userName = (String) request.getSession().getAttribute("username");
		HttpSession session = request.getSession(true);
		EmpBasicDetailsEntity ssnObj = null;
		try {
			String ssn_emp = request.getParameter("ssn_emp");
			ssnObj = empService.SSNExistOrNot(ssn_emp);
		} catch (Exception e) {
			logger.error("Error in ssncheck " + e);
		}
		return ssnObj;
	}

	@RequestMapping(value = { "/empsearchbySSN" }, method = RequestMethod.GET)
//	@ResponseBody
	public String empsearchbySSN(Model model, HttpServletRequest request, HttpServletResponse response) {
		
		try {
			HttpSession session = request.getSession();
			String userName = (String) request.getSession().getAttribute("username");
			if (userName == null) {
				return "redirect:/loginpage";
			} else {
				
			String ssn_emp = request.getParameter("ssnno");
			List<SearchBean> searchemployee = empService.empsearchbySSN(ssn_emp);
			String semp_type = "";
			String susername = "";
			String sfullname = "";
			String s_subtype = "";
			String spendingdocs = "";
			for (SearchBean searchBean : searchemployee) {
				String emptype = searchBean.getEmp_type();
				if (emptype.equalsIgnoreCase("W2") || emptype.equalsIgnoreCase("W2 Admin")) {
					semp_type = "Employees";
				} else {
					semp_type = "Contractors";
				}
			}

			session.setAttribute("semp_type", semp_type);
			session.setAttribute("susername", susername);
			session.setAttribute("sfullname", sfullname);
			session.setAttribute("s_subtype", s_subtype);
			session.setAttribute("spendingdocs", spendingdocs);

			session.setAttribute("searchemployee", searchemployee);
		}
		} catch (Exception e) {
			logger.error("Error in empsearchbySSN " + e);
		}
		return "SearchConsultant";
	}

	@RequestMapping(value = { "/checkUserName" }, method = RequestMethod.GET)
	@ResponseBody
	public String checkUserName(Model model, HttpServletRequest request, HttpServletResponse response) {
		String userName = (String) request.getSession().getAttribute("username");
		
			if (userName == null) {
				return "redirect:/loginpage";
			} else {
			String fullname = request.getParameter("fullname");
			String middleName = request.getParameter("middleName");
			String familyName = request.getParameter("familyName");
			String uname = empService.checkUserName(fullname, middleName, familyName);
			return uname;
			}
	}

	@RequestMapping(value = { "/saveEmployees" }, method = RequestMethod.POST)
	@ResponseBody
	public EmployeeDto saveCategory(Model model, HttpServletRequest request, HttpServletResponse response) {
		EmployeeDto empdto = new EmployeeDto();
		try {
			HttpSession session = request.getSession(true);
			String userName = (String) request.getSession().getAttribute("username");
			String ssn_emp = request.getParameter("ssn_emp");
			String firstName = request.getParameter("firstName");
			String middleName = request.getParameter("middleName");
			String familyName = request.getParameter("familyName");
			String employee_type = request.getParameter("employee_type");
			String w2department1 = request.getParameter("w2admin_details");
			String role = request.getParameter("w2admin_roles");
			String rephead = request.getParameter("w2emp_rephead");

			int mgr_empid = 0;
			if (!rephead.isEmpty()) {
				mgr_empid = Integer.parseInt(rephead);
			}
			int roleId = 0;
			if (!role.isEmpty()) {
				roleId = Integer.parseInt(role);
			}

			int w2department = 0;
			if (!w2department1.isEmpty()) {
				w2department = Integer.parseInt(w2department1);
			}
			
			String rec_name = request.getParameter("rec_name");
			String hr_name = request.getParameter("hr_name");
			String email_id = request.getParameter("email_id");
			String phne_no1 = request.getParameter("phne_no");
			String phne_no2 = request.getParameter("phne_no2");
			String phne_no3 = request.getParameter("phne_no3");
			String ctype2 = request.getParameter("ctype2");
			String ctype3 = request.getParameter("ctype3");
			String dob = request.getParameter("dob");
			String bgc = request.getParameter("bgc");
			String joining_Date = request.getParameter("joining_Date");

			String work_auth = request.getParameter("work_auth");

			String designation = request.getParameter("designation");
			String billingType = request.getParameter("billingType");
			String line1 = request.getParameter("line1");
			String line2 = request.getParameter("line2");
			String zipcode = request.getParameter("zipcode");
			String city = request.getParameter("city");
			String state = request.getParameter("state");
			String autouname = request.getParameter("autouname");
			String validateby = request.getParameter("validateby");
			String payrolltype = "";
			if (employee_type.equalsIgnoreCase("W2")) {
				payrolltype = "";
			} else {
				payrolltype = request.getParameter("payrolltype");
			}

			Integer loginempno = (Integer) session.getAttribute("empno");

			Integer candidateId = empService.saveBasicDetails(ssn_emp, firstName, employee_type, w2department, rec_name,
					hr_name, email_id, phne_no1, dob, joining_Date, designation, billingType, line1, roleId, mgr_empid,
					autouname, loginempno, middleName, familyName, line2, zipcode, city, state, bgc, work_auth,
					phne_no2, phne_no3, ctype2, ctype3, validateby, payrolltype);
			PageStatusEntity pageObj = empService.getRedirectPageStatus(candidateId);
			if (candidateId != 0) {
				EmpBasicDetailsEntity empObj = empService.getEmployeeDetailsByCandidateId(candidateId);
				// EmployeeDto empObj = empService.getCanidateDetailsByCanId(candidateId);
				String message = "Basic Details Added Successfully  Employee UserName=" + empObj.getUserName()
						+ "  Employee Number=" + empObj.getEmp_number() + "";
				empdto.setMessage(message);
				empdto.setCandidateId(candidateId);
				empdto.setEmp_type(employee_type);
				empdto.setDocstatus(pageObj.getDocument_status());
			}
		} catch (Exception e) {
			// logger.debug("Error in saveEmployees" + e.getCause());
			logger.error("Error in saveEmployees" + e.getMessage());
		}
		return empdto;
	}

	@RequestMapping(value = { "/addEmpDocuments" }, method = RequestMethod.GET)
	public String adddocPage(Model model, HttpServletRequest request, HttpServletResponse response) {
		String userName = (String) request.getSession().getAttribute("username");
try {
		if (userName == null) {
			return "redirect:/loginpage";
		} else {
			HttpSession session = request.getSession(true);
			String candidateId = request.getParameter("candidate_id");
			String empType = request.getParameter("empType");
			AttachmentBean attachmentBean = empService.getFilesByCandidateId(candidateId);
			EmployeeDto basicObj = empService.getCanidateDetailsByCanId(Integer.parseInt(candidateId));
			session.setAttribute("basicObj", basicObj);
			session.setAttribute("attachmentBean", attachmentBean);
			session.setAttribute("candidate_id", candidateId);
			session.setAttribute("empType", empType);
		//	return "EmployeeDocuments";
		}

       } catch (Exception e) {
			logger.error("Error in addEmpDocuments " + e);
		}
      return "EmployeeDocuments";
		
	}

	@RequestMapping(value = { "/saveEmpDocuments" }, method = RequestMethod.POST)
	// @ResponseBody
	public String saveEmpDocuments(Model model, HttpServletRequest request, HttpServletResponse response,
			@RequestParam(name = "offer_letter", required = false) MultipartFile offerletter,
			@RequestParam(name = "agreement", required = false) MultipartFile agreement,
			@RequestParam(name = "i9", required = false) MultipartFile i9_form,
			@RequestParam(name = "w4", required = false) MultipartFile w4_form) {
		String userName = (String) request.getSession().getAttribute("username");
		String message = null;
		// EmployeeDto empdto = new EmployeeDto();
		try {
			
			if (userName == null) {
				return "redirect:/loginpage";
			} else {
			
			Integer lgempno = (Integer) request.getSession().getAttribute("empno");
			HttpSession session = request.getSession(true);
			String candidate_id = request.getParameter("candidate_id");
			String empType = request.getParameter("empType");
			MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;

			String filetype = "";
			message = empService.saveEmployeeDocuments(candidate_id, offerletter, agreement, i9_form, w4_form, lgempno);

			String[] i9FormAddBtnCount = request.getParameterValues("i9FormAddBtnCount");
			if (i9FormAddBtnCount != null) {
				for (int i = 1; i <= i9FormAddBtnCount.length; i++) {
					String i9frominput = request.getParameter("i9forminput" + i + "");
					filetype = "i9Formdocs";
					MultipartFile i9formFile = multipartRequest.getFile("i9formFile" + i);
					message = empService.saveEmployeeAddtionalDocuments(i9formFile, filetype, i9frominput, candidate_id,
							lgempno);
				}
			}
			String[] i9supportbtncount = request.getParameterValues("i9supportbtncount");
			if (i9supportbtncount != null) {
				for (int i = 1; i <= i9supportbtncount.length; i++) {
					filetype = "i9Supportdocs";
					String i9supportinput = request.getParameter("i9supportinput" + i + "");
					MultipartFile i9supportFile = multipartRequest.getFile("i9supportFile" + i);
					message = empService.saveEmployeeAddtionalDocuments(i9supportFile, filetype, i9supportinput,
							candidate_id, lgempno);
				}
			}
			String[] OtherBtnCount = request.getParameterValues("OtherBtnCount");
			if (OtherBtnCount != null) {
				for (int i = 1; i <= OtherBtnCount.length; i++) {
					filetype = "OtherAdditionaldocs";
					String otherAddtnlinput = request.getParameter("otherAddtnlinput" + i + "");
					MultipartFile otherAddtnlFile = multipartRequest.getFile("otherAddtnlFile" + i);
					message = empService.saveEmployeeAddtionalDocuments(otherAddtnlFile, filetype, otherAddtnlinput,
							candidate_id, lgempno);
				}
			}
			String[] listABtnCount = request.getParameterValues("listABtnCount");
			if (listABtnCount != null) {
				for (int i = 1; i <= listABtnCount.length; i++) {
					filetype = "ListA";
					String listASelectionInput = request.getParameter("listASelectionId" + i + "");
					MultipartFile listAFile = multipartRequest.getFile("listAFile" + i);
					String fromdate = request.getParameter("fromdate" + i + "");
					String expirydate = request.getParameter("expirydate" + i + "");
					message = empService.saveEmployeeI9Documents(listAFile, filetype, listASelectionInput, candidate_id,
							lgempno, fromdate, expirydate);
				}
			}

			String[] listBBtnCount = request.getParameterValues("listBBtnCount");
			if (listBBtnCount != null) {
				for (int i = 1; i <= listBBtnCount.length; i++) {
					filetype = "ListB";
					String listASelectionInput = request.getParameter("listBSelectionId" + i + "");
					MultipartFile listBFile = multipartRequest.getFile("listBFile" + i);
					String fromdate = request.getParameter("lbfromdate" + i + "");
					String expirydate = request.getParameter("lbexpirydate" + i + "");
					message = empService.saveEmployeeI9Documents(listBFile, filetype, listASelectionInput, candidate_id,
							lgempno, fromdate, expirydate);
				}
			}
			String[] listCBtnCount = request.getParameterValues("listCBtnCount");
			if (listCBtnCount != null) {
				for (int i = 1; i <= listCBtnCount.length; i++) {
					filetype = "ListC";
					String listASelectionInput = request.getParameter("listCSelectionId" + i + "");
					MultipartFile listCFile = multipartRequest.getFile("listCFile" + i);
					String fromdate = request.getParameter("lcfromdate" + i + "");
					String expirydate = request.getParameter("lcexpirydate" + i + "");
					message = empService.saveEmployeeI9Documents(listCFile, filetype, listASelectionInput, candidate_id,
							lgempno, fromdate, expirydate);
				}
			}

			AttachmentBean attObj = empService.getFilesByCandidateId(candidate_id);
			PageStatusEntity pageObj = empService.getRedirectPageStatus(Integer.parseInt(candidate_id));
			if (attObj.getOfferletter() != null && attObj.getI9() != null && attObj.getW4() != null
					&& attObj.getAgreement() != null) {
				empService.updatePageStatus(candidate_id);
			}
			Integer candidateId = 0;
			if (candidate_id != null) {
				candidateId = Integer.parseInt(candidate_id);
			}
			session.setAttribute("candidate_id", candidateId);
			/*
			 * empdto.setMessage(message); empdto.setCandidateId(candidateId);
			 * empdto.setDocstatus(pageObj.getDocument_status());
			 * empdto.setBankstatus(pageObj.getBank_status());
			 * empdto.setClientstatus(pageObj.getClient_status());
			 */

			/* if(message.equalsIgnoreCase("Success")) { */
			PrintWriter out = response.getWriter();
			out.println("<script type=\"text/javascript\">");
			out.println("alert('" + message + "');");
			out.println("window.location='addEmpDocuments?candidate_id=" + candidateId + "&empType=" + empType + "'");
			out.println("</script>");
			out.close();
			/* } */
		}
		} catch (Exception e) {
			logger.error("Error occured in saveEmpDocuments ---", e);
		}
		return null;
	}

	@RequestMapping(value = { "/checkSelectedFileName" }, method = RequestMethod.GET)
	@ResponseBody
	public String checkSelectedFileName(Model model, HttpServletRequest request, HttpServletResponse response) {
		String userName = (String) request.getSession().getAttribute("username");
		String msg = null;
		if (userName == null) {
			return "redirect:/loginpage";
		} else {
			String filename = request.getParameter("filename");
			String fname = empService.checkSelectedFileName(filename);
			if (fname != null) {
				msg = "Uploaded";
			} else {
				msg = "NotExists";
			}
			return msg;
		}
	}

	@RequestMapping(value = { "/downloadocs" }, method = RequestMethod.GET)
	public void downloadocs(HttpServletResponse response, HttpServletRequest request) throws Exception {
		try {
			String userName = (String) request.getSession().getAttribute("username");
			if (userName == null) {
				PrintWriter out = response.getWriter();
				out.println("<script type=\"text/javascript\">");
				out.println("window.location.href='login.jsp'");
				out.println("</script>");
				out.close();
			} else {
				/*
				 * Integer empNo=null; String empNumber=request.getParameter("empno");
				 * if(empNumber!=null){ empNo=Integer.parseInt(empNumber); }
				 */
				Integer candidateId = null;
				String candidate_id = request.getParameter("candidate_id");
				if (candidate_id != null) {
					candidateId = Integer.parseInt(candidate_id);
				}

				String custmerName = null;
				String vendorName = null;
				String filetype = request.getParameter("filetype");
				String filename = request.getParameter("filename");
				if (filetype.equalsIgnoreCase("Customer_MSA")
						|| filetype.equalsIgnoreCase("Manager_Approved_Email_CMSA")) {
					custmerName = request.getParameter("customerName");
				} else if (filetype.equalsIgnoreCase("Vendor_MSA") || filetype.equalsIgnoreCase("Business Compliance")
						|| filetype.equalsIgnoreCase("Manager_Approved_Email_VMSA")) {
					vendorName = request.getParameter("vendorName");
				} else {

				}
				String filepath = null;
				String workingDir = env.getProperty("documents");
				if (custmerName != null) {
					filepath = workingDir + File.separator + custmerName + File.separator + filename;
				} else if (vendorName != null) {
					filepath = workingDir + File.separator + vendorName + File.separator + filename;
				} else {
					filepath = workingDir + File.separator + candidateId + File.separator + filename;
				}
				File ff = new File(filepath);
				if (ff.exists() == true) {
					FileInputStream fis = new FileInputStream(ff);
					byte[] inputBytes = new byte[(int) ff.length()];
					fis.read(inputBytes);
					response.setContentType("application/octet-stream;");
					response.setHeader("Content-Disposition", "attachment; filename=\"" + filename);
					OutputStream os = response.getOutputStream(); // file output stream
					os.write(inputBytes);
					os.close();
				} else {
					PrintWriter out = response.getWriter();
					out.println("<script type=\"text/javascript\">");
					out.println("alert('No file available');");
					out.println("window.history.back();");
					out.println("</script>");
					out.close();
				}
			}
		} catch (Exception e) {
			logger.error("Error while downloadocs action in EmployeesController" + e);
		}
	}

	@RequestMapping(value = { "/addEmpBankDetails" }, method = RequestMethod.GET)
	public String addbank(Model model, HttpServletRequest request, HttpServletResponse response) {
		String userName = (String) request.getSession().getAttribute("username");
try {
	
		if (userName == null) {
			return "redirect:/loginpage";
		} else {
			HttpSession session = request.getSession(true);
			String candidate_id = request.getParameter("candidate_id");
			EmployeeDto basicObj = empService.getCanidateDetailsByCanId(Integer.parseInt(candidate_id));
			session.setAttribute("basicObj", basicObj);
			session.setAttribute("candidate_id", candidate_id);

			//return "AddEmpBankDetails";
		}
} catch (Exception e) {
	logger.error("Error in addEmpBankDetails " + e);
}
return "AddEmpBankDetails";
	}

	@RequestMapping(value = { "/saveEmpbankDetails" }, method = RequestMethod.POST)
	public void saveEmployeebank(HttpServletRequest request, Model model, HttpServletResponse response) {
		String message = null;
		try {
			String userName = (String) request.getSession().getAttribute("username");
			if (userName == null) {
				//return "redirect:/loginpage";
				//window.location.href="loginpage";
				PrintWriter out = response.getWriter();
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Session Expired');");
				out.println("location='loginpage");
				out.println("</script>");
				out.close();
			} else {
			
			Integer lgempno = (Integer) request.getSession().getAttribute("empno");
			MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
			Integer candidate_Id = null;
			String candidate_id = request.getParameter("candidate_id");
			if (candidate_id != "") {
				candidate_Id = Integer.parseInt(candidate_id);
			}
			String accountNo = request.getParameter("acc_name");
			String bankname = request.getParameter("bank_name");
			String swiftcode = request.getParameter("swift_code");
			String ibancode = request.getParameter("ibank_code");
			String routingno = request.getParameter("bank_routing");
			// String bankamount = request.getParameter("bank_amount");
			MultipartFile file1 = multipartRequest.getFile("bfile");
			message = empService.saveEmpbankDetails(accountNo, bankname, swiftcode, ibancode, routingno, file1,
					candidate_Id, lgempno);

			if (request.getParameterValues("btncount") != null) {
				String bankBtnVal[] = request.getParameterValues("btncount");
				for (int i = 1; i <= bankBtnVal.length; i++) {
					String accountNo1 = request.getParameter("acc_name" + i + "");
					String bankname1 = request.getParameter("bank_name" + i + "");
					String swiftcode1 = request.getParameter("swift_code" + i + "");
					String ibancode1 = request.getParameter("ibank_code" + i + "");
					String routingno1 = request.getParameter("bank_routing" + i + "");
					// String bankamount1 = request.getParameter("bank_amount"+i+"");
					MultipartFile ofile = multipartRequest.getFile("ofile" + i);
					message = empService.saveEmpbankDetails(accountNo1, bankname1, swiftcode1, ibancode1, routingno1,
							ofile, candidate_Id, lgempno);

				}
			}

			PrintWriter out = response.getWriter();
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Employee Bank Details Added Successfully');");
			out.println("location='exitDetails?candidate_id=" + candidate_Id + "'");
			out.println("</script>");
			out.close();
		   }
		} catch (Exception e) {
			logger.error("Error occured in saveEmpbankDetails ---", e);
		}
	}

	@RequestMapping(value = { "/viewEmpBankDetails" }, method = RequestMethod.GET)
	public String viewEmpBankDetails(Model model, HttpServletRequest request, HttpServletResponse response) {
		String lguserName = (String) request.getSession().getAttribute("username");
		HttpSession session = request.getSession();
		try {
			if (lguserName == null) {
				return "redirect:/loginpage";
			} else {
			String candidate_id = request.getParameter("candidate_id");
			List<BankDetailsEntity> empEanklist = empService.viewEmpBankDetails(candidate_id);
			EmployeeDto basicObj = empService.getCanidateDetailsByCanId(Integer.parseInt(candidate_id));
			session.setAttribute("basicObj", basicObj);

			session.setAttribute("empEanklist", empEanklist);
			session.setAttribute("candidate_id", candidate_id);
			}
			} catch (Exception e) {
			logger.error("Error occured in viewEmpBankDetails ---", e);
		}
		return "UpdateEmpBankDetails";
	}

	@RequestMapping(value = { "/updateEmpBankDetails" }, method = RequestMethod.POST)
	public void updateEmpBankDetails(Model model, HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value = "file", required = false) CommonsMultipartFile file1[]) {
		String lguserName = (String) request.getSession().getAttribute("username");
		Integer lgempno = (Integer) request.getSession().getAttribute("empno");
		HttpSession session = request.getSession();
		String message = null;
		String fileName = "";
		try {
			if (lguserName == null) {
				//return "redirect:/loginpage";
				PrintWriter out = response.getWriter();
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Session Expired');");
				out.println("location='loginpage");
				out.println("</script>");
				out.close();
			} else {
			Integer candidate_Id = null;
			String candidate_id = request.getParameter("candidate_id");
			if (candidate_id != "") {
				candidate_Id = Integer.parseInt(candidate_id);
			}
			MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
			String[] tblpk1 = request.getParameterValues("tblpk");
			String[] accountNo = request.getParameterValues("txtAccount");
			String[] bankname = request.getParameterValues("txtBank");
			String[] swiftcode = request.getParameterValues("txtswift");
			String[] ibancode = request.getParameterValues("txtiban");
			String[] routingno = request.getParameterValues("txtrouting");
			// String[] bankamount = request.getParameterValues("bank_amount");

			message = empService.updateEmpBankDetails(accountNo, bankname, swiftcode, ibancode, routingno, file1,
					candidate_id, tblpk1, lgempno);
			/**/
			if (request.getParameterValues("btncount") != null) {
				String bankBtnVal[] = request.getParameterValues("btncount");
				for (int i = 1; i <= bankBtnVal.length; i++) {
					String accountNo1 = request.getParameter("acc_name" + i + "");
					String bankname1 = request.getParameter("bank_name" + i + "");
					String swiftcode1 = request.getParameter("swift_code" + i + "");
					String ibancode1 = request.getParameter("ibank_code" + i + "");
					String routingno1 = request.getParameter("bank_routing" + i + "");
					// String bankamount1 = request.getParameter("bank_amount"+i+"");
					MultipartFile ofile = multipartRequest.getFile("ofile" + i);
					message = empService.saveEmpbankDetails(accountNo1, bankname1, swiftcode1, ibancode1, routingno1,
							ofile, candidate_Id, lgempno);

				}
			}
			PrintWriter out = response.getWriter();
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Employee Bank Details Updated Successfully');");
			out.println("location='viewEmpBankDetails?candidate_id=" + candidate_Id + "'");
			out.println("</script>");
			out.close();
			}
		} catch (Exception e) {
			logger.error("Error occured in saveEmpbankDetails ---", e);
		}

	}

	@RequestMapping(value = { "/exitDetails" }, method = RequestMethod.GET)
	public String exitDetails(Model model, HttpServletRequest request, HttpServletResponse response) {
		String userName = (String) request.getSession().getAttribute("username");
		if (userName == null) {
			return "redirect:/loginpage";
		} else {
			try {
				HttpSession session = request.getSession(true);
				String candidate_id = request.getParameter("candidate_id");
				EmployeeDto basicObj = empService.getCanidateDetailsByCanId(Integer.parseInt(candidate_id));
				session.setAttribute("basicObj", basicObj);
				session.setAttribute("candidate_id", candidate_id);
			} catch (Exception e1) {
				logger.error("Error occured in exitDetails ---", e1);
			}
			return "ExitDetails";
		}
	}

	@RequestMapping(value = { "/saveExitDetails" }, method = RequestMethod.POST, consumes = "application/json")
	@ResponseBody
	public String saveExitDetails(Model model, HttpServletRequest request, HttpServletResponse response,
			@RequestBody EmpExitDetailsEntity exitObj) {
		String userName = (String) request.getSession().getAttribute("username");
		Integer empno = (Integer) request.getSession().getAttribute("empno");
		String message = null;
		try {
			HttpSession session = request.getSession(true);
			message = empService.saveExitDetails(exitObj, empno);
			EmployeeDto basicObj = empService.getCanidateDetailsByCanId(exitObj.getCandidate_id());
			session.setAttribute("basicObj", basicObj);
			session.setAttribute("candidate_id", exitObj.getCandidate_id());
		} catch (Exception e) {
			logger.error("Error occured in saveExitDetails ---", e);
		}
		return message;
	}

	@RequestMapping(value = { "/ViewExitDetails" }, method = RequestMethod.GET)
	public String ViewExitDetails(Model model, HttpServletRequest request, HttpServletResponse response) {
		String lguserName = (String) request.getSession().getAttribute("username");
		HttpSession session = request.getSession();
		try {
			if (lguserName == null) {
				return "redirect:/loginpage";
			} else {
			String candidate_id = request.getParameter("candidate_id");
			EmpExitDetailsEntity exitObj = empService.ViewExitDetails(candidate_id);
			EmployeeDto basicObj = empService.getCanidateDetailsByCanId(exitObj.getCandidate_id());
			session.setAttribute("basicObj", basicObj);
			session.setAttribute("exitObj", exitObj);
			}
		} catch (Exception e) {
			logger.error("Error occured in ViewExitDetails ---", e);
		}
		return "UpdateExitDetails";
	}

	@RequestMapping(value = { "/updateExitDetails" }, method = RequestMethod.POST)
	@ResponseBody
	public String updateExitDetails(Model model, HttpServletRequest request, HttpServletResponse response) {
		String lguserName = (String) request.getSession().getAttribute("username");
		Integer lgempno = (Integer) request.getSession().getAttribute("empno");
		HttpSession session = request.getSession();
		String message = null;
		try {
			String candidate_id = request.getParameter("candidate_id");
			String lwd = request.getParameter("txtLWD");
			String terminationdate = request.getParameter("txtTRD");
			String exitreason = request.getParameter("txttype");
			String comments = request.getParameter("comments");
			message = empService.updateExitDetails(candidate_id, lwd, terminationdate, exitreason, comments, lgempno);
		} catch (Exception e) {
			logger.error("Error occured in ViewExitDetails ---", e);
		}
		return message;
	}

	@RequestMapping(value = { "/search" }, method = RequestMethod.GET)
	public String search(Model model, HttpServletRequest request, HttpServletResponse response) {
		try {
			HttpSession session = request.getSession();
			String userName = (String) request.getSession().getAttribute("username");
			if (userName == null) {
				return "redirect:/loginpage";
			} else {
			List<SearchBean> searchemployee = null;
			String semp_type = null;
			String sempstatus = null;
			session.setAttribute("semp_type", semp_type);
			session.setAttribute("sempstatus", sempstatus);
			session.setAttribute("searchemployee", searchemployee);
			String candidates = "candidates";
			session.setAttribute("candidates", candidates);
			session.setAttribute("templates", null);
			session.setAttribute("stsreports", null);
			session.setAttribute("timesheet", null);
			session.setAttribute("myimmidocs", null);
			}
		} catch (Exception e) {
			logger.error("Error occured in search ---", e);
		}
		return "SearchConsultant";
	}

	@RequestMapping(value = { "/getEmpInfoByEmpType" }, method = RequestMethod.GET)
	@ResponseBody
	public List<ManagerDto> getEmpInfoByEmpType(Model model, HttpServletRequest request, HttpServletResponse response) {
		String userName = (String) request.getSession().getAttribute("username");
		String sEmp_type = request.getParameter("sEmp_type");
		List<ManagerDto> basicdetails = null;
		try {
			basicdetails = empService.getEmpInfoByEmpType(sEmp_type);
			System.out.println("basicdetails***" + basicdetails.size());
		} catch (Exception e) {
			logger.error("Error occured in getEmpInfoByEmpType ---", e);
		}
		return basicdetails;
	}

	@RequestMapping(value = { "/searchlist" }, method = RequestMethod.POST)
	public String searchByAdmin(Model model, HttpServletRequest request, HttpServletResponse response) {
		String lguserName = (String) request.getSession().getAttribute("username");
		try {
			if (lguserName == null) {
				return "redirect:/loginpage";
			} else {
			String susername = request.getParameter("susername");
			String sfullname = request.getParameter("sfullname");
			String s_subtype = request.getParameter("s_subtype");
			String spendingdocs = request.getParameter("spendingdocs");
			String semp_type = request.getParameter("semp_type");
			String sempstatus = request.getParameter("empstatus");
			
			List<SearchBean> searchemployee = empService.getemplistBySearch(susername, sfullname, s_subtype,spendingdocs, semp_type,sempstatus);
			
			HttpSession session = request.getSession();
			session.setAttribute("semp_type", semp_type);
			session.setAttribute("susername", susername);
			session.setAttribute("sfullname", sfullname);
			session.setAttribute("s_subtype", s_subtype);
			session.setAttribute("spendingdocs", spendingdocs);
			session.setAttribute("sempstatus", sempstatus);
			session.setAttribute("searchemployee", searchemployee);
			}
		} catch (Exception e) {
			logger.error("Error occured in searchByAdmin ---", e);
		}
		return "SearchConsultant";
	}

	@RequestMapping(value = { "/ViewEmployeeInfo" }, method = RequestMethod.GET)
	public String ViewEmployeeInfo(Model model, HttpServletRequest request, HttpServletResponse response) {
		String lguserName = (String) request.getSession().getAttribute("username");
		HttpSession session = request.getSession();
		try {
			if (lguserName == null) {
				return "redirect:/loginpage";
			} else {
			String candidate_id = request.getParameter("candidate_id");
			
				BasicDetailsDto basicInfoObj = empService.viewEmployeeInfo(candidate_id);

				List<WorkAuthorization> workAuthList = empService.getWorkAuthnList();
				List<EmpTypeMaster> empTypeList = empService.getEmployeeTypeList();
				List<DepartmentsEntity> deptList = empService.getdepartmentList();
				List<EmpRoles> roleList = empService.getroleList();
				List<ManagerDto> hrList = empService.getHRList();
				List<ManagerDto> repMagrList = empService.getrepMagrList();

				session.setAttribute("waList", workAuthList);
				session.setAttribute("empTypeList", empTypeList);
				session.setAttribute("deptList", deptList);
				session.setAttribute("roleList", roleList);
				session.setAttribute("hrList", hrList);
				session.setAttribute("repMagrList", repMagrList);
				session.setAttribute("autobasiclist", basicInfoObj);

			}
		} catch (Exception e) {
			logger.error("Error occured in ViewEmployeeInfo ---", e);
		}
		return "UpdateEmployees";
	}

	@RequestMapping(value = { "/updateEmployees" }, method = RequestMethod.POST)
	@ResponseBody
	public EmployeeDto updateEmployee(Model model, HttpServletRequest request, HttpServletResponse response) {
		EmployeeDto empdto = new EmployeeDto();
		try {
			String userName = (String) request.getSession().getAttribute("username");
			String candidate_id = request.getParameter("candidate_id");
			String ssn_emp = request.getParameter("ssn_emp");
			String firstName = request.getParameter("FirstName");
			String middleName = request.getParameter("middleName");
			String familyName = request.getParameter("familyName");
			String employee_type = request.getParameter("employee_type");
			String w2department1 = request.getParameter("w2admin_details");
			String role = request.getParameter("w2admin_roles");
			String rephead = request.getParameter("w2emp_rephead");

			int mgr_empid = 0;
			if (!rephead.isEmpty()) {
				mgr_empid = Integer.parseInt(rephead);
			}
			int roleId = 0;
			if (!role.isEmpty()) {
				roleId = Integer.parseInt(role);
			}

			int w2department = 0;
			if (!w2department1.isEmpty()) {
				w2department = Integer.parseInt(w2department1);
			}

			String rec_name = request.getParameter("rec_name");
			String hr_name = request.getParameter("hr_name");
			String email_id = request.getParameter("email_id");
			String phne_no = request.getParameter("phne_no");
			String dob = request.getParameter("dob");
			String bgc = request.getParameter("bgc");
			String joining_Date = request.getParameter("joining_Date");
			String work_auth = request.getParameter("work_auth");
			String designation = request.getParameter("designation");
			String billingType = request.getParameter("billingType");
			String line1 = request.getParameter("line1");
			String line2 = request.getParameter("line2");
			String zipcode = request.getParameter("zipcode");
			String city = request.getParameter("city");
			String state = request.getParameter("state");
			String phne_no2 = request.getParameter("phne_no2");
			String phne_no3 = request.getParameter("phne_no3");
			String ctype2 = request.getParameter("ctype2");
			String ctype3 = request.getParameter("ctype3");
			String validateby = request.getParameter("validateby");
			String payrolltype = "";
			if (employee_type.equalsIgnoreCase("W2 Admin")) {
				payrolltype = request.getParameter("payrolltype");
			} else {
				payrolltype = "";
			}

			String autouname = "";

			Integer lgempno = (Integer) request.getSession().getAttribute("empno");
			Integer candidateId = Integer.parseInt(candidate_id);
			String message = empService.updateBasicDetails(ssn_emp, firstName, employee_type, w2department, rec_name,
					hr_name, email_id, phne_no, dob, joining_Date, designation, billingType, line1, roleId, mgr_empid,
					autouname, lgempno, middleName, familyName, line2, zipcode, city, state, bgc, work_auth,
					candidateId, phne_no2, phne_no3, ctype2, ctype3, validateby, payrolltype);

			empdto.setMessage(message);
			empdto.setCandidateId(candidateId);

		} catch (Exception e) {
			logger.error("Error in updateEmployees" + e.getMessage());
		}
		return empdto;
	}

	@RequestMapping(value = { "/editEmployeeDocument" }, method = RequestMethod.POST)
	public String editEmployeeDocument(Model model, HttpServletRequest request, HttpServletResponse response,
			@RequestParam("editFile") MultipartFile editFile) {
		try {
			HttpSession session = request.getSession(true);
			String userName = (String) request.getSession().getAttribute("username");
			Integer loginempno = (Integer) session.getAttribute("empno");
			if (userName == null) {
				return "redirect:/loginpage";
			} else {
				/*
				 * String candidate_id = request.getParameter("candidate_id"); String empType =
				 * request.getParameter("empType"); String fileId =
				 * request.getParameter("fileId");
				 * 
				 * String
				 * msg=empService.updateDocumentById(editFile,fileId,candidate_id,loginempno);
				 */
				String fileId = request.getParameter("fileId");
				String CandidateId = request.getParameter("candidate_id");
				String fileType = request.getParameter("efileType");
				String InputVal = request.getParameter("eInputVal");
				String emptype = request.getParameter("empType");

				String msg = empService.updateEmployeeDocuments(editFile, fileId, CandidateId, loginempno, fileType,
						InputVal);
				if (msg.equalsIgnoreCase("Success")) {
					PrintWriter out = response.getWriter();
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Documents Uploaded Successfully');");
					out.println("window.location='addEmpDocuments?candidate_id=" + CandidateId + "&empType=" + emptype
							+ "'");
					out.println("</script>");
					out.close();
				}
			}
		} catch (Exception e) {
			logger.error("Error while in EditDocument" + e);
		}
		return null;
	}

	@RequestMapping(value = { "/deleteDocument" }, method = RequestMethod.POST)
	public String deleteDocument(Model model, HttpServletRequest request, HttpServletResponse response) {
		try {
			HttpSession session = request.getSession(true);
			String userName = (String) request.getSession().getAttribute("username");
			if (userName == null) {
				return "redirect:/loginpage";
			} else {
				String candidate_id = request.getParameter("candidate_id");
				String fileId = request.getParameter("fileId");
				String empType = request.getParameter("empType");
				String msg = empService.deleteDocumentByDocId(fileId);
				session.setAttribute("candidate_id", candidate_id);
				if (msg.equalsIgnoreCase("Success")) {
					PrintWriter out = response.getWriter();
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Document Deleted  Successfully');");
					out.println("window.location='addEmpDocuments?candidate_id=" + candidate_id + "&empType=" + empType
							+ "'");
					out.println("</script>");
					out.close();
				} else {
					PrintWriter out = response.getWriter();
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Document not deleted');");
					out.println("window.location='addEmpDocuments?candidate_id=" + candidate_id + "&empType=" + empType
							+ "'");
					out.println("</script>");
					out.close();
				}
			}
		} catch (Exception e) {
			logger.error("Error while in deleteDocument" + e);
		}
		return null;
	}

	@RequestMapping(value = { "/getHistoryByCandidateId" }, method = RequestMethod.GET)
	public String getEmployeeHistoryByCandidateId(Model model, HttpServletRequest request,
			HttpServletResponse response) {
		try {
			HttpSession session = request.getSession(true);
			String userName = (String) request.getSession().getAttribute("username");
			if (userName == null) {
				return "redirect:/loginpage";
			} else {
				String candidate_id = request.getParameter("candidate_id");
				List<EmpJoinHistorty> empHistoryobj = empService.getEmployeeHistoryByCandidateId(candidate_id);
				session.setAttribute("empHistoryobj", empHistoryobj);
				session.setAttribute("candidate_id", candidate_id);
			}
		} catch (Exception e) {
			logger.error("Error while in getHistoryByCandidateId" + e);
		}
		return "ViewEmpHistory";
	}

	@RequestMapping(value = { "/rejoinDetails" }, method = RequestMethod.POST)
	@ResponseBody
	public String rejoinDetails(Model model, HttpServletRequest request, HttpServletResponse response) {
		String message = null;
		try {
			HttpSession session = request.getSession(true);
			String userName = (String) request.getSession().getAttribute("username");
			Integer loginempno = (Integer) session.getAttribute("empno");
			if (userName == null) {
				return "redirect:/loginpage";
			} else {
				String candidate_id = request.getParameter("candidate_id");
				String rjdate = request.getParameter("rejoining_Date");
				message = empService.saveRejoinDetails(candidate_id, rjdate, loginempno);
			}
		} catch (Exception e) {
			logger.error("Error while in rejoinDetails" + e);
		}
		return message;
	}

	@RequestMapping(value = { "/getempTypeByCanId" }, method = RequestMethod.GET)
	@ResponseBody
	public String getempTypeByCanId(Model model, HttpServletRequest request, HttpServletResponse response) {
		String userName = (String) request.getSession().getAttribute("username");
		String canid = request.getParameter("canid");
		String empType = null;
		try {
			empType = empService.getempTypeByCanId(canid);
		} catch (Exception e) {
			logger.error("Error occured in getempTypeByCanId ---", e);
		}
		return empType;
	}

	@RequestMapping(value = { "/checkPhoneNo" }, method = RequestMethod.GET)
	@ResponseBody
	public BasicDetailsDto checkPhoneNo(Model model, HttpServletRequest request, HttpServletResponse response) {
		BasicDetailsDto basicObj = null;
		try {
			String phoneno = request.getParameter("phone");
			basicObj = empService.checkPhoneNo(phoneno);
		} catch (Exception e) {
			logger.error("Error in checkPhoneNo " + e);
		}
		return basicObj;
	}

	@RequestMapping(value = { "/checkEmail" }, method = RequestMethod.GET)
	@ResponseBody
	public String checkEmail(Model model, HttpServletRequest request, HttpServletResponse response) {
		String emailId = null;
		try {
			String email = request.getParameter("email");
			emailId = empService.checkEmail(email);
		} catch (Exception e) {
			logger.error("Error in checkEmail " + e);
		}
		return emailId;
	}

	@RequestMapping(value = { "/geti9SupportDocumentsListByType" }, method = RequestMethod.GET)
	@ResponseBody
	public I9SupportingDocumentsDto geti9SupportDocumentsListByType(Model model, HttpServletRequest request,
			HttpServletResponse response) {
		String i9sdType = request.getParameter("i9sdType");
		String candidateId = request.getParameter("candidate_id");
		I9SupportingDocumentsDto listdocs = empService.geti9SupportDocumentsListByType(i9sdType, candidateId);
		return listdocs;
	}

	@RequestMapping(value = { "/editListADocument" }, method = RequestMethod.POST)
	public String editListADocument(Model model, HttpServletRequest request, HttpServletResponse response,
			@RequestParam(name = "waeditFile", required = false) MultipartFile editFile) {
		try {
			HttpSession session = request.getSession(true);
			String userName = (String) request.getSession().getAttribute("username");
			if (userName == null) {
				return "redirect:/loginpage";
			} else {
				String fromdate = request.getParameter("wafromdate");
				String expiry_date = request.getParameter("waexpirydate");
				String waefileId = request.getParameter("waefileId");
				String waCandidateId = request.getParameter("waCandidateId");
				String efileType = request.getParameter("waefileType");
				String waeInputVal = request.getParameter("waeInputVal");
				String emptype = request.getParameter("waempType");

				Integer loginempno = (Integer) session.getAttribute("empno");
				String msg = empService.updateListADocument(editFile, waefileId, fromdate, expiry_date, waCandidateId,
						loginempno, efileType, waeInputVal);

				if (msg.equalsIgnoreCase("Success")) {
					PrintWriter out = response.getWriter();
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Documents Details Updated Successfully');");
					out.println("window.location='addEmpDocuments?candidate_id=" + waCandidateId + "&empType=" + emptype
							+ "'");
					out.println("</script>");
					out.close();
				} else {
					PrintWriter out = response.getWriter();
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Documents Details Not Updated');");
					out.println("window.location='addEmpDocuments?candidate_id=" + waCandidateId + "&empType=" + emptype
							+ "'");
					out.println("</script>");
					out.close();
				}
			}
		} catch (Exception e) {
			logger.error("Error while in editListADocument" + e);
		}
		return null;
	}

	/*
	 * @RequestMapping(value = { "/editEmployeeDocument" }, method =
	 * RequestMethod.POST) public String editEmployeeDocument(Model model,
	 * HttpServletRequest request, HttpServletResponse response,
	 * 
	 * @RequestParam(name="leditFile",required=false) MultipartFile editFile) { try{
	 * HttpSession session = request.getSession(true); String userName = (String)
	 * request.getSession().getAttribute("username"); if (userName == null) { return
	 * "redirect:/loginpage"; } else { String waefileId =
	 * request.getParameter("lfileId"); String waCandidateId =
	 * request.getParameter("candidate_id"); String efileType =
	 * request.getParameter("lefileType"); String waeInputVal =
	 * request.getParameter("leInputVal"); String emptype =
	 * request.getParameter("empType");
	 * 
	 * Integer loginempno = (Integer) session.getAttribute("empno"); String
	 * msg=empService.updateEmployeeDocument(editFile,waefileId,waCandidateId,
	 * loginempno,efileType,waeInputVal);
	 * 
	 * if(msg.equalsIgnoreCase("Success")) { PrintWriter out = response.getWriter();
	 * out.println("<script type=\"text/javascript\">");
	 * out.println("alert('Documents Details Updated Successfully');");
	 * out.println("window.location='addEmpDocuments?candidate_id="+waCandidateId+
	 * "&empType="+emptype+"'"); out.println("</script>"); out.close(); }else {
	 * PrintWriter out = response.getWriter();
	 * out.println("<script type=\"text/javascript\">");
	 * out.println("alert('Documents Details Not Updated');");
	 * out.println("window.location='addEmpDocuments?candidate_id="+waCandidateId+
	 * "&empType="+emptype+"'"); out.println("</script>"); out.close(); } } } catch
	 * (Exception e) { logger.error("Error while in editClientVendorDocument" + e);
	 * } return null; }
	 */
	@RequestMapping(value = { "/repoSearch" }, method = RequestMethod.GET)
	public String immidashboardreq(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession(true);
		try {
			String userName = (String) request.getSession().getAttribute("username");
			if (userName == null) {
				return "redirect:/loginpage";
			} else {
			List<BasicDetailsDto> candidateList = immiService.getW2CandidateListrepo();
			session.setAttribute("candidateList", candidateList);
			String candidates = "candidates";
			session.setAttribute("candidates", candidates);
			session.setAttribute("templates", null);
			session.setAttribute("stsreports", null);
			session.setAttribute("timesheet", null);
			session.setAttribute("myimmidocs", null);
			}
		} catch (Exception e) {
			logger.error("Error in repoSearch " + e);
		}
		return "repoSearch";
	}

	@RequestMapping(value = { "/getuserNameBycandId" }, method = RequestMethod.GET)
	@ResponseBody
	public ContractsPanelDetails_DTO getuserNameBycandId(Model model, HttpServletRequest request) {
		ContractsPanelDetails_DTO docsDto = new ContractsPanelDetails_DTO();
		List<DocumentHistoryDto> userList = null;
		System.out.println("getuserNameBycandId CTRL____--");
		try {
			String candId = request.getParameter("candidateid");
			userList = empService.getuserNameBycandId(candId);
			docsDto.setUserList(userList);
			System.out.println(docsDto);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("Error in userList  " + e);
		}
		return docsDto;
	}

	@RequestMapping(value = { "/getDocTypesByCandId" }, method = RequestMethod.GET)
	@ResponseBody
	public ContractsPanelDetails_DTO getDocTypesByCandId(Model model, HttpServletRequest request) {
		ContractsPanelDetails_DTO docsDto = new ContractsPanelDetails_DTO();
		List<DocumentHistoryDto> docList = null;
		try {
			String candId = request.getParameter("candidateid");

			docList = empService.getDocTypesByCandId(candId);

			docsDto.setDocList(docList);
			System.out.println(docsDto);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("Error in doc Types " + e);
		}
		return docsDto;
	}

	@RequestMapping(value = { "/getsubDocTypesBydocId" }, method = RequestMethod.GET)
	@ResponseBody
	public ContractsPanelDetails_DTO getsubDocTypesBydocId(Model model, HttpServletRequest request) {
		ContractsPanelDetails_DTO docsDto = new ContractsPanelDetails_DTO();
		List<DocumentHistoryDto> subdocList = null;
		try {
			String candId = request.getParameter("candidateid");
			// String profileId = request.getParameter("profileid");
			String docid = request.getParameter("docid");
			subdocList = empService.getsubDocTypesBydocId(candId, docid);

			docsDto.setSubdocList(subdocList);
			System.out.println(docsDto);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("Error in subdoc Types " + e);
		}
		return docsDto;
	}

	@RequestMapping(value = { "/getalldocs" }, method = RequestMethod.GET)
	@ResponseBody
	public ContractsPanelDetails_DTO getalldocs(Model model, HttpServletRequest request) {
		ContractsPanelDetails_DTO docsDto = new ContractsPanelDetails_DTO();
		List<DocumentHistoryDto> searchList = null;
		System.out.println("getalldocs CTRL____--");
		try {
			String candId = request.getParameter("candidateid");
			// String profileId = request.getParameter("profileid");
			String docid = request.getParameter("docid");
			String subdocid = request.getParameter("subdocid");
			searchList = empService.getalldocs(candId, subdocid, docid);

			docsDto.setSearchList(searchList);

			System.out.println(docsDto);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("Error in getalldocs " + e);
		}
		return docsDto;
	}

	@RequestMapping(value = { "/filemerge" }, method = RequestMethod.GET)
	@ResponseBody
	public String filemerge(Model model, HttpServletRequest request) {
		String msg = null;
		ContractsPanelDetails_DTO docsDto = new ContractsPanelDetails_DTO();
		List<String> searchList = null;
		try {
			String candId = request.getParameter("candidateid");
			String subdocname = request.getParameter("subdocname");
			String subdocid = request.getParameter("subdocid");
			String docid = request.getParameter("docid");
			System.out.println("ctrl" + candId + "--" + subdocid + "-" + docid + "-" + subdocname);
			searchList = empService.getdocs(candId, subdocname, subdocid, docid);
			if (searchList.size() > 0) {
				msg = "success";
			} else {
				msg = "fail";
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return msg;
	}

	@RequestMapping(value = { "/checkSessionUserName" }, method = RequestMethod.GET)
	@ResponseBody
	public String checkSessionUserName(Model model, HttpServletRequest request, HttpServletResponse response) {
		String userName =null;
		 try {
			 userName =(String) request.getSession().getAttribute("username");
			 System.out.println("***userName***"+userName);
		 } catch (Exception e) {
	            e.printStackTrace();
	            logger.error("Error in checkSessionUserName " + e);
	        } 
		return userName;
	}
}
