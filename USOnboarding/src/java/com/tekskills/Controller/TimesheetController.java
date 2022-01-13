package com.tekskills.Controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.Month;
import java.time.YearMonth;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.pdf.PdfWriter;
import com.itextpdf.tool.xml.XMLWorkerHelper;
import com.tekskills.Dto.BasicDetailsDto;
import com.tekskills.Dto.ClientVendorMaster_DTO;
import com.tekskills.Dto.CompanyDetails_DTO;
import com.tekskills.Dto.CustomerDetails_DTO;
import com.tekskills.Dto.EmployeeDto;
import com.tekskills.Dto.InvoiceDto;
import com.tekskills.Dto.SearchBean;
import com.tekskills.Dto.TimesheetDto;
import com.tekskills.Entity.CandidateDetailedInfo;
import com.tekskills.Entity.CustomerMasterEntity;
import com.tekskills.Entity.EmpBasicDetailsEntity;
import com.tekskills.Entity.EmpPayRateDetails;
import com.tekskills.Entity.ProductsEntity;
import com.tekskills.Entity.StatusReportEntity;
import com.tekskills.Entity.StatusReportTemplateEntity;
import com.tekskills.Service.ContractorsService;
import com.tekskills.Service.EmployeesService;
import com.tekskills.Service.StatusReportService;
import com.tekskills.Service.TimesheetService;
import com.tekskills.Util.Commons;

@Controller
@PropertySource("/WEB-INF/mail.properties")
public class TimesheetController {
	private static final Logger logger = Logger.getLogger(TimesheetController.class);
	private static final String UPLOAD_DIRECTORY = "temp_pdf";
	private static final int THRESHOLD_SIZE = 1024 * 1024 * 3; // 3MB
	private static final int MAX_FILE_SIZE = 1024 * 1024 * 40; // 40MB
	private static final int MAX_REQUEST_SIZE = 1024 * 1024 * 50; // 50MB
	@Autowired
	private Commons commons;
	@Autowired
	private TimesheetService tsServie;
	@Autowired
	private StatusReportService reportService;
	@Autowired
	private ContractorsService contService;
	@Autowired
	ServletContext context;
	@Autowired
	private EmployeesService empService;

	@RequestMapping(value = { "/generatetemplate" }, method = RequestMethod.POST)
	public String weeklytemplate(Model model, HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession(true);
		String userName = (String) request.getSession().getAttribute("username");
		try {
			if (userName != null) {
				String year = request.getParameter("year");
				Integer yr = Integer.parseInt(year);
				List<TimesheetDto> weeklytemplate = commons.getAllWeeksByYear(yr);
				List<TimesheetDto> monthlytemplate = commons.getMonthlyTemplate(yr);
				List<TimesheetDto> biweektemplate1 = commons.getBiweeklyTemplate_1(yr);
				List<TimesheetDto> biweektemplate2 = commons.getBiweeklyTemplate_2(yr);
				List<TimesheetDto> semiMonthTemplate = commons.getSemiMonthTemplate(yr);
				
				String message = tsServie.checktstemplate(year);
				session.setAttribute("semiMonthTemplate", semiMonthTemplate);
				session.setAttribute("weeklytemplate", weeklytemplate);
				session.setAttribute("monthlytemplate", monthlytemplate);
				session.setAttribute("biweektemplate1", biweektemplate1);
				session.setAttribute("biweektemplate2", biweektemplate2);
				session.setAttribute("templatesize", weeklytemplate.size());
				session.setAttribute("year", year);
				session.setAttribute("message", message);
			} else {
				return "redirect:/loginpage";
			}
		} catch (Exception e) {
			logger.error("Error in generatetemplate " + e);
		}
		return "TimesheetTemplate";
	}

	@RequestMapping(value = { "/viewtstemplate" }, method = RequestMethod.GET)
	public String viewtstemplate(Model model, HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession(true);
		String userName = (String) request.getSession().getAttribute("username");
		try {
			if (userName != null) {
				List<TimesheetDto> weeklytemplate = null;
				List<StatusReportTemplateEntity> templateList = null;
				List<TimesheetDto> monthlytemplate = null;
				List<TimesheetDto> biweektemplate1 =null;
				List<TimesheetDto> biweektemplate2 =null;
				session.setAttribute("year", 0);
				session.setAttribute("templateList", templateList);
				session.setAttribute("weeklytemplate", weeklytemplate);
				session.setAttribute("monthlytemplate", monthlytemplate);
				session.setAttribute("biweektemplate1", biweektemplate1);
				session.setAttribute("biweektemplate2", biweektemplate2);
			} else {
				return "redirect:/loginpage";
			}
		} catch (Exception e) {
			logger.error("Error in viewtstemplate " + e);
		}
		return "ViewTimesheetTemplate";
	}

	@RequestMapping(value = { "/viewweeklytemplate" }, method = RequestMethod.POST)
	public String viewweeklytemplate(Model model, HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession(true);
		String userName = (String) request.getSession().getAttribute("username");
		try {
			if (userName != null) {
				String year = request.getParameter("year");
				Integer yr = Integer.parseInt(year);
				List<TimesheetDto> weeklytemplate = tsServie.getWeeklyTimesheetByYear(yr);
				List<StatusReportTemplateEntity> semiMonthTemplate = reportService.getTemplateListByYear(yr);
				List<TimesheetDto> monthlytemplate = tsServie.getMonthlyTemplate(yr);
				List<TimesheetDto> biweektemplate1 = tsServie.getBiweeklyTemplate_1(yr);
				List<TimesheetDto> biweektemplate2 = tsServie.getBiweeklyTemplate_2(yr);
				/*List<TimesheetDto> weeklytemplate = commons.getAllWeeksByYear(yr);
				List<TimesheetDto> monthlytemplate = commons.getMonthlyTemplate(yr);
				List<TimesheetDto> biweektemplate1 = commons.getBiweeklyTemplate_1(yr);
				List<TimesheetDto> biweektemplate2 = commons.getBiweeklyTemplate_2(yr);
				List<TimesheetDto> semiMonthTemplate = commons.getSemiMonthTemplate(yr);
				
				session.setAttribute("semiMonthTemplate", semiMonthTemplate);*/
				session.setAttribute("templateList", semiMonthTemplate);
				session.setAttribute("weeklytemplate", weeklytemplate);
				session.setAttribute("monthlytemplate", monthlytemplate);
				session.setAttribute("biweektemplate1", biweektemplate1);
				session.setAttribute("biweektemplate2", biweektemplate2);
				
				session.setAttribute("templatesize", weeklytemplate.size());
				session.setAttribute("year", year);
			} else {
				return "redirect:/loginpage";
			}
		} catch (Exception e) {
			logger.error("Error in viewweeklytemplate " + e);
		}
		return "ViewTimesheetTemplate";
	}

