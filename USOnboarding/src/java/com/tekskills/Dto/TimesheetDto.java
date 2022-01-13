package com.tekskills.Dto;

import java.util.Date;
import java.util.List;

import com.tekskills.Entity.LeaveAttachmentsEntity;
import com.tekskills.Entity.TimesheetDetailsEntity;
import com.tekskills.Entity.TimesheetEntity;

public class TimesheetDto {
	
	
	List<TimesheetDto> timesheetList;
	TimesheetEntity tsDetails;
	List<TimesheetDetailsEntity> detailedTSList;
	List<LeaveAttachmentsEntity> leavefilesList;
	TimesheetDto timesheetDto;
	EmployeeDto basicObj;
	ClientVendorMaster_DTO payRateObj;
	
	private String payrollType;
	private Integer payrateid;
	private String month;
	private Integer year;
	private Integer weekno;
	private Integer monthno;
	private Integer week_id;
	private Integer month_id;
	private String fromdate;
	private String todate;
	private String dates;
	private Integer month_no;
	private String dayname;
	private String week_fromdate;
	private String week_todate;
	private String weeks;
	private String fullname;
	private String cadidate_status;
	private String manager_status;
	private String hr_status;
	private String week_or_period;
	private String audit_status;
	private Integer timesheet_id;
	private Integer candidate_id;
	private String timesheet_status;
	private String manager_comments;
	private String hr_comments;
	private String audit_comments;
	private Integer template_id;
	private String period_name;
	private Integer toprecord;
	private Integer manager_empno;
	private Integer hr_empno;
	private Integer audit_empno;
	private String manager_name;
	private String hr_name;
	private String audit_name;
	private String  periodname;
	private String  period;
	private Date  from_date;
	private Date  to_date;
	private Integer biweek_id;
	private String  payroll_fromdate;
	private String  payroll_todate;
	private String customer_name;
	private Integer invoice_id;
	
	public Integer getInvoice_id() {
		return invoice_id;
	}
	public void setInvoice_id(Integer invoice_id) {
		this.invoice_id = invoice_id;
	}
	private Integer mailcount;
	
	private String invoice_terms;
	
	private String totalbillablehours;
	
	public ClientVendorMaster_DTO getPayRateObj() {
		return payRateObj;
	}
	public void setPayRateObj(ClientVendorMaster_DTO payRateObj) {
		this.payRateObj = payRateObj;
	}
	public EmployeeDto getBasicObj() {
		return basicObj;
	}
	public void setBasicObj(EmployeeDto basicObj) {
		this.basicObj = basicObj;
	}
	public String getPayroll_fromdate() {
		return payroll_fromdate;
	}
	public void setPayroll_fromdate(String payroll_fromdate) {
		this.payroll_fromdate = payroll_fromdate;
	}
	public String getPayroll_todate() {
		return payroll_todate;
	}
	public void setPayroll_todate(String payroll_todate) {
		this.payroll_todate = payroll_todate;
	}

	
	public Integer getMonthno() {
		return monthno;
	}
	public void setMonthno(Integer monthno) {
		this.monthno = monthno;
	}
	
