package com.tekskills.Dao;

import java.util.List;

import com.tekskills.Dto.BasicDetailsDto;
import com.tekskills.Dto.ClientVendorMaster_DTO;
import com.tekskills.Dto.InvoiceDto;
import com.tekskills.Dto.TimesheetDto;
import com.tekskills.Entity.BiWeeklyTemplateEntity1;
import com.tekskills.Entity.BiWeeklyTemplateEntity2;
import com.tekskills.Entity.EmpPayRateDetails;
import com.tekskills.Entity.LeaveAttachmentsEntity;
import com.tekskills.Entity.MailReminderCountEntity;
import com.tekskills.Entity.MonthlyTemplateEntity;
import com.tekskills.Entity.SemiMonthlyTemplateEntity;
import com.tekskills.Entity.StatusReportTemplateEntity;
import com.tekskills.Entity.TimesheetDetailsEntity;
import com.tekskills.Entity.TimesheetEntity;
import com.tekskills.Entity.WeeklyTemplateEntity;

public interface TimesheetDao {

	Integer saveBiWeeklyTimesheet(SemiMonthlyTemplateEntity biweeklyObj);

	Integer saveWeeklyTimesheet(WeeklyTemplateEntity weeklyObj);

	TimesheetDto checkBiweeklyTemplateByMonthYear(int yearid, String month);

	TimesheetDto checkweeklyTemplateByMonthYear(int yearid, String month);

	Integer checktstemplate(int yearid);

	List<TimesheetDto> getPeningTimesheetByCandidateId(Integer candidateId, String payrollType, String emptype, int payrateid);

	TimesheetDto getDetailsByweekId(int week_id, String payrollType);

	Integer savetimesheet(TimesheetEntity timesheetObj);

	void saveDetailedTimeheet(TimesheetDetailsEntity tsDetailsObj);

	void saveLeaveAttachements(LeaveAttachmentsEntity leaveObj);

	List<TimesheetDto> getViewTimesheet(int yearid, String status, Integer role, Integer candidateId, String lgemptype, String month, int custType);

	TimesheetEntity getTimesheetDetailsById(int candidateId, int timesheetId);

	List<TimesheetDetailsEntity> getDetailedTimesheetListById(int candidateId, int timesheetId);

	List<LeaveAttachmentsEntity> getLeaveAttachmentsById(int candidateId, int timesheetId);

	String deleteDocumentByDocId(Integer id);

	void updateTimesheet(TimesheetEntity timesheetObj);

	void updateDetailedTimesheet(TimesheetDetailsEntity tsDetailsObj);

	List<TimesheetDto> getWeeklyTimesheetByYear(Integer yr);

	List<TimesheetDto> getMyTimesheet(int yearid, String status, Integer role, Integer candidateId, String lgemptype, String month, int custType);

	Integer saveMonthlyTemplate(MonthlyTemplateEntity monthObj);

	Integer saveBiWeeklyTimesheet1(BiWeeklyTemplateEntity1 weeklyObj);

	Integer saveBiWeeklyTimesheet2(BiWeeklyTemplateEntity2 weeklyObj);

	Integer saveStatusTemplate(StatusReportTemplateEntity weeklyObj);

	List<TimesheetDto> getMonthlyTemplate(Integer yr);

	List<TimesheetDto> getBiweeklyTemplate_1(Integer yr);

	List<TimesheetDto> getBiweeklyTemplate_2(Integer yr);

	EmpPayRateDetails getEmpPayrateDetailsByCandidateId(Integer candidateId, String emptype, Integer payrate_id);

	List<ClientVendorMaster_DTO> getEmpPayrateListByCandidateId(Integer candidateId, String emptype);

	String getCustomerNameByPayrateId(Integer payrate_id);

	List<TimesheetDto> getPendingViewTimesheet(int yearid, String status, Integer role, Integer candidateId,
			String lgemptype, String month, int custType);

	Integer saveTSmailreminder(MailReminderCountEntity mailObj);

	List<TimesheetDto> getmailhistory(Integer candidate_id, String fdate, String tdate);

	List<BasicDetailsDto> getCandidateList();

	List<ClientVendorMaster_DTO> getCustomertListByCandidateId(Integer candidateId);

	List<TimesheetDto> getApprovedTimesheetByCandidateId(Integer candidate_id, String payroll_type, String emp_type,
			int payrate_id);

	List<TimesheetDto> getViewTimesheetByCandiateId(int yearid,String month, Integer candidateid, String status, Integer payrate_id);

	List<TimesheetDto> getAllCandidateApprovedTimesheet(int currentYear, List<String> stringlist);

	List<Integer> getTimesheetIdByCandiateId(String from_date, String to_date, Integer candidateid, Integer customerid);

	String getBillableHoursByTimesheetIds(List<Integer> timesheetIds, Integer candidateid);

	InvoiceDto getViewTimesheetByTimesheetId(String candidateid, int timesheet_id);

	String getBillableHoursByTimesheetIds(int timesheet_id, Integer candidate_id);

	List<Integer> getTimesheetIdByCandiateIdDates(String fromdate, String todate, Integer candidate_id,
			Integer customerid);

	String getBillableHoursByCandiateIdDates(String fromdate, String todate, Integer candidate_id, List<Integer> timesheetIds);

	TimesheetDto getMonthlyTemplate(Integer yr, String month);

	TimesheetDto getWeeklyTimesheetByYear(Integer yr, String month);

	TimesheetDto getWeeklyTimesheetByYear1(Integer yr, String month);

	List<TimesheetDto> getPendingTimesheetById(Integer candidateid, String payroll_type, String emp_type,
			Integer payrate_id, Integer yr, String month);

	List<Integer> gettimesheetidsbydates(String from_date, String to_date, Integer candidateid, Integer customerid,
			Integer payrate_id);

	List<TimesheetDetailsEntity> getDetailedTimesheetListById(Integer candidate_id, Integer id, String fromdate,
			String todate);

	TimesheetDetailsEntity getTimesheetDetailsBydetailedId(Integer detailid);

	String checkInvoiceGeneratedByCandiateIdDates(String fromdate, String todate, Integer candidate_id,
			List<Integer> timesheetIds);

	String getBillableHoursDates(String fromdate, String todate, Integer candidate_id, List<Integer> timesheetIds);
	 
	String getTimesheetDatesStatus(String fromdate, String todate, Integer candidate_id, List<Integer> timesheetIds);

	TimesheetDto getGeneratedinvoiceList(int yearid, String month, Integer candidateid, Integer payrate_id, Integer invid);

	List<Integer> getInvoiceIds(int yearid, List<String> stringlist, Integer candidateid, Integer payrate_id);

	String getMonthTimesheetDetailsByInvoiceId(Integer invid);

	Integer getCountDaysByDates(String fromdate, String todate, Integer candidate_id, List<Integer> timesheetIds);

}