	@RequestMapping(value = { "/timesheet" }, method = RequestMethod.GET)
	public String addTemplate(Model model, HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession(true);
		Integer role = (Integer) session.getAttribute("role");
		Integer candidateId = (Integer) session.getAttribute("loginUserid");
		String payrollType = (String) session.getAttribute("payrollType");
		String userName = (String) request.getSession().getAttribute("username");
		String emptype = (String) request.getSession().getAttribute("emptype");
		try {
			if (userName != null) {
				String timesheet = "timesheet";
				session.setAttribute("candidates", null);
				session.setAttribute("templates", null);
				session.setAttribute("mdashboard",null);
				session.setAttribute("stsreports", null);
				session.setAttribute("myDashboard", null);
				session.setAttribute("bgc", null);
				session.setAttribute("timesheet", timesheet);
				session.setAttribute("mydocuments", null);
				session.setAttribute("immigration", null);
				session.setAttribute("myimmidocs", null);
				
				if (role != 4) {
					if(emptype.equalsIgnoreCase("W2")) {
						List<ClientVendorMaster_DTO> payrateclientList=tsServie.getEmpPayrateListByCandidateId(candidateId,emptype);
						if(payrateclientList.size()>1) {
							TimesheetDto timesheetDto = null;
							
							session.setAttribute("timesheetDto", timesheetDto);
							session.setAttribute("payrateclientListsize", payrateclientList.size());
							session.setAttribute("payrateclientList", payrateclientList);
							session.setAttribute("ses_payrateid", null);
							session.setAttribute("timesheetDto", timesheetDto);
							System.out.println("1111111-00000000----"+payrateclientList.size());
							return "SubmitW2Timesheet";	
						}else if(payrateclientList.size()>0 && payrateclientList.size()<2) {
							System.out.println("1111111--.............---"+payrateclientList.size());
							TimesheetDto timesheetDto = tsServie.getPeningTimesheetByCandidateId(candidateId,payrollType,emptype,null);
							session.setAttribute("timesheetDto", timesheetDto);
							
							return "SubmitTimesheet";	
							
						}else {
							/*int payratelist=0;
							session.setAttribute("payratelist", payratelist);*/
							
							TimesheetDto timesheetDto = tsServie.getPeningTimesheetByCandidateId(candidateId,payrollType,emptype,null);
							session.setAttribute("timesheetDto", timesheetDto);
							
							System.out.println(payrateclientList.size()+"*******...........................................***************"+timesheetDto.getPayrollType());
							return "SubmitTimesheet";
						}
					}
					else {
						if(emptype.equalsIgnoreCase("C2C") || (emptype.equalsIgnoreCase("1099"))) {
							List<ClientVendorMaster_DTO> payrateclientList=tsServie.getEmpPayrateListByCandidateId(candidateId,emptype);
							TimesheetDto timesheetDto = tsServie.getPeningTimesheetByCandidateId(candidateId,payrollType,emptype,null);
							session.setAttribute("payratelist", payrateclientList.size());
							session.setAttribute("timesheetDto", timesheetDto);
							return "SubmitTimesheet";	
						}else {
							TimesheetDto timesheetDto = tsServie.getPeningTimesheetByCandidateId(candidateId,payrollType,emptype,null);
							session.setAttribute("timesheetDto", timesheetDto);
							return "SubmitTimesheet";	
						}
					}
					
				} else {
					String status = "Submitted";
					String month ="";
					String customertype ="";
					LocalDate currentDate = LocalDate.now();
					Integer curyear = currentDate.getYear();
					String year=String.valueOf(curyear);
					List<TimesheetDto> timesheetList = tsServie.getPendingViewTimesheet(year, status, role, candidateId,
							emptype,month,customertype);
					session.setAttribute("timesheetList", timesheetList);
					
					List<TimesheetDto> candpendingList=tsServie.getAllCandidatePeningTimesheet();
					session.setAttribute("timesheetDto", candpendingList);
					
					return "timesheetDashboard";
					/*List<TimesheetDto> weeklytemplate = null;
					session.setAttribute("weeklytemplate", weeklytemplate);
					int templatesize = 0;
					session.setAttribute("templatesize", templatesize);
					List<String> monthsList = commons.getMonthsList();
					List<CompanyDetails_DTO> cutomerList = contService.getCustomerMasterList();
					model.addAttribute("cutomerList", cutomerList);
					session.setAttribute("monthsList", monthsList);
					session.setAttribute("year", 0);
					session.setAttribute("customertype", null);
					session.setAttribute("month", null);
					return "ViewTimesheet";*/
				}
			} else {
				return "redirect:/loginpage";
			}

		} catch (Exception e) {
			logger.error("Error in timesheet " + e);
		}
		return null;

	}

	@RequestMapping(value = { "/addtstemplate" }, method = RequestMethod.GET)
	public String addtstemplate(Model model, HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession(true);
		String userName = (String) request.getSession().getAttribute("username");
		try {
			if (userName != null) {
				
				List<TimesheetDto> weeklytemplate = null;
				List<StatusReportTemplateEntity> semiMonthTemplate = null;//semimonthlytemplate
				List<TimesheetDto> monthlytemplate = null;
				List<TimesheetDto> biweektemplate1 =null;
				List<TimesheetDto> biweektemplate2 =null;
				session.setAttribute("year", 0);
				session.setAttribute("semiMonthTemplate", semiMonthTemplate);
				session.setAttribute("weeklytemplate", weeklytemplate);
				session.setAttribute("monthlytemplate", monthlytemplate);
				session.setAttribute("biweektemplate1", biweektemplate1);
				session.setAttribute("biweektemplate2", biweektemplate2);
				
				List<String> monthsList = commons.getMonthsList();
				Date cyear=new Date();
				Integer cy=cyear.getYear();
				Integer currentYear=cy+1900;  
				String message = tsServie.checktstemplate(currentYear.toString());
				int templatesize = 0;
				session.setAttribute("templatesize", templatesize);
				session.setAttribute("monthsList", monthsList);
				session.setAttribute("year", 0);
				session.setAttribute("message", message);

				String templates = "templates";
				session.setAttribute("candidates", null);
				session.setAttribute("templates", templates);
				session.setAttribute("stsreports", null);
				session.setAttribute("timesheet", null);
				session.setAttribute("mdashboard",null);
				session.setAttribute("bgc", null);
				session.setAttribute("mydocuments", null);
				session.setAttribute("immigration", null);
				session.setAttribute("myimmidocs", null);
			} else {
				return "redirect:/loginpage";
			}
		} catch (Exception e) {
			logger.error("Error in addtstemplate " + e);
		}
		return "TimesheetTemplate";
	}

