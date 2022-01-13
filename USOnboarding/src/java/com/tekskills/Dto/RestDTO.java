package com.tekskills.Dto;

import java.util.List;

import com.tekskills.Entity.CandidateDetailedInfo;
import com.tekskills.Entity.EmpBasicDetailsEntity;

public class RestDTO {

	EmpBasicDetailsEntity basicObj ;
	CandidateDetailedInfo detailObj ;
	List<TimesheetDto> timesheetList;
	public EmpBasicDetailsEntity getBasicObj() {
		return basicObj;
	}
	public void setBasicObj(EmpBasicDetailsEntity basicObj) {
		this.basicObj = basicObj;
	}
	public CandidateDetailedInfo getDetailObj() {
		return detailObj;
	}
	public void setDetailObj(CandidateDetailedInfo detailObj) {
		this.detailObj = detailObj;
	}
	public List<TimesheetDto> getTimesheetList() {
		return timesheetList;
	}
	public void setTimesheetList(List<TimesheetDto> timesheetList) {
		this.timesheetList = timesheetList;
	}
	public Integer getDasboardcount() {
		return dasboardcount;
	}
	public void setDasboardcount(Integer dasboardcount) {
		this.dasboardcount = dasboardcount;
	}
	public Integer getUsercount() {
		return usercount;
	}
	public void setUsercount(Integer usercount) {
		this.usercount = usercount;
	}
	public MyDashboardDto getMyDashboard() {
		return myDashboard;
	}
	public void setMyDashboard(MyDashboardDto myDashboard) {
		this.myDashboard = myDashboard;
	}
	Integer dasboardcount;
	Integer usercount;
	MyDashboardDto myDashboard ;
	
	
}
