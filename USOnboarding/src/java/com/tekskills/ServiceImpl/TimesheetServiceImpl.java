package com.tekskills.ServiceImpl;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.Month;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.Map.Entry;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.tekskills.Dao.EmployeesDao;
import com.tekskills.Dao.TimesheetDao;
import com.tekskills.Dto.BasicDetailsDto;
import com.tekskills.Dto.ClientVendorMaster_DTO;
import com.tekskills.Dto.EmployeeDto;
import com.tekskills.Dto.InvoiceDto;
import com.tekskills.Dto.MailingDto;
import com.tekskills.Dto.SearchBean;
import com.tekskills.Dto.TimesheetDto;
import com.tekskills.Entity.BiWeeklyTemplateEntity1;
import com.tekskills.Entity.BiWeeklyTemplateEntity2;
import com.tekskills.Entity.CandidateDetailedInfo;
import com.tekskills.Entity.CustomerMasterEntity;
import com.tekskills.Entity.EmpPayRateDetails;
import com.tekskills.Entity.LeaveAttachmentsEntity;
import com.tekskills.Entity.MailReminderCountEntity;
import com.tekskills.Entity.MonthlyTemplateEntity;
import com.tekskills.Entity.SemiMonthlyTemplateEntity;
import com.tekskills.Entity.StatusReportEntity;
import com.tekskills.Entity.StatusReportTemplateEntity;
import com.tekskills.Entity.TimesheetDetailsEntity;
import com.tekskills.Entity.TimesheetEntity;
import com.tekskills.Entity.WeeklyTemplateEntity;
import com.tekskills.Service.TimesheetService;
import com.tekskills.Util.Commons;
import com.tekskills.Util.SendHtmlEmailNew;

@Service
@PropertySource("/WEB-INF/mail.properties")
public class TimesheetServiceImpl implements TimesheetService {
	private static final Logger logger = Logger.getLogger(TimesheetServiceImpl.class);
	@Autowired
	TimesheetDao timesheetDao;
	@Autowired
	private Commons commons;
	@Autowired
	private Commons commonObj;
	@Autowired
	EmployeesDao empDao;
	@Autowired
	private SendHtmlEmailNew sendmail;
	@Autowired
	private Environment env;

