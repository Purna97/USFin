package com.tekskills.Service;

import java.util.List;

import com.tekskills.Dto.StatusReportDto;
import com.tekskills.Dto.TimesheetDto;
import com.tekskills.Entity.BiWeeklyTemplateEntity1;
import com.tekskills.Entity.BiWeeklyTemplateEntity2;
import com.tekskills.Entity.EmpPayRateDetails;
import com.tekskills.Entity.MonthlyTemplateEntity;
import com.tekskills.Entity.StatusReportEntity;
import com.tekskills.Entity.StatusReportTemplateEntity;

public interface StatusReportService {

	List<StatusReportTemplateEntity> getTemplateList();

	String saveStatusTemplate(String month, String year, Integer loginUserid, String period, String periodname, String fromdate, String todate);

	String checkTemplateByMonth(String year, String month);

	List<StatusReportDto> getPeningReportsByCandidateId(Integer candidateId, Integer payrate_id, String emptype);

	List<String> getPeriodListByMMYY(String month, String year);

	List<StatusReportDto> getReports(String month, String year, String period, String status, Integer role, Integer candidateId, String lgemptype, String customertype);

	StatusReportDto getCanProjectDetailsById(String candidateid, String payrate_id);

	String savereport(String challenges, String outputs, String delivers, String canidateId, Integer loginempno, String month, String year, String period, String periodname, String lgfullname, String clienttname, String clientaddres, String projectname, String payrate_id);

	StatusReportDto getCanStusDetailsById(String candidateid, String status_reportid);

	String updatestatus(String challenges, String outputs, String delivers, String canidateId, Integer loginempno,
			String comments, String statureportId, String status, Integer role);

	String downloadpdf(String statureportId);

	StatusReportEntity getStatusDetailsByStatusId(String statureportId);

	List<StatusReportTemplateEntity> getTemplateListByYear(Integer yr);

	List<StatusReportDto> getAllStatusReports(String month, String year, String period, String status, Integer role,
			Integer candidateId, String lgemptype, String customertype);

	EmpPayRateDetails getEmpPayrateDetailsByCandidateId(Integer candidateId);

	String updatestatusreport(String challenges, String outputs, String delivers, String canidateId, Integer loginempno,
			String statureportId, Integer role);

	



	

}
