package com.tekskills.ServiceImpl;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Service;

import com.tekskills.Dao.EmployeesDao;
import com.tekskills.Dao.StatusReportDao;
import com.tekskills.Dao.TimesheetDao;
import com.tekskills.Dto.ClientVendorMaster_DTO;
import com.tekskills.Dto.StatusReportDto;
import com.tekskills.Dto.TimesheetDto;
import com.tekskills.Entity.EmpPayRateDetails;
import com.tekskills.Entity.StatusReportEntity;
import com.tekskills.Entity.StatusReportTemplateEntity;
import com.tekskills.Service.StatusReportService;
import com.tekskills.Util.Commons;

@Service
@PropertySource("/WEB-INF/mail.properties")
public class StatusReportServiceImpl implements StatusReportService {
	private static final Logger logger = Logger.getLogger(StatusReportServiceImpl.class);
	@Autowired
	EmployeesDao empDao;
	@Autowired
	StatusReportDao reportDao;
	@Autowired
	private Commons commons;
	@Autowired
	private Environment env;
	@Autowired
	TimesheetDao timesheetDao;
	
	@Override
	public List<StatusReportTemplateEntity> getTemplateList() {
		List<StatusReportTemplateEntity> templateList = null;
		try {
			templateList = reportDao.getTemplateList();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return templateList;
	}

	@Override
	public String saveStatusTemplate(String month, String year, Integer loginUserid, String period, String periodname,
			String fromdate, String todate) {
		String message = null;
		try {
			int yearid = 0;
			if (!year.isEmpty()) {
				yearid = Integer.parseInt(year);
			}
			Date from_date = commons.getSringDatetoSQLDate(fromdate);
			Date to_date = commons.getSringDatetoSQLDate(todate);

			StatusReportTemplateEntity reportObj = new StatusReportTemplateEntity();
			reportObj.setYear(yearid);
			reportObj.setMonth(month);
			reportObj.setPosted_by(loginUserid);
			reportObj.setPeriod(period);
			reportObj.setFrom_date(from_date);
			reportObj.setTo_date(to_date);
			reportObj.setPeriod_name(periodname);
			reportObj.setSubmitted_on(new Date());

			Integer templateId = reportDao.saveStatusTemplate(reportObj);
			if (templateId != null) {
				message = "Status Report Template Added Successfully";
			} else {
				message = "Something went wrong!!";
			}
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return message;
	}

	@Override
	public String checkTemplateByMonth(String year, String month) {
		String message = null;
		try {
			int yearid = 0;
			if (!year.isEmpty()) {
				yearid = Integer.parseInt(year);
			}
			StatusReportDto reportObj = reportDao.checkTemplateByMonth(yearid, month);
			if (reportObj != null) {
				message = "Template already added for year [" + year + "] and month [" + month + "]";
			} else {
				message = null;
			}
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return message;
	}

	@Override
	public List<StatusReportDto> getPeningReportsByCandidateId(Integer candidateId,Integer payrateId, String emptype) {
		List<StatusReportDto> reportList = new ArrayList<StatusReportDto>();
		try {
			if(payrateId==null) {
				EmpPayRateDetails payrateObj=timesheetDao.getEmpPayrateDetailsByCandidateId(candidateId,emptype,null);
				if(payrateObj!=null) {
					Integer payrateid=payrateObj.getPayrate_id();
					payrateId=payrateid;
				}
			}
			
			reportList = reportDao.getPeningReportsByCandidateId(candidateId,payrateId,emptype);
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return reportList;
	}

	@Override
	public List<String> getPeriodListByMMYY(String month, String year) {
		List<String> periodList = null;
		try {
			int yearid = 0;
			if (!year.isEmpty()) {
				yearid = Integer.parseInt(year);
			}
			periodList = reportDao.getPeriodListByMMYY(yearid, month);
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return periodList;
	}

	@Override
	public List<StatusReportDto> getReports(String month, String year, String period, String status, Integer role,
			Integer candidateId, String lgemptype,String customertype) {
		List<StatusReportDto> reportList = null;
		try {
			int yearid = 0;
			if (!year.isEmpty()) {
				yearid = Integer.parseInt(year);
			}
			int custType = 0;
			if (!customertype.isEmpty()) {
				custType = Integer.parseInt(customertype);
			}
			reportList = reportDao.getReports(yearid, month, period, status, role, candidateId,lgemptype,custType);
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return reportList;
	}

	@Override
	public StatusReportDto getCanProjectDetailsById(String candidateid, String payrate_id) {
		StatusReportDto candiObj = null;
		try {
			int candidateId = 0;
			if (!candidateid.isEmpty()) {
				candidateId = Integer.parseInt(candidateid);
			}int payrateid = 0;
			if (!payrate_id.isEmpty()) {
				payrateid = Integer.parseInt(payrate_id);
			}
			System.out.println("getCanProjectDetailsById--------------------"+payrateid);
			candiObj = reportDao.getCanProjectDetailsById(candidateId,payrateid);
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return candiObj;
	}

	@Override
	public String savereport(String challenges, String outputs, String delivers, String canidateId, Integer loginempno,
			String month, String year, String period, String periodname, String lgfullname, String clienttname, 
			String clientaddres, String projectname,String payrate_id) {
		String message = null;
		try { 
			int canidateid = 0;
			if (!canidateId.isEmpty()) {
				canidateid = Integer.parseInt(canidateId);
			}
			int yearid = 0; Integer payrateId=0;
			if (!year.isEmpty()) {
				yearid = Integer.parseInt(year);
			}
			if (!payrate_id.isEmpty()) {
				payrateId = Integer.parseInt(payrate_id);
			}
			ClientVendorMaster_DTO detilsObj=empDao.getCustomerEndclientByPayrateId(payrateId);
			int endclientid=0;int customerid=0;
			if(detilsObj!=null) {
				endclientid=detilsObj.getClientid();
				customerid=detilsObj.getCustid();
			}
			StatusReportEntity reportObj = new StatusReportEntity();
			reportObj.setCandidate_id(canidateid);
			reportObj.setChallenges(challenges);
			reportObj.setDeliverables(delivers);
			reportObj.setOutputs(outputs);
			reportObj.setYear(yearid);
			reportObj.setMonth(month);
			reportObj.setPeriod(period);
			reportObj.setPeriod_name(periodname);
			reportObj.setStatus("Submitted");
			reportObj.setFull_name(lgfullname);
			reportObj.setClient_address(clientaddres);
			reportObj.setClient_name(clienttname);
			reportObj.setProject_name(projectname);
			reportObj.setPayrate_id(payrateId);
			reportObj.setEndclient_id(endclientid);
			reportObj.setCustomer_id(customerid);
			reportObj.setSubmitted_on(new Date());

			Integer templateId = reportDao.savereport(reportObj);
			if (templateId != null) {
				message = "Status Report Submitted Successfully";
			} else {
				message = "Something went wrong!!";
			}
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return message;
	}

	@Override
	public StatusReportDto getCanStusDetailsById(String candidateid, String status_reportid) {
		StatusReportDto candiObj = null;
		try {
			int candidateId = 0;
			if (!candidateid.isEmpty()) {
				candidateId = Integer.parseInt(candidateid);
			}
			int statusreportid = 0;
			if (!status_reportid.isEmpty()) {
				statusreportid = Integer.parseInt(status_reportid);
			}
			candiObj = reportDao.getCanStusDetailsById(candidateId, statusreportid);
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return candiObj;
	}

	@Override
	public String updatestatus(String challenges, String outputs, String delivers, String canidateId,
			Integer loginempno, String comments, String statureportId, String status, Integer role) {
		String message = null;
		try {
			int canidateid = 0;
			if (!canidateId.isEmpty()) {
				canidateid = Integer.parseInt(canidateId);
			}
			int statureportid = 0;
			if (!statureportId.isEmpty()) {
				statureportid = Integer.parseInt(statureportId);
			}

			StatusReportEntity reportObj = reportDao.getStatusDeailsByStatusId(statureportid);
			if (reportObj != null) {
				//if (role != 1) {
					reportObj.setComments(comments);
					reportObj.setApproved_by(loginempno);
					reportObj.setApproved_on(new Date());
					reportObj.setStatus(status);
					reportDao.updateStatus(reportObj);
					message = "Status Report " + status + " Successfully";
				/*} else {
					reportObj.setChallenges(challenges);
					reportObj.setDeliverables(delivers);
					reportObj.setOutputs(outputs);
					reportObj.setSubmitted_on(new Date());
					reportDao.updateStatus(reportObj);
					message = "Status Report Updated Successfully";
				}*/
			}

		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return message;
	}

	@Override
	public String downloadpdf(String statureportId) {
		String htmlText = null;
		try {
			
			int stsid = 0;
			if (!statureportId.isEmpty()) {
				stsid = Integer.parseInt(statureportId);
			}

			StatusReportEntity reportObj = reportDao.getStatusDeailsByStatusId(stsid);
			htmlText = downloadStatuspdf(reportObj);
		}
			catch (Exception e) {
				logger.error("Error while  sendReceipt", e);
			}
			return htmlText;
	}

	private String downloadStatuspdf(StatusReportEntity reportObj) {

		String htmlText = null;
		
		try {
			Map<String, String> input = new HashMap<String, String>();
			String period=reportObj.getPeriod();
			String month=reportObj.getMonth();
			String periods=month+"("+period+")";
			String submittedon=commons.getSQLDateToMMDDYYYY(reportObj.getSubmitted_on());
					
			
			//nameval clientval  addressval Projectval Periodval mdval	Opval Issueval dateval	sigval
			String htmlfile = env.getProperty("pdfstatusreport");
			String tekskillslogo = env.getProperty("tekskillslogo");
			input.put("nameval", reportObj.getFull_name());
			input.put("clientval", reportObj.getClient_name());
			input.put("addressval", reportObj.getClient_address());
			input.put("Projectval", reportObj.getProject_name());
			input.put("Periodval", periods);
			input.put("image1", tekskillslogo);
			input.put("dateval", submittedon);
			input.put("Issueval", reportObj.getChallenges());
			input.put("mdval", reportObj.getDeliverables());
			input.put("Opval", reportObj.getOutputs());
			
			htmlText = readEmailFromHtml(htmlfile, input);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return htmlText;
	}

	private String readEmailFromHtml(String htmlfile, Map<String, String> input) {
		String msg = readContentFromFile(htmlfile);
		try {
			Set<Entry<String, String>> entries = input.entrySet();
			for (Map.Entry<String, String> entry : entries) {
				msg = msg.replace(entry.getKey().trim(), entry.getValue().trim());
			}
		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return msg;
	}

	private String readContentFromFile(String htmlfile) {
		StringBuffer contents = new StringBuffer();

		try {
			// use buffering, reading one line at a time
			BufferedReader reader = new BufferedReader(new FileReader(htmlfile));
			try {
				String line = null;
				while ((line = reader.readLine()) != null) {
					contents.append(line);
					contents.append(System.getProperty("line.separator"));
				}
			} finally {
				reader.close();
			}
		} catch (IOException ex) {
			ex.printStackTrace();
		}
		return contents.toString();
	}
	@Override
	public StatusReportEntity getStatusDetailsByStatusId(String status_reportid) {
		StatusReportEntity candiObj = null;
		try {
			
			int statusreportid = 0;
			if (!status_reportid.isEmpty()) {
				statusreportid = Integer.parseInt(status_reportid);
			}
			candiObj = reportDao.getStatusDeailsByStatusId(statusreportid);
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return candiObj;
	}

	@Override
	public List<StatusReportTemplateEntity> getTemplateListByYear(Integer yr) {
		List<StatusReportTemplateEntity> templateList = null;
		try {
			
			templateList = reportDao.getTemplateListByYear(yr);
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return templateList;
	}

	@Override
	public List<StatusReportDto> getAllStatusReports(String month, String year, String period, String status,
			Integer role, Integer candidateId, String lgemptype, String customertype) {
		List<StatusReportDto> reportList = null;
		try {
			int yearid = 0;
			if (!year.isEmpty()) {
				yearid = Integer.parseInt(year);
			}int custType = 0;
			if (!customertype.isEmpty()) {
				custType = Integer.parseInt(customertype);
			}
			reportList = reportDao.getAllStatusReports(yearid, month, period, status, role, candidateId,lgemptype,custType);
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return reportList;
	}

	@Override
	public EmpPayRateDetails getEmpPayrateDetailsByCandidateId(Integer candidateId) {
		EmpPayRateDetails  payrateObj=null;
		try {
		
		payrateObj=timesheetDao.getEmpPayrateDetailsByCandidateId(candidateId,null,null);
				
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return payrateObj;
	}
	
	@Override
	public String updatestatusreport(String challenges, String outputs, String delivers, String canidateId,
			Integer loginempno, String statureportId, Integer role) {
		String message = null;
		try {
			int canidateid = 0;
			if (!canidateId.isEmpty()) {
				canidateid = Integer.parseInt(canidateId);
			}
			int statureportid = 0;
			if (!statureportId.isEmpty()) {
				statureportid = Integer.parseInt(statureportId);
			}
			StatusReportEntity reportObj = reportDao.getStatusDeailsByStatusId(statureportid);
			if (reportObj != null) {
					reportObj.setChallenges(challenges);
					reportObj.setDeliverables(delivers);
					reportObj.setOutputs(outputs);
					//reportObj.setSubmitted_on(new Date());
					reportDao.updateStatus(reportObj);
					message = "Status Report Updated Successfully";
			}

		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return message;
	}

}
