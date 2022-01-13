package com.tekskills.Dto;

import com.tekskills.Entity.CandidateDetailedInfo;
import com.tekskills.Entity.EmpBasicDetailsEntity;

public class CommonDetailDto {
	private EmpBasicDetailsEntity empbasic;
	private CandidateDetailedInfo candidateInfo;
	
	public EmpBasicDetailsEntity getEmpbasic() {
		return empbasic;
	}
	public void setEmpbasic(EmpBasicDetailsEntity empbasic) {
		this.empbasic = empbasic;
	}
	public CandidateDetailedInfo getCandidateInfo() {
		return candidateInfo;
	}
	public void setCandidateInfo(CandidateDetailedInfo candidateInfo) {
		this.candidateInfo = candidateInfo;
	}
}