	public List<TimesheetDetailsEntity> getDetailedTSList() {
		return detailedTSList;
	}
	public void setDetailedTSList(List<TimesheetDetailsEntity> detailedTSList) {
		this.detailedTSList = detailedTSList;
	}
	public TimesheetEntity getTsDetails() {
		return tsDetails;
	}
	public void setTsDetails(TimesheetEntity tsDetails) {
		this.tsDetails = tsDetails;
	}
	public List<LeaveAttachmentsEntity> getLeavefilesList() {
		return leavefilesList;
	}
	public void setLeavefilesList(List<LeaveAttachmentsEntity> leavefilesList) {
		this.leavefilesList = leavefilesList;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public Integer getYear() {
		return year;
	}
	public void setYear(Integer year) {
		this.year = year;
	}
	public Integer getWeekno() {
		return weekno;
	}
	public void setWeekno(Integer weekno) {
		this.weekno = weekno;
	}
	public String getFromdate() {
		return fromdate;
	}
	public void setFromdate(String fromdate) {
		this.fromdate = fromdate;
	}
	public String getTodate() {
		return todate;
	}
	public void setTodate(String todate) {
		this.todate = todate;
	}
	public String getDates() {
		return dates;
	}
	public void setDates(String dates) {
		this.dates = dates;
	}
	public String getDayname() {
		return dayname;
	}
	public void setDayname(String dayname) {
		this.dayname = dayname;
	}
	public String getWeek_fromdate() {
		return week_fromdate;
	}
	public void setWeek_fromdate(String week_fromdate) {
		this.week_fromdate = week_fromdate;
	}
	public String getWeek_todate() {
		return week_todate;
	}
	public void setWeek_todate(String week_todate) {
		this.week_todate = week_todate;
	}
	public Integer getWeek_id() {
		return week_id;
	}
	public void setWeek_id(Integer week_id) {
		this.week_id = week_id;
	}
	public String getWeeks() {
		return weeks;
	}
	public void setWeeks(String weeks) {
		this.weeks = weeks;
	}
	public String getFullname() {
		return fullname;
	}
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	public String getCadidate_status() {
		return cadidate_status;
	}
	public void setCadidate_status(String cadidate_status) {
		this.cadidate_status = cadidate_status;
	}
	public List<TimesheetDto> getTimesheetList() {
		return timesheetList;
	}
	public void setTimesheetList(List<TimesheetDto> timesheetList) {
		this.timesheetList = timesheetList;
	}
	public String getPayrollType() {
		return payrollType;
	}
	public void setPayrollType(String payrollType) {
		this.payrollType = payrollType;
	}
	public String getManager_status() {
		return manager_status;
	}
	public void setManager_status(String manager_status) {
		this.manager_status = manager_status;
	}
	public String getHr_status() {
		return hr_status;
	}
	public void setHr_status(String hr_status) {
		this.hr_status = hr_status;
	}
	public String getWeek_or_period() {
		return week_or_period;
	}
	public void setWeek_or_period(String week_or_period) {
		this.week_or_period = week_or_period;
	}
	public String getAudit_status() {
		return audit_status;
	}
	public void setAudit_status(String audit_status) {
		this.audit_status = audit_status;
	}
	public Integer getTimesheet_id() {
		return timesheet_id;
	}
	public void setTimesheet_id(Integer timesheet_id) {
		this.timesheet_id = timesheet_id;
	}
	public Integer getCandidate_id() {
		return candidate_id;
	}
	public void setCandidate_id(Integer candidate_id) {
		this.candidate_id = candidate_id;
	}
	public String getTimesheet_status() {
		return timesheet_status;
	}
	public void setTimesheet_status(String timesheet_status) {
		this.timesheet_status = timesheet_status;
	}
	public String getManager_comments() {
		return manager_comments;
	}
	public void setManager_comments(String manager_comments) {
		this.manager_comments = manager_comments;
	}
	public String getHr_comments() {
		return hr_comments;
	}
	public void setHr_comments(String hr_comments) {
		this.hr_comments = hr_comments;
	}
	public String getAudit_comments() {
		return audit_comments;
	}
	public void setAudit_comments(String audit_comments) {
		this.audit_comments = audit_comments;
	}
	public Integer getTemplate_id() {
		return template_id;
	}
	public void setTemplate_id(Integer template_id) {
		this.template_id = template_id;
	}
	public String getPeriod_name() {
		return period_name;
	}
	public void setPeriod_name(String period_name) {
		this.period_name = period_name;
	}
	public Integer getToprecord() {
		return toprecord;
	}
	public void setToprecord(Integer toprecord) {
		this.toprecord = toprecord;
	}
	public Integer getManager_empno() {
		return manager_empno;
	}
	public void setManager_empno(Integer manager_empno) {
		this.manager_empno = manager_empno;
	}
	public Integer getHr_empno() {
		return hr_empno;
	}
	public void setHr_empno(Integer hr_empno) {
		this.hr_empno = hr_empno;
	}
	public Integer getAudit_empno() {
		return audit_empno;
	}
	public void setAudit_empno(Integer audit_empno) {
		this.audit_empno = audit_empno;
	}
	public String getManager_name() {
		return manager_name;
	}
	public void setManager_name(String manager_name) {
		this.manager_name = manager_name;
	}
	public String getHr_name() {
		return hr_name;
	}
	public void setHr_name(String hr_name) {
		this.hr_name = hr_name;
	}
	public String getAudit_name() {
		return audit_name;
	}
	public void setAudit_name(String audit_name) {
		this.audit_name = audit_name;
	}
	public Integer getMonth_id() {
		return month_id;
	}
	public void setMonth_id(Integer month_id) {
		this.month_id = month_id;
	}
	public Integer getMonth_no() {
		return month_no;
	}
	public void setMonth_no(Integer month_no) {
		this.month_no = month_no;
	}
	public String getPeriodname() {
		return periodname;
	}
	public void setPeriodname(String periodname) {
		this.periodname = periodname;
	}
	public String getPeriod() {
		return period;
	}
	public void setPeriod(String period) {
		this.period = period;
	}
	public Date getFrom_date() {
		return from_date;
	}
	public void setFrom_date(Date from_date) {
		this.from_date = from_date;
	}
	public Date getTo_date() {
		return to_date;
	}
	public void setTo_date(Date to_date) {
		this.to_date = to_date;
	}
	public Integer getBiweek_id() {
		return biweek_id;
	}
	public void setBiweek_id(Integer biweek_id) {
		this.biweek_id = biweek_id;
	}
	public Integer getPayrateid() {
		return payrateid;
	}
	public void setPayrateid(Integer payrateid) {
		this.payrateid = payrateid;
	}
	public String getCustomer_name() {
		return customer_name;
	}
	public void setCustomer_name(String customer_name) {
		this.customer_name = customer_name;
	}
	
	public TimesheetDto getTimesheetDto() {
		return timesheetDto;
	}
	public void setTimesheetDto(TimesheetDto timesheetDto) {
		this.timesheetDto = timesheetDto;
	}
	public Integer getMailcount() {
		return mailcount;
	}
	public void setMailcount(Integer mailcount) {
		this.mailcount = mailcount;
	}
	public String getInvoice_terms() {
		return invoice_terms;
	}
	public void setInvoice_terms(String invoice_terms) {
		this.invoice_terms = invoice_terms;
	}
	public String getTotalbillablehours() {
		return totalbillablehours;
	}
	public void setTotalbillablehours(String totalbillablehours) {
		this.totalbillablehours = totalbillablehours;
	}
}