	@Override
	public String saveBiWeeklyTimesheetTemplate(String month, String year, Integer loginempno, String periodname,
			String fromdate, String todate, String payroll_fromdate, String payroll_todate) {
		String message = null;
		try {
			int yearid = 0;
			if (!year.isEmpty()) {
				yearid = Integer.parseInt(year);
			}

			SemiMonthlyTemplateEntity biweeklyObj = new SemiMonthlyTemplateEntity();
			biweeklyObj.setYear(yearid);
			biweeklyObj.setMonth(month);
			biweeklyObj.setPosted_by(loginempno);
			biweeklyObj.setPeriod(periodname);
			biweeklyObj.setPayroll_fromdate(payroll_fromdate);
			biweeklyObj.setPayroll_todate(payroll_todate);
			biweeklyObj.setPeriod_fromdate(fromdate);
			biweeklyObj.setPeriod_todate(todate);
			biweeklyObj.setSubmitted_date(new Date());

			Integer templateId = timesheetDao.saveBiWeeklyTimesheet(biweeklyObj);
			if (templateId != null) {
				message = "Weekly Template Added Successfully";
			} else {
				message = "Something went wrong!!";
			}
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return message;
	}

	@Override
	public String saveWeeklyTimesheetTemplate(String month, String year, Integer loginempno, String weeks,
			String fromdate, String todate, String payroll_fromdate, String payroll_todate) {
		String message = null;
		try {
			int yearid = 0;
			if (!year.isEmpty()) {
				yearid = Integer.parseInt(year);
			}

			WeeklyTemplateEntity weeklyObj = new WeeklyTemplateEntity();
			weeklyObj.setYear(yearid);
			weeklyObj.setMonth(month);
			weeklyObj.setPosted_by(loginempno);
			weeklyObj.setPayroll_fromdate(payroll_fromdate);
			weeklyObj.setPayroll_todate(payroll_todate);
			weeklyObj.setWeeks(weeks);
			weeklyObj.setWeek_fromdate(fromdate);
			weeklyObj.setWeek_todate(todate);
			weeklyObj.setSubmitted_date(new Date());
			Integer templateId = timesheetDao.saveWeeklyTimesheet(weeklyObj);
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
	public String checkBiweeklyTemplateByMonthYear(String year, String month) {
		String message = null;
		try {
			int yearid = 0;
			if (!year.isEmpty()) {
				yearid = Integer.parseInt(year);
			}
			TimesheetDto reportObj = timesheetDao.checkBiweeklyTemplateByMonthYear(yearid, month);
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
	public String checkweeklyTemplateByMonthYear(String year, String month) {
		String message = null;
		try {
			int yearid = 0;
			if (!year.isEmpty()) {
				yearid = Integer.parseInt(year);
			}
			TimesheetDto reportObj = timesheetDao.checkweeklyTemplateByMonthYear(yearid, month);
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
	public String saveweeklytemplate(String year, Integer posted_by) {
		String message = null;
		try {
			int yearid = 0;
			if (!year.isEmpty()) {
				yearid = Integer.parseInt(year);
			}
			Integer templateId = null;
			List<TimesheetDto> weeklytemplate = commons.getAllWeeksByYear(yearid);
			for (TimesheetDto timesheetDto : weeklytemplate) {
				WeeklyTemplateEntity weeklyObj = new WeeklyTemplateEntity();

				weeklyObj.setMonth(timesheetDto.getMonth());
				weeklyObj.setYear(timesheetDto.getYear());
				weeklyObj.setWeeks(timesheetDto.getWeekno().toString());
				weeklyObj.setWeek_fromdate(timesheetDto.getFromdate());
				weeklyObj.setWeek_todate(timesheetDto.getTodate());
				weeklyObj.setPosted_by(posted_by);
				weeklyObj.setSubmitted_date(new Date());
				templateId = timesheetDao.saveWeeklyTimesheet(weeklyObj);
			}
			List<TimesheetDto> semimonthtemplate = commons.getSemiMonthTemplate(yearid);
			for (TimesheetDto timesheetDto : semimonthtemplate) {
				StatusReportTemplateEntity reportObj = new StatusReportTemplateEntity();

				reportObj.setMonth(timesheetDto.getMonth());
				reportObj.setYear(timesheetDto.getYear());
				reportObj.setPosted_by(posted_by);
				reportObj.setPeriod(timesheetDto.getPeriod());
				reportObj.setFrom_date(timesheetDto.getFrom_date());
				reportObj.setTo_date(timesheetDto.getTo_date());
				reportObj.setPeriod_name(timesheetDto.getPeriod_name());
				reportObj.setSubmitted_on(new Date());
								
				templateId = timesheetDao.saveStatusTemplate(reportObj);
			}
			List<TimesheetDto> biweeklytemplate1 = commons.getBiweeklyTemplate_1(yearid);
			for (TimesheetDto timesheetDto : biweeklytemplate1) {
				BiWeeklyTemplateEntity1 weeklyObj = new BiWeeklyTemplateEntity1();

				weeklyObj.setMonth(timesheetDto.getMonth());
				weeklyObj.setYear(timesheetDto.getYear());
				weeklyObj.setWeeks(timesheetDto.getWeekno().toString());
				weeklyObj.setWeek_fromdate(timesheetDto.getFromdate());
				weeklyObj.setWeek_todate(timesheetDto.getTodate());
				weeklyObj.setPosted_by(posted_by);
				weeklyObj.setSubmitted_date(new Date());
				templateId = timesheetDao.saveBiWeeklyTimesheet1(weeklyObj);
			}
			List<TimesheetDto> biweeklytemplate2 = commons.getBiweeklyTemplate_2(yearid);
			for (TimesheetDto timesheetDto : biweeklytemplate2) {
				BiWeeklyTemplateEntity2 weeklyObj = new BiWeeklyTemplateEntity2();

				weeklyObj.setMonth(timesheetDto.getMonth());
				weeklyObj.setYear(timesheetDto.getYear());
				weeklyObj.setWeeks(timesheetDto.getWeekno().toString());
				weeklyObj.setWeek_fromdate(timesheetDto.getFromdate());
				weeklyObj.setWeek_todate(timesheetDto.getTodate());
				weeklyObj.setPosted_by(posted_by);
				weeklyObj.setSubmitted_date(new Date());
				templateId = timesheetDao.saveBiWeeklyTimesheet2(weeklyObj);
			}
			List<TimesheetDto> monthlyTemplate = commons.getMonthlyTemplate(yearid);
			for (TimesheetDto timesheetDto : monthlyTemplate) {
				MonthlyTemplateEntity monthObj = new MonthlyTemplateEntity();

				monthObj.setMonth(timesheetDto.getMonth());
				monthObj.setYear(timesheetDto.getYear());
				monthObj.setMonth_no(timesheetDto.getWeekno());
				monthObj.setPayroll_fromdate(timesheetDto.getFromdate());
				monthObj.setPayroll_todate(timesheetDto.getTodate());
				monthObj.setPosted_by(posted_by);
				monthObj.setSubmitted_date(new Date());
				templateId = timesheetDao.saveMonthlyTemplate(monthObj);
			}

			if (templateId != null) {
				message = "Templates Added Successfully";
			} else {
				message = "Something went wrong!!";
			}
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return message;
	}

	@Override
	public String checktstemplate(String year) {
		String message = null;
		try {
			int yearid = 0;
			if (!year.isEmpty()) {
				yearid = Integer.parseInt(year);
			}
			Integer yr = timesheetDao.checktstemplate(yearid);
			if (yr != null) {
				message = "Template already added for year [" + year + "]";
			} else {
				message = null;
			}
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return message;
	}

	@Override
	public TimesheetDto getPeningTimesheetByCandidateId(Integer candidateId, String payrollType, String emptype, Integer payrate_id) {
		TimesheetDto  timesheetDTO=new TimesheetDto();
		try {
			String payroll=null;int payrateid=0;
			if(emptype.equalsIgnoreCase("W2 Admin")) {
				payroll=payrollType;
			}else {
				EmpPayRateDetails payrateObj=timesheetDao.getEmpPayrateDetailsByCandidateId(candidateId,emptype,payrate_id);
				if(payrateObj!=null) {
					payrateid=payrateObj.getPayrate_id();
					payroll=payrateObj.getPayroll_type();
				}
			}
			System.out.println("----------->"+candidateId);
			List<TimesheetDto> timesheetList = timesheetDao.getPeningTimesheetByCandidateId(candidateId, payroll,emptype,payrateid);
			
			timesheetDTO.setPayrollType(payroll);
			timesheetDTO.setTimesheetList(timesheetList);
			timesheetDTO.setPayrateid(payrateid);
			EmpPayRateDetails payrateObj=empDao.getPayrateDetailsByPayrateId(payrateid);
			if(payrateObj!=null) {
				if(payrateObj.getCustomer_id()!=0 || payrateObj.getCustomer_id()!=null) {
					CustomerMasterEntity custObj=empDao.getCustomerDetailsById(payrateObj.getCustomer_id());
					timesheetDTO.setCustomer_name(custObj.getCustomer_name());
				}else {
					timesheetDTO.setCustomer_name("NA");
				}
			}
			else {
				timesheetDTO.setCustomer_name("NA");
			}
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return timesheetDTO;
	}

	@Override
	public List<TimesheetDto> getDetailsByweekId(String weekid, String payrollType) {
		List<TimesheetDto> timesheetList = new ArrayList<TimesheetDto>();
		try {
			int week_id = 0;
			if (!weekid.isEmpty()) {
				week_id = Integer.parseInt(weekid);
			}
			TimesheetDto weektempObj = timesheetDao.getDetailsByweekId(week_id, payrollType);
			System.out.println(payrollType + "-----------" + weekid);

			if (weektempObj != null) {
				String fromdate = weektempObj.getWeek_fromdate();
				String todate = weektempObj.getWeek_todate();

				System.out.println(fromdate + "fromdate----------todate-" + todate);

				DateFormat df = new SimpleDateFormat("MM/dd/yyyy", Locale.getDefault());
				Date fd = new Date();
				Date td = new Date();
				fd = df.parse(fromdate);
				td = df.parse(todate);

				Calendar start = Calendar.getInstance();
				start.setTime(fd);

				Calendar end = Calendar.getInstance();
				end.setTime(td);

				for (Date sdate = start.getTime(); !start.after(end); start.add(Calendar.DATE,1), sdate = start.getTime()) {
					TimesheetDto dto = new TimesheetDto();
					SimpleDateFormat sdf = new SimpleDateFormat("MMMM");
					SimpleDateFormat dname = new SimpleDateFormat("EEEE");

					String dates = df.format(sdate);
					dto.setMonth(sdf.format(sdate));
					dto.setDates(dates);
					dto.setDayname(dname.format(sdate));
					timesheetList.add(dto);
					System.out.println(dates);
				}

			}

		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return timesheetList;
	}

	@Override
	public String savetimesheet(String[] dates1, String[] dayname1, String[] billablehrs1, String[] nonbillablehrs1,
			String[] leave1, String[] comments1, String canidateId, MultipartFile mgrapprovedts,
			List<MultipartFile> LLmultipartFiles, Integer loginempno, String year, String month, String weeks,
			String fromdate, String todate, String weekId, String tablength,Integer validateby,String[] over_time,String payrate_id) {
		String message = null;
		try {
			Integer candidate_Id = Integer.parseInt(canidateId);

			int yearid = 0;
			if (!year.isEmpty()) {
				yearid = Integer.parseInt(year);
			}

			int tblLen = 0;
			if (!tablength.isEmpty()) {
				tblLen = Integer.parseInt(tablength);
			}
			Integer payrateId = 0;
			if (!payrate_id.isEmpty()) {
				payrateId = Integer.parseInt(payrate_id);
			}
			Integer timesheetId = null;
			//if (mgrapprovedts != null) {
			ClientVendorMaster_DTO detilsObj=empDao.getCustomerEndclientByPayrateId(payrateId);
			int endclientid=0;int customerid=0;
			if(detilsObj!=null) {
				endclientid=detilsObj.getClientid();
				customerid=detilsObj.getCustid();
			}
			
					TimesheetEntity timesheetObj = new TimesheetEntity();
					timesheetObj.setCandidate_id(candidate_Id);
					timesheetObj.setMonth(month);
					timesheetObj.setYear(yearid);
					timesheetObj.setWeek_or_period(weekId);
					
					timesheetObj.setCadidate_status("Submitted");
					timesheetObj.setTimesheet_status("Submitted");
					
					/*if(validateby==1) {
						timesheetObj.setCadidate_status("Submitted");
						timesheetObj.setTimesheet_status("Submitted");
						timesheetObj.setManager_status("Submitted");
						timesheetObj.setHr_status(null);
						timesheetObj.setAudit_status(null);
					}else if(validateby==2) {
						timesheetObj.setCadidate_status("Submitted");
						timesheetObj.setTimesheet_status("Submitted");
						timesheetObj.setManager_status("Submitted");
						timesheetObj.setHr_status("Submitted");
						timesheetObj.setAudit_status(null);
					}else if(validateby==3) {
						timesheetObj.setCadidate_status("Submitted");
						timesheetObj.setTimesheet_status("Submitted");
						timesheetObj.setManager_status("Submitted");
						timesheetObj.setHr_status("Submitted");
						timesheetObj.setAudit_status("Submitted");
					}*/
					
					timesheetObj.setFrom_date(fromdate);
					timesheetObj.setTo_date(todate);
					timesheetObj.setCandidate_submitted_on(new Date());
					timesheetObj.setClient_mgr_approved_fie(mgrapprovedts.getOriginalFilename());
					timesheetObj.setPayrate_id(payrateId);
					timesheetObj.setEndclient_id(endclientid);
					timesheetObj.setCustomer_id(customerid);
					
					
					timesheetId = timesheetDao.savetimesheet(timesheetObj);
					if (!mgrapprovedts.getOriginalFilename().isEmpty()) {
					commonObj.fileToDirectory(candidate_Id, mgrapprovedts, null, null);
				}
				if (timesheetId != null) {
					TimesheetDetailsEntity tsDetailsObj = new TimesheetDetailsEntity();
					tsDetailsObj.setTimesheet_id(timesheetId);
					tsDetailsObj.setCandidate_id(candidate_Id);

					for (int i = 0; i < tblLen; i++) {
						String dates = dates1[i];
						String dayname = dayname1[i];
						String billablehrs = billablehrs1[i];
						String nonbillablehrs = nonbillablehrs1[i];
						String leave = leave1[i];
						String comments = comments1[i];
						String overtime = over_time[i];
						/*int leaveid = 0;
						if (!leave.isEmpty()) {
							leaveid = Integer.parseInt(leave);
						}*/
						tsDetailsObj.setDay_name(dayname);
						tsDetailsObj.setDate(dates);
						tsDetailsObj.setComments(comments);
						tsDetailsObj.setLeaves(leave);
						tsDetailsObj.setBillable_hours(billablehrs);
						tsDetailsObj.setNonbillable_hours(nonbillablehrs);
						tsDetailsObj.setOver_time(overtime);
						timesheetDao.saveDetailedTimeheet(tsDetailsObj);
					}

					if (LLmultipartFiles.size() > 0) {
						for (MultipartFile multipartFile : LLmultipartFiles) {
							if (!multipartFile.getOriginalFilename().isEmpty()) {
								LeaveAttachmentsEntity leaveObj = new LeaveAttachmentsEntity();
								leaveObj.setCandidate_id(candidate_Id);
								leaveObj.setTimesheet_id(timesheetId);
								leaveObj.setLeave_filename(multipartFile.getOriginalFilename());
								timesheetDao.saveLeaveAttachements(leaveObj);
								commonObj.fileToDirectory(candidate_Id, multipartFile, null, null);
							}
						}
					}
					message = "Timesheet submitted successfully";
				//}
				String tomail="";String toname="";
				BasicDetailsDto	empObj=empDao.viewEmployeeInfo(candidate_Id);
					if(empObj!=null) {
						String emptype=empObj.getEmp_type();
						String fromail=empObj.getEmailid();
						if(emptype.equalsIgnoreCase("W2 Admin")) {
							 tomail=env.getProperty("tsmanager_w2admin");
							 toname="Madhavi Manthena,";
						}
						else {
							 tomail=env.getProperty("ts_w2s");
							 toname="Team";
						}
						
						String subject="Timesheet submitted from "+fromdate+" to "+todate+" ";
						String body="Please approve submitted timesheet.";
						String fromname=empObj.getFullname();
						sendmail.sendTimesheetMail(fromail, tomail, toname, subject, body,fromname);
					}
					
					
					
			} else {
				message = "Timesheet not submitted";
			}

		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return message;
	}

	@Override
	public List<TimesheetDto> getViewTimesheet(String year, String status, Integer role, Integer candidateId,
			String lgemptype,String month, String customertype) {
		List<TimesheetDto> timesheetList = null;
		try {
			int yearid = 0;
			if (!year.isEmpty()) {
				yearid = Integer.parseInt(year);
			}int custType = 0;
			if (!customertype.isEmpty()) {
				custType = Integer.parseInt(customertype);
			}
			timesheetList = timesheetDao.getViewTimesheet(yearid, status, role, candidateId, lgemptype,month,custType);
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return timesheetList;
	}
	
	@Override
	public List<TimesheetDto> getPendingViewTimesheet(String year, String status, Integer role, Integer candidateId,
			String lgemptype,String month, String customertype) {
		List<TimesheetDto> timesheetList = null;
		try {
			int yearid = 0;
			if (!year.isEmpty()) {
				yearid = Integer.parseInt(year);
			}int custType = 0;
			if (!customertype.isEmpty()) {
				custType = Integer.parseInt(customertype);
			}
			timesheetList = timesheetDao.getPendingViewTimesheet(yearid, status, role, candidateId, lgemptype,month,custType);
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return timesheetList;
	}

	@Override
	public TimesheetDto getTimesheetDetailsById(String candidateid, String timesheet_id) {
		TimesheetDto timesheetObj = new TimesheetDto();
		try {

			int candidateId = 0;
			int timesheetId = 0;
			if (!candidateid.isEmpty()) {
				candidateId = Integer.parseInt(candidateid);
			}
			if (!timesheet_id.isEmpty()) {
				timesheetId = Integer.parseInt(timesheet_id);
			}
			TimesheetEntity tsDetails = timesheetDao.getTimesheetDetailsById(candidateId, timesheetId);
			List<TimesheetDetailsEntity> detailedTSList = timesheetDao.getDetailedTimesheetListById(candidateId,
					timesheetId);
			List<LeaveAttachmentsEntity> leavefilesList = timesheetDao.getLeaveAttachmentsById(candidateId,
					timesheetId);
			EmployeeDto basicObj= empDao.getCanidateDetailsByCanId(candidateId);
			timesheetObj.setBasicObj(basicObj);
			timesheetObj.setTsDetails(tsDetails);
			timesheetObj.setDetailedTSList(detailedTSList);
			timesheetObj.setLeavefilesList(leavefilesList);
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return timesheetObj;
	}

	@Override
	public String deleteLeaveLetter(String leaves_id) {
		String msg = null;
		try {
			Integer id = 0;
			if (leaves_id != "") {
				id = Integer.parseInt(leaves_id);
			}
			msg = timesheetDao.deleteDocumentByDocId(id);
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return msg;
	}

	@Override
	public String updatetimesheet(String[] billablehrs1, String[] nonbillablehrs1, String[] leave1, String[] comments1,
			String canidateId, MultipartFile mgrapprovedts, List<MultipartFile> lLmultipartFiles, String timesheet_Id, String[] over_time, String fromdate, String todate) {
		String message = null;
		try {
			Integer candidate_Id = Integer.parseInt(canidateId);

			int timesheet_id = 0;
			if (!timesheet_Id.isEmpty()) {
				timesheet_id = Integer.parseInt(timesheet_Id);
			}

			TimesheetEntity timesheetObj = timesheetDao.getTimesheetDetailsById(candidate_Id, timesheet_id);
			if (timesheetObj != null) {
				if (!mgrapprovedts.getOriginalFilename().isEmpty()) {

					timesheetObj.setClient_mgr_approved_fie(mgrapprovedts.getOriginalFilename());
					timesheetDao.updateTimesheet(timesheetObj);
					commonObj.fileToDirectory(candidate_Id, mgrapprovedts, null, null);
				}

				List<TimesheetDetailsEntity> detailedList = timesheetDao.getDetailedTimesheetListById(candidate_Id,
						timesheet_id);

				for (int i = 0; i < detailedList.size(); i++) {
					String bilhrs = billablehrs1[i];
					String nonbilhrs = nonbillablehrs1[i];
					String leavs = leave1[i];
					String comments = comments1[i];
					String overtime = over_time[i];

					detailedList.get(i).setBillable_hours(bilhrs);
					detailedList.get(i).setNonbillable_hours(nonbilhrs);
					detailedList.get(i).setOver_time(overtime);
					detailedList.get(i).setLeaves(leavs);
					detailedList.get(i).setComments(comments);
					

					timesheetDao.updateDetailedTimesheet(detailedList.get(i));

				}

				if (lLmultipartFiles.size() > 0) {
					for (MultipartFile multipartFile : lLmultipartFiles) {
						if (!multipartFile.getOriginalFilename().isEmpty()) {
							LeaveAttachmentsEntity leaveObj = new LeaveAttachmentsEntity();
							leaveObj.setCandidate_id(candidate_Id);
							leaveObj.setTimesheet_id(timesheet_id);
							leaveObj.setLeave_filename(multipartFile.getOriginalFilename());
							timesheetDao.saveLeaveAttachements(leaveObj);
							commonObj.fileToDirectory(candidate_Id, multipartFile, null, null);
						}
					}
				}
				
				message = "Timesheet updated successfully";
				String tomail="";String toname="";
				BasicDetailsDto	empObj=empDao.viewEmployeeInfo(candidate_Id);
					if(empObj!=null) {
						String emptype=empObj.getEmp_type();
						String fromail=empObj.getEmailid();
						if(emptype.equalsIgnoreCase("W2 Admin")) {
							 tomail=env.getProperty("tsmanager_w2admin");
							 toname="Madhavi Manthena,";
						}
						else {
							 tomail=env.getProperty("ts_w2s");
							 toname="Team";
						}
						
						String subject="Timesheet details updated from "+fromdate+" to "+todate+" ";
						String body="Please approve updated timesheet.";
						String fromname=empObj.getFullname();
						sendmail.sendTimesheetMail(fromail, tomail, toname, subject, body,fromname);
					}
					
			}

		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return message;
	}

	@Override
	public String updatetimesheetstatus(String candidateId, String status, String timesheetId, String comments,
			Integer role, String lgemptype, Integer dept, Integer lgempno ,String fromdate, String todate) {
		String message = null;
		try {
			int candidateid = 0;
			int timesheetid = 0;
			if (!candidateId.isEmpty()) {
				candidateid = Integer.parseInt(candidateId);
			}
			if (!timesheetId.isEmpty()) {
				timesheetid = Integer.parseInt(timesheetId);
			}
			CandidateDetailedInfo candidateObj = empDao.getCandidateDetailedInfoById(candidateid);
			TimesheetEntity tsDetails = timesheetDao.getTimesheetDetailsById(candidateid, timesheetid);
			if (tsDetails != null) {
				Integer validateBy = candidateObj.getValidateby_flag();
				
				if ((dept==8 && lgemptype.equalsIgnoreCase("W2 Admin")) || (dept!=0 && role == 2 && lgemptype.equalsIgnoreCase("W2 Admin")) || (role == 4 && dept==1 && (lgemptype.equalsIgnoreCase("W2 Admin")|| lgemptype.equalsIgnoreCase("Admin")))) {
					    tsDetails.setTimesheet_status(status);
					    tsDetails.setManager_comments(comments);
						tsDetails.setManager_status(status);
						tsDetails.setManager_empno(lgempno);
						tsDetails.setManager_approved_on(new Date());
				}
				/*if(dept==8 && lgemptype.equalsIgnoreCase("W2 Admin")) {
					tsDetails.setTimesheet_status(status);
					tsDetails.setHr_comments(comments);
					tsDetails.setHr_status(status);
					tsDetails.setHr_empno(lgempno);
					tsDetails.setHr_approved_on(new Date());
				}*/
				
				
				
			/*	if(dept==2 && (role == 5 || role==1) && lgemptype.equalsIgnoreCase("W2 Admin")) {
						tsDetails.setHr_comments(comments);
						tsDetails.setHr_status(status);
						tsDetails.setHr_empno(lgempno);
						tsDetails.setHr_approved_on(new Date());
					}*/
				
				
				
				
			/*	else {
					tsDetails.setAudit_comments(comments);
					tsDetails.setAudit_status(status);
					tsDetails.setAudit_empno(lgempno);
					tsDetails.setAudit_approved_on(new Date());
				}*/

				timesheetDao.updateTimesheet(tsDetails);
				
				String fromail="";String fromname="";
				BasicDetailsDto	empObj=empDao.viewEmployeeInfo(candidateid);
					if(empObj!=null) {
						String emptype=empObj.getEmp_type();
						String tomail=empObj.getEmailid();
						if(emptype.equalsIgnoreCase("W2 Admin")) {
							fromail=env.getProperty("tsmanager_w2admin");
							fromname="Madhavi Manthena,";
						}
						else {
							fromail=env.getProperty("ts_w2s");
							fromname="Timesheet Team";
						}
						String body="";
						String subject="Timesheet " + status + " from "+fromdate+" to "+todate+" ";
						if(status.equalsIgnoreCase("Rejected")) {
							 body="Timesheet has been " + status + ", please check in portal.";
						}else {
							 body="Timesheet has been " + status + ".";
						}
						
						String toname=empObj.getFullname();
						sendmail.sendTimesheetMail(fromail, tomail, toname, subject, body,fromname);
					}
				
				
				
				message = "Timesheet has been " + status + "";
			}

		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return message;
	}

	@Override
	public List<TimesheetDto> getWeeklyTimesheetByYear(Integer yr) {
		List<TimesheetDto> weeklytstList = null;
		try {
			weeklytstList = timesheetDao.getWeeklyTimesheetByYear(yr);
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return weeklytstList;
	}

	@Override
	public List<TimesheetDto> getMyTimesheet(String year, String status, Integer role, Integer candidateId,
			String lgemptype,String month,String customertype) {
		List<TimesheetDto> timesheetList = null;
		try {
			int yearid = 0;
			if (!year.isEmpty()) {
				yearid = Integer.parseInt(year);
			}
			int custType = 0;
			if (!customertype.isEmpty()) {
				custType = Integer.parseInt(customertype);
			}
			timesheetList = timesheetDao.getMyTimesheet(yearid, status, role, candidateId, lgemptype,month,custType);
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return timesheetList;
	}

	@Override
	public List<TimesheetDto> getMonthlyTemplate(Integer yr) {
		List<TimesheetDto> monthlist = null;
		try {
			
			monthlist = timesheetDao.getMonthlyTemplate(yr);
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return monthlist;
	}

	@Override
	public List<TimesheetDto> getBiweeklyTemplate_1(Integer yr) {
		List<TimesheetDto> monthlist = null;
		try {
			
			monthlist = timesheetDao.getBiweeklyTemplate_1(yr);
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return monthlist;
	}

	@Override
	public List<TimesheetDto> getBiweeklyTemplate_2(Integer yr) {
		List<TimesheetDto> monthlist = null;
		try {
			
			monthlist = timesheetDao.getBiweeklyTemplate_2(yr);
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return monthlist;
	}

	@Override
	public List<ClientVendorMaster_DTO> getEmpPayrateListByCandidateId(Integer candidateId, String emptype) {
		List<ClientVendorMaster_DTO> payratelist = null;
		try {
			
			payratelist = timesheetDao.getEmpPayrateListByCandidateId(candidateId, emptype);
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return payratelist;
	}

	
	@Override
	public String getCustomerNameByPayrateId(Integer payrate_id) {
		String custname = null;
		try {
			custname = timesheetDao.getCustomerNameByPayrateId(payrate_id);
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return custname;
	}

	/*@Override
	public TimesheetDto getAllCandidatePeningTimesheet() {
		  TimesheetDto  timesheetDTO=null;
		try {
			List<TimesheetDto> timesheetList = null;CandidateDetailedInfo candObj=null;
			List<SearchBean> searchemployee = empDao.getemplistBySearch("", "", "", "", "Employees");
			for (SearchBean empObj : searchemployee) {
			    timesheetDTO=new TimesheetDto();
				String payroll=null;int payrateid=0;
				  candObj=empDao.getCandidateDetailedInfoById(empObj.getCandidate_id());
				if(candObj.getEmp_type().equalsIgnoreCase("W2 Admin") && candObj.getPayroll_type()!=null) {
					payroll=candObj.getPayroll_type();
					timesheetList = timesheetDao.getPeningTimesheetByCandidateId(empObj.getCandidate_id(), payroll,candObj.getEmp_type(),payrateid);
					timesheetDTO.setPayrollType(payroll);
					timesheetDTO.setTimesheetList(timesheetList);
					timesheetDTO.setPayrateid(payrateid);
				}
			}
			
			
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return timesheetDTO;
	}*/
	@Override
	public List<TimesheetDto> getAllCandidatePeningTimesheet() {
		List<TimesheetDto> timesheetList = new ArrayList<TimesheetDto>();
		try {
			CandidateDetailedInfo candObj=null;
			List<SearchBean> searchemployee = empDao.getemplistBySearch("", "", "", "", "Employees","");
			System.out.println(searchemployee.size());
			for (SearchBean empObj : searchemployee) {
				String payroll=null;int payrateid=0;
			candObj=empDao.getCandidateDetailedInfoById(empObj.getCandidate_id());
			  if(candObj.getEmp_type().equalsIgnoreCase("W2 Admin") && candObj.getPayroll_type()!=null) {
				payroll=candObj.getPayroll_type();
				//List<TimesheetDto> timesheetList = timesheetDao.getPeningTimesheetByCandidateId(empObj.getCandidate_id(), payroll,candObj.getEmp_type(),payrateid);
				List<TimesheetDto> timesheetList1 = timesheetDao.getPeningTimesheetByCandidateId(empObj.getCandidate_id(), payroll,candObj.getEmp_type(),payrateid);
				for (TimesheetDto tslist : timesheetList1) {
					timesheetList.add(tslist);
				}
				/*timesheetDTO.setPayrollType(payroll);
				timesheetDTO.setTimesheetList(timesheetList);
				timesheetDTO.setPayrateid(payrateid);*/
				//CandPendingtimesheetList.add(timesheetDTO);
			}else if(candObj.getEmp_type().equalsIgnoreCase("W2")) {
				List<ClientVendorMaster_DTO>	payratelist = timesheetDao.getEmpPayrateListByCandidateId(empObj.getCandidate_id(), candObj.getEmp_type());
			for (ClientVendorMaster_DTO payrateidlist : payratelist) {
				List<TimesheetDto> timesheetListw2 = timesheetDao.getPeningTimesheetByCandidateId(empObj.getCandidate_id(), payrateidlist.getPayroll_type(),candObj.getEmp_type(),payrateidlist.getPayrate_id());
				System.out.println(timesheetListw2.size());
				for (TimesheetDto tslistw2 : timesheetListw2) {
					timesheetList.add(tslistw2);
				}
			}
			}
		  }
			
			
			/*if(emptype.equalsIgnoreCase("W2 Admin")) {
			
			}else {
				EmpPayRateDetails payrateObj=timesheetDao.getEmpPayrateDetailsByCandidateId(candidateId,emptype,payrate_id);
				if(payrateObj!=null) {
					payrateid=payrateObj.getPayrate_id();
					payroll=payrateObj.getPayroll_type();
				}
			}*/
			
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return timesheetList;
	}
	@Override
	public String tsmailreminder(String candidateid, Integer lgempno, String fdate, String tdate,Integer lgcandidateid,String lgemailid,String lgfullname) {
		String message = null;
		try {
			Integer candidate_id = 0;
			if (candidateid!="") {
				candidate_id = Integer.parseInt(candidateid);
			}
			MailReminderCountEntity mailObj = new MailReminderCountEntity();
			mailObj.setCandidate_id(candidate_id);
			mailObj.setSubmitted_on(new Date());
			mailObj.setSubmitted_by(lgempno);
			mailObj.setFrom_date(fdate);
			mailObj.setTo_date(tdate);
			/*Integer timesheet_id=timesheetDao.gettimsheetIdByDetails(candidate_id,fdate,tdate);
			mailObj.setTimesheet_id(timesheet_id);*/
			Integer reminderid = timesheetDao.saveTSmailreminder(mailObj);
			if (reminderid >0) {
				MailingDto maildto=new MailingDto();
				BasicDetailsDto candidateObj=empDao.viewEmployeeInfo(candidate_id);
				
				String frommail = lgemailid;
				String subject = "Reminder: Pening Timesheet for the period of "+fdate+" -- "+tdate+"";
				String comments = "You have pending timesheet for this period of "+fdate+" -- "+tdate+", please submit ASAP.";
				String tomail=candidateObj.getEmailid();	
				String fromname=lgfullname;String toname=candidateObj.getFullname();
				
				maildto.setFrommail(frommail);maildto.setToamil(tomail);
				maildto.setFromname(fromname);maildto.setToname(toname);
				maildto.setSubject(subject);maildto.setComments(comments);
				
				sendmail.tsmailreminder(maildto);
				message = "Mail Sent !!";
			} else {
				message = "Mail Not Sent !!";
			}
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return message;
	}

	@Override
	public List<TimesheetDto> getmailhistory(String candidateid, String fdate, String tdate) {
		List<TimesheetDto> reminderlist = null;
		try {
			Integer candidate_id = 0;
			if (candidateid!="") {
				candidate_id = Integer.parseInt(candidateid);
			}
			reminderlist=timesheetDao.getmailhistory(candidate_id,fdate,tdate);
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return reminderlist;
	}

	@Override
	public String downloadInvoicepdf(String candidateid,String timesheet_id) {
		String htmlText = null;
		try {
			Integer candidate_id = 0;
			if (candidateid!="") {
				candidate_id = Integer.parseInt(candidateid);
			}
			int timesheetId = 0;
			if (!timesheet_id.isEmpty()) {
				timesheetId = Integer.parseInt(timesheet_id);
			}
			TimesheetDto timesheetObj = new TimesheetDto();
		//	StatusReportEntity reportObj = timesheetDao.getStatusDeailsByStatusId(candidate_id);
			TimesheetEntity tsDetails = timesheetDao.getTimesheetDetailsById(candidate_id, timesheetId);
			EmployeeDto basicObj= empDao.getCanidateDetailsByCanId(candidate_id);
			//Integer hrs=timesheetDao.getTimesheetDetailsById(candidateId, timesheetId);
			ClientVendorMaster_DTO payRateObj=empDao.getPayRateDetailsByCandidateId(candidate_id,tsDetails.getPayrate_id());
			timesheetObj.setPayRateObj(payRateObj);
			timesheetObj.setBasicObj(basicObj);
			timesheetObj.setTsDetails(tsDetails);
			htmlText = downloadInvoicepdf(timesheetObj);
		   }
			catch (Exception e) {
				logger.error("Error while  downloadInvoicepdf", e);
			}
			return htmlText;
	}

	private String downloadInvoicepdf(TimesheetDto tsDetails) {
		String htmlText = null;
		try {
			Map<String, String> input = new HashMap<String, String>();
			String period=tsDetails.getTsDetails().getWeek_or_period();
			String month=tsDetails.getTsDetails().getMonth();
			/*String periods=month+"("+period+")";
			String submittedon=commons.getSQLDateToMMDDYYYY(new Date());*/
			
		//	LocalDate currentDate= LocalDate.parse(tsDetails.getTsDetails().getFrom_date());
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MM/dd/yyyy");
			LocalDate localDate = LocalDate.parse(tsDetails.getTsDetails().getFrom_date() , formatter );
			int dayif = localDate.getDayOfMonth();
            Month monthif = localDate.getMonth();
            Integer yearif = localDate.getYear();
            String invFrmif=dayif+" "+monthif;
            System.out.println(dayif+"**day**month**"+monthif+"***"+yearif+"****invFrm**"+invFrmif);
            
            LocalDate localDate2 = LocalDate.parse(tsDetails.getTsDetails().getTo_date(),formatter);
			int dayto = localDate2.getDayOfMonth();
            Month monthto = localDate2.getMonth();
            Integer yearto = localDate2.getYear();
            String invto=dayto+" "+monthto;
            System.out.println(dayto+"**day to**month**"+monthto+"*to**"+yearto+"**to**invto**"+invto);
            
            LocalDate invdDate = LocalDate.parse(tsDetails.getTsDetails().getFrom_date(),formatter).plusDays(45);
			System.out.println("**invdDate**"+invdDate);
		//	Float invAmount=Float.parseFloat(tsDetails.getPayRateObj().getBillrate())*
			//invDate invDueDate invTerm invADate invToName invHrs invRate invAmt invFrom invTo invCustName  invMonth
			String htmlfile = env.getProperty("generateInvoice");
			input.put("invName", tsDetails.getBasicObj().getFull_name());
			input.put("invCustName", tsDetails.getPayRateObj().getCustname());
			input.put("invFrom", invFrmif);
			input.put("invTo", invto);
			input.put("invMonth", monthif.toString());
			input.put("invYear", yearif.toString());
			input.put("invHrs", month);
			input.put("invRate", tsDetails.getPayRateObj().getBillrate());
			input.put("invAmt", month);
			input.put("invTerm", tsDetails.getPayRateObj().getInvoiceterms());
			input.put("invLDate", tsDetails.getTsDetails().getTo_date());
			input.put("invDueDate", invdDate.toString());
			input.put("invADate", tsDetails.getTsDetails().getFrom_date());
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
	public List<BasicDetailsDto> getCandidateList() {
		List<BasicDetailsDto> canList = null;
		try {
			canList = timesheetDao.getCandidateList();
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return canList;	
	}
	
	@Override
	public List<ClientVendorMaster_DTO> getCustomertListByCandidateId(String candidateid) {
		List<ClientVendorMaster_DTO> payratelist = null;
		try {
			Integer candidate_id = 0;
			if (!candidateid.isEmpty()) {
				candidate_id = Integer.parseInt(candidateid);
			}
			payratelist = timesheetDao.getCustomertListByCandidateId(candidate_id);
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return payratelist;
	}

	@Override
	public List<TimesheetDto> getAllCandidateApprovedTimesheet(String year, String month) {
		List<TimesheetDto> timesheetList = new ArrayList<TimesheetDto>();
		try {
			/*CandidateDetailedInfo candObj=null;
			 LocalDate currentdate = LocalDate.now();
			 Month currentMonth = currentdate.getMonth();
		      System.out.println("Current month: "+currentMonth);
		      //getting the current year
		      int currentYear = currentdate.getYear();
		      System.out.println("Current month: "+currentYear);*/
			int yearid = 0;
			if (!year.isEmpty()) {
				yearid = Integer.parseInt(year);
			}
			
			//List<String> monthlist=
			int monthno=Month.valueOf(month.toUpperCase()).getValue();
			String previousmonth=Month.of(monthno-1).name();
			String nextmonth=Month.of(monthno+1).name();
			List<String> stringlist=new ArrayList<String>();
			stringlist.add(nextmonth);
			stringlist.add(previousmonth);
			stringlist.add(month);
			timesheetList = timesheetDao.getAllCandidateApprovedTimesheet(yearid,stringlist);
			/*List<SearchBean> searchemployee = empDao.getemplistBySearch("", "", "", "", "Employees","");
			System.out.println(searchemployee.size());
			for (SearchBean empObj : searchemployee) {
			candObj=empDao.getCandidateDetailedInfoById(empObj.getCandidate_id());
			
			  String payroll=null;int payrateid=0;
			  if(candObj.getEmp_type().equalsIgnoreCase("W2 Admin") && candObj.getPayroll_type()!=null) {
				payroll=candObj.getPayroll_type();
				//List<TimesheetDto> timesheetList = timesheetDao.getPeningTimesheetByCandidateId(empObj.getCandidate_id(), payroll,candObj.getEmp_type(),payrateid);
				List<TimesheetDto> timesheetList1 = timesheetDao.getPeningTimesheetByCandidateId(empObj.getCandidate_id(), payroll,candObj.getEmp_type(),payrateid);
				for (TimesheetDto tslist : timesheetList1) {
					timesheetList.add(tslist);
				}
				timesheetDTO.setPayrollType(payroll);
				timesheetDTO.setTimesheetList(timesheetList);
				timesheetDTO.setPayrateid(payrateid);
				//CandPendingtimesheetList.add(timesheetDTO);
			}else 
			//[getWeeklyApprovedTimesheetByCanId]
			if(candObj.getEmp_type().equalsIgnoreCase("W2")) {
				List<ClientVendorMaster_DTO>	payratelist = timesheetDao.getEmpPayrateListByCandidateId(empObj.getCandidate_id(), candObj.getEmp_type());
			for (ClientVendorMaster_DTO payrateidlist : payratelist) {
				List<TimesheetDto> timesheetListw2 = timesheetDao.getApprovedTimesheetByCandidateId(empObj.getCandidate_id(), payrateidlist.getPayroll_type(),candObj.getEmp_type(),payrateidlist.getPayrate_id());
				System.out.println(timesheetListw2.size());
				for (TimesheetDto tslistw2 : timesheetListw2) {
					timesheetList.add(tslistw2);
				 }
			  }
			}
		  }*/
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return timesheetList;
	}

	@Override
	public List<TimesheetDto> getViewTimesheetByCandiateId(String year, String month, String candidate, String status, String payrateid) {
		List<TimesheetDto> timesheetList = null;
		try {
			int yearid = 0;
			if (!year.isEmpty()) {
				yearid = Integer.parseInt(year);
			}
			Integer candidateid = 0;
			if (!candidate.isEmpty()) {
				candidateid = Integer.parseInt(candidate);
			}
			Integer payrate_id = 0;
			if (!payrateid.isEmpty()) {
				payrate_id = Integer.parseInt(payrateid);
			}
			timesheetList = timesheetDao.getViewTimesheetByCandiateId(yearid,month,candidateid,status,payrate_id);
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return timesheetList;
	}

	@Override
	public List<Integer> getTimesheetIdByCandiateId(String fromdate, String duedate, String candidate,
			String customer) {
		List<Integer> timesheetIds = null;
		try {
			Date fd = new Date();
			Date td = new Date();
			DateFormat df = new SimpleDateFormat("MM/dd/yyyy", Locale.getDefault());
			fd = df.parse(fromdate);
			td = df.parse(fromdate);
			String from_date=commons.getSQLDateToMMDDYYYY(fd);
			String to_date=commons.getSQLDateToMMDDYYYY(td);
			
			Integer candidateid = 0;
			if (!candidate.isEmpty()) {
				candidateid = Integer.parseInt(candidate);
			}
			Integer customerid = 0;
			if (!customer.isEmpty()) {
				customerid = Integer.parseInt(customer);
			}
			timesheetIds = timesheetDao.getTimesheetIdByCandiateId(from_date,to_date,candidateid,customerid);
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return timesheetIds;
	}

	@Override
	public String getBillableHoursByTimesheetIds(List<Integer> timesheetIds, String candidate) {
		String BillableHours = null;
		try {
			Integer candidateid = 0;
			if (!candidate.isEmpty()) {
				candidateid = Integer.parseInt(candidate);
			}
			BillableHours = timesheetDao.getBillableHoursByTimesheetIds(timesheetIds,candidateid);
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return BillableHours;
	}

	@Override
	public InvoiceDto getViewTimesheetByTimesheetId(String candidateid, String timesheetid) {
		InvoiceDto timesheetObj = new InvoiceDto();
		try {
			int timesheet_id = 0;
			if (!timesheetid.isEmpty()) {
				timesheet_id = Integer.parseInt(timesheetid);
			}
			Integer candidate_id = 0;
			if (!candidateid.isEmpty()) {
				candidate_id = Integer.parseInt(candidateid);
			}
			String billableHours = timesheetDao.getBillableHoursByTimesheetIds(timesheet_id,candidate_id);
			timesheetObj.setTotalbillablehours(billableHours);
			
			TimesheetEntity tsDetails = timesheetDao.getTimesheetDetailsById(candidate_id, timesheet_id);
			
			EmpPayRateDetails payrateOBj=empDao.getPayrateDetailsByPayrateId(tsDetails.getPayrate_id());
			timesheetObj.setBillrate(payrateOBj.getBillrate());
			timesheetObj.setInvoice_terms(payrateOBj.getInvoice_terms());
			
			CustomerMasterEntity custObj=empDao.getCustomerDetailsById(tsDetails.getCustomer_id());
			timesheetObj.setQbcustid(custObj.getQb_customerid());
			
			/*String fromdate=commonObj.getDayMonthYear(tsDetails.getFrom_date());
			String todate=commonObj.getDayMonthYear(tsDetails.getTo_date());
			System.out.println(fromdate+"*********"+todate);*/
			timesheetObj.setFromdate(tsDetails.getFrom_date());
			timesheetObj.setTodate(tsDetails.getTo_date());
			timesheetObj.setTimesheet_id(tsDetails.getTimesheet_id());
			
			//timesheetObj = timesheetDao.getViewTimesheetByTimesheetId(candidateid,timesheet_id);
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return timesheetObj;
	}

	@Override
	public InvoiceDto getBillableHoursDetailsByDates(String candidateid, String fromdate, String todate,
			String customer, String invPeriod, String payrate_id) {
		InvoiceDto timesheetObj = new InvoiceDto();
		try {
			Integer candidate_id = 0;
			if (!candidateid.isEmpty()) {
				candidate_id = Integer.parseInt(candidateid);
			}			
			Integer payrateid = 0;
			if (!payrate_id.isEmpty()) {
				payrateid = Integer.parseInt(payrate_id);
			}
			Integer customerid = 0;
			if (!customer.isEmpty()) {
				customerid = Integer.parseInt(customer);
			}
		//	List<Integer> timesheetIds1=null;
			//List<Integer> timesheetIds = timesheetDao.getTimesheetIdByCandiateIdDates(fromdate,todate,candidate_id,customerid);
			List<Integer> timesheetIds = timesheetDao.gettimesheetidsbydates(fromdate,todate,candidate_id,customerid,payrateid);
		if(timesheetIds.size()>0) {
			
			//	 timesheetIds = timesheetDao.getTimesheetIdByCandiateIdDates(fromdate,todate,candidate_id,customerid);
			/*if(invPeriod.equalsIgnoreCase("Weekly")) {
				TimesheetEntity tsObj=timesheetDao.getTimesheetDetailsById(candidate_id, id);
			}*/
			
			StringBuilder sb = new StringBuilder();
			//String BillbleHours = timesheetDao.getBillableHoursByCandiateIdDates(fromdate,todate,candidate_id,timesheetIds);
			String BillbleHours=timesheetDao.getBillableHoursDates(fromdate,todate,candidate_id,timesheetIds);
			String timesheetstus=timesheetDao.getTimesheetDatesStatus(fromdate,todate,candidate_id,timesheetIds);
			Integer dayscount=timesheetDao.getCountDaysByDates(fromdate,todate,candidate_id,timesheetIds);
			
			System.out.println(BillbleHours+"**timesheetObj*"+dayscount);
			
			String invoice_status = timesheetDao.checkInvoiceGeneratedByCandiateIdDates(fromdate,todate,candidate_id,timesheetIds);
			for (Integer id : timesheetIds) {
				TimesheetEntity tsDetails = timesheetDao.getTimesheetDetailsById(candidate_id, id);
				sb.append(tsDetails.getClient_mgr_approved_fie());
				sb.append(",");
			   }
			  sb.deleteCharAt(sb.length()-1);
			  String str = sb.toString();
			 
			//String BillableHours = timesheetDao.getBillableHoursByTimesheetIds(timesheetIds,candidate_id);
			//timesheetObj.setTotalbillablehours(BillableHours);
			timesheetObj.setInvoice_status(invoice_status);
			timesheetObj.setFileName(str);
			timesheetObj.setDayscount(dayscount);
			timesheetObj.setTotalbillablehours(BillbleHours);
			timesheetObj.setTimesheetstatus(timesheetstus);
			//timesheetObj = timesheetDao.getViewTimesheetByTimesheetId(candidateid,timesheet_id);
		 }else {
			 
		 }
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return timesheetObj;
	}
	
	@Override
	public TimesheetDto getMonthlyTemplate(Integer yr, String month) {
		TimesheetDto monthlist = null;
		try {
			
			monthlist = timesheetDao.getMonthlyTemplate(yr,month);
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return monthlist;
	}

	@Override
	public TimesheetDto getWeeklyTimesheetByYear(Integer yr, String month) {
		TimesheetDto monthlist = null;
		try {
			
			monthlist = timesheetDao.getWeeklyTimesheetByYear(yr,month);
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return monthlist;
	}

	@Override
	public TimesheetDto getWeeklyTimesheetByYear1(Integer yr, String month) {
		TimesheetDto monthlist = null;
		try {
			
			monthlist = timesheetDao.getWeeklyTimesheetByYear1(yr,month);
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return monthlist;
	}

	@Override
	public List<TimesheetDto> getPendingTimesheetById(Integer candidateid, String payroll_type, String emp_type,
			String payrateid, Integer yr, String month) {
		List<TimesheetDto> timesheetList = null;
		try {
			
			Integer payrate_id = 0;
			if (!payrateid.isEmpty()) {
				payrate_id = Integer.parseInt(payrateid);
			}
			timesheetList = timesheetDao.getPendingTimesheetById(candidateid, payroll_type,emp_type,payrate_id,yr,month);
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return timesheetList;
	}

	@Override
	public void updateinvoicestatus(String fromdate, String todate, String tsids, String candidate,Integer invoiceid) {
		// TODO Auto-generated method stub
		try {
			Integer candidate_id = 0;
			if (!candidate.isEmpty()) {
				candidate_id = Integer.parseInt(candidate);
			}
			
			String[] tsidarray = tsids.split(",");
			for (String tsid : tsidarray) {
				Integer id=0;
				if(!tsid.isEmpty()) {
					id=Integer.parseInt(tsid);	
				}
				List<TimesheetDetailsEntity> detailedList = timesheetDao.getDetailedTimesheetListById(candidate_id,id,fromdate,todate);
				for (TimesheetDetailsEntity tsobj : detailedList) {
				Integer detailid=tsobj.getTimesheet_details_id();
				TimesheetDetailsEntity detailedObj=timesheetDao.getTimesheetDetailsBydetailedId(detailid);
				detailedObj.setInvoice_status("IG");
				detailedObj.setQbinvoice_id(invoiceid);
				timesheetDao.updateDetailedTimesheet(detailedObj);
			 }
			}
				
	}catch (Exception e) {
		// TODO: handle exception
	}
	}
	
	@Override
	public InvoiceDto gettimesheetidsbydates(String candidate, String fromdate, String todate,
			String customer, String payrateid) {
		InvoiceDto timesheetObj = new InvoiceDto();
		List<Integer> timesheetIds = null;
		try {
			Date fd = new Date();
			Date td = new Date();
			DateFormat df = new SimpleDateFormat("MM/dd/yyyy", Locale.getDefault());
			fd = df.parse(fromdate);
			td = df.parse(todate);
			String from_date=commons.getSQLDateToMMDDYYYY(fd);
			String to_date=commons.getSQLDateToMMDDYYYY(td);
			
			Integer candidateid = 0;
			if (!candidate.isEmpty()) {
				candidateid = Integer.parseInt(candidate);
			}
			Integer customerid = 0;
			if (!customer.isEmpty()) {
				customerid = Integer.parseInt(customer);
			}
			
			Integer payrate_id = 0;
			if (!payrateid.isEmpty()) {
				payrate_id = Integer.parseInt(payrateid);
			}
			timesheetIds = timesheetDao.gettimesheetidsbydates(from_date,to_date,candidateid,customerid,payrate_id);
			 StringBuilder sb = new StringBuilder();
				for (Integer id : timesheetIds) {
					System.out.println("timesheetIds****"+id);
					sb.append(id);
					sb.append(",");
				 }
				  sb.deleteCharAt(sb.length()-1);
				  String str = sb.toString();
			timesheetObj.setTimesheetIds(timesheetIds);
			timesheetObj.setTsids(str);
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return timesheetObj;
	}

	@Override
	public List<TimesheetDto> getGeneratedinvoiceList(String year, String month, String candidate,String payrateid) {
		List<TimesheetDto> timesheetList = new ArrayList<TimesheetDto>();
		try {
			int yearid = 0;
			if (!year.isEmpty()) {
				yearid = Integer.parseInt(year);
			}
			Integer candidateid = 0;
			if (!candidate.isEmpty()) {
				candidateid = Integer.parseInt(candidate);
			}Integer payrate_id = 0;
			if (!payrateid.isEmpty()) {
				payrate_id = Integer.parseInt(payrateid);
			}
			int monthno=Month.valueOf(month.toUpperCase()).getValue();
			String previousmonth=Month.of(monthno-1).name();
			String nextmonth=Month.of(monthno+1).name();
			List<String> stringlist=new ArrayList<String>();
			stringlist.add(nextmonth);
			stringlist.add(previousmonth);
			stringlist.add(month);
			List<Integer> invoiceidList=timesheetDao.getInvoiceIds(yearid,stringlist,candidateid,payrate_id);
			if(invoiceidList!=null) {
				for (Integer invid : invoiceidList) {
					String invmonth=timesheetDao.getMonthTimesheetDetailsByInvoiceId(invid);
					TimesheetDto innoiveObj = timesheetDao.getGeneratedinvoiceList(yearid,invmonth,candidateid,payrate_id,invid);
					timesheetList.add(innoiveObj);
				}
			}
			
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return timesheetList;
	}
}
