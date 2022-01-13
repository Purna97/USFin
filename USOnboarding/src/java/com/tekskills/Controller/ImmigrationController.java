package com.tekskills.Controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;
import java.util.StringJoiner;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.tekskills.Dto.BasicDetailsDto;
import com.tekskills.Dto.ClientVendorMaster_DTO;
import com.tekskills.Dto.DocEmpBean;
import com.tekskills.Dto.DocumentTypeDto;
import com.tekskills.Dto.EmployeeDto;
import com.tekskills.Dto.EndClientDetialDto;
import com.tekskills.Dto.LCADetailsDto;
import com.tekskills.Dto.TaskDetailsDto;
import com.tekskills.Dto.TempCandidateDetailsDTO;
import com.tekskills.Entity.ClientDetailsEntity;
import com.tekskills.Entity.ImmiDocumentTypeEntity;
import com.tekskills.Entity.SOCcodeMasterEntity;
import com.tekskills.Entity.TaskDetailsEntity;
import com.tekskills.Entity.WorkAuthorization;
import com.tekskills.Service.EmployeesService;
import com.tekskills.Service.H1BService;
import com.tekskills.Service.ImmigrationService;
import com.tekskills.Util.SendHtmlEmailNew;

@Controller
@PropertySource("/WEB-INF/mail.properties")
public class ImmigrationController {
	private static final Logger logger = Logger.getLogger(ImmigrationController.class);
	@Autowired
	private ImmigrationService immiService;
	@Autowired
	private H1BService h1bService;
	@Autowired
	private EmployeesService empService;
	@Autowired
	private Environment env;

	@Autowired
	private SendHtmlEmailNew sendmail;

	@RequestMapping(value = { "/immigration" }, method = RequestMethod.GET)
	public String immigration(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession(true);
		Integer role = (Integer) session.getAttribute("role");
		Integer candidateId = (Integer) session.getAttribute("loginUserid");
		String payrollType = (String) session.getAttribute("payrollType");
		String userName = (String) request.getSession().getAttribute("username");
		String emptype = (String) request.getSession().getAttribute("emptype");
		try {
			if (userName == null) {
				return "redirect:/loginpage"; 
			} else {
			// List<ClientVendorMaster_DTO> categoryList
			// =immiService.getEndclientListByCandidateId(candidateId);
			List<BasicDetailsDto> candidateList = immiService.getW2CandidateList();
			// from Tbl_ClientDetails where candidate_id=1339 and status=1
			// List<ClientVendorMaster_DTO> endclientList
			// =immiService.getEndclientListByCandidateId(candidateId);

			session.setAttribute("candidateList", candidateList);
			session.setAttribute("immigration", "immigration");
			session.setAttribute("candidates", null);
			session.setAttribute("templates", null);
			session.setAttribute("stsreports", null);
			session.setAttribute("timesheet", null);
			session.setAttribute("bgc", null);
			session.setAttribute("mydocuments", null);
			session.setAttribute("myimmidocs", null);
			session.setAttribute("mdashboard", null);
		   }
		}catch (Exception e) {
			logger.error("Error in immigration " + e);
		}
		return "Immigration";
		
	}

	@RequestMapping(value = { "/getendclientlist" }, method = RequestMethod.GET)
	@ResponseBody
	public List<ClientVendorMaster_DTO> getendclientlist(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession(true);
		String userName = (String) request.getSession().getAttribute("username");
		List<ClientVendorMaster_DTO> endclientList = null;
		try {
			if(userName!=null) {
			String candidateid = request.getParameter("candidateid");
			endclientList = immiService.getEndclientListByCandidateId(candidateid);
			}else {
				endclientList =null;
			}
		} catch (Exception e) {
			logger.error("Error in getendclientlist " + e);
		}
		return endclientList;
	}
	
	@RequestMapping(value = { "/getlcaquestionaries" }, method = RequestMethod.GET)
	@ResponseBody
	public EndClientDetialDto getlcaquestionaries(Model model, HttpServletRequest request) {
		String userName = (String) request.getSession().getAttribute("username");
		EndClientDetialDto enclientDto = null;
		try {
			if(userName!=null) {
			String candidateid = request.getParameter("candidateid");
			String clientid = request.getParameter("clientid");
			enclientDto = immiService.getlcaquestionaries(candidateid,clientid);
		/*	Integer lcaId=immiService.getlcaIdByCandidateClientId(candidateid,clientid);
			enclientDto.setLcaId(lcaId);*/
			List<LCADetailsDto> alllcaList = immiService.getAllLCAList(candidateid,clientid);
			List<LCADetailsDto> pendinglcaList = immiService.getPendingLCAList(candidateid,clientid);
			
			List<SOCcodeMasterEntity> soccodeList = h1bService.getSocCodeMasterList();
			enclientDto.setSocCodeList(soccodeList);
			enclientDto.setPendinglcaList(pendinglcaList);
			enclientDto.setAlllcaList(alllcaList);
			}else {
				enclientDto =null;
			}
		} catch (Exception e) {
			logger.error("Error in getlcaquestionaries " + e);
		}
		return enclientDto;
	}
	@RequestMapping(value = { "/gettaskdetails" }, method = RequestMethod.GET)
	@ResponseBody
	public EndClientDetialDto  gettaskdetailsbyids(Model model, HttpServletRequest request) {
		String userName = (String) request.getSession().getAttribute("username");
		EndClientDetialDto lcatask=new EndClientDetialDto();
		try {
			if(userName!=null) {
			String candidateid = request.getParameter("candidateid");
			//String clientid = request.getParameter("clientid");
			String type = request.getParameter("type");
			String clientid="";
			List<TaskDetailsDto> taskList = immiService.gettaskdetailsbyids(candidateid,clientid,type);
			List<LCADetailsDto> lcaList = immiService.getAllLCAList(candidateid,clientid);
			List<LCADetailsDto> acitveInacitveLCAList = immiService.getActiveInactiveLCAList(candidateid,clientid);
			List<ClientVendorMaster_DTO> endclientList = immiService.getEndclientListByCandidateId(candidateid);
			lcatask.setEndclientList(endclientList);
			lcatask.setAlllcaList(lcaList);
			lcatask.setAlltaskList(taskList);
			lcatask.setAcitveInacitveLCAList(acitveInacitveLCAList);
			
			//ClientDetailsEntity clientObj = immiService.getEndclientByClientId(clientid);
			//taskDto.setClientObj(clientObj);
			//taskDto.setTaskDetailsList(taskList);
			}else {
				lcatask =null;
			}
		} catch (Exception e) {
			logger.error("Error in gettaskdetailsbyids " + e);
		}
		return lcatask;
	}
	
