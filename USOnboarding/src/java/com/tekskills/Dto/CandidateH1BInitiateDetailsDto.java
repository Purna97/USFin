package com.tekskills.Dto;

import java.util.List;

import com.tekskills.Entity.CandidateH1BInitiateDetailsEntity;
import com.tekskills.Entity.ImmiProfileLableMaster;

public class CandidateH1BInitiateDetailsDto {
	
	private Integer initiate_id;
	private Integer candidate_id;
	private String profile_name;
	private String status;
	private String marital_status;
	private String kids_status;
	private String dependent_profile_name;
	
    CandidateH1BInitiateDetailsEntity initateInfo;
	
	public CandidateH1BInitiateDetailsEntity getInitateInfo() {
		return initateInfo;
	}
	public void setInitateInfo(CandidateH1BInitiateDetailsEntity initateInfo) {
		this.initateInfo = initateInfo;
	}
	
	List<ImmiProfileLableMaster> profileList;
	List<ImmiProfileLableMaster> dependentprofileList;
	
	public List<ImmiProfileLableMaster> getProfileList() {
		return profileList;
	}
	public void setProfileList(List<ImmiProfileLableMaster> profileList) {
		this.profileList = profileList;
	}
	public List<ImmiProfileLableMaster> getDependentprofileList() {
		return dependentprofileList;
	}
	public void setDependentprofileList(List<ImmiProfileLableMaster> dependentprofileList) {
		this.dependentprofileList = dependentprofileList;
	}
	
	public Integer getInitiate_id() {
		return initiate_id;
	}
	public void setInitiate_id(Integer initiate_id) {
		this.initiate_id = initiate_id;
	}
	public Integer getCandidate_id() {
		return candidate_id;
	}
	public void setCandidate_id(Integer candidate_id) {
		this.candidate_id = candidate_id;
	}
	public String getProfile_name() {
		return profile_name;
	}
	public void setProfile_name(String profile_name) {
		this.profile_name = profile_name;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getMarital_status() {
		return marital_status;
	}
	public void setMarital_status(String marital_status) {
		this.marital_status = marital_status;
	}
	public String getKids_status() {
		return kids_status;
	}
	public void setKids_status(String kids_status) {
		this.kids_status = kids_status;
	}
	public String getDependent_profile_name() {
		return dependent_profile_name;
	}
	public void setDependent_profile_name(String dependent_profile_name) {
		this.dependent_profile_name = dependent_profile_name;
	}
	
}
