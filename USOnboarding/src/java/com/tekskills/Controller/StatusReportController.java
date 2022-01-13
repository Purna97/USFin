package com.tekskills.Controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
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
import org.springframework.core.env.Environment;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.pdf.PdfWriter;
import com.itextpdf.tool.xml.XMLWorkerHelper;
import com.tekskills.Dto.ClientVendorMaster_DTO;
import com.tekskills.Dto.CompanyDetails_DTO;
import com.tekskills.Dto.StatusReportDto;
import com.tekskills.Dto.TimesheetDto;
import com.tekskills.Entity.EmpPayRateDetails;
import com.tekskills.Entity.StatusReportEntity;
import com.tekskills.Entity.StatusReportTemplateEntity;
import com.tekskills.Service.ContractorsService;
import com.tekskills.Service.StatusReportService;
import com.tekskills.Service.TimesheetService;
import com.tekskills.Util.Commons;

@Controller
@PropertySource("/WEB-INF/mail.properties")
public class StatusReportController {
	private static final Logger logger = Logger.getLogger(StatusReportController.class);
	private static final String UPLOAD_DIRECTORY = "temp_pdf";
	private static final int THRESHOLD_SIZE = 1024 * 1024 * 3; // 3MB
	private static final int MAX_FILE_SIZE = 1024 * 1024 * 40; // 40MB
	private static final int MAX_REQUEST_SIZE = 1024 * 1024 * 50; // 50MB
	@Autowired
	private StatusReportService reportService;
	@Autowired
	private Commons commons;
	@Autowired
	private Environment env;
	@Autowired
	ServletContext context;
	@Autowired
	private TimesheetService tsServie;
	@Autowired
	private ContractorsService contService;

	@RequestMapping(value = { "/addTemplate" }, method = RequestMethod.GET)
	public String addTemplate(Model model, HttpServletRequest request, HttpServletResponse response) {
		String userName = (String) request.getSession().getAttribute("username");
		try {
			if (userName != null) {
				HttpSession session = request.getSession(true);
				List<StatusReportTemplateEntity> templateList = reportService.getTemplateList();
				List<String> monthsList = commons.getMonthsList();
				session.setAttribute("templateList", templateList);
				session.setAttribute("monthsList", monthsList);

				String stsreports = "stsreports";
				session.setAttribute("candidates", null);
				session.setAttribute("templates", null);
				session.setAttribute("stsreports", stsreports);
				session.setAttribute("timesheet", null);
				session.setAttribute("mdashboard",null);
				session.setAttribute("mydocuments", null);
				session.setAttribute("immigration", null);
				session.setAttribute("myimmidocs", null);
			} else {
				return "redirect:/loginpage";
			}
		} catch (Exception e) {
			logger.error("Error in addTemplate " + e);
		}
		return "AddTemplate";
	}

	@RequestMapping(value = { "/saveTemplate" }, method = RequestMethod.POST)
	@ResponseBody
	public String saveStatusTemplate(Model model, HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession(true);
		String userName = (String) request.getSession().getAttribute("username");
		Integer loginempno = (Integer) session.getAttribute("empno");
		String message = null;
		try {
			if (userName != null) {
				String month = request.getParameter("months");
				String year = request.getParameter("years");

				int temp = 2;
				for (int i = 1; i <= temp; i++) {
					String period = request.getParameter("period" + i);
					String fromdate = request.getParameter("fromdate" + i);
					String todate = request.getParameter("todate" + i);
					String periodname = "P" + i;
					message = reportService.saveStatusTemplate(month, year, loginempno, period, periodname, fromdate,
							todate);

				}
			} else {
				message = null;
			}

		} catch (Exception e) {
			logger.error("Error in saveTemplate " + e);
		}
		return message;
	}