	@RequestMapping(value = { "/gettaskdetailsbyid" }, method = RequestMethod.GET)
	@ResponseBody
	public TaskDetailsEntity gettaskdetailsbyid(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession(true);
		String userName = (String) request.getSession().getAttribute("username");
		TaskDetailsEntity taskDto = null;
		try {
			if(userName!=null) {
			String taskid = request.getParameter("taskid");
			taskDto = immiService.getTaskdetailsById(taskid);
			}else {
				taskDto =null;
			}
		} catch (Exception e) {
			logger.error("Error in gettaskdetailsbyids " + e);
		}
		return taskDto;
	}
	@RequestMapping(value = { "/updatetask" }, method = RequestMethod.POST)
	@ResponseBody
	public String updatetask(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession(true);
		String userName = (String) request.getSession().getAttribute("username");
		String emailid = (String) request.getSession().getAttribute("emailid");
		String msg = null;
		try {
			if(userName!=null) {
			String taskid = request.getParameter("taskid");
			String description = request.getParameter("udescription");
			String duedate = request.getParameter("duedate");
			String taskstatus = request.getParameter("taskstatus");
			String comments = request.getParameter("comments");
			
			msg = immiService.updatetask(taskid,taskstatus,duedate,description,comments,emailid);
			
			}else {
				msg =null;
			}
		} catch (Exception e) {
			logger.error("Error in updatetask " + e);
		}
		return msg;
	}
	@RequestMapping(value = { "/addtask" }, method = RequestMethod.POST)
	@ResponseBody
	public String addtask(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession(true);
		String userName = (String) request.getSession().getAttribute("username");
		Integer empno = (Integer) request.getSession().getAttribute("empno");
		
		String msg = null;
		try {
			if(userName!=null) {
			String description = request.getParameter("description");
			String lcaRefNo = request.getParameter("lcaRefNoListTask");
			
			//String duedate = request.getParameter("duedate");
			String duedate = "";
			String taskname = request.getParameter("taskname");
			//String client_id = request.getParameter("client_id");
			String candidateid = request.getParameter("candidateid");
			msg = immiService.addtask(taskname,duedate,description,empno,lcaRefNo,candidateid);
			}else {
				msg =null;
			}
		} catch (Exception e) {
			logger.error("Error in updatetask " + e);
		}
		return msg;
	}
	
	
	@RequestMapping(value = { "/addh1task" }, method = RequestMethod.POST)
	@ResponseBody
	public String addh1task(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession(true);
		String userName = (String) request.getSession().getAttribute("username");
		Integer empno = (Integer) request.getSession().getAttribute("empno");
		String msg = null;
		try {
			if(userName!=null) {
			String description = request.getParameter("ah1description");
			//String duedate = request.getParameter("duedate");
			String duedate = "";
			String taskname = request.getParameter("ah1taskname");
			//String client_id = request.getParameter("client_id");
			String candidateid = request.getParameter("ah1candidateid");
			msg = immiService.addh1task(taskname,duedate,description,empno,candidateid);
			}else {
				msg =null;
			}
		} catch (Exception e) {
			logger.error("Error in addh1task " + e);
		}
		return msg;
	}
	
	@RequestMapping(value = { "/updateh1task" }, method = RequestMethod.POST)
	@ResponseBody
	public String updateh1task(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession(true);
		String userName = (String) request.getSession().getAttribute("username");
		String emailid = (String) request.getSession().getAttribute("emailid");
		String msg = null;
		try {
			if(userName!=null) {
			String taskid = request.getParameter("h1taskid");
			String description = request.getParameter("uh1description");
			String duedate = request.getParameter("uh1duedate");
			String taskstatus = request.getParameter("uh1taskstatus");
			String comments = request.getParameter("uh1comments");
			msg = immiService.updatetask(taskid,taskstatus,duedate,description,comments,emailid);
			}else {
				msg =null;
			}
		} catch (Exception e) {
			logger.error("Error in updatetask " + e);
		}
		return msg;
	}
	
	@RequestMapping(value = { "/getlcahistory" }, method = RequestMethod.GET)
	@ResponseBody
	public  EndClientDetialDto getLCAHistory(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession(true);
		String userName = (String) request.getSession().getAttribute("username");
		
		EndClientDetialDto lcadetailDto=new EndClientDetialDto();
		//List<DocEmpBean> lcaHistoryList = null;
		try {
			if(userName!=null) {
			String candidateid = request.getParameter("candidateid");
			String clientid = request.getParameter("clientid");
			List<DocEmpBean> lcaHistoryList = immiService.getLCAHistory(candidateid,clientid);
			List<LCADetailsDto> lcaList = immiService.getAllLCAList(candidateid,clientid);
			Integer lcaId=immiService.getlcaIdByCandidateClientId(candidateid,clientid);
			lcadetailDto.setLcaId(lcaId);
			lcadetailDto.setLcaHistoryList(lcaHistoryList);
			lcadetailDto.setLcaList(lcaList);
			}else {
				lcadetailDto =null;
			}
		} catch (Exception e) {
			logger.error("Error in getlcahistory " + e);
		}
		return lcadetailDto;
	}
	
