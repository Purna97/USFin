package com.tekskills.ServiceImpl;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.apache.commons.io.FilenameUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.sun.org.apache.xerces.internal.impl.dv.util.Base64;
import com.tekskills.Dao.BGCDao;
import com.tekskills.Dao.EmployeesDao;
import com.tekskills.Dao.ImmigrationDao;
import com.tekskills.Dao.TimesheetDao;
import com.tekskills.Dto.BasicDetailsDto;
import com.tekskills.Dto.ClientVendorMaster_DTO;
import com.tekskills.Dto.DocEmpBean;
import com.tekskills.Dto.DocumentTypeDto;
import com.tekskills.Dto.EmployeeDto;
import com.tekskills.Dto.EndClientDetialDto;
import com.tekskills.Dto.LCADetailsDto;
import com.tekskills.Dto.MailingDto;
import com.tekskills.Dto.ManagerDto;
import com.tekskills.Dto.TaskDetailsDto;
import com.tekskills.Dto.TempCandidateDetailsDTO;
import com.tekskills.Entity.CandidateDetailedInfo;
import com.tekskills.Entity.ClientDetailsEntity;
import com.tekskills.Entity.ClientDetailsHistoryEntity;
import com.tekskills.Entity.CompanyAdressEntity;
import com.tekskills.Entity.DocumentSubTypeEntity;
import com.tekskills.Entity.DocumentTypeEntity;
import com.tekskills.Entity.EmpBasicDetailsEntity;
import com.tekskills.Entity.EmpDocumentsEntity;
import com.tekskills.Entity.EmpPayRateDetails;
import com.tekskills.Entity.ImmiDocumentSubTypeEntity;
import com.tekskills.Entity.ImmiDocumentTypeEntity;
import com.tekskills.Entity.LCADetailsEntity;
import com.tekskills.Entity.PageStatusEntity;
import com.tekskills.Entity.TaskDetailsEntity;
import com.tekskills.Service.BGCService;
import com.tekskills.Service.ContractorsService;
import com.tekskills.Service.ImmigrationService;
import com.tekskills.Util.Commons;
import com.tekskills.Util.SendHtmlEmailNew;


@Service
public class ImmigrationServiceImpl implements ImmigrationService {
	private static final Logger logger = Logger.getLogger(ImmigrationServiceImpl.class);
	@Autowired
	ImmigrationDao immiDao;
	@Autowired
	ContractorsService contractService;
	@Autowired
	BGCService bgcService;
	@Autowired
	TimesheetDao timesheetDao;
	@Autowired
	private SendHtmlEmailNew sendmail;
	@Autowired
	private Commons commonObj;
	@Autowired
	EmployeesDao empDao;
	@Autowired
	BGCDao bgcDao;
	
