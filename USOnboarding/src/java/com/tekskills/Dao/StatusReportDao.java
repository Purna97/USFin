package com.tekskills.Dao;

import java.util.List;

import com.tekskills.Dto.StatusReportDto;
import com.tekskills.Entity.StatusReportEntity;
import com.tekskills.Entity.StatusReportTemplateEntity;

public interface StatusReportDao {

	List<StatusReportTemplateEntity> getTemplateList();

	Integer saveStatusTemplate(StatusReportTemplateEntity reportObj);

	StatusReportDto checkTemplateByMonth(int yearid, String month);

	List<StatusReportDto> getPeningReportsByCandidateId(int candidateid, Integer payrateId, String emptype);

	List<StatusReportDto> checkTemplateByMonthYear(int yyyy, String monthname, String periodname);

	List<String> getPeriodListByMMYY(int yearid, String month);

	List<StatusReportDto> getReports(int yearid, String month, String period, String status, Integer role, Integer candidateId, String lgemptype, int custType);

	StatusReportDto getCanProjectDetailsById(int candidateId, int payrateid);

	Integer savereport(StatusReportEntity reportObj);

	StatusReportDto getCanStusDetailsById(int candidateId, int status_reportid);

	StatusReportEntity getStatusDeailsByStatusId(int statureportId);

	void updateStatus(StatusReportEntity reportObj);

	List<StatusReportTemplateEntity> getTemplateListByYear(Integer yr);

	List<StatusReportDto> getAllStatusReports(int yearid, String month, String period, String status, Integer role,
			Integer candidateId, String lgemptype, int custType);

}