	@RequestMapping(value = { "/saveamendment" }, method = RequestMethod.POST)
	@ResponseBody
	public  String saveAmendment(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession(true);
		String userName = (String) request.getSession().getAttribute("username");
		Integer loginempno = (Integer) session.getAttribute("empno");
		String msg= null;
		try {
			if(userName!=null) {
			String candidateid = request.getParameter("candidateid");
			String clientid = request.getParameter("clientid");
			StringJoiner joiner = new StringJoiner(",");
			String[] amendmentchange = request.getParameterValues("amendmentchange");
			for (int i = 0; i < amendmentchange.length; i++) {
				joiner.add(amendmentchange[i].toString());
			}
			String amendment =joiner.toString();
			msg = immiService.saveAmendment(candidateid,clientid,amendment,loginempno);
			}else {
				msg =null;
			}
		} catch (Exception e) {
			logger.error("Error in saveamendment " + e);
		}
		return msg;
	}
	@RequestMapping(value = { "/getamendmentdetails" }, method = RequestMethod.GET)
	@ResponseBody
	public  ClientDetailsEntity getamendmentdetails(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession(true);
		String userName = (String) request.getSession().getAttribute("username");
		ClientDetailsEntity clientObj = null;
		try {
			if(userName!=null) {
			String candidateid = request.getParameter("candidateid");
			String clientid = request.getParameter("clientid");
			 clientObj = immiService.getEndclientByClientId(clientid);
			}else {
				clientObj =null;
			}
		} catch (Exception e) {
			logger.error("Error in getamendmentdetails " + e);
		}
		return clientObj;
	}
	
	@RequestMapping(value = { "/uploadLCADetails" }, method = RequestMethod.POST)
	@ResponseBody
	public String uploadLCADetailsSave(Model model, HttpServletRequest request, 
			HttpServletResponse response,@RequestParam("lcaDocument") MultipartFile document) {
		String message = null;
		try {
			Integer lgempno = (Integer) request.getSession().getAttribute("empno");
			Integer lgcandidateid = (Integer) request.getSession().getAttribute("candidateid");
			if (lgempno!= null) {
				
				String lcaId = request.getParameter("lcaRefNoList");
				String lcapayrateId = request.getParameter("lcapayrateId");
				String lcacandidateId = request.getParameter("lcacandidateId");
				String lcaclientId = request.getParameter("lcaclientId");
				String documenttype = request.getParameter("documenttypeId");
				String documentsubtype = request.getParameter("documentsubtype");
				String docinput = request.getParameter("lcaDocName");
				String startdate  = request.getParameter("startdate");
				String enddate = request.getParameter("enddate");
				String subdocname = request.getParameter("subdocname");
				String lcaNumber = request.getParameter("lcaNumber");
				
				System.out.println("subdocname******"+subdocname);
				if(subdocname.equalsIgnoreCase("Approved LCA")) {
				String lcastartdate  = request.getParameter("lcaBeginDate");
				String lcaenddate = request.getParameter("lcaEndDate");
				String county = request.getParameter("lcacounty");
				String caseType = request.getParameter("caseType");
				String lcaCertifiedDate = request.getParameter("lcaCertifiedDate");
				String soc_code = request.getParameter("soc_code");
				String job_title = request.getParameter("job_title");
				String wageRate = request.getParameter("wageRate");
				String wageLevel = request.getParameter("wageLevel");
				String prevailingWage = request.getParameter("prevailingWage");
				String lcaSubDate = request.getParameter("lcaSubDate");
			
				immiService.updateLCADetails(docinput, document, lcaNumber, county, 
						lcastartdate, lcaenddate, caseType, lcaCertifiedDate, soc_code, job_title,
						wageRate, wageLevel, prevailingWage, lcaSubDate,  lgempno, lcapayrateId,
						lcacandidateId, lcaclientId,documenttype,documentsubtype,lcaId,lgcandidateid);
				message = "Approved LCA details added successfully";
				}else {
					String fileType="LCA";
				/*	if(!lcaNumber.isEmpty()) {
						int lcaid=immiService.saveuploadLCADetails(docinput, document, lcaNumber, null, 
								startdate, enddate, null, null, null, null,
								null, null, null, null,  lgempno, lcapayrateId,
								lcacandidateId, lcaclientId,documenttype,documentsubtype);
					}else {*/
						immiService.saveImmigrationDocument(docinput, document, startdate, enddate,
								lgempno, lcapayrateId,	lcacandidateId, lcaclientId,documenttype,documentsubtype,fileType,lcaId);
					//}
					message = "Details added successfully";
				}
			}else {
				message = null;
			}
		} catch (Exception e) {
			logger.error("Error in uploadLCADetailsUpdate" + e);
		}
		return message;
	}

