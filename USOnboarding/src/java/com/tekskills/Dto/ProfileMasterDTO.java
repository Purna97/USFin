package com.tekskills.Dto;

import java.util.List;

import com.tekskills.Entity.CategoryEntity;
import com.tekskills.Entity.ImmiDocumentTypeEntity;
import com.tekskills.Entity.ProfileLableMaster;

public class ProfileMasterDTO {
	private int profileid;
	private int categoryid;
	private int subcategoryid;
	private String profilename;
	private String category;
	private String subcategory;
	private Integer subcategory_type;
	
	private String name;
	private Integer issubmitby;
	
	
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getIssubmitby() {
		return issubmitby;
	}
	public void setIssubmitby(Integer issubmitby) {
		this.issubmitby = issubmitby;
	}
	List<ProfileLableMaster> profileList;
	List<ProfileMasterDTO> profileMasterList;
	List<CategoryEntity> categoryList;
	List<CategoreisDTO> subcategoryList;
	List<ImmiDocumentTypeEntity> documentList;
	
	private String isdependent;
		
	public List<ImmiDocumentTypeEntity> getDocumentList() {
		return documentList;
	}
	public void setDocumentList(List<ImmiDocumentTypeEntity> documentList) {
		this.documentList = documentList;
	}
	public int getProfileid() {
		return profileid;
	}
	public void setProfileid(int profileid) {
		this.profileid = profileid;
	}
	public int getCategoryid() {
		return categoryid;
	}
	public void setCategoryid(int categoryid) {
		this.categoryid = categoryid;
	}
	public int getSubcategoryid() {
		return subcategoryid;
	}
	public void setSubcategoryid(int subcategoryid) {
		this.subcategoryid = subcategoryid;
	}
	public String getProfilename() {
		return profilename;
	}
	public void setProfilename(String profilename) {
		this.profilename = profilename;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getSubcategory() {
		return subcategory;
	}
	public void setSubcategory(String subcategory) {
		this.subcategory = subcategory;
	}
	public List<ProfileLableMaster> getProfileList() {
		return profileList;
	}
	public void setProfileList(List<ProfileLableMaster> profileList) {
		this.profileList = profileList;
	}
	public List<ProfileMasterDTO> getProfileMasterList() {
		return profileMasterList;
	}
	public void setProfileMasterList(List<ProfileMasterDTO> profileMasterList) {
		this.profileMasterList = profileMasterList;
	}
	public List<CategoryEntity> getCategoryList() {
		return categoryList;
	}
	public void setCategoryList(List<CategoryEntity> categoryList) {
		this.categoryList = categoryList;
	}
	public List<CategoreisDTO> getSubcategoryList() {
		return subcategoryList;
	}
	public void setSubcategoryList(List<CategoreisDTO> subcategoryList) {
		this.subcategoryList = subcategoryList;
	}
	public Integer getSubcategory_type() {
		return subcategory_type;
	}
	public void setSubcategory_type(Integer subcategory_type) {
		this.subcategory_type = subcategory_type;
	}
	public String getIsdependent() {
		return isdependent;
	}
	public void setIsdependent(String isdependent) {
		this.isdependent = isdependent;
	}
}