	@RequestMapping(value = { "/checkTemplate" }, method = RequestMethod.POST)
	@ResponseBody
	public String checkTemplate(Model model, HttpServletRequest request, HttpServletResponse response) {
		String userName = (String) request.getSession().getAttribute("username");
		String message = null;
		try {
			if (userName != null) {
				String month = request.getParameter("month");
				String year = request.getParameter("year");
				message = reportService.checkTemplateByMonth(year, month);
			} else {
				message = null;
			}

		} catch (Exception e) {
			logger.error("Error in checkTemplate " + e);
		}
		return message;
	}

	@RequestMapping(value = { "/addreport" }, method = RequestMethod.GET)
	public String addReport(Model model, HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession(true);
		Integer candidateId = (Integer) session.getAttribute("loginUserid");
		String userName = (String) request.getSession().getAttribute("username");
		String emptype = (String) request.getSession().getAttribute("emptype");
		try {
			if (userName != null) {

				if (emptype.equalsIgnoreCase("W2")) {
					List<ClientVendorMaster_DTO> payrateclientList = tsServie.getEmpPayrateListByCandidateId(candidateId, emptype);
					System.out.println("payrateclientList condition-----"+payrateclientList.size());
					if (payrateclientList.size() > 1) {
						List<StatusReportDto> pendingreportList = null;
						session.setAttribute("payrateclientListsize", payrateclientList.size());
						session.setAttribute("payrateclientList", payrateclientList);
						session.setAttribute("ses_payrateid", null);

						String stsreports = "stsreports";
						session.setAttribute("stsreports", stsreports);
						session.setAttribute("candidates", null);
						session.setAttribute("templates", null);
						session.setAttribute("timesheet", null);
						session.setAttribute("mdashboard",null);
						session.setAttribute("CustomerName", null);
						session.setAttribute("pendingreportList", pendingreportList);
						System.out.println("else 1111 condition"+payrateclientList.size());
						return "SubmitW2Report";
					} else if (payrateclientList.size() > 0 && payrateclientList.size() < 2) {
						//List<StatusReportDto> pendingreportList = reportService.getPeningReportsByCandidateId(candidateId,null, emptype);
						
						List<StatusReportDto> pendingreportList = reportService.getPeningReportsByCandidateId(candidateId,null, emptype);
						System.out.println("else 2222222222222 condition"+pendingreportList.size());
						EmpPayRateDetails payrateObj=reportService.getEmpPayrateDetailsByCandidateId(candidateId);
						if(payrateObj!=null) {
							session.setAttribute("ses_payrateid", payrateObj.getPayrate_id());
						}
						String stsreports = "stsreports";
						session.setAttribute("stsreports", stsreports);
						session.setAttribute("candidates", null);
						session.setAttribute("templates", null);
						session.setAttribute("timesheet", null);
						session.setAttribute("mdashboard",null);
						session.setAttribute("pendingreportList", pendingreportList);
						
						return "SubmitReport";

					}
					else {
						/*int payratelist=0;
						session.setAttribute("payratelist", payratelist);*/
						//System.out.println("else condition-----");
						List<StatusReportDto> pendingreportList = reportService.getPeningReportsByCandidateId(candidateId,null, emptype);
						
						session.setAttribute("pendingreportList", pendingreportList);
						return "SubmitReport";
					}
				} else {
					List<StatusReportDto> pendingreportList = reportService.getPeningReportsByCandidateId(candidateId,null,emptype);
					EmpPayRateDetails payrateObj=reportService.getEmpPayrateDetailsByCandidateId(candidateId);
					if(payrateObj!=null) {
						session.setAttribute("payrate_id", payrateObj.getPayrate_id());
					}
					String stsreports = "stsreports";
					session.setAttribute("stsreports", stsreports);
					session.setAttribute("candidates", null);
					session.setAttribute("templates", null);
					session.setAttribute("timesheet", null);
					session.setAttribute("mdashboard",null);
					session.setAttribute("pendingreportList", pendingreportList);
					return "SubmitReport";
				}

				/*
				 * List<StatusReportDto> pendingreportList
				 * =reportService.getPeningReportsByCandidateId(candidateId); String
				 * stsreports="stsreports"; session.setAttribute("stsreports",stsreports);
				 * session.setAttribute("candidates",null);
				 * session.setAttribute("templates",null);
				 * session.setAttribute("timesheet",null);
				 * session.setAttribute("pendingreportList", pendingreportList);
				 */
			} else {
				return "redirect:/loginpage";
			}
		} catch (Exception e) {
			logger.error("Error in addTemplate " + e);
		}
		return null;

	}