	@Override
	public List<BasicDetailsDto> getW2CandidateList() {
		List<BasicDetailsDto> canList = null;
		try {
			canList = immiDao.getW2CandidateList();
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return canList;	
	}
	
	@Override
	public List<BasicDetailsDto> getW2CandidateListrepo() {
		List<BasicDetailsDto> canList = null;
		try {
			canList = immiDao.getW2CandidateListrepo();
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return canList;	
	}
	@Override
	public List<ClientVendorMaster_DTO> getEndclientListByCandidateId(String candidateId) {
		List<ClientVendorMaster_DTO> canList = null;
		try {
			Integer candidate_Id = 0;
			if (candidateId!="") {
				candidate_Id = Integer.parseInt(candidateId);
			}
			canList = immiDao.getEndclientListByCandidateId(candidate_Id);
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return canList;	
	}
	@Override
	public EndClientDetialDto getlcaquestionaries(String candidateid, String clientid) {
		EndClientDetialDto questionaryObj =new EndClientDetialDto();
		try {
			Integer candidate_Id = 0;Integer client_id = 0;
			if (candidateid!="") {
				candidate_Id = Integer.parseInt(candidateid);
			}if (clientid!="") {
				client_id = Integer.parseInt(clientid);
			}
		ClientDetailsEntity clientObj = immiDao.getEndClientDetailsById(candidate_Id,client_id);
			if(clientObj!=null) {
				CompanyAdressEntity endclientaddresObj=immiDao.getEndclientAddressByclientId(client_id);
				CompanyAdressEntity remoteaddressObj=immiDao.getRemoteAddressByclientId(client_id);
				questionaryObj.setClientObj(clientObj);
				questionaryObj.setEndclientaddres(endclientaddresObj);
				questionaryObj.setRemoteaddress(remoteaddressObj);
				List<CompanyAdressEntity> lcaLocationList=immiDao.getlcaLocationListByclientId(client_id);
				questionaryObj.setLcaLocationList(lcaLocationList);
				
			}
			List<ImmiDocumentTypeEntity> docTypeyList = immiDao.getDocumentTypeList();
			questionaryObj.setDocTypeyList(docTypeyList);
			
			
			
			/*List<LCADetailsDto>	lcaList = immiDao.getAllLCAListByClientId(client_id);
			questionaryObj.setLcaList(lcaList);*/
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return questionaryObj;	
	}
	@Override
	public List<TaskDetailsDto> gettaskdetailsbyids(String candidateid, String clientid, String type) {
		List<TaskDetailsDto> taskList = null;
		try {
			Integer candidate_Id = 0;Integer client_id = 0;Integer payrateid=0;
			if (candidateid!="") {
				candidate_Id = Integer.parseInt(candidateid);
			}
		if (clientid!="") {
				client_id = Integer.parseInt(clientid);
			}
		/*		ClientDetailsEntity clientObj = immiDao.getEndClientDetailsById(candidate_Id,client_id);
			if(clientObj!=null) {
				Integer payrateid=clientObj.getPayrate_id();*/
				taskList = immiDao.gettaskdetailsbyids(candidate_Id,client_id,type);
			//}
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return taskList;	
	}
	@Override
	public TaskDetailsEntity getTaskdetailsById(String taskid) {
		TaskDetailsEntity taskObj = null;
		try {
			Integer task_Id = 0;
			if (taskid!="") {
				task_Id = Integer.parseInt(taskid);
			}
			taskObj = immiDao.getTaskdetailsById(task_Id);
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return taskObj;	
	}
	@Override
	public String updatetask(String taskid, String taskstatus, String duedate, String description, String comments, String emailid) {
		String msg="";
		try {
			Integer task_Id = 0;
			if (taskid!="") {
				task_Id = Integer.parseInt(taskid);
			}
			System.out.println("emailid----------------"+emailid);
			TaskDetailsEntity taskObj = immiDao.getTaskdetailsById(task_Id);
			if(taskObj!=null) {
				taskObj.setTask_status(taskstatus);
				taskObj.setDue_date(duedate);
				taskObj.setTask_description(description);
				taskObj.setComments(comments);
				immiDao.updatetask(taskObj);	
				
				if(taskstatus.equalsIgnoreCase("Closed")) {
					TaskDetailsEntity newtaskObj = immiDao.getTaskdetailsById(task_Id);
					//ClientDetailsEntity clientObj= immiDao.getEndclientByClientId(newtaskObj.getClient_id());
					EmpBasicDetailsEntity basicObj=empDao.getEmployeeDetailsByCandidateId(newtaskObj.getCandidate_id());
					/*String cname="";
					if(clientObj.getClientName()!=null) {
						 cname=clientObj.getClientName();
					}else {
						cname="";
					}*/
				/*	String tablecontent = "<html><body><table cellpadding='5' cellspacing='0' border='1'><tr><th>Task Name</th>"
							+ "<th>Task Description</th><th>Candidate Name</th><th>Client Name</th><th>Task Created Date</th>"
							+ "<th>Due Date</th><th>Status</th><th>Comments</th></tr><tr><td>"+newtaskObj.getTask_name()+"</td>"
							+ "<td>"+newtaskObj.getTask_description()+ "</td><td>" + basicObj.getFirst_name() + "</td>"
							+ "<td>" +cname+ "</td><td>" + newtaskObj.getCreated_date()+"</td>"
							+ "<td>" + newtaskObj.getDue_date() + "</td><td>"+newtaskObj.getTask_status()+"</td>"
							+ "<td>" + newtaskObj.getComments() + "</td></tr></table></body></html>";*/
					
					String tablecontent = "<html><body><table cellpadding='5' cellspacing='0' border='1'><tr><th>Task Name</th>"
							+ "<th>Task Description</th><th>Candidate Name</th><th>Task Created Date</th>"
							+ "<th>Due Date</th><th>Status</th><th>Comments</th></tr><tr><td>"+newtaskObj.getTask_name()+"</td>"
							+ "<td>"+newtaskObj.getTask_description()+ "</td><td>" + basicObj.getFirst_name() + "</td>"
							+ "<td>" + newtaskObj.getCreated_date()+"</td>"
							+ "<td>" + newtaskObj.getDue_date() + "</td><td>"+newtaskObj.getTask_status()+"</td>"
							+ "<td>" + newtaskObj.getComments() + "</td></tr></table></body></html>";
					
					String subject=""+newtaskObj.getDocumenttype_name()+" Task Status has been "+newtaskObj.getTask_status()+"";
					String bodycontent="Please find below Task Status details: ";
					String fromemail=emailid;String toemail=emailid;
					sendmail.sendTaskStatusMail(fromemail,toemail,subject,tablecontent,bodycontent);
				}
				msg="Task Details Updated Successfully";
			}else {
				msg="Task Details Not Updated";
			}
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return msg;	
	}
	@Override
	public String addtask(String taskname, String duedate, String description, Integer empno, String lcaRefNo,String candidateid) {
		String msg="";
		try {
			Integer lcaId = 0;
			if (lcaRefNo!="") {
				lcaId = Integer.parseInt(lcaRefNo);
			}
			Integer candidate_Id=0;
			if (candidateid!="") {
				candidate_Id = Integer.parseInt(candidateid);
			}
			
			LCADetailsEntity lcaObj=immiDao.getLcaDetailsById(lcaId);
			ClientDetailsEntity clientObj = immiDao.getEndClientDetailsById(candidate_Id,lcaObj.getClient_id());
			if(clientObj!=null) {
			TaskDetailsEntity taskObj =new TaskDetailsEntity();
			 SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
		      Calendar c = Calendar.getInstance();
		      c.setTime(new Date()); // Now use today date.
		      c.add(Calendar.DATE, 7); // Adding 7 days
		      String date = sdf.format(c.getTime());
				taskObj.setTask_name(taskname);
				taskObj.setTask_status("Open");
				taskObj.setDue_date(date);
				taskObj.setCreated_date(new Date());
				taskObj.setTask_description(description);
				taskObj.setClient_id(clientObj.getClient_id());
				taskObj.setPayrate_id(clientObj.getPayrate_id());
				taskObj.setCandidate_id(candidate_Id);
				taskObj.setDocumenttype_name("LCA");
				taskObj.setImmigration_id(lcaId);
				taskObj.setPosted_by(empno);
				Integer taskid=immiDao.addtask(taskObj);	
				if(taskid!=null) {
				msg="Task Details Added Successfully";
			}else {
				msg="Task Details Not Added";
			 }
		   }
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return msg;	
	}
	@Override
	public List<DocEmpBean> getLCAHistory(String candidateid, String clientid) {
		List<DocEmpBean> lcaHistoryList = null;
		try {
			Integer candidate_Id = 0;Integer client_id = 0;
			if (candidateid!="") {
				candidate_Id = Integer.parseInt(candidateid);
			}if (clientid!="") {
				client_id = Integer.parseInt(clientid);
			}
			lcaHistoryList = immiDao.getLCAHistory(candidate_Id,client_id);
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return lcaHistoryList;	
	}
	@Override
	public String saveAmendment(String candidateid, String clientid, String amendment, Integer loginempno) {
		String msg="";
		try {
			Integer candidate_Id = 0;Integer client_id = 0;
			if (candidateid!="") {
				candidate_Id = Integer.parseInt(candidateid);
			}if (clientid!="") {
				client_id = Integer.parseInt(clientid);
			}
			
			ClientDetailsEntity clientObj=immiDao.getEndClientDetailsById(candidate_Id,client_id);
			if(clientObj!=null) {
				if(clientObj.getAmendment_status()==null) {
					String[] tasks = {"Upload H1B", "Upload H1B Questionnaire", "Upload PAF"};
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
						      taskObj.setDocumenttype_name("H-1B");
						      taskObj.setPosted_by(loginempno);
						      taskObj.setPayrate_id(clientObj.getPayrate_id());
						      taskObj.setCandidate_id(clientObj.getCandidate_id());
						      taskObj.setClient_id(clientObj.getClient_id());
						      immiDao.saveTaskDetails(taskObj);
						    }
					}
				clientObj.setAmendment_status(amendment);
				empDao.updateClientDetails(clientObj);
				ClientDetailsEntity clientObjnew=immiDao.getEndClientDetailsById(candidate_Id,client_id);
				
				
				
				msg=clientObjnew.getAmendment_status();
			}
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return msg;	
	}
	@Override
	public ClientDetailsEntity getEndclientByClientId(String clientid) {
		ClientDetailsEntity clientObj = null;
		try {
			Integer client_id = 0;
			if (clientid!="") {
				client_id = Integer.parseInt(clientid);
			}
			clientObj = immiDao.getEndclientByClientId(client_id);
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return clientObj;	
	}
	
	@Override
	public void updateLCADetails(String docInput,MultipartFile file , String lcaNumber, 
			String county, String lcaBeginDate, String lcaEndDate,String caseType, String lcaCertifiedDate, 
			String soc_code, String job_title, String wageRate, String wageLevel, String prevailingWage, 
			String lcaSubDate, Integer lgempno, String lcapayrateId, String lcacandidateId,
			String lcaclientId, String documenttype, String documentsubtype, String lcaId,Integer lgcandidateid) {
		try {
			Integer lcapayrate_Id = 0;
			if (lcapayrateId!="") {
				lcapayrate_Id = Integer.parseInt(lcapayrateId);
			}
			Integer lcacandidate_Id = 0;
			if (lcacandidateId!="") {
				lcacandidate_Id = Integer.parseInt(lcacandidateId);
			}
			Integer client_id = 0;
			if (lcaclientId!="") {
				client_id = Integer.parseInt(lcaclientId);
			}
			
			Integer documenttype_id = 0;
			if (documenttype!="") {
				documenttype_id = Integer.parseInt(documenttype);
			}
			
			Integer documentsubtype_id = 0;
			if (documentsubtype!="") {
				documentsubtype_id = Integer.parseInt(documentsubtype);
			}
			Integer lca_Id = 0;
			if (lcaId!="") {
				lca_Id = Integer.parseInt(lcaId);
			}
			
		//	EmpPayRateDetails payRateObj=empDao.getPayrateDetailsByPayrateId(lcapayrate_Id);
			
			LCADetailsEntity lcaObj =immiDao.getLcaDetailsById(lca_Id);
			lcaObj.setCandidate_id(lcacandidate_Id);
			lcaObj.setPayrate_id(lcapayrate_Id);
			if(lcaObj.getLca_number()==null) {
				lcaObj.setLca_number(lcaNumber);	
			}
			
			/*if(caseType!=null) {
				lcaObj.setLca_begin_date(lcaBeginDate);
				lcaObj.setLca_end_date(lcaEndDate);
			}*/
			lcaObj.setLca_submitted_date(lcaSubDate);
			lcaObj.setLca_certified_date(lcaCertifiedDate);
			lcaObj.setJob_title(job_title);
			lcaObj.setSoc(soc_code);
			lcaObj.setCase_type(caseType);
			//lcaObj.setWage_rate(wageRate);
			lcaObj.setWage_level(wageLevel);
			lcaObj.setPreviling_wage(prevailingWage);
			lcaObj.setPosted_by(lgempno);
			lcaObj.setClient_id(client_id);
			immiDao.updateLCADetails(lcaObj);
			
			/*MailingDto maildto=new MailingDto();
			EmployeeDto lgcandidateObj=empDao.getCanidateDetailsByCanId(lgcandidateid);
			BasicDetailsDto lca_candidateObj=empDao.viewEmployeeInfo(lcacandidate_Id);
			List<ManagerDto> hrtoList=empDao.getHRList();
			List<String> cclist=new ArrayList<String>();
			if(hrtoList.size()>0) {
				for (ManagerDto hrnameobj : hrtoList) {
					cclist.add(hrnameobj.getEmailId());
				}
				
			}
			String frommail = lgcandidateObj.getEmailid();
			String subject = "Update Job Title For The Candidate Of  "+lca_candidateObj.getFullname()+"";
			String comments = "Please Update Job Title For The Candidate Of  "+lca_candidateObj.getFullname()+"";
			String fromname=lgcandidateObj.getFull_name();
			String toname="Team";
			
			maildto.setFrommail(frommail);maildto.setCclist(cclist);
			maildto.setFromname(fromname);maildto.setToname(toname);
			maildto.setSubject(subject);maildto.setComments(comments);
			
			sendmail.basicDetailsReminder(maildto);*/
			
			CandidateDetailedInfo candidateObj=empDao.getCandidateDetailedInfoById(lcacandidate_Id);
			if(candidateObj!=null) {
				candidateObj.setDesignation(job_title);
				empDao.updateCandidateDetailedInfo(candidateObj);
				
			}else {
				MailingDto maildto=new MailingDto();
				BasicDetailsDto lgcandidateObj=empDao.viewEmployeeInfo(lgcandidateid);
				BasicDetailsDto lca_candidateObj=empDao.viewEmployeeInfo(lcacandidate_Id);
				List<ManagerDto> hrtoList=empDao.getHRList();
				List<String> cclist=new ArrayList<String>();
				if(hrtoList.size()>0) {
					for (ManagerDto hrnameobj : hrtoList) {
						cclist.add(hrnameobj.getEmailId());
					}
					
				}
				String frommail = lgcandidateObj.getEmailid();
				String subject = "Update Job Title For The Candidate Of  "+lca_candidateObj.getFullname()+"";
				String comments = "Please Update Job Title For The Candidate Of  "+lca_candidateObj.getFullname()+"";
				String fromname=lgcandidateObj.getFullname();
				String toname="Hi Team";
				
				maildto.setFrommail(frommail);maildto.setCclist(cclist);
				maildto.setFromname(fromname);maildto.setToname(toname);
				maildto.setSubject(subject);maildto.setComments(comments);
				
				sendmail.basicDetailsReminder(maildto);
				
			}
			/*if(!lcaBeginDate.isEmpty()||!lcaEndDate.isEmpty()) {
				 lcaDocumentDate=lcaDocName+"_"+lcaBeginDate+"_"+lcaEndDate;
			}else {
				DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
				Date d1 = df.parse(payRateObj.getProj_startDate());
				Date d2 = df.parse(payRateObj.getProj_endDate());
				SimpleDateFormat formatter = new SimpleDateFormat("MM-dd-yyyy");
				String strDate= formatter.format(d1);
				String endDate= formatter.format(d2);
				 lcaDocumentDate=lcaDocName+"_"+strDate+"_"+endDate;
				
			}*/
			
			String documentName="";	
			DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
			if(!lcaBeginDate.isEmpty() || !lcaEndDate.isEmpty()) {
				Date d1 = df.parse(lcaBeginDate);
				Date d2 = df.parse(lcaEndDate);
				 SimpleDateFormat formatter = new SimpleDateFormat("MM-dd-yyyy");
				String strDate= formatter.format(d1);
				String endDate= formatter.format(d2);
				documentName=docInput+"_"+strDate+"_"+endDate;
			}else {
				documentName=docInput;
			}
			if(file!=null) {
				if(!file.getOriginalFilename().isEmpty()) {
					EmpDocumentsEntity pdocobj=new EmpDocumentsEntity();
					pdocobj.setFile_name(file.getOriginalFilename().replace(file.getOriginalFilename(), FilenameUtils.getBaseName(documentName) + "." + FilenameUtils.getExtension(file.getOriginalFilename())));
					pdocobj.setFiletype("LCA");
					pdocobj.setCandidate_id(lcacandidate_Id);
					pdocobj.setPayrate_id(lcapayrate_Id);
					pdocobj.setStatus("Active");
					pdocobj.setPostedBy(lgempno);
					pdocobj.setSubmit_date(new Date());
					pdocobj.setLca_id(lca_Id);
					pdocobj.setInputvalue(docInput);
					pdocobj.setClient_id(client_id);
					if(!lcaBeginDate.isEmpty()) {
						pdocobj.setFrom_date(lcaBeginDate);
					}
					if(!lcaEndDate.isEmpty()) {
						pdocobj.setExpiry_date(lcaEndDate);
					}
					pdocobj.setDocumenttype_id(documenttype_id);
					pdocobj.setDocumentsubtype_id(documentsubtype_id);
					commonObj.ImmigrationfileToDirectory(lcacandidate_Id,file,documentName);
					empDao.saveDocuments(pdocobj);
				   }
				}
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
	}
	
	@Override
	public String checkImmigrationSelectedFileName(String lcapayrateId, String docInput, String docType) {
		String fName = null;
		try {
			Integer lcapayrate_Id = 0;
			if (lcapayrateId!="") {
				lcapayrate_Id = Integer.parseInt(lcapayrateId);
			}
			EmpPayRateDetails payRateObj=empDao.getPayrateDetailsByPayrateId(lcapayrate_Id);
			DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
			Date d1 = df.parse(payRateObj.getProj_startDate());
			Date d2 = df.parse(payRateObj.getProj_endDate());
			 SimpleDateFormat formatter = new SimpleDateFormat("MM-dd-yyyy");
			String strDate= formatter.format(d1);
			String endDate= formatter.format(d2);
			String fileName=docInput+"_"+strDate+"_"+endDate+"."+docType;
			if(!docType.isEmpty()) {
				fName = empDao.checkSelectedFileName(fileName);
			}else {
				fName = empDao.checkSelectedFileInput(docInput);
			}
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return fName;
	}
	@Override
	public void saveImmigrationDocument(String docInput, MultipartFile file, String startdate, String enddate,
			Integer lgempno, String payrateId, String candidateId, String clientId, String documenttype,
			String documentsubtype, String fileType, String lcaId) {
		try {
			Integer payrate_Id = 0;
			if (payrateId!="") {
				payrate_Id = Integer.parseInt(payrateId);
			}
			Integer candidate_Id = 0;
			if (candidateId!="") {
				candidate_Id = Integer.parseInt(candidateId);
			}
			Integer client_id = 0;
			if (clientId!="") {
				client_id = Integer.parseInt(clientId);
			}
			
			Integer documenttype_id = 0;
			if (documenttype!="") {
				documenttype_id = Integer.parseInt(documenttype);
			}
			
			Integer documentsubtype_id = 0;
			if (documentsubtype!="") {
				documentsubtype_id = Integer.parseInt(documentsubtype);
			}
			
			Integer lca_Id = 0;
			if (lcaId!="") {
				lca_Id = Integer.parseInt(lcaId);
			}
			String documentName="";	
			DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
			if(!startdate.isEmpty() || enddate!=null ) {
				Date d1 = df.parse(startdate);
				String endDate="";
				SimpleDateFormat formatter = new SimpleDateFormat("MM-dd-yyyy");
				if(!enddate.isEmpty()) {
					Date d2 = df.parse(enddate);
					endDate= formatter.format(d2);
				}
				String strDate= formatter.format(d1);
				documentName=docInput+"_"+strDate+"_"+endDate;
			}else {
				documentName=docInput;
			}
			System.out.println("lcaDocumentName **********"+documentName);
			if(file!=null) {
				if(!file.getOriginalFilename().isEmpty()) {
					EmpDocumentsEntity pdocobj=new EmpDocumentsEntity();
					pdocobj.setFile_name(file.getOriginalFilename().replace(file.getOriginalFilename(), FilenameUtils.getBaseName(documentName) + "." + FilenameUtils.getExtension(file.getOriginalFilename())));
					pdocobj.setFiletype(fileType);
					pdocobj.setCandidate_id(candidate_Id);
					pdocobj.setPayrate_id(payrate_Id);
					pdocobj.setClient_id(client_id);
					pdocobj.setStatus("Active");
					pdocobj.setPostedBy(lgempno);
					pdocobj.setSubmit_date(new Date());
					pdocobj.setInputvalue(docInput);
					
					if(!startdate.isEmpty()) {
						pdocobj.setFrom_date(startdate);
					}
					if(enddate!=null) {
					if(!enddate.isEmpty()) {
						pdocobj.setExpiry_date(enddate);
					}
					}
					pdocobj.setLca_id(lca_Id);
					pdocobj.setDocumenttype_id(documenttype_id);
					pdocobj.setDocumentsubtype_id(documentsubtype_id);
					commonObj.ImmigrationfileToDirectory(candidate_Id,file,documentName);
					empDao.saveDocuments(pdocobj);
				   }
				}
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
	}
	@Override
	public String checkLCANumber(String lcaNumber) {
		String lca = null;
		try {
			lca = immiDao.checkLCANumber(lcaNumber);
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return lca;
	}
	@Override
	public List<LCADetailsDto>  getAllLCAList(String candidateid,String clientid) {
		List<LCADetailsDto> lcaList = null;
		try {
			Integer candidate_Id = 0;Integer clientidId = 0;
			if (candidateid!="") {
				candidate_Id = Integer.parseInt(candidateid);
			}
			if (clientid!="") {
				clientidId = Integer.parseInt(clientid);
			}
			lcaList = immiDao.getAllLCAList(candidate_Id,clientidId);
			
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return lcaList;
	}
	@Override
	public EndClientDetialDto getsubdocsbydoclcaid(String lcaid, String docid) {
		EndClientDetialDto endClient = new EndClientDetialDto();
		try {
			Integer lca_id=0;
			if (lcaid!="") {
				lca_id = Integer.parseInt(lcaid);
			}
			Integer doc_id=0;
			if (docid!="") {
				doc_id = Integer.parseInt(docid);
			}
			Integer docCount=immiDao.getDocumentCountByLcaId(lca_id);
			System.out.println("docCount********"+docCount);
			List<DocumentTypeDto> subdocTypeList = immiDao.getsubdoctypesbydocid(doc_id,docCount);
			
			LCADetailsEntity lcaObj=immiDao.getLcaDetailsById(lca_id);
			ClientDetailsEntity clientObj = immiDao.getEndClientDetailsById(lcaObj.getCandidate_id(),lcaObj.getClient_id());
			if(clientObj!=null) {
				CompanyAdressEntity endclientaddresObj=immiDao.getEndclientAddressByclientId(lcaObj.getClient_id());
				CompanyAdressEntity remoteaddressObj=immiDao.getRemoteAddressByclientId(lcaObj.getClient_id());
				endClient.setLcaObj(lcaObj);
				endClient.setClientObj(clientObj);
				endClient.setEndclientaddres(endclientaddresObj);
				endClient.setRemoteaddress(remoteaddressObj);
			  }
	    List<DocumentTypeDto> lcaList = immiDao.getsubdoctypesbylcaid(lca_id);
		if(lcaList.size()==0) {
			subdocTypeList.removeIf(listItem -> listItem.getSubdoctypename().equalsIgnoreCase("Approved LCA") 
	                 ||  listItem.getSubdoctypename().equalsIgnoreCase("Executed LCA"));
		}	
		else if(lcaList.size()==1) {
			subdocTypeList.removeIf(listItem -> listItem.getSubdoctypename().equalsIgnoreCase("LCA Questionnaire") 
	                 ||  listItem.getSubdoctypename().equalsIgnoreCase("Executed LCA"));
		}
		else if(lcaList.size()==2) {
			subdocTypeList.removeIf(listItem -> listItem.getSubdoctypename().equalsIgnoreCase("LCA Questionnaire") 
	                 ||  listItem.getSubdoctypename().equalsIgnoreCase("Approved LCA"));
		}
		else if(lcaList.size()>=3) {
			subdocTypeList.removeIf(listItem -> listItem.getSubdoctypename().equalsIgnoreCase("LCA Questionnaire") 
	                 ||  listItem.getSubdoctypename().equalsIgnoreCase("Approved LCA")
	                 ||  listItem.getSubdoctypename().equalsIgnoreCase("Executed LCA"));
		}

			
			/* List<DocumentTypeDto> finalsubdocTypeList = subdocTypeList.stream()
		              .filter(os -> lcaList.stream()                   
		                  .anyMatch(ns ->                                  
		                       !os.getSubdoctypeid().equals(ns.getSubdoctypeid())))
		              .collect(Collectors.toList());*/
			
			
			endClient.setSubdocTypeList(subdocTypeList);
			endClient.setDocCount(docCount);
			
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return endClient;	
	}
	@Override
	public List<DocEmpBean> lcaDetailsByLcaId(String lcaid) {
		List<DocEmpBean> lcaList = null;
		try {
			Integer lca_id=0;
			if (lcaid!="") {
				lca_id = Integer.parseInt(lcaid);
			}
			lcaList = immiDao.lcaDetailsByLcaId(lca_id);
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return lcaList;
	}
	
	@Override
	public String checksubdocsbydoclcaid(String lcaid, String docid, String subdocid) {
		String message = null;
		try {
			Integer lca_id=0;
			if (lcaid!="") {
				lca_id = Integer.parseInt(lcaid);
			}
			Integer doc_id=0;
			if (docid!="") {
				doc_id = Integer.parseInt(docid);
			}
			Integer subdoc_id=0;
			if (subdocid!="") {
				subdoc_id = Integer.parseInt(subdocid);
			}
			Integer docCount = immiDao.checksubdocsbydoclcaid(lca_id,doc_id,subdoc_id);
			if(docCount>0) {
				message="Exists";
			}else {
				message="Not Exists";
			 }
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return message;
	}
	
	@Override
	public List<DocEmpBean> getdochistorybyId(String lcaid, String docsubtypeid) {
		List<DocEmpBean> lcaList = null;
		try {
			Integer lca_id=0;
			if (lcaid!="") {
				lca_id = Integer.parseInt(lcaid);
			}Integer docsub_Id=0;
			if (docsubtypeid!="") {
				docsub_Id = Integer.parseInt(docsubtypeid);
			}
			lcaList = immiDao.getdochistorybyId(lca_id,docsub_Id);
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return lcaList;
	}
	@Override
	public Integer getlcaIdByCandidateClientId(String candidateid, String clientid) {
		Integer lcaId = 0;
		try {
			Integer candidate_Id = 0;Integer client_id = 0;
			if (candidateid!="") {
				candidate_Id = Integer.parseInt(candidateid);
			}if (clientid!="") {
				client_id = Integer.parseInt(clientid);
			}
			lcaId = immiDao.getlcaIdByCandidateClientId(candidate_Id,client_id);
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return lcaId;	
	}
	@Override
	public String updateLCADocuments(MultipartFile editFile, Integer loginempno, String candidateid,
			String documentid, String docName, String startdate, String enddate) {
		String msg=null;
		Integer docId=0;
		try {
			Integer candidate_Id = 0;
			if (candidateid!="") {
				candidate_Id = Integer.parseInt(candidateid);
			}
			
			Integer doc_Id = 0;
			if (documentid!="") {
				doc_Id = Integer.parseInt(documentid);
			}
			EmpDocumentsEntity docObjDb=empDao.getDocumentByDocId(doc_Id);
		/*	EmpDocumentsEntity docObjDb=empDao.getDocumentByDocId(doc_Id);
			if(docObjDb!=null) {
				 if(!editFile.getOriginalFilename().isEmpty()) {
					 docObjDb.setStatus("InActive");
					 empDao.updateDocument(docObjDb);
					 
	          	     EmpDocumentsEntity docobj=new EmpDocumentsEntity();
	          	     docobj.setPostedBy(loginempno);
	 			     docobj.setCandidate_id(candidate_Id);
	 			     docobj.setSubmit_date(new Date());
	 			     docobj.setStatus("Active");
	 			     docobj.setFile_name(editFile.getOriginalFilename());
	 			     docobj.setFiletype(docObjDb.getFiletype());
	 			     docobj.setClient_id(docObjDb.getClient_id());
	 			     if(docObjDb.getInputvalue()!=null) {
	 			        docobj.setInputvalue(docObjDb.getInputvalue());
	 			      }
	 			    if(docObjDb.getLca_id()!=null) {
	 			        docobj.setLca_id(docObjDb.getLca_id());
	 			      }
	 			     docobj.setDocumenttype_id(docObjDb.getDocumenttype_id());
	 			     docobj.setDocumentsubtype_id(docObjDb.getDocumentsubtype_id());
	 			     commonObj.ImmigrationH1BfileToDirectory(candidate_Id,null,editFile);
	 			    docId=empDao.saveConsultantDocs(docobj);
	               } 
			 }*/
			
			
			String documentName="";	
			DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
			if(!startdate.isEmpty() || !enddate.isEmpty()) {
				Date d1 = df.parse(startdate);
				Date d2 = df.parse(enddate);
				 SimpleDateFormat formatter = new SimpleDateFormat("MM-dd-yyyy");
				String strDate= formatter.format(d1);
				String endDate= formatter.format(d2);
				documentName=docName+"_"+strDate+"_"+endDate;
			}else {
				documentName=docName;
			}
			if(editFile!=null) {
				if(!editFile.getOriginalFilename().isEmpty()) {
					 docObjDb.setStatus("InActive");
					 empDao.updateDocument(docObjDb);
					EmpDocumentsEntity docobj=new EmpDocumentsEntity();
					docobj.setFile_name(editFile.getOriginalFilename().replace(editFile.getOriginalFilename(), FilenameUtils.getBaseName(documentName) + "." + FilenameUtils.getExtension(editFile.getOriginalFilename())));
					docobj.setCandidate_id(candidate_Id);
					docobj.setStatus("Active");
					docobj.setPostedBy(loginempno);
					docobj.setSubmit_date(new Date());
					docobj.setInputvalue(docName);
					if(!startdate.isEmpty()) {
						docobj.setFrom_date(startdate);
					}
					if(!enddate.isEmpty()) {
						docobj.setExpiry_date(enddate);
					}
					docobj.setPayrate_id(docObjDb.getPayrate_id());
				    docobj.setFiletype(docObjDb.getFiletype());
	 			     docobj.setClient_id(docObjDb.getClient_id());
	 			    if(docObjDb.getLca_id()!=null) {
	 			        docobj.setLca_id(docObjDb.getLca_id());
	 			      }
	 			     docobj.setDocumenttype_id(docObjDb.getDocumenttype_id());
	 			     docobj.setDocumentsubtype_id(docObjDb.getDocumentsubtype_id());
					commonObj.ImmigrationfileToDirectory(candidate_Id,editFile,documentName);
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
	public EndClientDetialDto getLcaQuestionnaireBylcaid(String lcaid) {
		EndClientDetialDto endClient = new EndClientDetialDto();
		try {
			Integer lca_id=0;
			if (lcaid!="") {
				lca_id = Integer.parseInt(lcaid);
			}
			LCADetailsEntity lcaObj=immiDao.getLcaDetailsById(lca_id);
			Integer docCount=immiDao.getDocumentCountByLcaId(lca_id);
			ClientDetailsEntity clientObj = immiDao.getEndClientDetailsById(lcaObj.getCandidate_id(),lcaObj.getClient_id());
			if(clientObj!=null) {
				CompanyAdressEntity endclientaddresObj=immiDao.getEndclientAddressByclientId(lcaObj.getClient_id());
				CompanyAdressEntity remoteaddressObj=immiDao.getRemoteAddressByclientId(lcaObj.getClient_id());
				List<CompanyAdressEntity> lcaLocationList=immiDao.getlcaLocationListByclientId(lcaObj.getClient_id());
				endClient.setLcaObj(lcaObj);
				endClient.setClientObj(clientObj);
				endClient.setEndclientaddres(endclientaddresObj);
				endClient.setRemoteaddress(remoteaddressObj);
				endClient.setDocCount(docCount);
				endClient.setLcaLocationList(lcaLocationList);
			  }
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return endClient;	
	}
	
	@Override
	public String updatelcaqetails(String endclient_name, String endclient_id, String end_addressId,String endline1, String endline2,
			String endcity, String endstate, String endzipcode, Integer lgempno, String organization_name,
			String cand_job_title, String education, String remote_county, String remote_soc_code,
			String workinglocation , String remote_addressId, String remote_line1, 
			String remote_line2, String remote_city, String remote_state, String remote_zipcode, String remote_merto,
			String reason_lca, String lcaid, String lcastartdate, String lcaenddate,
			String wageRate , String lcaPostedDate, String metro_politan_area, String wr_option,String u_duties) {
		String msg = null;
		try {
			String emptype=null;
			Integer endclientId=0;
			if (endclient_id!="") {
				endclientId = Integer.parseInt(endclient_id);
			}
			Integer endaddressId=0;
			if (end_addressId!="") {
				endaddressId = Integer.parseInt(end_addressId);
			}
			
			Integer lca_id=0;
			if (lcaid!="") {
				lca_id = Integer.parseInt(lcaid);
			}
			
			Integer remoteaddressId=0;
			ClientDetailsEntity clientObjDB=immiDao.getClientDetailsByClientId(endclientId);
			if(clientObjDB.getWorkinglocation().equalsIgnoreCase("Remote/Home")) {
				if(remote_addressId!="") {
					remoteaddressId = Integer.parseInt(remote_addressId);
				}
			}
			
			if(clientObjDB!=null) {
			CompanyAdressEntity clientAddressObjDB=immiDao.getCompanyAdressDetailsByAddressId(endaddressId);
			//System.out.println("***client type from DB in client Address details*****"+clientObjDB.getClient_type());
			if(!clientObjDB.getClientName().equalsIgnoreCase(endclient_name) || clientObjDB.getCand_job_title().equalsIgnoreCase(cand_job_title) || clientObjDB.getEducation().equalsIgnoreCase(education) || clientObjDB.getWorkinglocation().equalsIgnoreCase(workinglocation)) {
			
			ClientDetailsHistoryEntity clientHistoyObj=new ClientDetailsHistoryEntity();
			clientHistoyObj.setClient_id(clientObjDB.getClient_id());
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
			clientHistoyObj.setCounty(clientObjDB.getCounty());
			clientHistoyObj.setSoc_code(clientObjDB.getSoc_code());
			clientHistoyObj.setWorkinglocation(clientObjDB.getWorkinglocation());
			clientHistoyObj.setReason_lca(clientObjDB.getReason_lca());
			//clientHistoyObj.setMetro_politan_area(clientObjDB.getMetro_politan_area());
			//if(emptype.equalsIgnoreCase("W2")) {
			clientHistoyObj.setPayrate_id(clientObjDB.getPayrate_id());
			//}
			empDao.updateClientHistoryDetails(clientHistoyObj);
			
			clientObjDB.setClientName(endclient_name);
			clientObjDB.setProject_name(clientObjDB.getProject_name());
			clientObjDB.setFed_id(clientObjDB.getFed_id());
			clientObjDB.setClient_mgr(clientObjDB.getClient_mgr());
			clientObjDB.setClient_mgr_email(clientObjDB.getClient_mgr_email());
			clientObjDB.setClient_mgr_extn(clientObjDB.getClient_mgr_extn());
			clientObjDB.setEmp_mailat_client(clientObjDB.getEmp_mailat_client());
			clientObjDB.setEmp_extnat_client(clientObjDB.getEmp_extnat_client());
			//clientObjDB.setPayrate_id(payRate_Id);
			clientObjDB.setSubmittedOn(new Date());
			clientObjDB.setPosted_by(lgempno);
			clientObjDB.setOrganization_name(clientObjDB.getOrganization_name());
			clientObjDB.setCand_job_title(cand_job_title);
			clientObjDB.setEducation(education);
			clientObjDB.setWorkinglocation(workinglocation);
			clientObjDB.setCounty(remote_county);
			clientObjDB.setSoc_code(remote_soc_code);
			clientObjDB.setReason_lca(reason_lca);
			//clientObjDB.setMetro_politan_area(metro_politan_area);
			clientObjDB.setClient_type(clientObjDB.getClient_type());
			empDao.updateClientDetails(clientObjDB);
			msg="Success";
			//System.out.println("Success Success"+msg);
	       }
			
			//System.out.println("work_authorization&&&&&&"+work_authorization);
			if (workinglocation!=null) {
			if (workinglocation.equalsIgnoreCase("Remote/Home")) {
				String companytype1="Remote/Home";
				CompanyAdressEntity remoteAddressObjDB=immiDao.getCompanyAdressDetailsByAddressId(remoteaddressId);
				if(remoteAddressObjDB!=null) {
				if((remote_line2=="" || remote_line2!="") && remoteAddressObjDB.getLine2()!=null) {
					if(!remoteAddressObjDB.getLine1().equalsIgnoreCase(remote_line1) || !remoteAddressObjDB.getLine2().equalsIgnoreCase(remote_line2) || !remoteAddressObjDB.getCity().equalsIgnoreCase(remote_city) || !remoteAddressObjDB.getState().equalsIgnoreCase(remote_state) || !remoteAddressObjDB.getZipcode().equals(remote_zipcode) || !remoteAddressObjDB.getMetro_politan_area().equals(remote_merto)) {
					//	System.out.println("Insided  remote candidate Address changes"); || !remoteAddressObjDB.getSoc_code().equalsIgnoreCase(remote_soc_code) || !remoteAddressObjDB.getCounty().equals(remote_county)
						CompanyAdressEntity remoteAddressObj = new CompanyAdressEntity();
						remoteAddressObj.setLine1(remote_line1);
						remoteAddressObj.setLine2(remote_line2);
						remoteAddressObj.setCompany_id(remoteAddressObjDB.getCompany_id());
						remoteAddressObj.setCompany_type(companytype1);
						remoteAddressObj.setCity(remote_city);
						remoteAddressObj.setState(remote_state);
						remoteAddressObj.setZipcode(remote_zipcode);
						remoteAddressObj.setMetro_politan_area(remote_merto);
						/*remoteAddressObj.setCounty(remote_county);
						remoteAddressObj.setSoc_code(remote_soc_code);*/
						remoteAddressObj.setStatus("Active");
						remoteAddressObj.setPostedBy(lgempno);
						remoteAddressObj.setSubmitted_on(new Date());
						empDao.saveCompanyAddressDetails(remoteAddressObj);
						remoteAddressObjDB.setStatus("InActive");
					    empDao.updateCompanyAddressInfo(remoteAddressObjDB);
					    msg="Success";
					}else {
			    	   // msg="Error";
					}	
				 }else if((remote_line2=="" || remote_line2!="") && remoteAddressObjDB.getLine2()==null) {
						if(!remoteAddressObjDB.getLine1().equalsIgnoreCase(remote_line1) || !remoteAddressObjDB.getCity().equalsIgnoreCase(remote_city) || !remoteAddressObjDB.getState().equalsIgnoreCase(remote_state) || !remoteAddressObjDB.getZipcode().equals(remote_zipcode) || !remoteAddressObjDB.getMetro_politan_area().equals(remote_merto)) {
								
								// System.out.println("Insided  remote candidate Address changes");  || !remoteAddressObjDB.getSoc_code().equalsIgnoreCase(remote_soc_code) || !remoteAddressObjDB.getCounty().equals(remote_county)
									CompanyAdressEntity remoteAddressObj = new CompanyAdressEntity();
									remoteAddressObj.setLine1(remote_line1);
									 if(remote_line2!="") {
										 remoteAddressObj.setLine2(remote_line2);
								     }
									remoteAddressObj.setCompany_id(remoteAddressObjDB.getCompany_id());
									remoteAddressObj.setCompany_type(companytype1);
									remoteAddressObj.setCity(remote_city);
									remoteAddressObj.setState(remote_state);
									remoteAddressObj.setZipcode(remote_zipcode);
									remoteAddressObj.setMetro_politan_area(remote_merto);
									/*remoteAddressObj.setCounty(remote_county);
									remoteAddressObj.setSoc_code(remote_soc_code);*/
									remoteAddressObj.setStatus("Active");
									remoteAddressObj.setPostedBy(lgempno);
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
						remoteAddressObj.setCompany_id(endclientId);
						remoteAddressObj.setCompany_type(companytype1);
						remoteAddressObj.setCity(remote_city);
						remoteAddressObj.setState(remote_state);
						remoteAddressObj.setZipcode(remote_zipcode);
						remoteAddressObj.setMetro_politan_area(remote_merto);
						/*remoteAddressObj.setCounty(remote_county);
						remoteAddressObj.setSoc_code(remote_soc_code);*/
						remoteAddressObj.setStatus("Active");
						remoteAddressObj.setPostedBy(lgempno);
						remoteAddressObj.setSubmitted_on(new Date());
						empDao.saveCompanyAddressDetails(remoteAddressObj);
				        msg="Success";
				   }
			   }else {
					//System.out.println("Insided  remote candidate Address changes");
					CompanyAdressEntity remoteAddressObjDB1=immiDao.getCompanyAdressDetailsByAddressId(remoteaddressId);
					if(remoteAddressObjDB1!=null) {
						remoteAddressObjDB1.setStatus("InActive");
					    empDao.updateCompanyAddressInfo(remoteAddressObjDB1);
					    msg="Success";
					}
			    }
			}
			
		if(clientAddressObjDB!=null) {
			//System.out.println("Insided client Address");
	     if((endline2=="" || endline2!="") && clientAddressObjDB.getLine2()!=null) {	
		     if(!clientAddressObjDB.getLine1().equalsIgnoreCase(endline1) || !clientAddressObjDB.getLine2().equalsIgnoreCase(endline2) || !clientAddressObjDB.getCity().equalsIgnoreCase(endcity) || !clientAddressObjDB.getState().equalsIgnoreCase(endstate) || !clientAddressObjDB.getZipcode().equals(endzipcode)) {
				//System.out.println("Insided candidate client Address changes");
				CompanyAdressEntity clientAddressObj = new CompanyAdressEntity();
				clientAddressObj.setLine1(endline1);
				clientAddressObj.setLine2(endline2);
				clientAddressObj.setCompany_id(clientAddressObjDB.getCompany_id());
				clientAddressObj.setCompany_type(clientAddressObjDB.getCompany_type());
				clientAddressObj.setCity(endcity);
				clientAddressObj.setState(endstate);
				clientAddressObj.setZipcode(endzipcode);
				clientAddressObj.setMetro_politan_area(metro_politan_area);
				clientAddressObj.setStatus("Active");
				clientAddressObj.setPostedBy(lgempno);
				clientAddressObj.setSubmitted_on(new Date());
				empDao.saveCompanyAddressDetails(clientAddressObj);
				clientAddressObjDB.setStatus("InActive");
			    empDao.updateCompanyAddressInfo(clientAddressObjDB);
			    msg="Success";
			  }else {
				//	System.out.println("Insided candidate client Address no changes");
	    	        //msg="Error";
			    }
			 }else if((endline2=="" || endline2!="") && clientAddressObjDB.getLine2()==null) {
				 if(!clientAddressObjDB.getLine1().equalsIgnoreCase(endline1) || !clientAddressObjDB.getCity().equalsIgnoreCase(endcity) || !clientAddressObjDB.getState().equalsIgnoreCase(endstate) || !clientAddressObjDB.getZipcode().equals(endzipcode)) {
					//	System.out.println("Insided candidate client Address changes");
						CompanyAdressEntity clientAddressObj = new CompanyAdressEntity();
						clientAddressObj.setLine1(endline1);
						clientAddressObj.setLine2(endline2);
						clientAddressObj.setCompany_id(clientAddressObjDB.getCompany_id());
						clientAddressObj.setCompany_type(clientAddressObjDB.getCompany_type());
						clientAddressObj.setCity(endcity);
						clientAddressObj.setState(endstate);
						clientAddressObj.setZipcode(endzipcode);
						clientAddressObj.setMetro_politan_area(metro_politan_area);
						clientAddressObj.setStatus("Active");
						clientAddressObj.setPostedBy(lgempno);
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
			 Integer docCount=immiDao.getDocumentCountByLcaId(lca_id);
			 
			 System.out.println("docCount****"+docCount);
			 
		     if(msg.equalsIgnoreCase("Success")) {
		    	 if(docCount>0) {
		    		 LCADetailsEntity lcaObjDb=immiDao.getLcaDetailsById(lca_id);
			    	 	if(lcaObjDb!=null) {
			    	        lcaObjDb.setLcastatus("InActive");
						    immiDao.inactiveRefNo(lcaObjDb);
			    	 	}
			    	 String[] tasks = {"Upload LCA", "Upload LCA Questionnaire", "Upload PAF"};
					/*	if(organization_name!=null && clientId!=0) {*/
			    	 Integer nlcaId=0;Integer candId=0;
			    	 LCADetailsDto lcaDtoObj=immiDao.getLcaTopRecord(candId);
					 System.out.println("lcaDtoObj*******"+lcaDtoObj);
					 if(lcaDtoObj!=null) {
						 Integer referenceLca=lcaDtoObj.getLca_reference();
						 System.out.println("referenceLca*******"+referenceLca);
						 referenceLca=referenceLca+1;
						 System.out.println("referenceLca after increment"+referenceLca);
						 //referenceLca++;
						 ClientDetailsEntity endlcientObj= immiDao.getEndclientByClientId(clientObjDB.getClient_id());
						 if(endlcientObj!=null) {
						 LCADetailsEntity lcaOBj=new LCADetailsEntity();
						 lcaOBj.setClient_id(clientObjDB.getClient_id());
						 lcaOBj.setCandidate_id(clientObjDB.getCandidate_id());
						 lcaOBj.setPayrate_id(endlcientObj.getPayrate_id());
						 lcaOBj.setPosted_by(lgempno);
						 lcaOBj.setLcastatus("Active");
						 lcaOBj.setLca_reference(referenceLca++);
						 lcaOBj.setLca_begin_date(lcastartdate);
						 lcaOBj.setLca_end_date(lcaenddate);
						 lcaOBj.setWage_rate(wageRate);
						 lcaOBj.setWr_option(wr_option);
						 lcaOBj.setJob_duties(u_duties);
						 lcaOBj.setLca_submitted_date(lcaPostedDate);
						    nlcaId=immiDao.saveLCADetails(lcaOBj);
						 }
					 }else {
						 ClientDetailsEntity endlcientObj= immiDao.getEndclientByClientId(clientObjDB.getClient_id());
						 if(endlcientObj!=null) {
							 Integer referenceLca=1;
						 LCADetailsEntity lcaOBj=new LCADetailsEntity();
						 lcaOBj.setClient_id(clientObjDB.getClient_id());
						 lcaOBj.setCandidate_id(endlcientObj.getCandidate_id());
						 lcaOBj.setPayrate_id(endlcientObj.getPayrate_id());
						 lcaOBj.setPosted_by(lgempno);
						 lcaOBj.setLcastatus("Active");
						 lcaOBj.setLca_reference(referenceLca);
						 lcaOBj.setLca_begin_date(lcastartdate);
						 lcaOBj.setLca_end_date(lcaenddate);
						 lcaOBj.setWage_rate(wageRate);
						 lcaOBj.setWr_option(wr_option);
						 lcaOBj.setJob_duties(u_duties);
						 lcaOBj.setLca_submitted_date(lcaPostedDate);
						 nlcaId=immiDao.saveLCADetails(lcaOBj);
						 }
					 }
			    	 
			    	 
							 for(int i=0; i< tasks.length; i++){
							      System.out.println(tasks[i]);
							      TaskDetailsEntity taskObj=new TaskDetailsEntity();
							      taskObj.setImmigration_id(nlcaId);
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
							      taskObj.setPosted_by(lgempno);
							      taskObj.setPayrate_id(clientObjDB.getPayrate_id());
							      taskObj.setCandidate_id(clientObjDB.getCandidate_id());
							      taskObj.setClient_id(clientObjDB.getClient_id());
							      immiDao.saveTaskDetails(taskObj);
							    }
		    	 }else {
		    		    LCADetailsEntity lcaObjDb=immiDao.getLcaDetailsById(lca_id);
			    	 	if(lcaObjDb!=null) {
			    	 		lcaObjDb.setLca_begin_date(lcastartdate);
			    	 		lcaObjDb.setLca_end_date(lcaenddate);
			    	 		lcaObjDb.setWage_rate(wageRate);
			    	 		lcaObjDb.setWr_option(wr_option);
			    	 		lcaObjDb.setLca_submitted_date(lcaPostedDate);
			    	 		lcaObjDb.setJob_duties(u_duties);
						    immiDao.updateLCADetails(lcaObjDb);
			    	 	  }
		    	     }
					//}
			 }
		     
		     
		     
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return msg;	
	}
	@Override
	public List<LCADetailsDto> getPendingLCAList(String candidateid, String clientid) {
		List<LCADetailsDto> lcaList = null;
		try {
			Integer candidate_Id = 0;Integer clientidId = 0;
			if (candidateid!="") {
				candidate_Id = Integer.parseInt(candidateid);
			}
			if (clientid!="") {
				clientidId = Integer.parseInt(clientid);
			}
			lcaList = immiDao.getAllLCAList(candidate_Id,clientidId);
		
			Iterator<LCADetailsDto> it = lcaList.iterator();
			while (it.hasNext()) {
				LCADetailsDto value = it.next();
				Integer docCount=immiDao.getDocumentCountByLcaId(value.getLca_id());
				if(docCount==3) {
					it.remove();
					}
			}
			
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return lcaList;
	}
	
	@Override
	public String inactiveRefNo(String lcaid) {
		String msg = null;
		try {
			Integer lca_id=0;
			if (lcaid!="") {
				lca_id = Integer.parseInt(lcaid);
			}
			LCADetailsEntity lcaObj=immiDao.getLcaDetailsById(lca_id);
		if(lcaObj!=null) {
			lcaObj.setLcastatus("InActive");
			immiDao.inactiveRefNo(lcaObj);
			msg="LCA reference number inactivated";
		}else {
			msg="something went wrong !!";
		}
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return msg;
	}
	@Override
	public String saveInitiateLCADetails(String endclient_name, String endline1, String endline2, String endcity,
			String endstate, String endzipcode, Integer lgempno, String organization_name, String cand_job_title,
			String education, String remote_county, String remote_soc_code, String workinglocation, String remote_line1,
			String remote_line2, String remote_city, String remote_state, String remote_zipcode, 
			String reason_lca, String init_candidateid, String lcastartdate, String lcaenddate,
			String wageRate, String init_lcaPostedDate, String init_metro_politan_area, String wr_option) {
		String msg = null;
		try {
			Integer endclientId=0;
			Integer candidateId=0;
			if (init_candidateid!="") {
				candidateId = Integer.parseInt(init_candidateid);
			}
			
			ClientDetailsEntity clientObjNew=new ClientDetailsEntity();
			clientObjNew.setClientName(endclient_name);
			//clientObjNew.setProject_name();
			clientObjNew.setPayrate_id(0);
			clientObjNew.setCandidate_id(candidateId);
			clientObjNew.setSubmittedOn(new Date());
			clientObjNew.setPosted_by(lgempno);
			clientObjNew.setOrganization_name(organization_name);
			clientObjNew.setCand_job_title(cand_job_title);
			clientObjNew.setEducation(education);
			clientObjNew.setWorkinglocation(workinglocation);
			clientObjNew.setCounty(remote_county);
			clientObjNew.setSoc_code(remote_soc_code);
			clientObjNew.setReason_lca(reason_lca);
			clientObjNew.setMetro_politan_area(init_metro_politan_area);
			clientObjNew.setClient_type("EndClient");
			clientObjNew.setStatus(1);
			endclientId=empDao.saveClientDetails(clientObjNew);
			
			if (workinglocation!=null) {
			if (workinglocation.equalsIgnoreCase("Remote/Home")) {
				String companytype1="Remote/Home";
					   CompanyAdressEntity remoteAddressObj = new CompanyAdressEntity();
						remoteAddressObj.setLine1(remote_line1);
						remoteAddressObj.setLine2(remote_line2);
						remoteAddressObj.setCompany_id(endclientId);
						remoteAddressObj.setCompany_type(companytype1);
						remoteAddressObj.setCity(remote_city);
						remoteAddressObj.setState(remote_state);
						remoteAddressObj.setZipcode(remote_zipcode);
						remoteAddressObj.setStatus("Active");
						remoteAddressObj.setPostedBy(lgempno);
						remoteAddressObj.setSubmitted_on(new Date());
						empDao.saveCompanyAddressDetails(remoteAddressObj);
				        msg="Success";
			     }
			}
			
		if(endclientId!=0) {
						CompanyAdressEntity clientAddressObj = new CompanyAdressEntity();
						clientAddressObj.setLine1(endline1);
						clientAddressObj.setLine2(endline2);
						clientAddressObj.setCompany_id(endclientId);
						clientAddressObj.setCompany_type("EndClient");
						clientAddressObj.setCity(endcity);
						clientAddressObj.setState(endstate);
						clientAddressObj.setZipcode(endzipcode);
						clientAddressObj.setStatus("Active");
						clientAddressObj.setPostedBy(lgempno);
						clientAddressObj.setSubmitted_on(new Date());
						empDao.saveCompanyAddressDetails(clientAddressObj);
					    msg="Success";
		      }
		
		         ClientDetailsEntity endlcientObj= immiDao.getEndclientByClientId(endclientId);
		         
		    	 String[] tasks = {"Upload LCA Questionnaire","Upload Approved LCA","Upload Executed LCA"};
		    	 Integer nlcaId=0;Integer candId=0;
		    	 LCADetailsDto lcaDtoObj=immiDao.getLcaTopRecord(candId);
				 if(lcaDtoObj!=null) {
					 Integer referenceLca=lcaDtoObj.getLca_reference();
					 referenceLca=referenceLca+1;
					 if(endlcientObj!=null) {
					 LCADetailsEntity lcaOBj=new LCADetailsEntity();
					 lcaOBj.setClient_id(endlcientObj.getClient_id());
					 lcaOBj.setCandidate_id(endlcientObj.getCandidate_id());
					 lcaOBj.setPayrate_id(0);
					 lcaOBj.setPosted_by(lgempno);
					 lcaOBj.setLcastatus("Active");
					 lcaOBj.setLca_reference(referenceLca++);
					 lcaOBj.setLca_begin_date(lcastartdate);
					 lcaOBj.setLca_end_date(lcaenddate);
					 lcaOBj.setWage_rate(wageRate);
					 lcaOBj.setWr_option(wr_option);
					 //lcaOBj.setLcaPostedDate(init_lcaPostedDate);
					 lcaOBj.setLca_submitted_date(init_lcaPostedDate);
					 nlcaId=immiDao.saveLCADetails(lcaOBj);
					 }
				 }else {
					 if(endlcientObj!=null) {
						 Integer referenceLca=1;
					 LCADetailsEntity lcaOBj=new LCADetailsEntity();
					 lcaOBj.setClient_id(endlcientObj.getClient_id());
					 lcaOBj.setCandidate_id(endlcientObj.getCandidate_id());
					 lcaOBj.setPayrate_id(0);
					 lcaOBj.setPosted_by(lgempno);
					 lcaOBj.setLcastatus("Active");
					 lcaOBj.setLca_reference(referenceLca);
					 lcaOBj.setLca_begin_date(lcastartdate);
					 lcaOBj.setLca_end_date(lcaenddate);
					 lcaOBj.setWage_rate(wageRate);
					 lcaOBj.setWr_option(wr_option);
					// lcaOBj.setLcaPostedDate(init_lcaPostedDate);
					 lcaOBj.setLca_submitted_date(init_lcaPostedDate);
					 nlcaId=immiDao.saveLCADetails(lcaOBj);
					 }
				 }
						 for(int i=0; i< tasks.length; i++){
						      System.out.println(tasks[i]);
						      TaskDetailsEntity taskObj=new TaskDetailsEntity();
						      taskObj.setImmigration_id(nlcaId);
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
						      taskObj.setPosted_by(lgempno);
						      taskObj.setPayrate_id(0);
						      taskObj.setCandidate_id(endlcientObj.getCandidate_id());
						      taskObj.setClient_id(endlcientObj.getClient_id());
						      immiDao.saveTaskDetails(taskObj);
						    }
					//}
		//	 }
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return msg;	
	}
	
	@Override
	public void saveCompanyAddress(Integer company_id, String companytype, Integer loginempno,
			String line1, String line2, String city, String state,  String zipcode, String metropolitan) {
		try {
			CompanyAdressEntity companyAddressObj = new CompanyAdressEntity();
			companyAddressObj.setLine1(line1);
			companyAddressObj.setLine2(line2);
			companyAddressObj.setCity(city);
			companyAddressObj.setState(state);
			companyAddressObj.setZipcode(zipcode);
			companyAddressObj.setCompany_id(company_id);
			companyAddressObj.setCompany_type(companytype);
			companyAddressObj.setStatus("Active");
			companyAddressObj.setPostedBy(loginempno);
			companyAddressObj.setSubmitted_on(new Date());
			companyAddressObj.setMetro_politan_area(metropolitan);
			empDao.saveCompanyAddressDetails(companyAddressObj);
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
	   }
	
	
	@Override
	public String updateInitiateLCADetails(String endclient_name, String endclient_id, String end_addressId, String endline1,
			String endline2, String endcity, String endstate, String endzipcode, String end_metro_politan_area,
			Integer lgempno, String organization_name, String cand_job_title, String education, String remote_county,
			String remote_soc_code, String workinglocation, String remote_addressId, String remote_line1,
			String remote_line2, String remote_city, String remote_state, String remote_zipcode,
			String remote_metro_politan_area, String reason_lca, String lcastartdate, String lcaenddate,
			String wageRate, String init_lcaPostedDate, String wr_option, String init_duties) {

		String msg = null;
		try {
			String emptype=null;
			Integer endclientId=0;
			if (endclient_id!="") {
				endclientId = Integer.parseInt(endclient_id);
			}
			Integer endaddressId=0;
			if (end_addressId!="") {
				endaddressId = Integer.parseInt(end_addressId);
			}
			
			Integer remoteaddressId=0;
			ClientDetailsEntity clientObjDB=immiDao.getClientDetailsByClientId(endclientId);
			if(clientObjDB.getWorkinglocation()!=null) {
			if(clientObjDB.getWorkinglocation().equalsIgnoreCase("Remote/Home")) {
				if(remote_addressId!="") {
					remoteaddressId = Integer.parseInt(remote_addressId);
				 }
			  }
			}
			
			if(clientObjDB!=null) {
			CompanyAdressEntity clientAddressObjDB=immiDao.getCompanyAdressDetailsByAddressId(endaddressId);
			//System.out.println("***client type from DB in client Address details*****"+clientObjDB.getClient_type());
		//	if(!clientObjDB.getClientName().equalsIgnoreCase(endclient_name) || clientObjDB.getCand_job_title().equalsIgnoreCase(cand_job_title) || clientObjDB.getEducation().equalsIgnoreCase(education) || clientObjDB.getWorkinglocation().equalsIgnoreCase(workinglocation)) {
			
			ClientDetailsHistoryEntity clientHistoyObj=new ClientDetailsHistoryEntity();
			clientHistoyObj.setClient_id(clientObjDB.getClient_id());
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
			clientHistoyObj.setCounty(clientObjDB.getCounty());
			clientHistoyObj.setSoc_code(clientObjDB.getSoc_code());
			clientHistoyObj.setWorkinglocation(clientObjDB.getWorkinglocation());
			clientHistoyObj.setReason_lca(clientObjDB.getReason_lca());
			clientHistoyObj.setMetro_politan_area(clientObjDB.getMetro_politan_area());
			//if(emptype.equalsIgnoreCase("W2")) {
			clientHistoyObj.setPayrate_id(clientObjDB.getPayrate_id());
			//}
			empDao.updateClientHistoryDetails(clientHistoyObj);
			
			clientObjDB.setClientName(clientObjDB.getClientName());
			clientObjDB.setProject_name(clientObjDB.getProject_name());
			clientObjDB.setFed_id(clientObjDB.getFed_id());
			clientObjDB.setClient_mgr(clientObjDB.getClient_mgr());
			clientObjDB.setClient_mgr_email(clientObjDB.getClient_mgr_email());
			clientObjDB.setClient_mgr_extn(clientObjDB.getClient_mgr_extn());
			clientObjDB.setEmp_mailat_client(clientObjDB.getEmp_mailat_client());
			clientObjDB.setEmp_extnat_client(clientObjDB.getEmp_extnat_client());
			//clientObjDB.setPayrate_id(payRate_Id);
			clientObjDB.setSubmittedOn(new Date());
			clientObjDB.setPosted_by(lgempno);
			clientObjDB.setOrganization_name(organization_name);
			clientObjDB.setCand_job_title(cand_job_title);
			clientObjDB.setEducation(education);
			clientObjDB.setWorkinglocation(workinglocation);
			clientObjDB.setCounty(remote_county);
			clientObjDB.setSoc_code(remote_soc_code);
			clientObjDB.setReason_lca(reason_lca);
			//clientObjDB.setMetro_politan_area(init_metro_politan_area);
			clientObjDB.setClient_type(clientObjDB.getClient_type());
			empDao.updateClientDetails(clientObjDB);
			msg="Success";
			//System.out.println("Success Success"+msg);
	    //   }
			
			//System.out.println("work_authorization&&&&&&"+work_authorization);
			if (workinglocation!=null) {
			if (workinglocation.equalsIgnoreCase("Remote/Home")) {
				String companytype1="Remote/Home";
				CompanyAdressEntity remoteAddressObjDB=immiDao.getCompanyAdressDetailsByAddressId(remoteaddressId);
				if(remoteAddressObjDB!=null) {
				if((remote_line2=="" || remote_line2!="") && remoteAddressObjDB.getLine2()!=null) {
					if(!remoteAddressObjDB.getLine1().equalsIgnoreCase(remote_line1) || !remoteAddressObjDB.getLine2().equalsIgnoreCase(remote_line2) || !remoteAddressObjDB.getCity().equalsIgnoreCase(remote_city) || !remoteAddressObjDB.getState().equalsIgnoreCase(remote_state) || !remoteAddressObjDB.getZipcode().equals(remote_zipcode)) {
					//	System.out.println("Insided  remote candidate Address changes"); || !remoteAddressObjDB.getSoc_code().equalsIgnoreCase(remote_soc_code) || !remoteAddressObjDB.getCounty().equals(remote_county)
						CompanyAdressEntity remoteAddressObj = new CompanyAdressEntity();
						remoteAddressObj.setLine1(remote_line1);
						remoteAddressObj.setLine2(remote_line2);
						remoteAddressObj.setCompany_id(remoteAddressObjDB.getCompany_id());
						remoteAddressObj.setCompany_type(companytype1);
						remoteAddressObj.setCity(remote_city);
						remoteAddressObj.setState(remote_state);
						remoteAddressObj.setZipcode(remote_zipcode);
						remoteAddressObj.setMetro_politan_area(remote_metro_politan_area);
						/*remoteAddressObj.setCounty(remote_county);
						remoteAddressObj.setSoc_code(remote_soc_code);*/
						remoteAddressObj.setStatus("Active");
						remoteAddressObj.setPostedBy(lgempno);
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
									remoteAddressObj.setCompany_id(remoteAddressObjDB.getCompany_id());
									remoteAddressObj.setCompany_type(companytype1);
									remoteAddressObj.setCity(remote_city);
									remoteAddressObj.setState(remote_state);
									remoteAddressObj.setZipcode(remote_zipcode);
									remoteAddressObj.setMetro_politan_area(remote_metro_politan_area);
									/*remoteAddressObj.setCounty(remote_county);
									remoteAddressObj.setSoc_code(remote_soc_code);*/
									remoteAddressObj.setStatus("Active");
									remoteAddressObj.setPostedBy(lgempno);
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
						remoteAddressObj.setCompany_id(endclientId);
						remoteAddressObj.setCompany_type(companytype1);
						remoteAddressObj.setCity(remote_city);
						remoteAddressObj.setState(remote_state);
						remoteAddressObj.setZipcode(remote_zipcode);
						remoteAddressObj.setMetro_politan_area(remote_metro_politan_area);
						/*remoteAddressObj.setCounty(remote_county);
						remoteAddressObj.setSoc_code(remote_soc_code);*/
						remoteAddressObj.setStatus("Active");
						remoteAddressObj.setPostedBy(lgempno);
						remoteAddressObj.setSubmitted_on(new Date());
						empDao.saveCompanyAddressDetails(remoteAddressObj);
				        msg="Success";
				   }
			   }else {
					//System.out.println("Insided  remote candidate Address changes");
					CompanyAdressEntity remoteAddressObjDB1=immiDao.getCompanyAdressDetailsByAddressId(remoteaddressId);
					if(remoteAddressObjDB1!=null) {
						remoteAddressObjDB1.setStatus("InActive");
					    empDao.updateCompanyAddressInfo(remoteAddressObjDB1);
					    msg="Success";
					}
			    }
			}
			
		if(clientAddressObjDB!=null) {
			//System.out.println("Insided client Address");
	     if((endline2=="" || endline2!="") && clientAddressObjDB.getLine2()!=null) {	
		     if(!clientAddressObjDB.getLine1().equalsIgnoreCase(endline1) || !clientAddressObjDB.getLine2().equalsIgnoreCase(endline2) || !clientAddressObjDB.getCity().equalsIgnoreCase(endcity) || !clientAddressObjDB.getState().equalsIgnoreCase(endstate) || !clientAddressObjDB.getZipcode().equals(endzipcode)) {
				//System.out.println("Insided candidate client Address changes");
				CompanyAdressEntity clientAddressObj = new CompanyAdressEntity();
				clientAddressObj.setLine1(endline1);
				clientAddressObj.setLine2(endline2);
				clientAddressObj.setCompany_id(clientAddressObjDB.getCompany_id());
				clientAddressObj.setCompany_type(clientAddressObjDB.getCompany_type());
				clientAddressObj.setCity(endcity);
				clientAddressObj.setState(endstate);
				clientAddressObj.setZipcode(endzipcode);
				clientAddressObj.setMetro_politan_area(end_metro_politan_area);
				clientAddressObj.setStatus("Active");
				clientAddressObj.setPostedBy(lgempno);
				clientAddressObj.setSubmitted_on(new Date());
				empDao.saveCompanyAddressDetails(clientAddressObj);
				clientAddressObjDB.setStatus("InActive");
			    empDao.updateCompanyAddressInfo(clientAddressObjDB);
			    msg="Success";
			  }else {
				//	System.out.println("Insided candidate client Address no changes");
	    	        //msg="Error";
			    }
			 }else if((endline2=="" || endline2!="") && clientAddressObjDB.getLine2()==null) {
				 if(!clientAddressObjDB.getLine1().equalsIgnoreCase(endline1) || !clientAddressObjDB.getLine2().equalsIgnoreCase(endline2) || !clientAddressObjDB.getCity().equalsIgnoreCase(endcity) || !clientAddressObjDB.getState().equalsIgnoreCase(endstate) || !clientAddressObjDB.getZipcode().equals(endzipcode)) {
					//	System.out.println("Insided candidate client Address changes");
						CompanyAdressEntity clientAddressObj = new CompanyAdressEntity();
						clientAddressObj.setLine1(endline1);
						clientAddressObj.setLine2(endline2);
						clientAddressObj.setCompany_id(clientAddressObjDB.getCompany_id());
						clientAddressObj.setCompany_type(clientAddressObjDB.getCompany_type());
						clientAddressObj.setCity(endcity);
						clientAddressObj.setState(endstate);
						clientAddressObj.setZipcode(endzipcode);
						clientAddressObj.setMetro_politan_area(end_metro_politan_area);
						clientAddressObj.setStatus("Active");
						clientAddressObj.setPostedBy(lgempno);
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
		     if(msg.equalsIgnoreCase("Success")) {
		    	 String[] tasks = {"Upload LCA Questionnaire","Upload Approved LCA","Upload Executed LCA"};
				/*	if(organization_name!=null && clientId!=0) {*/
		    	 Integer nlcaId=0;Integer candId=0;
		    	 LCADetailsDto lcaDtoObj=immiDao.getLcaTopRecord(candId);
				 System.out.println("lcaDtoObj*******"+lcaDtoObj);
				 if(lcaDtoObj!=null) {
					 Integer referenceLca=lcaDtoObj.getLca_reference();
					 System.out.println("referenceLca*******"+referenceLca);
					 referenceLca=referenceLca+1;
					 System.out.println("referenceLca after increment"+referenceLca);
					 //referenceLca++;
					 ClientDetailsEntity endlcientObj= immiDao.getEndclientByClientId(clientObjDB.getClient_id());
					 if(endlcientObj!=null) {
					 LCADetailsEntity lcaOBj=new LCADetailsEntity();
					 lcaOBj.setClient_id(clientObjDB.getClient_id());
					 lcaOBj.setCandidate_id(clientObjDB.getCandidate_id());
					 lcaOBj.setPayrate_id(endlcientObj.getPayrate_id());
					 lcaOBj.setPosted_by(lgempno);
					 lcaOBj.setLcastatus("Active");
					 lcaOBj.setLca_reference(referenceLca++);
					 lcaOBj.setLca_begin_date(lcastartdate);
					 lcaOBj.setLca_end_date(lcaenddate);
					 lcaOBj.setWage_rate(wageRate);
					 lcaOBj.setWr_option(wr_option);
					 lcaOBj.setJob_duties(init_duties);
					// lcaOBj.setLcaPostedDate(init_lcaPostedDate);
					 lcaOBj.setLca_submitted_date(init_lcaPostedDate);
					 lcaOBj.setWage_rate(wageRate);
					 nlcaId=immiDao.saveLCADetails(lcaOBj);
					 }
				 }else {
					 ClientDetailsEntity endlcientObj= immiDao.getEndclientByClientId(clientObjDB.getClient_id());
					 if(endlcientObj!=null) {
						 Integer referenceLca=1;
					 LCADetailsEntity lcaOBj=new LCADetailsEntity();
					 lcaOBj.setClient_id(clientObjDB.getClient_id());
					 lcaOBj.setCandidate_id(endlcientObj.getCandidate_id());
					 lcaOBj.setPayrate_id(endlcientObj.getPayrate_id());
					 lcaOBj.setPosted_by(lgempno);
					 lcaOBj.setLcastatus("Active");
					 lcaOBj.setLca_reference(referenceLca);
					 lcaOBj.setLca_begin_date(lcastartdate);
					 lcaOBj.setLca_end_date(lcaenddate);
					 lcaOBj.setWage_rate(wageRate);
					 lcaOBj.setWr_option(wr_option);
					 lcaOBj.setJob_duties(init_duties);
					// lcaOBj.setLcaPostedDate(init_lcaPostedDate);
					 lcaOBj.setLca_submitted_date(init_lcaPostedDate);
					 nlcaId=immiDao.saveLCADetails(lcaOBj);
					 }
				 }
		    	 
		    	 
						 for(int i=0; i< tasks.length; i++){
						      System.out.println(tasks[i]);
						      TaskDetailsEntity taskObj=new TaskDetailsEntity();
						      taskObj.setImmigration_id(nlcaId);
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
						      taskObj.setPosted_by(lgempno);
						      taskObj.setPayrate_id(clientObjDB.getPayrate_id());
						      taskObj.setCandidate_id(clientObjDB.getCandidate_id());
						      taskObj.setClient_id(clientObjDB.getClient_id());
						      immiDao.saveTaskDetails(taskObj);
						    }
					//}
			 }
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return msg;	
	
	}
	@Override
	public String deleteRefNo(String lcaid) {
		String msg = null;
		try {
			Integer lca_id=0;
			if (lcaid!="") {
				lca_id = Integer.parseInt(lcaid);
				immiDao.deleteRefNo(lca_id);
				msg="Success";
			}else{
				msg="Fail";
			}
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return msg;
	}
	
	@Override
	public Integer saveImmiCandidate(String fname, String ssn, String phne_no, String emailid, Integer lgempno,
			String lname, String autouname) {
		Integer candidateId = 0;
		try {
			/*String pwd="asdASD123";
			String bytes_ssn_emp = Base64.encode(ssn.getBytes());
			String bytes_pwd = Base64.encode(pwd.getBytes());
			TemporaryCandidateDetails candidateObj = new TemporaryCandidateDetails();
			candidateObj.setSsn(bytes_ssn_emp);
			candidateObj.setFull_name(fname + " " + lname);
			candidateObj.setFirst_name(fname);
			candidateObj.setLast_name(lname);
			candidateObj.setContact_number(phne_no);
			candidateObj.setEmail_id(emailid);
			candidateObj.setPassword(bytes_pwd);
			candidateObj.setStatus("Active");
			candidateObj.setSubmitted_date(new Date());
			candidateObj.setPosted_by(lgempno);
			candidateId = bgcDao.saveCandidateDetails(candidateObj);*/
			
			
		
			EmpBasicDetailsEntity basicObj = new EmpBasicDetailsEntity();
			String password = "asdASD123";
			String bytepwd = Base64.encode(password.getBytes());
			basicObj.setFullName(fname+" "+lname);
			basicObj.setPwd(bytepwd);		
			//basicObj.setDob(dob);
			basicObj.setStatus(1);
			basicObj.setSubmit_date(new Date());

			basicObj.setUserName(autouname.toLowerCase());
			basicObj.setPosted_by(lgempno);
			basicObj.setFirst_name(fname);
			//basicObj.setMiddle_name(middleName);
			basicObj.setFamily_name(lname);
			basicObj.setContact_no1(phne_no);
			basicObj.setContact_no_type1("Personal");
			
			
			basicObj.setEmail(emailid);
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
			System.out.println();
			  CandidateDetailedInfo candDetailObj = new CandidateDetailedInfo();
			  
			    candDetailObj.setCandidateInfo(basicObj);
			    candDetailObj.setDepartment_id(0);
			    candDetailObj.setRole_id(0);
			    candDetailObj.setReporting_head(0);
			    candDetailObj.setWork_authorization("");
			    candDetailObj.setStatus("Active");
			    candDetailObj.setPosted_by(lgempno);
			    candDetailObj.setSubmitted_on(new Date());
			    empDao.saveCandidateDetailedInfo(candDetailObj);
			    
			    
			PageStatusEntity pagestsObj = new PageStatusEntity();
			pagestsObj.setCandidate_id(candidateId);
			pagestsObj.setPostedBy(lgempno);
			pagestsObj.setBasicinfo_status(1);
			pagestsObj.setDocument_status(0);
			pagestsObj.setClient_status(0);
			pagestsObj.setBank_status(0);
			pagestsObj.setExit_status(0);
			pagestsObj.setBasic_submitdate(new Date());
			empDao.savePageStatus(pagestsObj);
		}
			
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return candidateId;
	}
	@Override
	public List<TempCandidateDetailsDTO> getImmiCandidateList() {
		List<TempCandidateDetailsDTO> catList = null;
		try {
			//catList = bgcDao.getAllCandidates();
			catList = immiDao.getImmiCandidateList();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return catList;
	}
	@Override
	public String updateImmiCandidate(String candidateId, String fname, String lname, String phne_no, String emailid,
			Integer lgempno, String uname) {
		String msg="";
		try {
		Integer canid=0;
		if(candidateId!="") {
			canid=Integer.parseInt(candidateId);
		}
		EmpBasicDetailsEntity basicDetailDBObj = empDao.getEmployeeDetailsByCandidateId(canid);
		if(basicDetailDBObj!=null) {
		basicDetailDBObj.setContact_no1(phne_no);
		basicDetailDBObj.setEmail(emailid);
		basicDetailDBObj.setFirst_name(fname);
		basicDetailDBObj.setFamily_name(lname);
		basicDetailDBObj.setFullName(fname+" "+lname);
		basicDetailDBObj.setUserName(uname.toLowerCase());
		empDao.updateBasicDetails(basicDetailDBObj);
		msg="Details Updated Successfully";
		}else {
			msg="Details not updated";
		}
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return msg;
	}
	@Override
	public String onboardcandidate(String candidateId, String employee_type, String work_auth) {
		String message=null;
		try {
			Integer candidate_Id=0;
			if (candidateId!="") {
				candidate_Id = Integer.parseInt(candidateId);
			}
			  CandidateDetailedInfo candidateInfoDBObj = empDao.getCandidateDetailedInfoById(candidate_Id);
			if(candidateInfoDBObj!=null) {
				candidateInfoDBObj.setEmp_type(employee_type);
				candidateInfoDBObj.setWork_authorization(work_auth);
				empDao.updateCandidateDetailedInfo(candidateInfoDBObj);
				message = "Candidate Onboarded successfully";
			}
			
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return message;
	}
	
	@Override
	public List<ImmiDocumentTypeEntity> getDocumentTypeList() {
		List<ImmiDocumentTypeEntity> docTypeList = null;
		try {
			docTypeList = immiDao.getDocumentTypeList();
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return docTypeList;	
	}

	@Override
	public String savedoctype(String docname, Integer lgempno) {
		String message=null;
		try {
			ImmiDocumentTypeEntity docObj=new ImmiDocumentTypeEntity();
			String uppercaseString=uppercaseString(docname);
			docObj.setDocument_type(uppercaseString);
			docObj.setStatus("Active");
			docObj.setPosted_by(lgempno);
			docObj.setSubmitted_date(new Date());
			Integer doc_id=immiDao.savedocumentType(docObj);
			if(doc_id!=0) {
				message = uppercaseString+" added successfully";
			}else {
				message = uppercaseString+" not added";
			}
			
		} catch (Exception e) {
			logger.info(e.getMessage(),e);		}
		return message;
	}

	@Override
	public String updatedoctype(String docname, String docid) {
		String message=null;
		try {
			Integer doc_id=0;
			if (docid!="") {
				doc_id = Integer.parseInt(docid);
			}
			ImmiDocumentTypeEntity docObj=immiDao.getDocumentTypeById(doc_id);
			String uppercaseString=uppercaseString(docname);
			if(docObj!=null) {
				docObj.setDocument_type(uppercaseString);
				immiDao.updateDocumentType(docObj);
				message = uppercaseString+" updated successfully";
			}
			else {
				message=uppercaseString+" not updated";
			}
			
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return message;
	}

	@Override
	public String checkDocumentType(String docname) {
		String doc_name = null;
		try {
			doc_name = immiDao.checkDocumentType(docname);
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return doc_name;
	}
	
	@Override
	public List<DocumentTypeDto> getDocumentsList() {
		List<DocumentTypeDto> docTypeList = null;
		try {
			docTypeList = immiDao.getDocumentsList();
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return docTypeList;	
	}
	
	
	@Override
	public String savesubdoctype(String doctypeid, String subdocname, Integer lgempno, 
			String issubbycand, String sameas_doctype) {
		String message=null;
		try {
			Integer doctype_Id = 0;
			if (doctypeid != "") {
				doctype_Id = Integer.parseInt(doctypeid);
			}
			Integer issubbycandid = 0;
			if (issubbycand!="") {
				issubbycandid = Integer.parseInt(issubbycand);
			}
			ImmiDocumentSubTypeEntity docObj=new ImmiDocumentSubTypeEntity();
			String uppercaseString=uppercaseString(subdocname);
			docObj.setDocumenttype_id(doctype_Id);
			docObj.setDocument_type(uppercaseString);
			docObj.setStatus("Active");
			docObj.setPosted_by(lgempno);
			docObj.setSubmitted_date(new Date());
			docObj.setIssubycand(issubbycandid);
			System.out.println("sameas_doctype---"+sameas_doctype);
			if(sameas_doctype==null || sameas_doctype=="") {
				docObj.setIs_same(0);
			}else {
				docObj.setIs_same(1);
			}
			Integer doc_id=immiDao.savedocumentSubType(docObj);
			if(doc_id!=0) {
				message = uppercaseString+" added successfully";
			}else {
				message = uppercaseString+" not added";
			}
			
		} catch (Exception e) {
			logger.info(e.getMessage(),e);		}
		return message;
	}
	
	@Override
	public String checkDocumentSubType(String docname) {
		String doc_name = null;
		try {
			doc_name = immiDao.checkDocumentSubType(docname);
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return doc_name;
	}

	@Override
	public String updateSubdocType(String usubdocname, String doctypeid, String usubdocid, String issubbycand) {
		String message=null;
		try {
			Integer doc_id=0;Integer subdocTpyeId=0;
			if (doctypeid!="") {
				doc_id = Integer.parseInt(doctypeid);
			}
			if (usubdocid!="") {
				subdocTpyeId = Integer.parseInt(usubdocid);
			}
			Integer issubbycandid = 0;
			if (issubbycand!="") {
				issubbycandid = Integer.parseInt(issubbycand);
			}
			System.out.println(doc_id+"---******----"+subdocTpyeId+"---******---"+usubdocname);
			ImmiDocumentSubTypeEntity docObj=immiDao.getDocumentSubTypeById(subdocTpyeId);
			System.out.println("---------------------------------"+docObj);
			if(docObj!=null) {
				docObj.setDocument_type(usubdocname);
				docObj.setDocumenttype_id(doc_id);
				docObj.setIssubycand(issubbycandid);
				immiDao.updateSubDocumentType(docObj);
				message = usubdocname+" updated successfully";
			}
			else {
				message=usubdocname+" not updated";
			}
			
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return message;
	}

	public String uppercaseString(String name) {
		String uppercasename=null;;
		try {
			 uppercasename = name.substring(0, 1).toUpperCase() + name.substring(1);
			}
		 catch (Exception e) {
			logger.info(e.getMessage(),e);		
			}
	return uppercasename;
	}
	@Override
	public LCADetailsEntity getLcaDetailsById(String lcaid) {
		LCADetailsEntity lcaObj =null;
		try {
			Integer lca_Id = 0;
			if (lcaid!="") {
				lca_Id = Integer.parseInt(lcaid);
			}
			 lcaObj =immiDao.getLcaDetailsById(lca_Id);
		   
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return lcaObj;
	}
	@Override
	public String getSubDocDetailsByName(String string, String lcaid, int candidate_id) {
		String filename="";
		try {
			Integer lca_Id = 0;
			if (lcaid!="") {
				lca_Id = Integer.parseInt(lcaid);
			}
			Integer subdocid=immiDao.getSubDocIdByName(string);
			filename=immiDao.getcertifiedfileByIds(lca_Id,candidate_id,subdocid);
			
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return filename;
	}
	@Override
	public Integer getDocumentCountByLcaId(String lcaid) {
		Integer docCount=0;
		try {
			Integer lca_Id = 0;
			if (lcaid!="") {
				lca_Id = Integer.parseInt(lcaid);
			}
			 docCount=immiDao.getDocumentCountByLcaId(lca_Id);
		   
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return docCount;
	}
	@Override
	public String addh1task(String taskname, String duedate, String description, Integer empno, String candidateid) {
		String msg="";
		try {
			
			Integer candidate_Id=0;
			if (candidateid!="") {
				candidate_Id = Integer.parseInt(candidateid);
			}
			TaskDetailsEntity taskObj =new TaskDetailsEntity();
			 SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
		      Calendar c = Calendar.getInstance();
		      c.setTime(new Date()); // Now use today date.
		      c.add(Calendar.DATE, 7); // Adding 7 days
		      String date = sdf.format(c.getTime());
				taskObj.setTask_name(taskname);
				taskObj.setTask_status("Open");
				taskObj.setDue_date(date);
				taskObj.setCreated_date(new Date());
				taskObj.setTask_description(description);
				taskObj.setCandidate_id(candidate_Id);
				taskObj.setDocumenttype_name("H-1B");
				taskObj.setPosted_by(empno);
				Integer taskid=immiDao.addtask(taskObj);	
				if(taskid!=null) {
				msg="Task Details Added Successfully";
			}else {
				msg="Task Details Not Added";
			}
				//}
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return msg;	
	}
	@Override
	public DocumentTypeDto immicheckDocumentTypeIssame(String docTypeid) {
		 DocumentTypeDto docDto = new DocumentTypeDto();
	try {
		Integer docType_id = 0;
		if (docTypeid!="") {
			docType_id = Integer.parseInt(docTypeid);
		}
		Integer issame=immiDao.immicheckDocumentTypeIssame(docType_id);
		Integer subdocTypeCount=immiDao.immicheckDocumentTypeSubocTypeCount(docType_id);
		docDto.setIsameas_doctype(issame);
		docDto.setSubdocTypeCount(subdocTypeCount);
	   
	} catch (Exception e) {
		logger.info(e.getMessage(),e);
	}
	return docDto;
}
	@Override
	public LCADetailsDto getTopLcaByCandidateId(Integer candidateid) {
		LCADetailsDto lcaDtoObj = new LCADetailsDto();
			try {
				lcaDtoObj=immiDao.getLcaTopRecord(candidateid);
			} catch (Exception e) {
				logger.info(e.getMessage(),e);
			}
			return lcaDtoObj;
	  }
	@Override
	public List<LCADetailsDto> getActiveInactiveLCAList(String candidateid, String clientid) {
		List<LCADetailsDto> lcaList = null;
		try {
			Integer candidate_Id = 0;Integer clientidId = 0;
			if (candidateid!="") {
				candidate_Id = Integer.parseInt(candidateid);
			}
			if (clientid!="") {
				clientidId = Integer.parseInt(clientid);
			}
			lcaList = immiDao.getActiveInactiveLCAList(candidate_Id,clientidId);
			
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return lcaList;
	}
	@Override
	public String updateCompanyAddress(Integer lcaaddress_id, Integer loginempno, String lca_line1, String lca_line2,
			String lca_city, String lca_state, String lca_zipcode, String lca_othermetro) {
		String msg = null;
		try {
		CompanyAdressEntity lcaotherlocAddressObjDB=immiDao.getCompanyAdressDetailsByAddressId(lcaaddress_id);
		if(lcaotherlocAddressObjDB!=null) {
			//System.out.println("Insided client Address");
	     if((lca_line2=="" || lca_line2!="") && lcaotherlocAddressObjDB.getLine2()!=null) {	
		     if(!lcaotherlocAddressObjDB.getLine1().equalsIgnoreCase(lca_line1) || !lcaotherlocAddressObjDB.getLine2().equalsIgnoreCase(lca_line2) || !lcaotherlocAddressObjDB.getCity().equalsIgnoreCase(lca_city) || !lcaotherlocAddressObjDB.getState().equalsIgnoreCase(lca_state) || !lcaotherlocAddressObjDB.getZipcode().equals(lca_zipcode) || !lcaotherlocAddressObjDB.getMetro_politan_area().equals(lca_othermetro)) {
				//System.out.println("Insided candidate client Address changes");
				CompanyAdressEntity clientAddressObj = new CompanyAdressEntity();
				clientAddressObj.setLine1(lca_line1);
				clientAddressObj.setLine2(lca_line2);
				clientAddressObj.setCompany_id(lcaotherlocAddressObjDB.getCompany_id());
				clientAddressObj.setCompany_type(lcaotherlocAddressObjDB.getCompany_type());
				clientAddressObj.setCity(lca_city);
				clientAddressObj.setState(lca_state);
				clientAddressObj.setZipcode(lca_zipcode);
				clientAddressObj.setMetro_politan_area(lca_othermetro);
				clientAddressObj.setStatus("Active");
				clientAddressObj.setPostedBy(loginempno);
				clientAddressObj.setSubmitted_on(new Date());
				empDao.saveCompanyAddressDetails(clientAddressObj);
				lcaotherlocAddressObjDB.setStatus("InActive");
			    empDao.updateCompanyAddressInfo(lcaotherlocAddressObjDB);
			    msg="Success";
			  }else {
				//	System.out.println("Insided candidate client Address no changes");
	    	        //msg="Error";
			    }
			 }else if((lca_line2=="" || lca_line2!="") && lcaotherlocAddressObjDB.getLine2()==null) {
				 if(!lcaotherlocAddressObjDB.getLine1().equalsIgnoreCase(lca_line1) || !lcaotherlocAddressObjDB.getCity().equalsIgnoreCase(lca_city) || !lcaotherlocAddressObjDB.getState().equalsIgnoreCase(lca_state) || !lcaotherlocAddressObjDB.getZipcode().equals(lca_zipcode) || !lcaotherlocAddressObjDB.getMetro_politan_area().equals(lca_othermetro)) {
						//System.out.println("Insided candidate client Address changes");
						CompanyAdressEntity clientAddressObj = new CompanyAdressEntity();
						clientAddressObj.setLine1(lca_line1);
						clientAddressObj.setLine2(lca_line2);
						clientAddressObj.setCompany_id(lcaotherlocAddressObjDB.getCompany_id());
						clientAddressObj.setCompany_type(lcaotherlocAddressObjDB.getCompany_type());
						clientAddressObj.setCity(lca_city);
						clientAddressObj.setState(lca_state);
						clientAddressObj.setZipcode(lca_zipcode);
						clientAddressObj.setMetro_politan_area(lca_othermetro);
						clientAddressObj.setStatus("Active");
						clientAddressObj.setPostedBy(loginempno);
						clientAddressObj.setSubmitted_on(new Date());
						empDao.saveCompanyAddressDetails(clientAddressObj);
						lcaotherlocAddressObjDB.setStatus("InActive");
					    empDao.updateCompanyAddressInfo(lcaotherlocAddressObjDB);
					    msg="Success";
					  }else {
						//	System.out.println("Insided candidate client Address no changes");
			    	        //msg="Error";
					    } 
			      } 
		      }
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return msg;		
	}
  }