	@RequestMapping(value = { "/saveweeklytemplate" }, method = RequestMethod.POST)
	@ResponseBody
	public String saveStatusTemplate(Model model, HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession(true);
		Integer loginempno = (Integer) session.getAttribute("empno");
		String userName = (String) request.getSession().getAttribute("username");
		String message = null;
		try {
			if (userName != null) {
				String year = request.getParameter("year");
				message = tsServie.saveweeklytemplate(year, loginempno);
			} else {
				message = null;
			}

		} catch (Exception e) {
			logger.error("Error in saveweeklytemplate " + e);
		}
		return message;
	}

	@RequestMapping(value = { "/checktstemplate" }, method = RequestMethod.POST)
	@ResponseBody
	public String checkTemplate(Model model, HttpServletRequest request, HttpServletResponse response) {
		String message = null;
		String userName = (String) request.getSession().getAttribute("username");
		try {
			if (userName != null) {
				String year = request.getParameter("year");
				message = tsServie.checktstemplate(year);
			} else {
				message = null;
			}
		} catch (Exception e) {
			logger.error("Error in checkTStemplate " + e);
		}
		return message;
	}

	@RequestMapping(value = { "/addtimesheet" }, method = RequestMethod.GET)
	public String addtimesheet(Model model, HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession(true);
		Integer candidateId = (Integer) session.getAttribute("loginUserid");
		String payrollType = (String) session.getAttribute("payrollType");
		String userName = (String) request.getSession().getAttribute("username");
		String emptype = (String) request.getSession().getAttribute("emptype");
		try {
			if (userName != null) {
				TimesheetDto timesheetDto = tsServie.getPeningTimesheetByCandidateId(candidateId,
						payrollType,emptype,null);
				String timesheet = "timesheet";
				session.setAttribute("candidates", null);
				session.setAttribute("templates", null);
				session.setAttribute("stsreports", null);
				session.setAttribute("mdashboard",null);
				session.setAttribute("timesheet", timesheet);
				session.setAttribute("timesheetDto", timesheetDto);
				session.setAttribute("mydocuments", null);
				session.setAttribute("myimmidocs", null);
				session.setAttribute("immigration", null);
				session.setAttribute("bgc", null);
			} else {
				return "redirect:/loginpage";
			}
		} catch (Exception e) {
			logger.error("Error in addTemplate " + e);
		}
		return "SubmitTimesheet";
	}

	@RequestMapping(value = { "/getDetailsByweekId" }, method = RequestMethod.POST)
	@ResponseBody
	public List<TimesheetDto> getDetailsByweekId(Model model, HttpServletRequest request,
			HttpServletResponse response) {
		List<TimesheetDto> tsdetailsList = null;
		String userName = (String) request.getSession().getAttribute("username");
		try {
			if (userName != null) {
				String weekid = request.getParameter("weekid");
				String payrollType = request.getParameter("payrollType");
				tsdetailsList = tsServie.getDetailsByweekId(weekid, payrollType);
			} else {
				tsdetailsList = null;
			}
		} catch (Exception e) {
			logger.error("Error in getDetailsByweekId " + e);
		}
		return tsdetailsList;
	}

	@RequestMapping(value = { "/savetimesheet" }, method = RequestMethod.POST)
	@ResponseBody
	public String savetimesheet(Model model, HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession(true);
		Integer loginempno = (Integer) session.getAttribute("empno");
		Integer validateby = (Integer) session.getAttribute("validateby");
		
		String userName = (String) request.getSession().getAttribute("username");
		String message = null;
		try {
			if (userName != null) {
				String payrate_id = request.getParameter("payrate_id");
				String tablength = request.getParameter("tablength");
				String[] dates1 = request.getParameterValues("dates[]");
				String[] dayname1 = request.getParameterValues("dayname[]");
				String[] billablehrs1 = request.getParameterValues("billablehrs[]");
				String[] nonbillablehrs1 = request.getParameterValues("nonbillablehrs[]");
				String[] leave1 = request.getParameterValues("leave[]");
				String[] comments1 = request.getParameterValues("comments[]");
				String[] over_time = request.getParameterValues("over_time[]");
				//String[] over_time =null;
				
				String canidateId = request.getParameter("canidateId");
				String year = request.getParameter("year");
				String month = request.getParameter("month");
				String weeks = request.getParameter("weeks");
				String fromdate = request.getParameter("fromdate");
				String todate = request.getParameter("todate");
				String weekId = request.getParameter("weekId");

				MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
				MultipartFile mgrapprovedts = multipartRequest.getFile("mgrapprovedts");
				List<MultipartFile> LLmultipartFiles = ((MultipartRequest) request).getMultiFileMap().get("leaveletter");
				message = tsServie.savetimesheet(dates1, dayname1, billablehrs1, nonbillablehrs1, leave1, comments1,
						canidateId, mgrapprovedts, LLmultipartFiles, loginempno, year, month, weeks, fromdate, todate,
						weekId, tablength,validateby,over_time,payrate_id);

			} else {
				message = null;
			}
		} catch (Exception e) {
			logger.error("Error in savetimesheet " + e);
		}
		return message;
	}

	@RequestMapping(value = { "/viewtimesheet" }, method = RequestMethod.GET)
	public String viewtimesheet(Model model, HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession(true);
		String userName = (String) request.getSession().getAttribute("username");
		try {
			if (userName != null) {
				List<TimesheetDto> timesheetList = null;
				session.setAttribute("timesheetList", timesheetList);
				List<CompanyDetails_DTO> cutomerList = contService.getCustomerMasterList();
				List<String> monthsList = commons.getMonthsList();
				session.setAttribute("monthsList", monthsList);
				model.addAttribute("cutomerList", cutomerList);
				session.setAttribute("month", null);
				session.setAttribute("customertype", null);
			} else {
				return "redirect:/loginpage";
			}
		} catch (Exception e) {
			logger.error("Error in viewtimesheet " + e);
		}
		return "ViewTimesheet";
	}
	//viewmytimesheet
	@RequestMapping(value = { "/mytimesheet" }, method = RequestMethod.GET)
	public String viewmytimesheet(Model model, HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession(true);
		String userName = (String) request.getSession().getAttribute("username");
		Integer candidateid = (Integer) request.getSession().getAttribute("candidateid");
		String lgemptype = (String) session.getAttribute("emptype");
		try {
			if (userName != null) {
				List<TimesheetDto> timesheetList = null;
				List<String> monthsList = commons.getMonthsList();
				//List<ClientVendorMaster_DTO> cutomerList = contService.getCustomerMasterListByCanidateId(candidateid);
				List<ClientVendorMaster_DTO> cutomerList=tsServie.getEmpPayrateListByCandidateId(candidateid,lgemptype);
				model.addAttribute("cutomerList", cutomerList);
				session.setAttribute("monthsList", monthsList);
				session.setAttribute("month", null);
				session.setAttribute("customertype", null);
				session.setAttribute("timesheetList", timesheetList);
				
			} else {
				return "redirect:/loginpage";
			}
		} catch (Exception e) {
			logger.error("Error in viewmytimesheet " + e);
		}
		return "ViewMyTimesheet";
	}