	@RequestMapping(value = { "/w2addreport" }, method = RequestMethod.GET)
	public String w2timesheet(Model model, HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession(true);
		Integer role = (Integer) session.getAttribute("role");
		Integer candidateId = (Integer) session.getAttribute("loginUserid");

		String userName = (String) request.getSession().getAttribute("username");
		String emptype = (String) request.getSession().getAttribute("emptype");
		try {
			if (userName != null) {
				String stsreports = "stsreports";
				session.setAttribute("candidates", null);
				session.setAttribute("templates", null);
				session.setAttribute("stsreports", null);
				session.setAttribute("timesheet", null);
				session.setAttribute("mdashboard",null);
				session.setAttribute("stsreports", stsreports);
				if (role != 4) {
					String payrateid = request.getParameter("payrateid");
					if (emptype.equalsIgnoreCase("W2")) {
						Integer payrate_id = 0;
						if (payrateid != "") {
							payrate_id = Integer.parseInt(payrateid);
						}
						List<StatusReportDto> pendingreportList = reportService.getPeningReportsByCandidateId(candidateId,payrate_id, emptype);
						List<ClientVendorMaster_DTO> payrateclientList = tsServie.getEmpPayrateListByCandidateId(candidateId, emptype);

						String CustomerName = tsServie.getCustomerNameByPayrateId(payrate_id);
						session.setAttribute("CustomerName", CustomerName);
						session.setAttribute("payrateclientList", payrateclientList);
						session.setAttribute("ses_payrateid", payrate_id);
						session.setAttribute("pendingreportList", pendingreportList);
						
						
						return "SubmitW2Report";
					}

				}
			} else {
				return "redirect:/loginpage";
			}

		} catch (Exception e) {
			logger.error("Error in w2addreport " + e);
		}
		return null;

	}

	@RequestMapping(value = { "/viewreports" }, method = RequestMethod.GET)
	public String viewReport(Model model, HttpServletRequest request, HttpServletResponse response) {
		String userName = (String) request.getSession().getAttribute("username");
		Integer candidateid = (Integer) request.getSession().getAttribute("candidateid");
		String emptype = (String) request.getSession().getAttribute("emptype");
		try {
			HttpSession session = request.getSession(true);
			if (userName != null) {
				List<StatusReportTemplateEntity> templateList = null;
				List<StatusReportDto> pendingreportList = null;
				List<StatusReportDto> reportList = null;
				List<String> monthsList = commons.getMonthsList();
				if(emptype.equalsIgnoreCase("W2")) {
					List<ClientVendorMaster_DTO> cutomerList = tsServie.getEmpPayrateListByCandidateId(candidateid, emptype);
					//List<ClientVendorMaster_DTO> cutomerList = contService.getCustomerMasterListByCanidateId(candidateid);
					model.addAttribute("cutomerList", cutomerList);
				}else {
					List<CompanyDetails_DTO> cutomerList = contService.getCustomerMasterList();
					model.addAttribute("cutomerList", cutomerList);
				}

				String stsreports = "stsreports";
				session.setAttribute("candidates", null);
				session.setAttribute("templates", null);
				session.setAttribute("stsreports", stsreports);
				session.setAttribute("timesheet", null);
				session.setAttribute("mdashboard",null);

				session.setAttribute("monthsList", monthsList);
				session.setAttribute("pendingreportList", pendingreportList);
				session.setAttribute("templateList", templateList);
				session.setAttribute("reportList", reportList);
				session.setAttribute("customertype", null);
			} else {
				return "redirect:/loginpage";
			}
		} catch (Exception e) {
			logger.error("Error in viewReports " + e);
		}
		return "ViewStatusReport";
	}

