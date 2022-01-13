package com.tekskills.Dto;

import java.util.List;

import com.tekskills.Entity.CandidateH1BInitiateDetailsEntity;
import com.tekskills.Entity.H1BQuestionnariesEntity;
import com.tekskills.Entity.ImmiCandidateFormsStatusEntity;
import com.tekskills.Entity.PublicBenefitsChecklistEntity;

public class PublicBenefitsChecklistDTO {
	PublicBenefitsChecklistEntity applicantObj;
	PublicBenefitsChecklistEntity spouseObj;
	List<PublicBenefitsChecklistEntity> benfitschildList;
	List<PublicBenefitsChecklistDTO> allbenfitsList;
	
	public List<PublicBenefitsChecklistDTO> getAllbenfitsList() {
		return allbenfitsList;
	}
	public void setAllbenfitsList(List<PublicBenefitsChecklistDTO> allbenfitsList) {
		this.allbenfitsList = allbenfitsList;
	}

	PublicBenefitsChecklistDTO pbcdto;
	
    ImmiCandidateFormsStatusEntity formObj;
	
    CandidateH1BInitiateDetailsEntity initiateObj;
    
    H1BQuestionnariesEntity h1bApplObj;
	H1BQuestionnariesEntity h4spouseObj;
	
    List<H1BQuestionnariesEntity> childList;
    
    private Integer benefits_id;
    private String beneficiary_Name;
	private String beneficiary_type;
	private Integer candidate_id;
	private String income_maintenance;
	private String ssi;
	private String tanf;
	private String ga;
	private String snap;
	private String housing_assistance;
	private String project_rental_assistance;
	private String public_housing_act;
	private String ffm_medicalemergency;
	private String ffm_ideact;
	private String ffm_schoolbenefits;
	private String ffm_uderage21;
	private String ffm_pregnant_period60;
	private String pbcstatus;
	
	
	public String getBeneficiary_Name() {
		return beneficiary_Name;
	}
	public void setBeneficiary_Name(String beneficiary_Name) {
		this.beneficiary_Name = beneficiary_Name;
	}
	public int getBenefits_id() {
		return benefits_id;
	}

	public void setBenefits_id(Integer benefits_id) {
		this.benefits_id = benefits_id;
	}

	public String getBeneficiary_type() {
		return beneficiary_type;
	}

	public void setBeneficiary_type(String beneficiary_type) {
		this.beneficiary_type = beneficiary_type;
	}

	public int getCandidate_id() {
		return candidate_id;
	}

	public void setCandidate_id(Integer candidate_id) {
		this.candidate_id = candidate_id;
	}

	public String getIncome_maintenance() {
		return income_maintenance;
	}

	public void setIncome_maintenance(String income_maintenance) {
		this.income_maintenance = income_maintenance;
	}

	public String getSsi() {
		return ssi;
	}

	public void setSsi(String ssi) {
		this.ssi = ssi;
	}

	public String getTanf() {
		return tanf;
	}

	public void setTanf(String tanf) {
		this.tanf = tanf;
	}

	public String getGa() {
		return ga;
	}

	public void setGa(String ga) {
		this.ga = ga;
	}

	public String getSnap() {
		return snap;
	}

	public void setSnap(String snap) {
		this.snap = snap;
	}

	public String getHousing_assistance() {
		return housing_assistance;
	}

	public void setHousing_assistance(String housing_assistance) {
		this.housing_assistance = housing_assistance;
	}

	public String getProject_rental_assistance() {
		return project_rental_assistance;
	}

	public void setProject_rental_assistance(String project_rental_assistance) {
		this.project_rental_assistance = project_rental_assistance;
	}

	public String getPublic_housing_act() {
		return public_housing_act;
	}

	public void setPublic_housing_act(String public_housing_act) {
		this.public_housing_act = public_housing_act;
	}

	public String getFfm_medicalemergency() {
		return ffm_medicalemergency;
	}

	public void setFfm_medicalemergency(String ffm_medicalemergency) {
		this.ffm_medicalemergency = ffm_medicalemergency;
	}

	public String getFfm_ideact() {
		return ffm_ideact;
	}

	public void setFfm_ideact(String ffm_ideact) {
		this.ffm_ideact = ffm_ideact;
	}

	public String getFfm_schoolbenefits() {
		return ffm_schoolbenefits;
	}

	public void setFfm_schoolbenefits(String ffm_schoolbenefits) {
		this.ffm_schoolbenefits = ffm_schoolbenefits;
	}

	public String getFfm_uderage21() {
		return ffm_uderage21;
	}

	public void setFfm_uderage21(String ffm_uderage21) {
		this.ffm_uderage21 = ffm_uderage21;
	}

	public String getFfm_pregnant_period60() {
		return ffm_pregnant_period60;
	}

	public void setFfm_pregnant_period60(String ffm_pregnant_period60) {
		this.ffm_pregnant_period60 = ffm_pregnant_period60;
	}
    
	
    public List<PublicBenefitsChecklistEntity> getBenfitschildList() {
		return benfitschildList;
	}
	public void setBenfitschildList(List<PublicBenefitsChecklistEntity> benfitschildList) {
		this.benfitschildList = benfitschildList;
	}
    
	public H1BQuestionnariesEntity getH1bApplObj() {
		return h1bApplObj;
	}
	public void setH1bApplObj(H1BQuestionnariesEntity h1bApplObj) {
		this.h1bApplObj = h1bApplObj;
	}
	public H1BQuestionnariesEntity getH4spouseObj() {
		return h4spouseObj;
	}
	public void setH4spouseObj(H1BQuestionnariesEntity h4spouseObj) {
		this.h4spouseObj = h4spouseObj;
	}
	public List<H1BQuestionnariesEntity> getChildList() {
		return childList;
	}
	public void setChildList(List<H1BQuestionnariesEntity> childList) {
		this.childList = childList;
	}
	public CandidateH1BInitiateDetailsEntity getInitiateObj() {
		return initiateObj;
	}
	public void setInitiateObj(CandidateH1BInitiateDetailsEntity initiateObj) {
		this.initiateObj = initiateObj;
	}
    
	public ImmiCandidateFormsStatusEntity getFormObj() {
		return formObj;
	}
	public void setFormObj(ImmiCandidateFormsStatusEntity formObj) {
		this.formObj = formObj;
	}

	public PublicBenefitsChecklistDTO getPbcdto() {
		return pbcdto;
	}
	public void setPbcdto(PublicBenefitsChecklistDTO pbcdto) {
		this.pbcdto = pbcdto;
	}
	public PublicBenefitsChecklistEntity getApplicantObj() {
		return applicantObj;
	}
	public void setApplicantObj(PublicBenefitsChecklistEntity applicantObj) {
		this.applicantObj = applicantObj;
	}
	public PublicBenefitsChecklistEntity getSpouseObj() {
		return spouseObj;
	}
	public void setSpouseObj(PublicBenefitsChecklistEntity spouseObj) {
		this.spouseObj = spouseObj;
	}
	public String getPbcstatus() {
		return pbcstatus;
	}
	public void setPbcstatus(String pbcstatus) {
		this.pbcstatus = pbcstatus;
	}	
}