	//gettimesheet
	@RequestMapping(value = { "/timesheet" }, method = RequestMethod.POST)
	public String gettimesheet(Model model, HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession(true);
		String userName = (String) request.getSession().getAttribute("username");
		Integer role = (Integer) session.getAttribute("role");
		Integer candidateId = (Integer) session.getAttribute("loginUserid");
		String lgemptype = (String) session.getAttribute("emptype");
		try {
			if (userName != null) {
				String year = request.getParameter("year");
				String status = request.getParameter("status");
				String month = request.getParameter("month");
				String customertype = request.getParameter("customertype");
				
				List<TimesheetDto> timesheetList = tsServie.getViewTimesheet(year, status, role, candidateId,
						lgemptype,month,customertype);
				List<CompanyDetails_DTO> cutomerList = contService.getCustomerMasterList();
				model.addAttribute("cutomerList", cutomerList);
				

				session.setAttribute("timesheetList", timesheetList);
				session.setAttribute("year", year);
				session.setAttribute("status", status);
				session.setAttribute("month", month);
				session.setAttribute("customertype", customertype);
			} else {
				return "redirect:/loginpage";
			}
		} catch (Exception e) {
			logger.error("Error in getTimesheet " + e);
		}
		return "ViewTimesheet";
	}

	//getmytimesheet
	@RequestMapping(value = { "/mytimesheet" }, method = RequestMethod.POST)
	public String getmytimesheet(Model model, HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession(true);
		String userName = (String) request.getSession().getAttribute("username");
		Integer role = (Integer) session.getAttribute("role");
		Integer candidateId = (Integer) session.getAttribute("loginUserid");
		String lgemptype = (String) session.getAttribute("emptype");
		Integer candidateid = (Integer) request.getSession().getAttribute("candidateid");
		try {
			if (userName != null) {
				String year = request.getParameter("year");
				String status = request.getParameter("status");
				String month = request.getParameter("month");
				String customertype = request.getParameter("customertype");
				List<TimesheetDto> timesheetList = tsServie.getMyTimesheet(year, status, role, candidateId, lgemptype,month,customertype);
				//List<ClientVendorMaster_DTO> cutomerList = contService.getCustomerMasterListByCanidateId(candidateid);
				List<ClientVendorMaster_DTO> cutomerList=tsServie.getEmpPayrateListByCandidateId(candidateid,lgemptype);
				//List<CompanyDetails_DTO> cutomerList = contService.getCustomerMasterList();
				model.addAttribute("cutomerList", cutomerList);
				List<String> monthsList = commons.getMonthsList();
				session.setAttribute("monthsList", monthsList);
				session.setAttribute("timesheetList", timesheetList);
				session.setAttribute("year", year);
				session.setAttribute("status", status);
				session.setAttribute("month", month);
				session.setAttribute("customertype", customertype);
			} else {
				return "redirect:/loginpage";
			}
		} catch (Exception e) {
			logger.error("Error in getmytimesheet " + e);
		}
		return "ViewMyTimesheet";
	}

	@RequestMapping(value = {"/getTimesheetDetailsById" }, method = RequestMethod.POST, consumes = MediaType.APPLICATION_FORM_URLENCODED_VALUE)
	@ResponseBody
	public TimesheetDto getTimesheetDetailsById(Model model, HttpServletRequest request, HttpServletResponse response) {
		TimesheetDto timesheetObj = null;
		String userName = (String) request.getSession().getAttribute("username");
		try {
			if (userName != null) {
				String candidateid = request.getParameter("candidateid");
				String timesheet_id = request.getParameter("timesheet_id");
				timesheetObj = tsServie.getTimesheetDetailsById(candidateid, timesheet_id);
			} else {
				timesheetObj = null;
			}
		} catch (Exception e) {
			logger.error("Error in getTimesheetDetailsById " + e);
		}
		return timesheetObj;
	}

	@RequestMapping(value = {"/deleteLeaveLetter" }, method = RequestMethod.POST, consumes = MediaType.APPLICATION_FORM_URLENCODED_VALUE)
	@ResponseBody
	public String deleteLeaveLetter(Model model, HttpServletRequest request, HttpServletResponse response) {
		String message = null;
		String userName = (String) request.getSession().getAttribute("username");
		try {
			if (userName != null) {
				String leaves_id = request.getParameter("leaves_id");
				message = tsServie.deleteLeaveLetter(leaves_id);
			} else {
				message = null;
			}
		} catch (Exception e) {
			logger.error("Error in deleteLeaveLetter " + e);
		}
		return message;
	}

	@RequestMapping(value = { "/updatetimesheet" }, method = RequestMethod.POST)
	@ResponseBody
	public String updatetimesheet(Model model, HttpServletRequest request, HttpServletResponse response) {
		String userName = (String) request.getSession().getAttribute("username");
		String message = null;
		try {
			if (userName != null) {
				String[] billablehrs1 = request.getParameterValues("billablehrs[]");
				String[] nonbillablehrs1 = request.getParameterValues("nonbillablehrs[]");
				String[] leave1 = request.getParameterValues("leave[]");
				String[] comments1 = request.getParameterValues("comments[]");
				String[] over_time = request.getParameterValues("over_time[]");
				
				String canidateId = request.getParameter("canidateId");
				String timesheetId = request.getParameter("timesheetId");
				String fdate = request.getParameter("fdate");
				String tdate = request.getParameter("tdate");

				MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
				MultipartFile mgrapprovedts = multipartRequest.getFile("mgrapprovedts");
				List<MultipartFile> LLmultipartFiles = ((MultipartRequest) request).getMultiFileMap()
						.get("leaveletter");
				message = tsServie.updatetimesheet(billablehrs1, nonbillablehrs1, leave1, comments1, canidateId,
						mgrapprovedts, LLmultipartFiles, timesheetId,over_time,fdate,tdate);
			} else {
				message = null;
			}
		} catch (Exception e) {
			logger.error("Error in updatetimesheet " + e);
		}
		return message;
	}