	@RequestMapping(value = {"/getPeriod" }, method = RequestMethod.POST, consumes = MediaType.APPLICATION_FORM_URLENCODED_VALUE)
	@ResponseBody
	public List<String> getPeriod(Model model, HttpServletRequest request, HttpServletResponse response) {
		String userName = (String) request.getSession().getAttribute("username");
		List<String> perioList = null;
		try {
			if (userName != null) {
				String month = request.getParameter("month");
				String year = request.getParameter("year");
				perioList = reportService.getPeriodListByMMYY(month, year);
			} else {
				perioList = null;
			}
		} catch (Exception e) {
			logger.error("Error in getPeriod " + e);
		}
		return perioList;
	}

	@RequestMapping(value = { "/getreports" }, method = RequestMethod.POST)
	public String getReports(Model model, HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession(true);
		Integer role = (Integer) session.getAttribute("role");
		Integer candidateId = (Integer) session.getAttribute("loginUserid");
		String lgemptype = (String) session.getAttribute("emptype");
		String userName = (String) request.getSession().getAttribute("username");
		List<StatusReportDto> reportList = null;
		try {
			if (userName != null) {
				String month = request.getParameter("month");
				String year = request.getParameter("year");
				String period = request.getParameter("period");
				String status = request.getParameter("status");
				String customertype = request.getParameter("customertype");
				reportList = reportService.getReports(month, year, period, status, role, candidateId, lgemptype,customertype);

				if(lgemptype.equalsIgnoreCase("W2")) {
					//List<ClientVendorMaster_DTO> cutomerList = contService.getCustomerMasterListByCanidateId(candidateId);
					List<ClientVendorMaster_DTO> cutomerList = tsServie.getEmpPayrateListByCandidateId(candidateId, lgemptype);
					model.addAttribute("cutomerList", cutomerList);
				}else {
					List<CompanyDetails_DTO> cutomerList = contService.getCustomerMasterList();
					model.addAttribute("cutomerList", cutomerList);
				}
				session.setAttribute("reportList", reportList);
				session.setAttribute("month", month);
				session.setAttribute("period", period);
				session.setAttribute("year", year);
				session.setAttribute("status", status);
				session.setAttribute("customertype", customertype);
			} else {
				return "redirect:/loginpage";
			}
		} catch (Exception e) {
			logger.error("Error in getReports " + e);
		}
		return "ViewStatusReport";
	}

	@RequestMapping(value = {"/getDetailsByCanId" }, method = RequestMethod.POST, consumes = MediaType.APPLICATION_FORM_URLENCODED_VALUE)
	@ResponseBody
	public StatusReportDto getDetailsByCanId(Model model, HttpServletRequest request, HttpServletResponse response) {
		String userName = (String) request.getSession().getAttribute("username");
		StatusReportDto canidateObj = null;
		try {
			if (userName != null) {
				HttpSession session = request.getSession(true);
				String emptype = (String) session.getAttribute("emptype");
				String lgworkAuth = (String) session.getAttribute("lgworkAuth");
				String candidateid = request.getParameter("candidateid");
				String payrate_id = request.getParameter("payrate_id");
				System.out.println("payrate_id------"+payrate_id);
				if ((emptype.equalsIgnoreCase("W2 Admin"))
						&& (!lgworkAuth.equalsIgnoreCase("US Citizen") || !lgworkAuth.equalsIgnoreCase("Green Card"))) {
					canidateObj = null;
				} else {
					canidateObj = reportService.getCanProjectDetailsById(candidateid,payrate_id);
				}
			} else {
				canidateObj = null;
			}
		} catch (Exception e) {
			logger.error("Error in getDetailsByCanId " + e);
		}
		return canidateObj;
	}

