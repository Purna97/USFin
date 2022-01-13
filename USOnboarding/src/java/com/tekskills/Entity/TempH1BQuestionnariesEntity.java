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
@Table(name="Temp_Tbl_H1BQuestionnaries")
public class TempH1BQuestionnariesEntity {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="h1questionnrie_id")
	private int h1questionnrie_id; 
	
	@Column(name="candidate_id")
	private int candidate_id;
	
	@Column(name="applicant_type")
	private String applicant_type;
	
	@Column(name="first_name")
	private String first_name;
	
	@Column(name="middle_name")
	private String middle_name;
	
	@Column(name="family_name")
	private String family_name;
	
	@Column(name="full_name")
	private String full_name;
	
	@Column(name="dob")
	private String dob;
	
	@Column(name="country_birth")
	private String country_birth;
	
	@Column(name="city_birth")
	private String city_birth;
	
	@Column(name="country_citizenship")
	private String country_citizenship;
	
	@Column(name="highest_education")
	private String highest_education;
	
	@Column(name="IT_experience")
	private String it_experience;
	
	
	@Column(name="specialization")
	private String specialization;
	
	@Column(name="US_phonenumber")
	private String us_phonenumber;
	
	@Column(name="mobile_number")
	private String mobile_number;
	
	@Column(name="personal_email")
	private String personal_email;
	
	@Column(name="official_email")
	private String official_email;
	
	@Column(name="ssn")
	private String ssn;
	
	@Column(name="passport_number")
	private String passport_number;
	
	@Column(name="passport_issuedate")
	private String passport_issuedate;
	
	@Column(name="passport_expirydate")
	private String passport_expirydate;
	
	@Column(name="I94_number")
	private String i94_number;
	
	@Column(name="current_non_immiStatus")
	private String current_non_immiStatus;
	
	@Column(name="firstentry_dateinUS")
	private String firstentry_dateinUS;
	
	@Column(name="firstentry_statusinUS")
	private String firstentry_statusinUS;
	
	@Column(name="recententry_dateinUS")
	private String recententry_dateinUS;
	
	@Column(name="recententry_statusinUS")
	private String recententry_statusinUS;
	
	@Column(name="consulate_visastamping")
	private String consulate_visastamping;
	
	@Column(name="petitionfiled_behalf")
	private String petitionfiled_behalf;
	
	@Column(name="outside_us_address")
	private String outside_us_address;
	
	@Column(name="line1")
	private String line1;
	
	@Column(name="line2")
	private String line2;
	
	@Column(name="city")
	private String city;
	
	@Column(name="state")
	private String state;
	
	@Column(name="zipcode")
	private String zipcode;
	
	@Column(name="status")
	private String status;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="submitted_date")
	private Date submitted_date; 
	
	@Column(name="initiate_id")
	private Integer initiate_id; 
	

	public Integer getInitiate_id() {
		return initiate_id;
	}

	public void setInitiate_id(Integer initiate_id) {
		this.initiate_id = initiate_id;
	}

		
	@Column(name="posted_by")
	private int posted_by;

	public int getH1questionnrie_id() {
		return h1questionnrie_id;
	}

	public void setH1questionnrie_id(int h1questionnrie_id) {
		this.h1questionnrie_id = h1questionnrie_id;
	}

	public int getCandidate_id() {
		return candidate_id;
	}

	public void setCandidate_id(int candidate_id) {
		this.candidate_id = candidate_id;
	}

	public String getApplicant_type() {
		return applicant_type;
	}

	public void setApplicant_type(String applicant_type) {
		this.applicant_type = applicant_type;
	}

	public String getFirst_name() {
		return first_name;
	}

	public void setFirst_name(String first_name) {
		this.first_name = first_name;
	}

	public String getMiddle_name() {
		return middle_name;
	}

	public void setMiddle_name(String middle_name) {
		this.middle_name = middle_name;
	}

	public String getFamily_name() {
		return family_name;
	}

	public void setFamily_name(String family_name) {
		this.family_name = family_name;
	}

	public String getFull_name() {
		return full_name;
	}

	public void setFull_name(String full_name) {
		this.full_name = full_name;
	}

	public String getDob() {
		return dob;
	}

	public void setDob(String dob) {
		this.dob = dob;
	}

	public String getCountry_birth() {
		return country_birth;
	}

	public void setCountry_birth(String country_birth) {
		this.country_birth = country_birth;
	}

	public String getCity_birth() {
		return city_birth;
	}

	public void setCity_birth(String city_birth) {
		this.city_birth = city_birth;
	}

	public String getCountry_citizenship() {
		return country_citizenship;
	}

	public void setCountry_citizenship(String country_citizenship) {
		this.country_citizenship = country_citizenship;
	}

	public String getHighest_education() {
		return highest_education;
	}

	public void setHighest_education(String highest_education) {
		this.highest_education = highest_education;
	}

	public String getSpecialization() {
		return specialization;
	}

	public void setSpecialization(String specialization) {
		this.specialization = specialization;
	}

	public String getUs_phonenumber() {
		return us_phonenumber;
	}

	public void setUs_phonenumber(String us_phonenumber) {
		this.us_phonenumber = us_phonenumber;
	}

	public String getMobile_number() {
		return mobile_number;
	}

	public void setMobile_number(String mobile_number) {
		this.mobile_number = mobile_number;
	}

	public String getPersonal_email() {
		return personal_email;
	}

	public void setPersonal_email(String personal_email) {
		this.personal_email = personal_email;
	}

	public String getOfficial_email() {
		return official_email;
	}

	public void setOfficial_email(String official_email) {
		this.official_email = official_email;
	}

	public String getSsn() {
		return ssn;
	}

	public void setSsn(String ssn) {
		this.ssn = ssn;
	}

	public String getPassport_number() {
		return passport_number;
	}

	public void setPassport_number(String passport_number) {
		this.passport_number = passport_number;
	}

	public String getPassport_issuedate() {
		return passport_issuedate;
	}

	public void setPassport_issuedate(String passport_issuedate) {
		this.passport_issuedate = passport_issuedate;
	}

	public String getPassport_expirydate() {
		return passport_expirydate;
	}

	public void setPassport_expirydate(String passport_expirydate) {
		this.passport_expirydate = passport_expirydate;
	}

	public String getI94_number() {
		return i94_number;
	}

	public void setI94_number(String i94_number) {
		this.i94_number = i94_number;
	}

	public String getCurrent_non_immiStatus() {
		return current_non_immiStatus;
	}

	public void setCurrent_non_immiStatus(String current_non_immiStatus) {
		this.current_non_immiStatus = current_non_immiStatus;
	}

	public String getFirstentry_dateinUS() {
		return firstentry_dateinUS;
	}

	public void setFirstentry_dateinUS(String firstentry_dateinUS) {
		this.firstentry_dateinUS = firstentry_dateinUS;
	}

	public String getFirstentry_statusinUS() {
		return firstentry_statusinUS;
	}

	public void setFirstentry_statusinUS(String firstentry_statusinUS) {
		this.firstentry_statusinUS = firstentry_statusinUS;
	}

	public String getRecententry_dateinUS() {
		return recententry_dateinUS;
	}

	public void setRecententry_dateinUS(String recententry_dateinUS) {
		this.recententry_dateinUS = recententry_dateinUS;
	}

	public String getRecententry_statusinUS() {
		return recententry_statusinUS;
	}

	public void setRecententry_statusinUS(String recententry_statusinUS) {
		this.recententry_statusinUS = recententry_statusinUS;
	}

	public String getConsulate_visastamping() {
		return consulate_visastamping;
	}

	public void setConsulate_visastamping(String consulate_visastamping) {
		this.consulate_visastamping = consulate_visastamping;
	}

	public String getPetitionfiled_behalf() {
		return petitionfiled_behalf;
	}

	public void setPetitionfiled_behalf(String petitionfiled_behalf) {
		this.petitionfiled_behalf = petitionfiled_behalf;
	}

	public String getOutside_us_address() {
		return outside_us_address;
	}

	public void setOutside_us_address(String outside_us_address) {
		this.outside_us_address = outside_us_address;
	}

	public String getLine1() {
		return line1;
	}

	public void setLine1(String line1) {
		this.line1 = line1;
	}

	public String getLine2() {
		return line2;
	}

	public void setLine2(String line2) {
		this.line2 = line2;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Date getSubmitted_date() {
		return submitted_date;
	}

	public void setSubmitted_date(Date submitted_date) {
		this.submitted_date = submitted_date;
	}

	public int getPosted_by() {
		return posted_by;
	}

	public void setPosted_by(int posted_by) {
		this.posted_by = posted_by;
	} 
	
	public String getIt_experience() {
		return it_experience;
	}

	public void setIt_experience(String it_experience) {
		this.it_experience = it_experience;
	}

}