	@RequestMapping(value = {"/updatetsstatus" }, method = RequestMethod.POST, consumes = MediaType.APPLICATION_FORM_URLENCODED_VALUE)
	@ResponseBody
	public String updatetimesheetstatus(Model model, HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession(true);
		String userName = (String) request.getSession().getAttribute("username");
		Integer lgempno = (Integer) request.getSession().getAttribute("empno");
		String message = null;
		try {
			if (userName != null) {
				Integer role = (Integer) session.getAttribute("role");
				String lgemptype = (String) session.getAttribute("emptype");
				Integer dept = (Integer) session.getAttribute("dept");

				String candidateid = request.getParameter("candidateid");
				String status = request.getParameter("status");
				String timesheetId = request.getParameter("timesheetId");
				String comments = request.getParameter("tscomments");
				String fdate = request.getParameter("fdate");
				String tdate = request.getParameter("tdate");
				
				message = tsServie.updatetimesheetstatus(candidateid, status, timesheetId, comments, role, lgemptype,dept,lgempno,fdate,tdate);
			} else {
				message = null;
			}
		} catch (Exception e) {
			logger.error("Error in updatetsstatus " + e);
		}
		return message;
	}
	
	@RequestMapping(value = { "/w2timesheet" }, method = RequestMethod.GET)
	public String w2timesheet(Model model, HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession(true);
		Integer role = (Integer) session.getAttribute("role");
		Integer candidateId = (Integer) session.getAttribute("loginUserid");
		
		String userName = (String) request.getSession().getAttribute("username");
		String emptype = (String) request.getSession().getAttribute("emptype");
		try {
			if (userName != null) {
				String timesheet = "timesheet";
				session.setAttribute("candidates", null);
				session.setAttribute("templates", null);
				session.setAttribute("mdashboard",null);
				session.setAttribute("stsreports", null);
				session.setAttribute("timesheet", timesheet);
				if (role != 4) {
					String payrateid = request.getParameter("payrateid");
					if(emptype.equalsIgnoreCase("W2")) {
						Integer payrate_id=0;
					if(payrateid!="") {
						payrate_id=Integer.parseInt(payrateid);
					}
						TimesheetDto timesheetDto = tsServie.getPeningTimesheetByCandidateId(candidateId,null,emptype,payrate_id);
						session.setAttribute("timesheetDto", timesheetDto);
						
						List<ClientVendorMaster_DTO> payrateclientList=tsServie.getEmpPayrateListByCandidateId(candidateId,emptype);
						
						String CustomerName=tsServie.getCustomerNameByPayrateId(payrate_id);
						session.setAttribute("CustomerName", CustomerName);
						session.setAttribute("payrateclientList", payrateclientList);
						session.setAttribute("ses_payrateid", payrate_id);
						return "SubmitW2Timesheet";	
					}
					
				} else {
					List<TimesheetDto> weeklytemplate = null;
					session.setAttribute("weeklytemplate", weeklytemplate);
					int templatesize = 0;
					session.setAttribute("templatesize", templatesize);
					List<String> monthsList = commons.getMonthsList();
					session.setAttribute("monthsList", monthsList);
					session.setAttribute("year", 0);
					return "ViewTimesheet";
				}
			} else {
				return "redirect:/loginpage";
			}

		} catch (Exception e) {
			logger.error("Error in timesheet " + e);
		}
		return null;

	}
	@RequestMapping(value = {"/tsmailreminder" }, method = RequestMethod.GET)
	@ResponseBody
	public String tsmailreminder(Model model, HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession(true);
		String userName = (String) request.getSession().getAttribute("username");
		Integer lgempno = (Integer) request.getSession().getAttribute("empno");
		Integer lgcandidateid = (Integer) request.getSession().getAttribute("candidateid");
		String lgemailid = (String) request.getSession().getAttribute("emailid");
		String lgfullname = (String) request.getSession().getAttribute("lgfullname");
		
		
		String message = null;
		try {
			if (userName != null) {
				
				String candidateid = request.getParameter("candidate_id");
				String fdate = request.getParameter("fdate");
				String tdate = request.getParameter("tdate");
				
				message = tsServie.tsmailreminder(candidateid, lgempno,fdate,tdate,lgcandidateid,lgemailid,lgfullname);
			} else {
				message = null;
			}
		} catch (Exception e) {
			logger.error("Error in tsmailreminder " + e);
		}
		return message;
	}
	@RequestMapping(value = {"/getmailhistory" }, method = RequestMethod.GET)
	@ResponseBody
	public List<TimesheetDto> getmailhistory(Model model, HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession(true);
		String userName = (String) request.getSession().getAttribute("username");
		List<TimesheetDto> reminderList = null;
		try {
			if (userName != null) {
				
				String candidateid = request.getParameter("candidate_id");
				String fdate = request.getParameter("fdate");
				String tdate = request.getParameter("tdate");
				
				reminderList = tsServie.getmailhistory(candidateid,fdate,tdate);
			} else {
				reminderList = null;
			}
		} catch (Exception e) {
			logger.error("Error in getmailhistory " + e);
		}
		return reminderList;
	}
	

	@RequestMapping(value = {"/getCustomersById" }, method = RequestMethod.GET)
	@ResponseBody
	public List<ClientVendorMaster_DTO> getCustomersById(Model model, HttpServletRequest request, HttpServletResponse response) {
		String userName = (String) request.getSession().getAttribute("username");
		List<ClientVendorMaster_DTO> cutomerList = null;
		try {
			if (userName != null) {
				String candidateid = request.getParameter("candidate_id");
				
				cutomerList=tsServie.getCustomertListByCandidateId(candidateid);
			} else {
				cutomerList = null;
			}
		} catch (Exception e) {
			logger.error("Error in getCustomersById " + e);
		}
		return cutomerList;
	}
	