	@RequestMapping(value = {
			"/getCanStusDetailsById" }, method = RequestMethod.POST, consumes = MediaType.APPLICATION_FORM_URLENCODED_VALUE)
	@ResponseBody
	public StatusReportDto getCanStusDetailsById(Model model, HttpServletRequest request,
			HttpServletResponse response) {
		String userName = (String) request.getSession().getAttribute("username");
		StatusReportDto canidateObj = null;
		try {
			HttpSession session = request.getSession(true);
			String candidateid = request.getParameter("candidateid");
			String status_reportid = request.getParameter("status_reportid");

			canidateObj = reportService.getCanStusDetailsById(candidateid, status_reportid);

		} catch (Exception e) {
			logger.error("Error in getCanStusDetailsById " + e);
		}
		return canidateObj;
	}

	@RequestMapping(value = { "/savereport" }, method = RequestMethod.POST)
	@ResponseBody
	public String savereport(Model model, HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession(true);
		String userName = (String) request.getSession().getAttribute("username");
		String lgfullname = (String) request.getSession().getAttribute("lgfullname");
		Integer loginempno = (Integer) session.getAttribute("empno");
		String message = null;
		try {
			if (userName != null) {
				String canidateId = request.getParameter("canidateId");
				String challenges = request.getParameter("challenges");
				String outputs = request.getParameter("outputs");
				String delivers = request.getParameter("delivers");
				String month = request.getParameter("month");
				String year = request.getParameter("year");
				String period = request.getParameter("period");
				String periodname = request.getParameter("periodname");
				String clienttname = request.getParameter("clienttname");
				String clientaddres = request.getParameter("clientaddres");
				String projectname = request.getParameter("projectname");
				String payrate_id = request.getParameter("payrate_id");
				
				message = reportService.savereport(challenges, outputs, delivers, canidateId, loginempno, month, year,
						period, periodname, lgfullname, clienttname, clientaddres, projectname,payrate_id);
			} else {
				message = null;
			}
		} catch (Exception e) {
			logger.error("Error in saveTemplate " + e);
		}
		return message;
	}

	@RequestMapping(value = { "/updatestatus" }, method = RequestMethod.POST)
	@ResponseBody
	public String updatestatus(Model model, HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession(true);
		String userName = (String) request.getSession().getAttribute("username");
		Integer loginempno = (Integer) session.getAttribute("empno");
		Integer role = (Integer) session.getAttribute("role");
		String message = null;
		try {
			if (userName != null) {
				String canidateId = request.getParameter("canidateId");
				String statureportId = request.getParameter("statureportId");
				String challenges = request.getParameter("challenges");
				String outputs = request.getParameter("outputs");
				String delivers = request.getParameter("delivers");
				String comments = request.getParameter("comments");
				String status = request.getParameter("status");
				message = reportService.updatestatus(challenges, outputs, delivers, canidateId, loginempno, comments,
						statureportId, status, role);
			} else {
				message = null;
			}
		} catch (Exception e) {
			logger.error("Error in saveTemplate " + e);
		}
		return message;
	}
	@RequestMapping(value = { "/updatestatusreport" }, method = RequestMethod.POST)
	@ResponseBody
	public String updatestatusreport(Model model, HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession(true);
		String userName = (String) request.getSession().getAttribute("username");
		Integer loginempno = (Integer) session.getAttribute("empno");
		Integer role = (Integer) session.getAttribute("role");
		String message = null;
		try {
			if (userName != null) {
				String canidateId = request.getParameter("canidateId");
				String statureportId = request.getParameter("statureportId");
				String challenges = request.getParameter("challenges");
				String outputs = request.getParameter("outputs");
				String delivers = request.getParameter("delivers");
				//String comments = request.getParameter("comments");
				//String status = request.getParameter("status");
				message = reportService.updatestatusreport(challenges, outputs, delivers, canidateId, loginempno, statureportId, role);
			} else {
				message = null;
			}
		} catch (Exception e) {
			logger.error("Error in updatestatusreport " + e);
		}
		return message;
	}
	

