package com.tekskills.Entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
@Entity
@Table(name="Tbl_PublicBenefitsChecklist")
public class PublicBenefitsChecklistEntity {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)	
	@Column(name="benefits_id")
	private int benefits_id;
		
	@Column(name="h1questionnrie_id")
	private int h1que_id;
	
	@Column(name="beneficiary_type")
	private String beneficiary_type;
	
	@Column(name="candidate_id")
	private int candidate_id;
	
	@Column(name="income_maintenance")
	private String income_maintenance;
	
	@Column(name="ssi")
	private String ssi;
	
	@Column(name="tanf")
	private String tanf;
	
	@Column(name="ga")
	private String ga;
	
	@Column(name="snap")
	private String snap;
	
	@Column(name="housing_assistance")
	private String housing_assistance;
	
	@Column(name="project_rental_assistance")
	private String project_rental_assistance;
	
	@Column(name="public_housing_act")
	private String public_housing_act;
	
	@Column(name="ffm_medicalemergency")
	private String ffm_medicalemergency;
	
	@Column(name="ffm_ideact")
	private String ffm_ideact;
	
	@Column(name="ffm_schoolbenefits")
	private String ffm_schoolbenefits;
	
	@Column(name="ffm_uderage21")
	private String ffm_uderage21;
	
	@Column(name="ffm_pregnant_period60")
	private String ffm_pregnant_period60;
	
	@Column(name="status")
	private String status;

	@Column(name="posted_by")
	private int posted_by;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="submitted_on")
	private Date submitted_on;

	@Column(name="initiate_id")
	private Integer initiate_id; 
	

	public Integer getInitiate_id() {
		return initiate_id;
	}

	public void setInitiate_id(Integer initiate_id) {
		this.initiate_id = initiate_id;
	}
	
	public int getH1que_id() {
		return h1que_id;
	}

	public void setH1que_id(int h1que_id) {
		this.h1que_id = h1que_id;
	}

	public int getBenefits_id() {
		return benefits_id;
	}

	public void setBenefits_id(int benefits_id) {
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

	public void setCandidate_id(int candidate_id) {
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

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getPosted_by() {
		return posted_by;
	}

	public void setPosted_by(int posted_by) {
		this.posted_by = posted_by;
	}

	public Date getSubmitted_on() {
		return submitted_on;
	}

	public void setSubmitted_on(Date submitted_on) {
		this.submitted_on = submitted_on;
	}

}