	@RequestMapping(value = {"/getEmpPayRateDetailsById" }, method = RequestMethod.GET)
	@ResponseBody
	public EmpPayRateDetails getEmpPayRateDetailsById(Model model, HttpServletRequest request, HttpServletResponse response) {
		String userName = (String) request.getSession().getAttribute("username");
		EmpPayRateDetails payrateObj = null;
		try {
			if (userName != null) {
				String candidateid = request.getParameter("candidate_id");
				String payrateid = request.getParameter("payrate_id");
				payrateObj = contService.getPayrateDetailsByPayrateId(payrateid, candidateid);
			} else {
				payrateObj = null;
			}
		} catch (Exception e) {
			logger.error("Error in getEmpPayRateDetailsById " + e);
		}
		return payrateObj;
	}
	
	@RequestMapping(value = { "/generateinvoicepage" }, method = RequestMethod.GET)
	public String generateinvoice(Model model, HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession(true);
		String userName = (String) request.getSession().getAttribute("username");
		try {
			if (userName != null) {
				List<String> monthsList =null;
				String scandidate = null;
				String month =null;
				List<BasicDetailsDto> candidateList = tsServie.getCandidateList();
				session.setAttribute("candidateList", candidateList);
				monthsList = commons.getMonthsList();
				session.setAttribute("monthsList", monthsList);
				List<TimesheetDto> timesheetList =null;
				session.setAttribute("timesheetList", timesheetList);
				session.setAttribute("month", month);
				session.setAttribute("scandidate", scandidate);
				
				String invoice = "invoice";
				session.setAttribute("candidates", null);
				session.setAttribute("templates", null);
				session.setAttribute("stsreports", null);
				session.setAttribute("mdashboard",null);
				session.setAttribute("invoice", invoice);
				session.setAttribute("mydocuments", null);
				session.setAttribute("myimmidocs", null);
				session.setAttribute("immigration", null);
				session.setAttribute("bgc", null);
			} else {
				return "redirect:/loginpage";
			}
		} catch (Exception e) {
			logger.error("Error in generateinvoice " + e);
		}
		return "generateInovoice";
	}
	
	@RequestMapping(value = { "/searchAllCandidateApprovedTimesheet" }, method = RequestMethod.POST)
	public String searchAllCandidateApprovedTimesheet(Model model, HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession(true);
		String userName = (String) request.getSession().getAttribute("username");
		try {
			if (userName != null) {
				String year = request.getParameter("year");
				String month = request.getParameter("month");
				List<TimesheetDto> timesheetList=tsServie.getAllCandidateApprovedTimesheet(year,month);
				List<CompanyDetails_DTO> cutomerList = contService.getCustomerMasterList();
				model.addAttribute("cutomerList", cutomerList);
				session.setAttribute("timesheetList", timesheetList);
				session.setAttribute("year", year);
				session.setAttribute("month", month);
			} else {
				return "redirect:/loginpage";
			}
		} catch (Exception e) {
			logger.error("Error in searchAllCandidateApprovedTimesheet " + e);
		}
		return "generateInovoice";
	}
	
	@RequestMapping(value = { "/searchApprovedTimesheetById" }, method = RequestMethod.GET)
	@ResponseBody
	public InvoiceDto searchApprovedTimesheetById(Model model, HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession(true);
		String userName = (String) request.getSession().getAttribute("username");
		 InvoiceDto invoiceDtoObj = new InvoiceDto();
		try {
			if (userName != null) {
				String year = request.getParameter("year");
				String month = request.getParameter("month");
				String candidate = request.getParameter("candidate");
				String payrateid = request.getParameter("payrate_id");
				List<TimesheetDto> approvedtimesheetList= tsServie.getViewTimesheetByCandiateId(year,month,candidate,"Approved",payrateid);
				invoiceDtoObj.setApprovedtimesheetList(approvedtimesheetList);
				
				List<TimesheetDto> nonapprovedtimesheetList= tsServie.getViewTimesheetByCandiateId(year,month,candidate,"NotApproved",payrateid);
				invoiceDtoObj.setNonapprovedtimesheetList(nonapprovedtimesheetList);
				
				Integer yr = Integer.parseInt(year);				
			
				List<TimesheetDto> generatedinvoiceList= tsServie.getGeneratedinvoiceList(year,month,candidate,payrateid);
				invoiceDtoObj.setGeneratedinvoiceList(generatedinvoiceList);
				
				EmpPayRateDetails payrateObj = contService.getPayrateDetailsByPayrateId(payrateid, candidate);
				/*if(payrateObj.getInvoice_period().equalsIgnoreCase("Monthly") || payrateObj.getInvoice_period().equalsIgnoreCase("Semi-Monthly")
						|| payrateObj.getInvoice_period().equalsIgnoreCase("Bi-Weekly")) {
					TimesheetDto monthlytemplate = tsServie.getMonthlyTemplate(yr,month);
					invoiceDtoObj.setMonthlytemplate(monthlytemplate);
				}else {
					TimesheetDto weeklytemplate = tsServie.getWeeklyTimesheetByYear(yr,month);
					TimesheetDto weeklytemplate1 = tsServie.getWeeklyTimesheetByYear1(yr,month);
					invoiceDtoObj.setFromdate(weeklytemplate.getFromdate());
					invoiceDtoObj.setTodate(weeklytemplate1.getTodate());
					
				}*/
				 //c.set(Calendar.DATE, c.getActualMaximum(Calendar.DATE));
				 int monthno=Month.valueOf(month.toUpperCase()).getValue();				
				 Calendar c = Calendar.getInstance();
				 c.set(yr,monthno , 1);
				
				 c.add(Calendar.MONTH, -2);		
				 SimpleDateFormat sdf = new SimpleDateFormat("MMMM YYYY");
				
				 invoiceDtoObj.setFromdate(sdf.format(c.getTime()));
 				 c.add(Calendar.MONTH, 3);
				 
								
				invoiceDtoObj.setTodate(sdf.format(c.getTime()));
				Integer candidateid=0;
				if (candidate!="") {
					candidateid = Integer.parseInt(candidate);
				}
				/*Integer payrate_id = 0;
				if (!payrateid.isEmpty()) {
					payrate_id = Integer.parseInt(payrateid);
				}*/
				CandidateDetailedInfo empObj=empService.getCandidateDetailedInfoById(candidateid);
			   // TimesheetDto timesheetDto = tsServie.getPeningTimesheetByCandidateId(candidateid,payrateObj.getPayroll_type(),empObj.getEmp_type(),null);
			    List<TimesheetDto> pendigtimesheetList = tsServie.getPendingTimesheetById(candidateid, payrateObj.getPayroll_type(),empObj.getEmp_type(),payrateid,yr,month);
				
			    invoiceDtoObj.setPendingtimesheetList(pendigtimesheetList);
			    invoiceDtoObj.setPayrateObj(payrateObj);
				//session.setAttribute("timesheetList", atimesheetList);
				session.setAttribute("year", year);
				session.setAttribute("month", month);
				session.setAttribute("scandidate", candidate);
			} else {
				invoiceDtoObj=null;
			}
		} catch (Exception e) {
			logger.error("Error in searchApprovedTimesheetById " + e);
		}
		return invoiceDtoObj;
	}
	