	@RequestMapping(value = { "/downloadpdf" }, method = RequestMethod.GET)
	public String downloadpdf(Model model, HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession(true);
		String userName = (String) request.getSession().getAttribute("username");
		try {
			if (userName != null) {
				String statureportId = request.getParameter("statureportId");
				StatusReportEntity statusObj = reportService.getStatusDetailsByStatusId(statureportId);
				if (statusObj != null) {
					String htmlText = reportService.downloadpdf(statureportId);
					byte[] bytes = htmlText.getBytes();
					String filetitle = statusObj.getFull_name() + "_Project Status for the " + statusObj.getMonth()
							+ " and period (" + statusObj.getPeriod() + ")";
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
			logger.error("Error in downloadpdf " + e);
		}
		return null;
	}

	@RequestMapping(value = { "/allstatus" }, method = RequestMethod.GET)
	public String allstatus(Model model, HttpServletRequest request, HttpServletResponse response) {
		String userName = (String) request.getSession().getAttribute("username");
		try {
			HttpSession session = request.getSession(true);
			if (userName != null) {
				List<StatusReportTemplateEntity> templateList = null;
				List<StatusReportDto> pendingreportList = null;
				List<String> monthsList = commons.getMonthsList();
				List<StatusReportDto> reportList = null;
				List<CompanyDetails_DTO> cutomerList = contService.getCustomerMasterList();
				model.addAttribute("cutomerList", cutomerList);

				session.setAttribute("reportList", reportList);
				String stsreports = "stsreports";
				session.setAttribute("candidates", null);
				session.setAttribute("templates", null);
				session.setAttribute("stsreports", stsreports);
				session.setAttribute("timesheet", null);
				session.setAttribute("mdashboard",null);
				session.setAttribute("bgc",null);
				session.setAttribute("myDashboard", null);
				session.setAttribute("mydocuments", null);
				session.setAttribute("myimmidocs", null);
				session.setAttribute("immigration", null);
				session.setAttribute("monthsList", monthsList);
				session.setAttribute("pendingreportList", pendingreportList);
				session.setAttribute("templateList", templateList);
			} else {
				return "redirect:/loginpage";
			}
		} catch (Exception e) {
			logger.error("Error in allstatus " + e);
		}
		return "ViewAllStatusReport";
	}

	@RequestMapping(value = { "/viewallstatusreports" }, method = RequestMethod.POST)
	public String allstatusreports(Model model, HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession(true);
		Integer role = (Integer) session.getAttribute("role");
		Integer candidateId = (Integer) session.getAttribute("loginUserid");
		String lgemptype = (String) session.getAttribute("emptype");
		String userName = (String) request.getSession().getAttribute("username");
		List<StatusReportDto> reportList = null;
		try {
			if (userName != null) {
				String month = request.getParameter("month");
				String year = request.getParameter("year");
				String period = request.getParameter("period");
				String status = request.getParameter("status");
				String customertype = request.getParameter("customertype");
				reportList = reportService.getAllStatusReports(month, year, period, status, role, candidateId,
						lgemptype,customertype);

				session.setAttribute("reportList", reportList);
				session.setAttribute("month", month);
				session.setAttribute("period", period);
				session.setAttribute("year", year);
				session.setAttribute("status", status);
			} else {
				return "redirect:/loginpage";
			}
		} catch (Exception e) {
			logger.error("Error in viewallstatusreports " + e);
		}
		return "ViewAllStatusReport";
	}
}
