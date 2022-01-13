package com.tekskills.Dto;

import java.util.List;

import com.tekskills.Entity.EmpPayRateDetails;
import com.tekskills.Entity.TimesheetEntity;

public class InvoiceDto {
	private Integer payrateid;
	
	private Integer qbcustid;
	private String fromdate;
	private String todate;
	private String fullname;
	private Integer candidate_id;
	private Integer timesheet_id;
	private Integer qbproductid;
    private String invoice_terms;
    private String billrate;
	private String totalbillablehours;
	private String fileName;
	private String tsids;
	List<Integer> timesheetIds;
	
	TimesheetDto monthlytemplate;
	TimesheetEntity tsDetails;
	private String invoice_status;
	private String timesheetstatus;
	
	List<TimesheetDto> approvedtimesheetList;
	List<TimesheetDto> nonapprovedtimesheetList;
	List<TimesheetDto> generatedinvoiceList;
	private Integer dayscount;
	
	public List<TimesheetDto> getGeneratedinvoiceList() {
		return generatedinvoiceList;
	}
	public void setGeneratedinvoiceList(List<TimesheetDto> generatedinvoiceList) {
		this.generatedinvoiceList = generatedinvoiceList;
	}
	EmpPayRateDetails payrateObj;
	
	List<TimesheetDto> pendingtimesheetList;
	
	
	public TimesheetEntity getTsDetails() {
		return tsDetails;
	}
	public void setTsDetails(TimesheetEntity tsDetails) {
		this.tsDetails = tsDetails;
	}
	
	public List<Integer> getTimesheetIds() {
		return timesheetIds;
	}
	public void setTimesheetIds(List<Integer> timesheetIds) {
		this.timesheetIds = timesheetIds;
	}
	public List<TimesheetDto> getApprovedtimesheetList() {
		return approvedtimesheetList;
	}
	public void setApprovedtimesheetList(List<TimesheetDto> approvedtimesheetList) {
		this.approvedtimesheetList = approvedtimesheetList;
	}
	public List<TimesheetDto> getNonapprovedtimesheetList() {
		return nonapprovedtimesheetList;
	}
	public void setNonapprovedtimesheetList(List<TimesheetDto> nonapprovedtimesheetList) {
		this.nonapprovedtimesheetList = nonapprovedtimesheetList;
	}
	public List<TimesheetDto> getPendingtimesheetList() {
		return pendingtimesheetList;
	}
	public void setPendingtimesheetList(List<TimesheetDto> pendingtimesheetList) {
		this.pendingtimesheetList = pendingtimesheetList;
	}
	public TimesheetDto getMonthlytemplate() {
		return monthlytemplate;
	}
	public void setMonthlytemplate(TimesheetDto monthlytemplate) {
		this.monthlytemplate = monthlytemplate;
	}
	
	public Integer getPayrateid() {
		return payrateid;
	}
	public void setPayrateid(Integer payrateid) {
		this.payrateid = payrateid;
	}
	public Integer getQbcustid() {
		return qbcustid;
	}
	public void setQbcustid(Integer qbcustid) {
		this.qbcustid = qbcustid;
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
	public String getFullname() {
		return fullname;
	}
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	public Integer getCandidate_id() {
		return candidate_id;
	}
	public void setCandidate_id(Integer candidate_id) {
		this.candidate_id = candidate_id;
	}
	public String getInvoice_terms() {
		return invoice_terms;
	}
	public void setInvoice_terms(String invoice_terms) {
		this.invoice_terms = invoice_terms;
	}
	public String getBillrate() {
		return billrate;
	}
	public void setBillrate(String billrate) {
		this.billrate = billrate;
	}
	public String getTotalbillablehours() {
		return totalbillablehours;
	}
	public void setTotalbillablehours(String totalbillablehours) {
		this.totalbillablehours = totalbillablehours;
	}
	
	
	
	public EmpPayRateDetails getPayrateObj() {
		return payrateObj;
	}
	public void setPayrateObj(EmpPayRateDetails payrateObj) {
		this.payrateObj = payrateObj;
	}
	public Integer getTimesheet_id() {
		return timesheet_id;
	}
	public void setTimesheet_id(Integer timesheet_id) {
		this.timesheet_id = timesheet_id;
	}
	public Integer getQbproductid() {
		return qbproductid;
	}
	public void setQbproductid(Integer qbproductid) {
		this.qbproductid = qbproductid;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getTsids() {
		return tsids;
	}
	public void setTsids(String tsids) {
		this.tsids = tsids;
	}
	public String getInvoice_status() {
		return invoice_status;
	}
	public void setInvoice_status(String invoice_status) {
		this.invoice_status = invoice_status;
	}
	public String getTimesheetstatus() {
		return timesheetstatus;
	}
	public void setTimesheetstatus(String timesheetstatus) {
		this.timesheetstatus = timesheetstatus;
	}
	public Integer getDayscount() {
		return dayscount;
	}
	public void setDayscount(Integer dayscount) {
		this.dayscount = dayscount;
	}
	
	
}