	@RequestMapping(value = {"/getBillableHoursDetailsByDates" }, method = RequestMethod.GET)
	@ResponseBody
	public InvoiceDto getBillableHoursDetailsByDates(Model model, HttpServletRequest request, HttpServletResponse response) {
		String userName = (String) request.getSession().getAttribute("username");
		InvoiceDto invObj = null;
		try {
			if (userName != null) {
				String candidateid = request.getParameter("candidate_id");
				String fromdate = request.getParameter("fromdate");
				String todate = request.getParameter("todate"); 
				String customer_id = request.getParameter("customer_id"); 
				String payrate_id = request.getParameter("payrate_id"); 
				String invPeriod = request.getParameter("invPeriod"); 
				invObj = tsServie.getBillableHoursDetailsByDates(candidateid, fromdate, todate,customer_id,invPeriod,payrate_id);
			} else {
				invObj = null;
			}
		} catch (Exception e) {
			logger.error("Error in getBillableHoursDetailsByDates " + e);
		}
		return invObj;
	}
	
	@RequestMapping(value = { "/createinvoicepage" }, method = RequestMethod.GET)
	public String createinvoicepage(Model model, HttpServletRequest request, HttpServletResponse response) {
		String userName = (String) request.getSession().getAttribute("username");
		HttpSession session = request.getSession(true);
		try {
			if (userName != null) {
				InvoiceDto timesheetObj = new InvoiceDto();
				String candidateid = request.getParameter("candidate_id");
				String fromdate = request.getParameter("fromdate");
				String todate = request.getParameter("todate"); 
				/*String customer_id = request.getParameter("customer_id"); */
				String invbillablehrs = request.getParameter("invbillablehrs");
				/*String inv_terms = request.getParameter("inv_terms");
				String billrate = request.getParameter("billrate");*/
				String payrate_id = request.getParameter("payrate_id");
				String fileName = request.getParameter("fileName");
				Integer candidate_id=0;
				if(candidateid!="") {
					candidate_id=Integer.parseInt(candidateid);
				}
				
				EmpPayRateDetails parateObj=contService.getPayrateDetailsByPayrateId(payrate_id, candidateid);
				ProductsEntity prodObj=contService.getProductServicesByPayRateId(payrate_id);
				System.out.println("candidateid===================================="+candidateid);
				
			//	InvoiceDto timesheetObj = tsServie.getViewTimesheetByTimesheetId(candidate_id, timesheetid);
				CustomerDetails_DTO cust=contService.getCustomerDetailsById(parateObj.getCustomer_id().toString());
				
				timesheetObj = tsServie.gettimesheetidsbydates(candidateid, fromdate, todate,parateObj.getCustomer_id().toString(),payrate_id);
				timesheetObj.setQbproductid(prodObj.getQb_productid());
				timesheetObj.setFromdate(fromdate);
				timesheetObj.setTodate(todate);
				timesheetObj.setBillrate(parateObj.getBillrate());
				timesheetObj.setInvoice_terms(parateObj.getInvoice_terms());
				timesheetObj.setTotalbillablehours(invbillablehrs);
				timesheetObj.setQbcustid(cust.getCustObj().getQb_customerid());
				timesheetObj.setFileName(fileName);
				timesheetObj.setCandidate_id(candidate_id);
				model.addAttribute("timesheetDto", timesheetObj);
				String invoice = "invoice";
				session.setAttribute("candidates", null);
				session.setAttribute("templates", null);
				session.setAttribute("stsreports", null);
				session.setAttribute("mdashboard",null);
				session.setAttribute("invoice", invoice);
				session.setAttribute("mydocuments", null);
				session.setAttribute("myimmidocs", null);
				session.setAttribute("immigration", null);
				session.setAttribute("bgc", null);
			} else {
				return "redirect:/loginpage";
			}
		} catch (Exception e) {
			logger.error("Error in searchAllCandidateApprovedTimesheet " + e);
		}
		return "createInvoice";
	}
	/*@RequestMapping(value = { "/createinvoicepage" }, method = RequestMethod.GET)
	public String createinvoicepage(Model model, HttpServletRequest request, HttpServletResponse response) {
		String userName = (String) request.getSession().getAttribute("username");
		HttpSession session = request.getSession(true);
		try {
			if (userName != null) {
				String timesheetid = request.getParameter("timesheetId");
				String candidate_id = request.getParameter("candidate_id");
				InvoiceDto timesheetObj = tsServie.getViewTimesheetByTimesheetId(candidate_id, timesheetid);
				model.addAttribute("timesheetDto", timesheetObj);
				String invoice = "invoice";
				session.setAttribute("candidates", null);
				session.setAttribute("templates", null);
				session.setAttribute("stsreports", null);
				session.setAttribute("mdashboard",null);
				session.setAttribute("invoice", invoice);
				session.setAttribute("mydocuments", null);
				session.setAttribute("myimmidocs", null);
				session.setAttribute("immigration", null);
				session.setAttribute("bgc", null);
			} else {
				return "redirect:/loginpage";
			}
		} catch (Exception e) {
			logger.error("Error in searchAllCandidateApprovedTimesheet " + e);
		}
		return "createInvoice";
	}*/
	
	