	@RequestMapping(value = { "/checkImmigrationSelectedFileName" }, method = RequestMethod.GET)
	@ResponseBody
	public String checkImmigrationSelectedFileName(Model model, HttpServletRequest request, HttpServletResponse response) {
		String userName = (String) request.getSession().getAttribute("username");
		String msg = null;
		if (userName == null) {
			return "redirect:/loginpage";
		} else {
			String lcapayrateId = request.getParameter("lcapayrateId");
			String docInput = request.getParameter("docInput");
			String docType = request.getParameter("docType");
			String fname = immiService.checkImmigrationSelectedFileName(lcapayrateId, docInput, docType);
			/*if (fname!=null) {
				msg = "Uploaded";
			} else {
				msg = "NotExists";
			}*/
			return fname;
		}
	}
	@RequestMapping(value = { "/checklcanumber" }, method = RequestMethod.GET)
	@ResponseBody
	public String checkLCANumber(Model model, HttpServletRequest request) {
		String lca = null;
		try {
			Integer lgempno = (Integer) request.getSession().getAttribute("empno");
			if (lgempno != null) {
				String lcaNumber = request.getParameter("lcaNumber");
				lca = immiService.checkLCANumber(lcaNumber);
			} else {
				lca = null;
			}
		} catch (Exception e) {
			logger.error("Error in checklcanumber " + e);
		}
		return lca;
	}
	
@RequestMapping(value = { "/downloadimmigrationdocs" }, method = RequestMethod.GET)
	public void downloadbgvdocs(HttpServletResponse response, HttpServletRequest request) throws Exception {
		try {
			String userName = (String) request.getSession().getAttribute("username");
			if (userName == null) {
				PrintWriter out = response.getWriter();
				out.println("<script type=\"text/javascript\">");
				out.println("window.location.href='login.jsp'");
				out.println("</script>");
				out.close();
			} else {
				Integer candidateId = null;
				String candidate_id = request.getParameter("candidate_id");
				String filename = request.getParameter("filename");
				String filepath = null;
				String workingDir = env.getProperty("documents");
				if (!candidate_id.isEmpty()) {
					candidateId = Integer.parseInt(candidate_id);
					String path = workingDir + File.separator + candidateId;
					filepath = path + File.separator + "Immigration" + File.separator + filename;
				}
				System.out.println(filepath);
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
			logger.error("Error while downloadimmigrationdocs action in ImmigrationController" + e);
		}
	}
	
	@RequestMapping(value = { "/getsubdocsbydoclcaid" }, method = RequestMethod.GET)
	@ResponseBody
	public EndClientDetialDto getsubdocsbydoclcaid(Model model, HttpServletRequest request) {
		EndClientDetialDto endClient = null;
		try {
			String lcaid = request.getParameter("lcaid");
			String docid = request.getParameter("docid");
			endClient = immiService.getsubdocsbydoclcaid(lcaid,docid);
			List<DocEmpBean> lcaList = immiService.lcaDetailsByLcaId(lcaid);
			endClient.setLcaHistoryList(lcaList);
		} catch (Exception e) {
			logger.error("Error in getsubdocsbydoclcaid" + e);
		}
		return endClient;
	}
	
	@RequestMapping(value = { "/getquestionnairebylcaid" }, method = RequestMethod.GET)
	@ResponseBody
	public EndClientDetialDto getquestionnairebylcaid(Model model, HttpServletRequest request) {
		EndClientDetialDto endClient = null;
		try {
			String lcaid = request.getParameter("lcaid");
			endClient = immiService.getLcaQuestionnaireBylcaid(lcaid);
			List<SOCcodeMasterEntity> soccodeList = h1bService.getSocCodeMasterList();
			endClient.setSocCodeList(soccodeList);
		/*	List<DocEmpBean> lcaList = immiService.lcaDetailsByLcaId(lcaid);
			endClient.setLcaHistoryList(lcaList);*/
		} catch (Exception e) {
			logger.error("Error in getquestionnairebylcaid" + e);
		}
		return endClient;
	}
	
	@RequestMapping(value = { "/lcadetailsbylcaid" }, method = RequestMethod.GET)
	@ResponseBody
	public List<DocEmpBean> lcadetailsbylcaid(Model model, HttpServletRequest request) {
		List<DocEmpBean> lcaList=null;
		try {
			String lcaid = request.getParameter("lcaid");
			lcaList = immiService.lcaDetailsByLcaId(lcaid);
			
		} catch (Exception e) {
			logger.error("Error in lcadetailsbylcaid" + e);
		}
		return lcaList;
	}
	
	@RequestMapping(value = { "/checksubdocsbydoclcaid" }, method = RequestMethod.GET)
	@ResponseBody
	public String checksubdocsbydoclcaid(Model model, HttpServletRequest request) {
		String message = null;
		try {
			Integer lgempno = (Integer) request.getSession().getAttribute("empno");
			if (lgempno != null) {
				String lcaid = request.getParameter("lcaid");
				String docid = request.getParameter("docid");
				String subdocid = request.getParameter("subdocid");
				message = immiService.checksubdocsbydoclcaid(lcaid,docid,subdocid);
			} else {
				message = null;
			}
		} catch (Exception e) {
			logger.error("Error in checksubdocsbydoclcaid " + e);
		}
		return message;
	}	
	
	@RequestMapping(value = { "/getdochistorybyId" }, method = RequestMethod.GET)
	@ResponseBody
	public List<DocEmpBean> getdochistorybyId(Model model, HttpServletRequest request) {
		List<DocEmpBean> lcaList=null;
		try {
			String lcaid = request.getParameter("lcaid");
			String docsubtypeid = request.getParameter("docsubtypeid");
			lcaList = immiService.getdochistorybyId(lcaid,docsubtypeid);
			
		} catch (Exception e) {
			logger.error("Error in getdochistorybyId" + e);
		}
		return lcaList;
	}
	
	@RequestMapping(value = { "/updateLCADocuments" }, method = RequestMethod.POST)
	@ResponseBody
	public  String updateLCADocuments(Model model, HttpServletRequest request,
			@RequestParam("lcaeditFile") MultipartFile lcaeditFile) {
		HttpSession session = request.getSession(true);
		String userName = (String) request.getSession().getAttribute("username");
		Integer loginempno = (Integer) session.getAttribute("empno");
		String msg= null;
		try {
			if(userName!=null) {
			String documentid = request.getParameter("lcadocumentid");
			String candidateid = request.getParameter("lcaedcandidateid");
			String docName = request.getParameter("edinputval");
			String startdate = request.getParameter("edstartdate");
			String enddate = request.getParameter("edenddate");
			msg = immiService.updateLCADocuments(lcaeditFile,loginempno,candidateid, documentid,docName,startdate,enddate);
			}else {
				msg =null;
			}
		} catch (Exception e) {
			logger.error("Error in updateLCADocuments " + e);
		}
		return msg;
	}
	
	@RequestMapping(value = { "/gettasksbyclientid" }, method = RequestMethod.GET)
	@ResponseBody
	public EndClientDetialDto  gettasksbyclientid(Model model, HttpServletRequest request) {
		String userName = (String) request.getSession().getAttribute("username");
		EndClientDetialDto lcatask=new EndClientDetialDto();
		try {
			if(userName!=null) {
			String candidateid = request.getParameter("candidateid");
			String clientid = request.getParameter("clientid");
			String type = request.getParameter("type");
			List<TaskDetailsDto> taskList = immiService.gettaskdetailsbyids(candidateid,clientid,type);
			List<LCADetailsDto> lcaList = immiService.getAllLCAList(candidateid,clientid);
			//List<ClientVendorMaster_DTO> endclientList = immiService.getEndclientListByCandidateId(candidateid);
			//lcatask.setEndclientList(endclientList);
			lcatask.setAlllcaList(lcaList);
			lcatask.setAlltaskList(taskList);
			
			}else {
				lcatask =null;
			}
		} catch (Exception e) {
			logger.error("Error in gettasksbyclientid " + e);
		}
		return lcatask;
	}
	
	@RequestMapping(value = { "/getCanidateDetailsByCanId" }, method = RequestMethod.GET)
	@ResponseBody
	public EmployeeDto  getCandidateDetails(Model model, HttpServletRequest request) {
		String userName = (String) request.getSession().getAttribute("username");
		EmployeeDto basicObj=null;
		try {
			if(userName!=null) {
				String candidateid = request.getParameter("candidateid");
				Integer candidate_Id = 0;
				if (candidateid!="") {
					candidate_Id = Integer.parseInt(candidateid);
				}
				 basicObj=empService.getCanidateDetailsByCanId(candidate_Id);
				 System.out.println("basicObj*******"+basicObj.getWork_authorization());
			}else {
				basicObj =null;
			}
		} catch (Exception e) {
			logger.error("Error in getCanidateDetailsByCanId " + e);
		}
		return basicObj;
	}
	
	@RequestMapping(value = { "/updatelcaqetails" }, method = RequestMethod.POST)
	@ResponseBody
	public String updatelcaqetails(Model model, HttpServletRequest request, 
			HttpServletResponse response) {
		String message = null;
		try {
			Integer lgempno = (Integer) request.getSession().getAttribute("empno");
			if (lgempno!= null) {
				
				String organization_name = null;
				String cand_job_title = null;
				String education = null;
				String workinglocation = null;
				String reason_lca = null;
				
				String remote_line1 = null;
				String remote_line2 = null;
				String remote_city = null;
				String remote_state = null;
				String remote_zipcode = null;
				String remote_county = null;
				String remote_soc_code = null;
				String lcaenddate = null;
				String lcastartdate= null;
				String wageRate = null;
				String lcaPostedDate= null;
				String metro_politan_area = null;
				String wr_option = null;  
				String remote_metro=null;
				String u_duties = null;
				String lcaid=request.getParameter("lcaqueRefNoList");
				String endclient_id=request.getParameter("endClientId");
				String endclient_name=request.getParameter("endClientName");
				organization_name = request.getParameter("organization_name");
				cand_job_title = request.getParameter("cand_job_title");
				u_duties = request.getParameter("u_duties");
				education = request.getParameter("education");
				workinglocation = request.getParameter("workinglocation");
				remote_county = request.getParameter("remote_county");
				remote_soc_code = request.getParameter("remote_soc_code");
				reason_lca = request.getParameter("reason_lca");	
				wr_option = request.getParameter("uwr_option");
				 wageRate = request.getParameter("u_wageRate");
				 lcastartdate  = request.getParameter("u_lcaBeginDate");
				 lcaenddate = request.getParameter("u_lcaEndDate");
				 lcaPostedDate = request.getParameter("u_lcaPostedDate");
				 
				 
		  		String end_addressId = request.getParameter("end_addressId");
	  			String endline1 = request.getParameter("endline1");
				String endline2 = request.getParameter("endline2");
				String endcity = request.getParameter("endcity");
				String endstate = request.getParameter("endstate");
				String endzipcode = request.getParameter("endzipcode");
				metro_politan_area = request.getParameter("u_metro_politan_area");
				
				 String remote_addressId = request.getParameter("remote_addressId");	
				 if(workinglocation.equalsIgnoreCase("Remote/Home")) {
					 remote_line1 = request.getParameter("remote_line1");
					 remote_line2 = request.getParameter("remote_line2");
					 remote_city = request.getParameter("remote_city");
					 remote_state = request.getParameter("remote_state");
					 remote_zipcode = request.getParameter("remote_zipcode");
					 remote_metro = request.getParameter("uremote_metro");
				  }
				 System.out.println("job duties"+u_duties);
				 
		  message=immiService.updatelcaqetails(endclient_name,endclient_id,end_addressId,endline1, endline2, endcity, 
				endstate, endzipcode,lgempno,organization_name,cand_job_title,education,remote_county,
				remote_soc_code,workinglocation, remote_addressId,remote_line1, remote_line2, remote_city, remote_state, 
				remote_zipcode,remote_metro,reason_lca,lcaid, lcastartdate, lcaenddate,wageRate,lcaPostedDate,metro_politan_area,wr_option,u_duties);
		  
		  
		  	String[] othr_addrids = request.getParameterValues("ulcaotherloc_addrid[]");
		  	String[] othr_line1s = request.getParameterValues("ulca_othr_line1[]");
			String[] othr_line2s = request.getParameterValues("ulca_othr_line2[]");
			String[] othr_citys = request.getParameterValues("ulca_othr_city[]");
			String[] othr_states = request.getParameterValues("ulca_othr_state[]");
			String[] othr_zipcodes = request.getParameterValues("ulca_othr_zipcode[]");
			String[] lca_othr_remote_metros = request.getParameterValues("ulca_othr_remote_metro[]");
			      
			if (othr_line1s != null) {
				for (int t = 1; t < othr_line1s.length; t++) {
					Integer addr_id=Integer.parseInt(othr_addrids[t]);
					 String othr_line1=othr_line1s[t];
	    			 String othr_line2=othr_line2s[t];
	    			 String othr_city=othr_citys[t];
	    			 String othr_state=othr_states[t];
	    			 String othr_zipcode=othr_zipcodes[t];
	    			 String othr_metro = lca_othr_remote_metros[t];
	    			/* System.out.println("addr_id***"+addr_id);
	    			 System.out.println("othr_line1***"+othr_line1);
	    			 System.out.println("othr_line2***"+othr_line2);
	    			 System.out.println("othr_city***"+othr_city);
	    			 System.out.println("othr_state***"+othr_state);
	    			 System.out.println("othr_zipcode***"+othr_zipcode);
	    			 System.out.println("othr_metro***"+othr_metro);*/
	    			  immiService.updateCompanyAddress(addr_id, lgempno, othr_line1,othr_line2,othr_city,othr_state,othr_zipcode,othr_metro);
				   }
			 }
		  if(message.equalsIgnoreCase("Success")) {
			  message="Updated LCA Questionnaire Details Successfully";
		      }else{
		    	  message="Failed To Update LCA Questionnaire Details";
		      }
			}else {
				message = null;
			}
		} catch (Exception e) {
			logger.error("Error in updatelcaqetails" + e);
		}
		return message;
	}
	@RequestMapping(value = { "/inactiveRefNo" }, method = RequestMethod.GET)
	@ResponseBody
	public String  inactiveRefNo(Model model, HttpServletRequest request) {
		String userName = (String) request.getSession().getAttribute("username");
		String msg=null;
		try {
			if(userName!=null) {
				String lcaid = request.getParameter("lcaid");
				msg=immiService.inactiveRefNo(lcaid);
			}else {
				msg =null;
			}
		} catch (Exception e) {
			logger.error("Error in inactiveRefNo " + e);
		}
		return msg;
	}
	
	@RequestMapping(value = { "/deleteRefNo" }, method = RequestMethod.GET)
	@ResponseBody
	public String  deleteRefNo(Model model, HttpServletRequest request) {
		String userName = (String) request.getSession().getAttribute("username");
		String msg=null;
		try {
			if(userName!=null) {
				String lcaid = request.getParameter("lcaid");
				msg=immiService.deleteRefNo(lcaid);
			}else {
				msg =null;
			}
		} catch (Exception e) {
			logger.error("Error in deleteRefNo " + e);
		}
		return msg;
	}
	
	@RequestMapping(value = { "/InitiateLCAQDetails" }, method = RequestMethod.POST)
	@ResponseBody
	public String InitiateLCAQDetails(Model model, HttpServletRequest request, 
			HttpServletResponse response) {
		String message = null;
		try {
			Integer lgempno = (Integer) request.getSession().getAttribute("empno");
			if (lgempno!= null) {				
				String organization_name = null;
				String cand_job_title = null;
				String init_duties = null;
				String education = null;
				String workinglocation = null;
				String reason_lca = null;				
				String remote_line1 = null;
				String remote_line2 = null;
				String remote_city = null;
				String remote_state = null;
				String remote_zipcode = null;
				String remote_soc_code = null;
				String remote_county = null;
				String remote_metro_politan_area = null;
				
				
				String lcaenddate = null;
				String lcastartdate= null;
				String wageRate = null;
				
				String init_lcaPostedDate= null;
				String init_metro_politan_area = null;
				String wr_option = null; 
				 
				String lcaType=request.getParameter("lcaType");
				System.out.println("lcaType***"+lcaType);
				String endclient_name=request.getParameter("init_endClientName");
				organization_name = request.getParameter("init_organization");
				cand_job_title = request.getParameter("init_cand_job_title");
				init_duties = request.getParameter("init_duties");
				education = request.getParameter("init_education");
				workinglocation = request.getParameter("init_workinglocation");
				remote_county = request.getParameter("init_remote_county");
				remote_soc_code = request.getParameter("init_remote_soc_code");
				reason_lca = request.getParameter("init_reason_lca");	 
				 wageRate = request.getParameter("init_wageRate");
				 wr_option = request.getParameter("iwr_option");
				 lcastartdate  = request.getParameter("init_lcaBeginDate");
				 lcaenddate = request.getParameter("init_lcaEndDate");
				 init_lcaPostedDate = request.getParameter("init_lcaPostedDate");
				
				 
					System.out.println(lcastartdate+"**wageRate*******"+wageRate+"**lcaenddate****"+lcaenddate);
	  			String endline1 = request.getParameter("init_endline1");
				String endline2 = request.getParameter("init_endline2");
				String endcity = request.getParameter("init_endcity");
				String endstate = request.getParameter("init_endstate");
				String endzipcode = request.getParameter("init_endzipcode");
				String end_metro_politan_area = request.getParameter("init_end_metro_politan_area");
				
				  
				
				String init_candidateid = request.getParameter("init_candidateid");	
				System.out.println("organization_name*********"+organization_name);
				 if(workinglocation.equalsIgnoreCase("Remote/Home")) {
					 remote_line1 = request.getParameter("init_remote_line1");
					 remote_line2 = request.getParameter("init_remote_line2");
					 remote_city = request.getParameter("init_remote_city");
					 remote_state = request.getParameter("init_remote_state");
					 remote_zipcode = request.getParameter("init_remote_zipcode");
					 remote_metro_politan_area = request.getParameter("init_remote_metro_politan_area");
				  }
				 if(lcaType.equalsIgnoreCase("Client Project")) {
					    String endclient_id=request.getParameter("init_endClientId"); 
				  		String end_addressId = request.getParameter("init_end_addressId");
				  		String remote_addressId = request.getParameter("init_remote_addressId");
				  		System.out.println("remote_addressId*******"+remote_addressId);
				  		message=immiService.updateInitiateLCADetails(endclient_name,endclient_id,end_addressId,endline1, endline2, endcity, 
				 				endstate, endzipcode,end_metro_politan_area,lgempno,organization_name,cand_job_title,education,remote_county,
				 				remote_soc_code,workinglocation, remote_addressId,remote_line1, remote_line2, remote_city, remote_state, 
				 				remote_zipcode,remote_metro_politan_area,reason_lca, lcastartdate, lcaenddate,wageRate,init_lcaPostedDate,wr_option,init_duties);
				  		String[] othr_line1s = request.getParameterValues("lca_othr_line1[]");
						String[] othr_line2s = request.getParameterValues("lca_othr_line2[]");
						String[] othr_citys = request.getParameterValues("lca_othr_city[]");
						String[] othr_states = request.getParameterValues("lca_othr_state[]");
						String[] othr_zipcodes = request.getParameterValues("lca_othr_zipcode[]");
						String[] lca_othr_remote_metros = request.getParameterValues("lca_othr_remote_metro[]");
						      
						if (othr_line1s != null) {
							for (int t = 1; t < othr_line1s.length; t++) {
								 String othr_line1=othr_line1s[t];
				    			 String othr_line2=othr_line2s[t];
				    			 String othr_city=othr_citys[t];
				    			 String othr_state=othr_states[t];
				    			 String othr_zipcode=othr_zipcodes[t];
				    			 String othr_metro = lca_othr_remote_metros[t];
				    		//	 String othr_client_type="OtherClient";
				    			 Integer endclientId=0;
				    				if (endclient_id!="") {
				    					endclientId = Integer.parseInt(endclient_id);
				    				}	 
							     if(endclientId!=0) {
								 	String	companytype="LCALocation";
								 	immiService.saveCompanyAddress(endclientId, companytype, lgempno, othr_line1,othr_line2,othr_city,othr_state,othr_zipcode,othr_metro);
								   }
							   }
						 }

				  		
				  		
					}else {
						message=immiService.saveInitiateLCADetails(endclient_name,endline1, endline2, endcity, 
									endstate, endzipcode,lgempno,organization_name,cand_job_title,education,remote_county,
									remote_soc_code,workinglocation,remote_line1, remote_line2, remote_city, remote_state, 
									remote_zipcode,reason_lca,init_candidateid, lcastartdate, lcaenddate,wageRate,init_lcaPostedDate,init_metro_politan_area,wr_option);
					}
				 
				 	String[] othr_addrids = request.getParameterValues("initulcaotherloc_addrid[]");
				  	String[] othr_line1s = request.getParameterValues("initulca_othr_line1[]");
					String[] othr_line2s = request.getParameterValues("initulca_othr_line2[]");
					String[] othr_citys = request.getParameterValues("initulca_othr_city[]");
					String[] othr_states = request.getParameterValues("initulca_othr_state[]");
					String[] othr_zipcodes = request.getParameterValues("initulca_othr_zipcode[]");
					String[] lca_othr_remote_metros = request.getParameterValues("initulca_othr_remote_metro[]");
					      
					if (othr_line1s != null) {
						for (int t = 1; t < othr_line1s.length; t++) {
							Integer addr_id=Integer.parseInt(othr_addrids[t]);
							 String othr_line1=othr_line1s[t];
			    			 String othr_line2=othr_line2s[t];
			    			 String othr_city=othr_citys[t];
			    			 String othr_state=othr_states[t];
			    			 String othr_zipcode=othr_zipcodes[t];
			    			 String othr_metro = lca_othr_remote_metros[t];
			    			/* System.out.println("addr_id***"+addr_id);
			    			 System.out.println("othr_line1***"+othr_line1);
			    			 System.out.println("othr_line2***"+othr_line2);
			    			 System.out.println("othr_city***"+othr_city);
			    			 System.out.println("othr_state***"+othr_state);
			    			 System.out.println("othr_zipcode***"+othr_zipcode);
			    			 System.out.println("othr_metro***"+othr_metro);*/
			    			  immiService.updateCompanyAddress(addr_id, lgempno, othr_line1,othr_line2,othr_city,othr_state,othr_zipcode,othr_metro);
						   }
					 }
				 
				 
		
		  if(message.equalsIgnoreCase("Success")) {
			  message="Updated LCA Questionnaire Details Successfully";
		      }else{
		    	  message="Failed To Update LCA Questionnaire Details";
		      }
			}else {
				message = null;
			}
		} catch (Exception e) {
			logger.error("Error in InitiateLCAQDetails" + e);
		}
		return message;
	}
	
	@RequestMapping(value = { "/immitempreg" }, method = RequestMethod.GET)
	public String addCandidate(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession(true);
		try {
			String userName = (String) request.getSession().getAttribute("username");
			if (userName == null) {
				return "redirect:/loginpage";
			} else {
			List<TempCandidateDetailsDTO> candidateList = immiService.getImmiCandidateList();
			List<WorkAuthorization> workAuthList = empService.getWorkAuthnList();
			session.setAttribute("waList", workAuthList);
			model.addAttribute("candidateList", candidateList);
			}
		} catch (Exception e) {
			logger.error("Error in get immitempreg method Immigration Controller page" + e);
		}
		return "ImmiTempRegistration";
	}
	
	@RequestMapping(value = { "/saveImmiCandidate" }, method = RequestMethod.POST)
	@ResponseBody
	public String saveCandidateDetails(Model model, HttpServletRequest request, HttpServletResponse response) {
		String message = null;
		try {
			Integer lgempno = (Integer) request.getSession().getAttribute("empno");
			if (lgempno != null) {
				String fname = request.getParameter("fname");
				String lname = request.getParameter("lname");
				String ssn = "";//request.getParameter("ssn")
				String phne_no = request.getParameter("phne_no");
				String emailid = request.getParameter("emailid");
				String uname = empService.checkUserName(fname, null, lname);
				Integer candidateId = immiService.saveImmiCandidate(fname, ssn, phne_no, emailid, lgempno, lname,uname);
				if (candidateId > 0) {
					message = fname + " " + lname + " added successfully";
				}
			} else {
				message = null;
			}
		} catch (Exception e) {
			logger.error("Error in saveImmiCandidate" + e.getStackTrace());
		}
		return message;
	}
	@RequestMapping(value = { "/updateImmiCandidate" }, method = RequestMethod.POST)
	@ResponseBody
	public String updatecandidate(Model model, HttpServletRequest request, HttpServletResponse response) {
		String message = null;
		try {
			Integer lgempno = (Integer) request.getSession().getAttribute("empno");
			if (lgempno != null) {
				String candidateId = request.getParameter("candidateId");
				String fname = request.getParameter("efname");
				String lname = request.getParameter("elname");
				String phne_no = request.getParameter("ephne_no");
				String emailid = request.getParameter("eemailid");
				String uname = empService.checkUserName(fname, null, lname);
				String msg = immiService.updateImmiCandidate(candidateId, fname, lname, phne_no, emailid, lgempno,uname);
				message = msg;
			} else {
				message = null;
			}
		} catch (Exception e) {
			logger.error("Error in updateImmiCandidate " + e.getStackTrace());
		}
		return message;
	}
	@RequestMapping(value = { "/onboardcandidate" }, method = RequestMethod.GET)
	@ResponseBody
	public String onboardcandidate(Model model, HttpServletRequest request, HttpServletResponse response) {
		String message = null;
		try {
			Integer lgempno = (Integer) request.getSession().getAttribute("empno");
			if (lgempno != null) {
				String candidateId = request.getParameter("candidate_id");
				String work_auth = request.getParameter("work_auth");
				String employee_type = request.getParameter("employee_type");
				
				String msg = immiService.onboardcandidate(candidateId,employee_type,work_auth);
				message = msg;
			} else {
				message = null;
			}
		} catch (Exception e) {
			logger.error("Error in onboardcandidate " + e.getStackTrace());
		}
		return message;
	}
	
	@RequestMapping(value = { "/immidocumenttype" }, method = RequestMethod.GET)
	public String doctypemaster(Model model, HttpServletRequest request, HttpServletResponse response) {
		String userName = (String) request.getSession().getAttribute("username");
		try {
			if (userName == null) {
				return "redirect:/loginpage";
			} else {
				List<ImmiDocumentTypeEntity> docTypeyList = immiService.getDocumentTypeList();
				model.addAttribute("docTypeyList", docTypeyList);
				List<DocumentTypeDto> docsList = immiService.getDocumentsList();
				model.addAttribute("docsList", docsList);
				return "ImmiDocumentsTypeMaster";
			}
		} catch (Exception e) {
			logger.error("Error in ImmiDocumentsTypeMaster GET Method" + e);
		}
		return null;
	}

	@RequestMapping(value = { "/immisavedoctype" }, method = RequestMethod.POST)
	@ResponseBody
	public String savedoctype(Model model, HttpServletRequest request, HttpServletResponse response) {
		String userName = (String) request.getSession().getAttribute("username");
		Integer lgempno = (Integer) request.getSession().getAttribute("empno");
		String message="";
		try {
			if (userName == null) {
				return "redirect:/loginpage";
			} else {
				String docname = request.getParameter("docname");
				message=immiService.savedoctype(docname, lgempno);
				List<ImmiDocumentTypeEntity> docTypeyList = immiService.getDocumentTypeList();
				model.addAttribute("docTypeyList", docTypeyList);
				//return "DocumentsTypeMaster";
			}
		} catch (Exception e) {
			logger.error("Error in immisavedoctype GET Method" + e);
		}
		return message;
	}
	@RequestMapping(value = { "/immiupdatedoctype" }, method = RequestMethod.POST)
	@ResponseBody
	public String updatedoctype(Model model, HttpServletRequest request, HttpServletResponse response) {
		String userName = (String) request.getSession().getAttribute("username");
		String message="";
		try {
			if (userName == null) {
				return "redirect:/loginpage";
			} else {
				String docname = request.getParameter("udocname");
				String docid = request.getParameter("udocid");
				message=immiService.updatedoctype(docname, docid);
			}
		} catch (Exception e) {
			logger.error("Error in immiupdatedoctype GET Method" + e);
		}
		return message;
	}
	@RequestMapping(value = { "/immicheckDocumentType" }, method = RequestMethod.GET)
	@ResponseBody
	public String checkDocumentType(Model model, HttpServletRequest request) {
		String doc_name = null;
		try {
			Integer lgempno = (Integer) request.getSession().getAttribute("empno");
			if (lgempno != null) {
				String docname = request.getParameter("docname");
				doc_name = immiService.checkDocumentType(docname);
			} else {
				doc_name = null;
			}
		} catch (Exception e) {
			logger.error("Error in immicheckDocumentType" + e);
		}
		return doc_name;
	}
	
	@RequestMapping(value = { "/immisavesubdoctype" }, method = RequestMethod.POST)
	@ResponseBody
	public String savesubdoctype(Model model, HttpServletRequest request, HttpServletResponse response) {
		String userName = (String) request.getSession().getAttribute("username");
		Integer lgempno = (Integer) request.getSession().getAttribute("empno");
		String message="";
		try {
			if (userName == null) {
				return "redirect:/loginpage";
			} else {
				String doctypeid = request.getParameter("doctypeid");
				String subdocname = request.getParameter("subdocname");
				String issubbycand = request.getParameter("issubdocname");
				String sameas_doctype = request.getParameter("sameas_doctype");
				
				System.out.println("issubbycand******"+issubbycand);
				message=immiService.savesubdoctype(doctypeid,subdocname, lgempno,issubbycand,sameas_doctype);
				List<ImmiDocumentTypeEntity> docTypeyList = immiService.getDocumentTypeList();
				model.addAttribute("docTypeyList", docTypeyList);
				List<DocumentTypeDto> docsList = immiService.getDocumentsList();
				model.addAttribute("docsList", docsList);
			}
		} catch (Exception e) {
			logger.error("Error in immisavedoctype GET Method" + e);
		}
		return message;
	}
	
	@RequestMapping(value = { "/immicheckDocumentSubType" }, method = RequestMethod.GET)
	@ResponseBody
	public String checkDocumentSubType(Model model, HttpServletRequest request) {
		String doc_name = null;
		try {
			Integer lgempno = (Integer) request.getSession().getAttribute("empno");
			if (lgempno != null) {
				String docname = request.getParameter("docname");
				doc_name = immiService.checkDocumentSubType(docname);
			} else {
				doc_name = null;
			}
		} catch (Exception e) {
			logger.error("Error in immicheckDocumentSubType" + e);
		}
		return doc_name;
	}
	@RequestMapping(value = { "/immiupdatesubdoctype" }, method = RequestMethod.POST)
	@ResponseBody
	public String updateSubdocType(Model model, HttpServletRequest request, HttpServletResponse response) {
		String userName = (String) request.getSession().getAttribute("username");
		String message="";
		try {
			if (userName == null) {
				return "redirect:/loginpage";
			} else {
				String usubdocname = request.getParameter("usubdocname");
				String doctypeid = request.getParameter("udoctypeid");
				String usubdocid = request.getParameter("usubdocid");
				String issubbycand = request.getParameter("uissubdocname");
				System.out.println("issubbycand******"+issubbycand);
				System.out.println(doctypeid+"--------"+usubdocid+"---usubdocname---"+usubdocname);
				message=immiService.updateSubdocType(usubdocname, doctypeid,usubdocid,issubbycand);
			}
		} catch (Exception e) {
			logger.error("Error in immiupdatesubdoctype GET Method" + e);
		}
		return message;
	}
	
	@RequestMapping(value = { "/getSocCodeList" }, method = RequestMethod.GET)
	@ResponseBody
	public EndClientDetialDto getSocCodeList(Model model, HttpServletRequest request) {
		EndClientDetialDto endClient = null;
		try {
			endClient=new EndClientDetialDto();
			List<SOCcodeMasterEntity> soccodeList = h1bService.getSocCodeMasterList();
			endClient.setSocCodeList(soccodeList);
		} catch (Exception e) {
			logger.error("Error in getSocCodeList" + e);
		}
		return endClient;
	}
	
	@RequestMapping(value = { "/immicheckDocumentTypeissame" }, method = RequestMethod.GET)
	@ResponseBody
	public DocumentTypeDto immicheckDocumentTypeissame(Model model, HttpServletRequest request) {
		DocumentTypeDto docDto = null;
		try {
			Integer lgempno = (Integer) request.getSession().getAttribute("empno");
			if (lgempno != null) {
				String docTypeid = request.getParameter("docTypeid");
				docDto = immiService.immicheckDocumentTypeIssame(docTypeid);
			} else {
				docDto = null;
			}
		} catch (Exception e) {
			logger.error("Error in immicheckDocumentTypeissame" + e);
		}
		return docDto;
	}
}