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
@Table(name="Tbl_bgv_CandidateEducationalDetails")
public class CandidateBGCEducationEntity {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="education_id")
	private int education_id; 
	
	@Column(name="candidate_id")
	private int candidate_id; 
	
	@Column(name="college_name")
	private String college_name;
	
	 @Column(name="university_name")
	private String university_name;
	 
	@Column(name="education_fromDate")
	private String education_fromDate;
	
	@Column(name="education_toDate")
	private String education_toDate;
	
	@Column(name="course_Type")
	private String course_Type;	
	
	@Column(name="student_id")
	private String student_id;	
	
	@Column(name="type_of_degree")
	private String type_of_degree;
		
	@Column(name="graduation")
	private String graduation;	
	
	@Column(name="qualification")
	private String qualification;
	
	@Column(name="staus")
	private String staus;	
		
	@Column(name="major_subject")
	private String major_subject;
	
	@Column(name="candidate_status")
	private String candidate_status;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="submitted_on")
	private Date submitted_on;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="approved_on")
	private Date approved_on;
	
	@Column(name="approved_by")
	private int approved_by;
	
	@Column(name="approved_status")
	private String approved_status;

	
	public String getMajor_subject() {
		return major_subject;
	}

	public void setMajor_subject(String major_subject) {
		this.major_subject = major_subject;
	}

	public String getApproved_status() {
		return approved_status;
	}

	public void setApproved_status(String approved_status) {
		this.approved_status = approved_status;
	}
	
	public int getEducation_id() {
		return education_id;
	}

	public void setEducation_id(int education_id) {
		this.education_id = education_id;
	}

	public String getCollege_name() {
		return college_name;
	}

	public void setCollege_name(String college_name) {
		this.college_name = college_name;
	}

	public String getUniversity_name() {
		return university_name;
	}

	public void setUniversity_name(String university_name) {
		this.university_name = university_name;
	}

	public String getEducation_fromDate() {
		return education_fromDate;
	}

	public void setEducation_fromDate(String education_fromDate) {
		this.education_fromDate = education_fromDate;
	}

	public String getEducation_toDate() {
		return education_toDate;
	}

	public void setEducation_toDate(String education_toDate) {
		this.education_toDate = education_toDate;
	}

	public String getCourse_Type() {
		return course_Type;
	}

	public void setCourse_Type(String course_Type) {
		this.course_Type = course_Type;
	}

	public String getStudent_id() {
		return student_id;
	}

	public void setStudent_id(String student_id) {
		this.student_id = student_id;
	}

	public String getType_of_degree() {
		return type_of_degree;
	}

	public void setType_of_degree(String type_of_degree) {
		this.type_of_degree = type_of_degree;
	}

	public String getGraduation() {
		return graduation;
	}

	public void setGraduation(String graduation) {
		this.graduation = graduation;
	}

	public String getQualification() {
		return qualification;
	}

	public void setQualification(String qualification) {
		this.qualification = qualification;
	}

	public String getStaus() {
		return staus;
	}

	public void setStaus(String staus) {
		this.staus = staus;
	}

	public int getCandidate_id() {
		return candidate_id;
	}

	public void setCandidate_id(int candidate_id) {
		this.candidate_id = candidate_id;
	}

	public String getCandidate_status() {
		return candidate_status;
	}

	public void setCandidate_status(String candidate_status) {
		this.candidate_status = candidate_status;
	}

	public Date getSubmitted_on() {
		return submitted_on;
	}

	public void setSubmitted_on(Date submitted_on) {
		this.submitted_on = submitted_on;
	}

	public Date getApproved_on() {
		return approved_on;
	}

	public void setApproved_on(Date approved_on) {
		this.approved_on = approved_on;
	}

	public int getApproved_by() {
		return approved_by;
	}

	public void setApproved_by(int approved_by) {
		this.approved_by = approved_by;
	}


}