	/*@RequestMapping(value = { "/generateInvoice" }, method = RequestMethod.POST)
	public String generateInvoice(Model model, HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession(true);
		String userName = (String) request.getSession().getAttribute("username");
		try {
			if (userName != null) {
				//candidate customertype  fromdate todate invTerm
				String candidateid = request.getParameter("candidate_id");
				String timesheet_id = request.getParameter("timesheetId");
				TimesheetDto timesheetObj = tsServie.getTimesheetDetailsById(candidateid, timesheet_id);
				if (timesheetObj != null) {
					String htmlText = tsServie.downloadInvoicepdf(candidateid,timesheet_id);
					byte[] bytes = htmlText.getBytes();
					String filetitle = timesheetObj.getBasicObj().getFull_name() + "_Invoice for the " + timesheetObj.getTsDetails().getMonth()
							+ " and period (" + timesheetObj.getTsDetails().getYear() + ")";
					String filename = filetitle + ".html";
					DiskFileItemFactory factory = new DiskFileItemFactory();
					factory.setSizeThreshold(THRESHOLD_SIZE);
					factory.setRepository(new File(System.getProperty("java.io.tmpdir")));
					ServletFileUpload upload = new ServletFileUpload(factory);
					upload.setFileSizeMax(MAX_FILE_SIZE);
					upload.setSizeMax(MAX_REQUEST_SIZE);
					// constructs the directory path to store upload file
					String uploadPath = context.getRealPath("") + UPLOAD_DIRECTORY;

					if (!new File(uploadPath).exists()) {
						new File(uploadPath).mkdir();
						logger.info("directory created  ");
					}
					System.out.println("uploadPath****"+uploadPath);
					String desFile = uploadPath + File.separator + filetitle;
					File dest = new File(uploadPath + File.separator + filename);
					System.out.println("desFile****"+desFile);
					FileOutputStream fileOuputStream = null;
					try {
						fileOuputStream = new FileOutputStream(dest);
						fileOuputStream.write(bytes);
						logger.info("File created with content ");
					} catch (IOException e) {
						e.printStackTrace();
					}
					try {
						Document document = new Document();
						PdfWriter writer = null;
						try {
							writer = PdfWriter.getInstance(document, new FileOutputStream(desFile + ".pdf"));
						} catch (FileNotFoundException | DocumentException e1) {
							logger.error("Exception due to:" + e1.toString());
							e1.printStackTrace();
						}
						document.open();
						try {
							XMLWorkerHelper.getInstance().parseXHtml(writer, document, new FileInputStream(dest));
						} catch (IOException e) {
							logger.error("Exception due to:" + e.toString());

							e.printStackTrace();
						}
						document.close();
					} catch (Exception ex) {
						logger.error("Exception due to:" + ex.toString());
						ex.printStackTrace();
					}

					File file = new File(desFile + ".pdf");
					InputStream in = new FileInputStream(file);

					response.setContentType("application/pdf");
					response.setHeader("Content-Disposition", "attachment; filename=" + file.getName());
					response.setHeader("Content-Length", String.valueOf(file.length()));
					FileCopyUtils.copy(in, response.getOutputStream());
				}
			} else {
				return "redirect:/loginpage";
			}
		} catch (Exception e) {
			logger.error("Error in generateInvoicepdf " + e);
		}
		return null;
	}
	@RequestMapping(value = { "/generateInvoicepdf" }, method = RequestMethod.GET)
	public String generateInvoicepdf(Model model, HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession(true);
		String userName = (String) request.getSession().getAttribute("username");
		try {
			if (userName != null) {
				String candidateid = request.getParameter("candidate_id");
				String timesheet_id = request.getParameter("timesheetId");
				TimesheetDto timesheetObj = tsServie.getTimesheetDetailsById(candidateid, timesheet_id);
				if (timesheetObj != null) {
					String htmlText = tsServie.downloadInvoicepdf(candidateid,timesheet_id);
					byte[] bytes = htmlText.getBytes();
					String filetitle = timesheetObj.getBasicObj().getFull_name() + "_Invoice for the " + timesheetObj.getTsDetails().getMonth()
							+ " and period (" + timesheetObj.getTsDetails().getYear() + ")";
					String filename = filetitle + ".html";
					DiskFileItemFactory factory = new DiskFileItemFactory();
					factory.setSizeThreshold(THRESHOLD_SIZE);
					factory.setRepository(new File(System.getProperty("java.io.tmpdir")));
					ServletFileUpload upload = new ServletFileUpload(factory);
					upload.setFileSizeMax(MAX_FILE_SIZE);
					upload.setSizeMax(MAX_REQUEST_SIZE);
					// constructs the directory path to store upload file
					String uploadPath = context.getRealPath("") + UPLOAD_DIRECTORY;

					if (!new File(uploadPath).exists()) {
						new File(uploadPath).mkdir();
						logger.info("directory created  ");
					}
					System.out.println("uploadPath****"+uploadPath);
					String desFile = uploadPath + File.separator + filetitle;
					File dest = new File(uploadPath + File.separator + filename);
					System.out.println("desFile****"+desFile);
					FileOutputStream fileOuputStream = null;
					try {
						fileOuputStream = new FileOutputStream(dest);
						fileOuputStream.write(bytes);
						logger.info("File created with content ");
					} catch (IOException e) {
						e.printStackTrace();
					}
					try {
						Document document = new Document();
						PdfWriter writer = null;
						try {
							writer = PdfWriter.getInstance(document, new FileOutputStream(desFile + ".pdf"));
						} catch (FileNotFoundException | DocumentException e1) {
							logger.error("Exception due to:" + e1.toString());
							e1.printStackTrace();
						}
						document.open();
						try {
							XMLWorkerHelper.getInstance().parseXHtml(writer, document, new FileInputStream(dest));
						} catch (IOException e) {
							logger.error("Exception due to:" + e.toString());

							e.printStackTrace();
						}
						document.close();
					} catch (Exception ex) {
						logger.error("Exception due to:" + ex.toString());
						ex.printStackTrace();
					}

					File file = new File(desFile + ".pdf");
					InputStream in = new FileInputStream(file);

					response.setContentType("application/pdf");
					response.setHeader("Content-Disposition", "attachment; filename=" + file.getName());
					response.setHeader("Content-Length", String.valueOf(file.length()));
					FileCopyUtils.copy(in, response.getOutputStream());
				}
			} else {
				return "redirect:/loginpage";
			}
		} catch (Exception e) {
			logger.error("Error in generateInvoicepdf " + e);
		}
		return null;
	}*/
	
	@RequestMapping(value = {"/gettimesheetidsbydates" }, method = RequestMethod.GET)
	@ResponseBody
	public InvoiceDto getTimesheetIdsByDates(Model model, HttpServletRequest request, HttpServletResponse response) {
		String userName = (String) request.getSession().getAttribute("username");
		InvoiceDto invObj = null;
		try {
			if (userName != null) {
				String candidateid = request.getParameter("candidate_id");
				String fromdate = request.getParameter("fromdate");
				String todate = request.getParameter("todate"); 
				String customer_id = request.getParameter("customer_id"); 
				String payrateid = request.getParameter("payrateid"); 
				invObj = tsServie.gettimesheetidsbydates(candidateid, fromdate, todate,customer_id,payrateid);
				
			} else {
				invObj = null;
			}
		} catch (Exception e) {
			logger.error("Error in getBillableHoursDetailsByDates " + e);
		}
		return invObj;
	}
}
