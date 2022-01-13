package com.tekskills.Dto;

public class AssignedCandidateDto {
private Integer candidate_id;
private Integer bgc_id;
private Integer profile_id;
private String full_name;
private String task_status;
private String profile_name;
public Integer getCandidate_id() {
	return candidate_id;
}
public void setCandidate_id(Integer candidate_id) {
	this.candidate_id = candidate_id;
}
public Integer getBgc_id() {
	return bgc_id;
}
public void setBgc_id(Integer bgc_id) {
	this.bgc_id = bgc_id;
}
public Integer getProfile_id() {
	return profile_id;
}
public void setProfile_id(Integer profile_id) {
	this.profile_id = profile_id;
}
public String getFull_name() {
	return full_name;
}
public void setFull_name(String full_name) {
	this.full_name = full_name;
}
public String getTask_status() {
	return task_status;
}
public void setTask_status(String task_status) {
	this.task_status = task_status;
}
public String getProfile_name() {
	return profile_name;
}
public void setProfile_name(String profile_name) {
	this.profile_name = profile_name;
}

}
