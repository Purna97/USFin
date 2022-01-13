package com.tekskills.ServiceImpl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import javax.mail.MessagingException;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.sun.org.apache.xerces.internal.impl.dv.util.Base64;
import com.tekskills.Dao.BGCDao;
import com.tekskills.Dao.EmployeesDao;
import com.tekskills.Dto.AssignedCandidateDto;
import com.tekskills.Dto.BasicDetailsDto;
import com.tekskills.Dto.CandidateBGCAddressDetailsDto;
import com.tekskills.Dto.CandidateBGCPersonalDetailsDto;
import com.tekskills.Dto.CandidateBgvEducationDto;
import com.tekskills.Dto.CandidateBgvEmploymentDto;
import com.tekskills.Dto.CategoreisDTO;
import com.tekskills.Dto.ContractsPanelDetails_DTO;
import com.tekskills.Dto.DocEmpBean;
import com.tekskills.Dto.DocumentTypeDto;
import com.tekskills.Dto.ProfileMasterDTO;
import com.tekskills.Dto.TempCandidateDetailsDTO;
import com.tekskills.Dto.commentHistoryDto;
import com.tekskills.Dto.fileHistoryDto;
import com.tekskills.Entity.BGCCandidateFormsStatusEntity;
import com.tekskills.Entity.BGCCheckListCommentsHistory;
import com.tekskills.Entity.BGCCheckListFileHistory;
import com.tekskills.Entity.CandidateBGCAddressEntity;
import com.tekskills.Entity.CandidateBGCCheckList;
import com.tekskills.Entity.CandidateBGCDetails;
import com.tekskills.Entity.CandidateBGCEducationEntity;
import com.tekskills.Entity.CandidateBGCEmploymentEntity;
import com.tekskills.Entity.CandidateBGCPersonalEntity;
import com.tekskills.Entity.CategoryEntity;
import com.tekskills.Entity.DocumentTypeEntity;
import com.tekskills.Entity.FormsCommentsHistory;
import com.tekskills.Entity.ProfileLableMaster;
import com.tekskills.Entity.ProfileMasterCheckList;
import com.tekskills.Entity.SubCategoryDocumentsEntity;
import com.tekskills.Entity.SubCategoryEntity;
import com.tekskills.Entity.TemporaryCandidateDetails;
import com.tekskills.Service.BGCService;
import com.tekskills.Util.Commons;
import com.tekskills.Util.SendHtmlEmailNew;
@Service
public class BGCServiceImpl implements BGCService {
	private static final Logger logger = Logger.getLogger(BGCServiceImpl.class);
	@Autowired
	BGCDao bgcDao;
	@Autowired
	private Commons commonObj;
	@Autowired
	private SendHtmlEmailNew sendmail;
	@Autowired
	EmployeesDao empDao;
	@Autowired
	private Environment env;
	@Override
	public int saveCategory(String category, Integer lgempno) {
		int categoryid=0;
		try {
			CategoryEntity categoryObj=new CategoryEntity();
			//String categoryname = category.substring(0, 1).toUpperCase() + category.substring(1);
			String uppercaseString=uppercaseString(category);
			categoryObj.setCategory_name(uppercaseString);
			categoryObj.setPosted_by(lgempno);
			categoryObj.setSubmitted_date(new Date());
			try {
				 categoryid=bgcDao.saveCategory(categoryObj);
			}catch(Exception e) {
				logger.info(e.getMessage(),e);
			}
		} catch (Exception e) {
			logger.info(e.getMessage(),e);		}
	return categoryid;
	}

	@Override
	public int saveSubCategory(String category, String subCategory, String sameas_category, Integer lgempno,
			String subcattype,String doctype, String isdocupload, MultipartFile[] document) {
		int subcategoryid=0;
		try {
			String subCategoryName=null;
			Integer categoryId=0;Integer subcatTypeId=0;Integer doctypeId=0;
			if (category!="") {
				categoryId = Integer.parseInt(category);
			}if (subcattype!="") {
				subcatTypeId = Integer.parseInt(subcattype);
			}
			String uppercaseString=uppercaseString(subCategory);
			SubCategoryEntity subcatObj=new SubCategoryEntity();
			subcatObj.setCategory_id(categoryId);
			subcatObj.setSubcategory_name(uppercaseString);
			if(sameas_category==null || sameas_category=="") {
				//subCategoryName=uppercaseString;
				subcatObj.setIs_same(0);
			}else {
				subcatObj.setIs_same(1);
				//CategoryEntity catObj=bgcDao.getCategoryByCategoryId(categoryId);
				//subCategoryName=catObj.getCategory_name();
			}
			if (doctype!="") {
				doctypeId = Integer.parseInt(doctype);
			}
			subcatObj.setSubcategory_type(subcatTypeId);
			subcatObj.setDocumenttype_id(doctypeId);
			subcatObj.setPosted_by(lgempno);
			subcatObj.setSubmitted_date(new Date());
			subcatObj.setDocStatus(isdocupload);
			try {
				subcategoryid=bgcDao.saveSubCategory(subcatObj);
			}catch(Exception e) {
				logger.info(e.getMessage(),e);
			}
			if(isdocupload.equalsIgnoreCase("Yes")) {
				if(document!=null) {
					if(document.length!=0) {
						for(int i=0;i<document.length;i++) {
							SubCategoryDocumentsEntity subCatDocObj=new SubCategoryDocumentsEntity();
							System.out.println("file******name******"+document[i].getOriginalFilename());
							if(!document[i].getOriginalFilename().isEmpty()) {
								subCatDocObj.setSubcat_id(subcategoryid);
								subCatDocObj.setFile_name(document[i].getOriginalFilename());
								subCatDocObj.setPosted_by(lgempno);
								subCatDocObj.setDocStatus("Active");
								subCatDocObj.setSubmitted_date(new Date());
								try {
									commonObj.bgvfileToDirectory(null, document[i],subCategoryName);
								} catch (MessagingException e) {
									e.printStackTrace();
								}
								bgcDao.saveSubCategoryDocument(subCatDocObj);
								//message="Success";
							}
						}
					}
				}
				
			}
		} catch (Exception e) {
			logger.info(e.getMessage(),e);		}
	return subcategoryid;
	}

	@Override
	public String checkCategory(String category) {
		String categoryName = null;
		try {
			categoryName = bgcDao.checkCategory(category);
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return categoryName;
	}

	@Override
	public String checkSubCategory(String subCategory) {
		String subcat = null;
		try {
			subcat = bgcDao.checkSubCategory(subCategory);
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return subcat;
	}

	@Override
	public List<CategoryEntity> getAllCategeories() {
		List<CategoryEntity> catList = null;
		try {
			catList = bgcDao.getAllCategeories();
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return catList;	
	}

	@Override
	public String updatecategory(String category, String categoryid) {
		String message=null;
		try {
			Integer categoryId=0;
			if (categoryid!="") {
				categoryId = Integer.parseInt(categoryid);
			}
			CategoryEntity catObj=bgcDao.getCategoryByCategoryId(categoryId);
			SubCategoryEntity subcatObj=bgcDao.getSubCategoryByCategoryId(categoryId);
			if(catObj!=null) {
				String uppercaseString=uppercaseString(category);
				catObj.setCategory_name(uppercaseString);
				bgcDao.updatecategory(catObj);
				if(subcatObj!=null) {
					subcatObj.setSubcategory_name(category);
					bgcDao.updatesubcategory(subcatObj);
				}
				message = category+" category updated successfully";
			}
			else {
				message="Category not updated";
			}
			
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return message;
	}

	@Override
	public List<SubCategoryEntity> getAllSubCategeories() {
		List<SubCategoryEntity> subcatList = null;
		try {
			subcatList = bgcDao.getAllSubCategeories();
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return subcatList;	
	}

	@Override
	public List<CategoreisDTO> getSubCategeoriesList() {
		List<CategoreisDTO> subcatList = null;
		try {
			subcatList = bgcDao.getSubCategeoriesList();
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return subcatList;	
	}

	@Override
	public String updatesubcategory(String category, String subCategory, String sameas_category, Integer lgempno,
			String subcategoryid,String usubcattype, String udoctype, String isdocupload, MultipartFile[] udocument) {
		String message=null;
		try {
			Integer categoryId=0;Integer subcategoryId=0;Integer doctypeId=0;
			if (category!="") {
				categoryId = Integer.parseInt(category);
			}if (subcategoryid!="") {
				subcategoryId = Integer.parseInt(subcategoryid);
			}
			if (udoctype!="") {
				doctypeId = Integer.parseInt(udoctype);
			}
			Integer subcatType=0;
			if (usubcattype!="") {
				subcatType = Integer.parseInt(usubcattype);
			}
			System.out.println("isdocupload*****"+isdocupload);
			SubCategoryEntity subcatObj=bgcDao.getSubCategoryBysubCategoryId(subcategoryId);
			if(subcatObj!=null) {
				if(sameas_category==null || sameas_category=="") {
					subcatObj.setIs_same(0);
						
				}else {
					subcatObj.setIs_same(1);
				}
				
				/*if(subcatObj.getDocStatus()!=null && !subcatObj.getDocStatus().equalsIgnoreCase(udocupload)) {
					
				}else if(subcatObj.getDocStatus()==null && !subcatObj.getDocStatus().equalsIgnoreCase(udocupload)) {
					
				}*/
				
				String uppercaseString=uppercaseString(subCategory);
				subcatObj.setSubcategory_name(uppercaseString);
				subcatObj.setCategory_id(categoryId);
				subcatObj.setSubcategory_type(subcatType);
				subcatObj.setDocumenttype_id(doctypeId);
				subcatObj.setDocStatus(isdocupload);
				bgcDao.updatesubcategory(subcatObj);
				message = subCategory+" SubCategory updated successfully";
			 }
			else {
				message="SubCategory not updated";
			}
			if(isdocupload.equalsIgnoreCase("Yes")) {
				if(udocument!=null) {
					if(udocument.length!=0) {
						for(int i=0;i<udocument.length;i++) {
							SubCategoryDocumentsEntity subCatDocObj=new SubCategoryDocumentsEntity();
							System.out.println("update file******name******"+udocument[i].getOriginalFilename());
							if(!udocument[i].getOriginalFilename().isEmpty()) {
								String filename=bgcDao.checkSubCategoryDocument(udocument[i].getOriginalFilename(),subcategoryId);
								if(filename==null) {
								subCatDocObj.setSubcat_id(subcategoryId);
								subCatDocObj.setFile_name(udocument[i].getOriginalFilename());
								subCatDocObj.setPosted_by(lgempno);
								subCatDocObj.setDocStatus("Active");
								subCatDocObj.setSubmitted_date(new Date());
								try {
									commonObj.bgvfileToDirectory(null, udocument[i],null);
								} catch (MessagingException e) {
									e.printStackTrace();
								}
								bgcDao.saveSubCategoryDocument(subCatDocObj);
								}
								//message="Success";
							}
						}
					}
				}
			}else {
				
				List<SubCategoryDocumentsEntity> subCatDocList = bgcDao.viewSubCatDocListBySubCatId(subcategoryId);
				if(subCatDocList.size()>0) {
				for (SubCategoryDocumentsEntity subcat : subCatDocList) {
					SubCategoryDocumentsEntity docObj=bgcDao.getSubCatDocumentBySubCatId(subcat.getDoc_id());
					docObj.setDocStatus("InActive");
					bgcDao.updateSubCatDocument(docObj);
				   }
				}
			}
			
			
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return message;
	}

	@Override
	public String checkprofilemaster(String profilename) {
		String profile = null;
		try {
			profile = bgcDao.checkprofilemaster(profilename);
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return profile;
	}

	@Override
	public List<SubCategoryEntity> getSubCategoriesByCatid(String category) {
		List<SubCategoryEntity> subcatList = null;
		try {
			Integer categoryId=0;
			if (category!="") {
				categoryId = Integer.parseInt(category);
			}
			subcatList = bgcDao.getSubCategoriesByCatid(categoryId);
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return subcatList;
	}

	@Override
	public Integer saveGroupingProfileName(String profilename, Integer lgempno) {
		int profileId=0;
		try {
			ProfileLableMaster lableObj=new ProfileLableMaster();
			String uppercaseString=uppercaseString(profilename);
			lableObj.setProfile_name(uppercaseString);
			lableObj.setStatus("Active");
			lableObj.setPosted_by(lgempno);
			lableObj.setSubmitted_date(new Date());
			try {
				profileId=bgcDao.saveGroupingProfileName(lableObj);
			}catch(Exception e) {
				logger.info(e.getMessage(),e);
			}
		} catch (Exception e) {
			logger.info(e.getMessage(),e);		}
	return profileId;
	}

	@Override
	public String saveProfileMaster(Integer lableId, String subcategoryId, Integer lgempno) {
		String msg=null;;
		try {
			ProfileMasterCheckList profileMasterObj=new ProfileMasterCheckList();
			
			profileMasterObj.setPosted_by(lgempno);
			profileMasterObj.setSubmitted_date(new Date());
			profileMasterObj.setProfile_id(lableId);
			profileMasterObj.setSubcategory_id(Integer.parseInt(subcategoryId));
			bgcDao.saveProfileMaster(profileMasterObj);
			
			msg="Grouping Profile Name Added Successfully";
			}
		 catch (Exception e) {
			logger.info(e.getMessage(),e);		
			}
	return msg;
	}

	@Override
	public List<ProfileLableMaster> getProfileList() {
		List<ProfileLableMaster> profileList = null;
		try {
			profileList = bgcDao.getProfileList();
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return profileList;	
	}

	@Override
	public List<ProfileMasterDTO> getProfileListByProfileId(String profileid) {
		List<ProfileMasterDTO> profileList = null;
		try {
			Integer profile_Id=0;
			if (profileid!="") {
				profile_Id = Integer.parseInt(profileid);
			}
			profileList = bgcDao.getProfileListByProfileId(profile_Id);
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return profileList;	
	}

	@Override
	public String getProfileNameById(String profileid) {
		String profilename = null;
		try {
			Integer profile_Id=0;
			if (profileid!="") {
				profile_Id = Integer.parseInt(profileid);
			}
			profilename = bgcDao.getProfileNameById(profile_Id);
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return profilename;
	}

	@Override
	public List<ProfileMasterCheckList> getProfileMasterListById(String profile_id) {
		List<ProfileMasterCheckList> masterList = null;
		try {
			Integer profile_Id=0;
			if (profile_id!="") {
				profile_Id = Integer.parseInt(profile_id);
			}
			masterList = bgcDao.getProfileMasterListById(profile_Id);
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return masterList;
	}

	@Override
	public String updateprofilemaster(Integer lableId, String subcategoryId, Integer lgempno) {
		String msg=null;;
		try {Integer subcatid=0;
			if(subcategoryId!="") {
				subcatid=Integer.parseInt(subcategoryId);	
			}
			
			List<ProfileMasterCheckList> profilelist=bgcDao.getProfileListByProfileSubcatId(lableId,subcatid);
			if(profilelist.size()==0) {
				ProfileMasterCheckList profileMasterObj=new ProfileMasterCheckList();
				profileMasterObj.setPosted_by(lgempno);
				profileMasterObj.setSubmitted_date(new Date());
				profileMasterObj.setProfile_id(lableId);
				profileMasterObj.setSubcategory_id(Integer.parseInt(subcategoryId));
				bgcDao.saveProfileMaster(profileMasterObj);
		
			}
			msg="Grouping Profile Updated Successfully";
			
			}
		 catch (Exception e) {
			logger.info(e.getMessage(),e);		
			}
	return msg;
	}

	@Override
	public void deleteMasterListById(Integer lableId, Integer scatid) {
		try {
			
			bgcDao.deleteMasterListById(lableId, scatid);
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return;
	}

	@Override
	public void updateprofileName(String profile_id, String profilename) {
		try {
			Integer profileId=0;
			if (profile_id!="") {
				profileId = Integer.parseInt(profile_id);
			}
			ProfileLableMaster lableObj=bgcDao.geProfileLableMasterById(profileId);
			String uppercaseString=uppercaseString(profilename);
			lableObj.setProfile_name(uppercaseString);;
			bgcDao.updateprofileName(lableObj);
				
			
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		
	}

	@Override
	public List<TemporaryCandidateDetails> getTempCandidateList() {
		List<TemporaryCandidateDetails> candiList = null;
		try {
			candiList = bgcDao.getTempCandidateList();
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return candiList;	
	}

	@Override
	public List<ProfileMasterDTO> getCandidateSpecifics(String Categoryid, String profileid) {
		List<ProfileMasterDTO> catList = new ArrayList<ProfileMasterDTO>();
		try {
			
			Integer Category_Id=0;
			if (Categoryid!="") {
				Category_Id = Integer.parseInt(Categoryid);
			}Integer profile_Id=0;
			if (profileid!="") {
				profile_Id = Integer.parseInt(profileid);
			}
			List<Integer> uniqueSubcatList = new ArrayList<>();
			List<Integer> mastersubList = bgcDao.getSubCategoiesByProfileId(profile_Id);
			List<Integer> subcatList=bgcDao.getSubCategoryByCatId(Category_Id);
			uniqueSubcatList.addAll(subcatList.stream().filter(str -> !mastersubList.contains(str)).collect(Collectors.toList()));
			
			for (Integer subid : uniqueSubcatList) {
				ProfileMasterDTO catDto=new ProfileMasterDTO();
				ProfileMasterDTO catsubcatObj=bgcDao.getCatSubcatBySubcatId(subid);
				catDto.setSubcategoryid(catsubcatObj.getSubcategoryid());
				catDto.setSubcategory(catsubcatObj.getSubcategory());
				catDto.setSubcategory_type(catsubcatObj.getSubcategory_type());
				catList.add(catDto);
			}
			
			
			/*Integer profile_Id=0;
			if (profileid!="") {
				profile_Id = Integer.parseInt(profileid);
			}
			List<Integer> mastersubList = bgcDao.getSubCategoiesByProfileId(profile_Id);
			List<Integer> subcatList=bgcDao.getSubCategoryIds();
			List<Integer> uniqueSubcatList = new ArrayList<>();
			uniqueSubcatList.addAll(subcatList.stream().filter(str -> !mastersubList.contains(str)).collect(Collectors.toList()));
			for (Integer subid : uniqueSubcatList) {
				ProfileMasterDTO catDto=new ProfileMasterDTO();
				ProfileMasterDTO catsubcatObj=bgcDao.getCatSubcatBySubcatId(subid);
				catDto.setCategoryid(catsubcatObj.getCategoryid());
				catDto.setCategory(catsubcatObj.getCategory());
				catList.add(catDto);
			}
			*/
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return catList;	
	}

	@Override
	public Integer saveCandidateBGCDetails(String profile, String candidate, String status, Integer lgempno, String baicform) {
		Integer profileId=0;
		try {
			Integer profile_Id=0;
			if (profile!="") {
				profile_Id = Integer.parseInt(profile);
			}
			
			Integer candidate_Id=0;
			if (candidate!="") {
				candidate_Id = Integer.parseInt(candidate);
			}try {
				
			CandidateBGCDetails candidateDbObj = bgcDao.getBGCDetailsByIds(candidate_Id,profile_Id);
			if(candidateDbObj!=null) {
				candidateDbObj.setStatus("InActive");
				bgcDao.updateCandidateBGCDetail(candidateDbObj);
			 }
			CandidateBGCDetails candidateObj=new CandidateBGCDetails();
			candidateObj.setProfile_id(profile_Id);
			candidateObj.setCandidate_id(candidate_Id);
			candidateObj.setTask_status(status);
			candidateObj.setPosted_by(lgempno);
			candidateObj.setStatus("Active");
			candidateObj.setSubmitted_date(new Date());
			candidateObj.setPredefined_forms(baicform);
			profileId=bgcDao.saveCandidateBGCDetails(candidateObj);
				TemporaryCandidateDetails candiOb=bgcDao.getCandidateDetailsById(Integer.parseInt(candidate));
				candiOb.setStatus("Assigned");
				bgcDao.updateCandidateStatus(candiOb);
			}catch(Exception e) {
				logger.info(e.getMessage(),e);
			}
		} catch (Exception e) {
			logger.info(e.getMessage(),e);		}
	return profileId;
	}

	

	@Override
	public SubCategoryEntity getCategoryBySubCatid(String subcategoryId) {
		SubCategoryEntity sucatObj = null;
		try {
			Integer subcategory_Id=0;
			if (subcategoryId!="") {
				subcategory_Id = Integer.parseInt(subcategoryId);
			}
			sucatObj = bgcDao.getCategoryBySubCatid(subcategory_Id);
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return sucatObj;
	}

	@Override
	public String saveCandidateBGCCheckList(String candidate, String subcategoryId, Integer lgempno, Integer profile,
			Integer catid, Integer bgc_id) {
		String msg=null;;
		try {
			CandidateBGCCheckList bgccheckObj=new CandidateBGCCheckList();
			Integer candidate_Id=0;Integer subcategory_Id=0;
			/*if (profile!="") {
				profile_Id = Integer.parseInt(profile);
			}else {
				profile_Id=0;
			}*/
			if (candidate!="") {
				candidate_Id = Integer.parseInt(candidate);
			}
			
			if (subcategoryId!="") {
				subcategory_Id = Integer.parseInt(subcategoryId);
			}
			
			bgccheckObj.setPosted_by(lgempno);
			bgccheckObj.setSubmitted_date(new Date());
			bgccheckObj.setProfile_id(profile);
			if(subcategory_Id!=0) {
				bgccheckObj.setSubcategory_id(subcategory_Id);
			}
			bgccheckObj.setCategory_id(catid);
			bgccheckObj.setBgc_id(bgc_id);
			bgccheckObj.setCandidate_id(candidate_Id);
			bgcDao.saveCandidateBGCCheckList(bgccheckObj);
			String frommail="";
			String subject=""; String tomail=""; String username="";String comment="";
			sendmail.sendMailtoCandidate(frommail, subject, tomail, username, comment);
			msg="Profile Assigned To Candidate Successfully";
			}
		 catch (Exception e) {
			logger.info(e.getMessage(),e);		
			}
	return msg;
	}
	public String uppercaseString(String name) {
		String uppercasename=null;;
		try {
			 uppercasename = name.substring(0, 1).toUpperCase() + name.substring(1);
			}
		 catch (Exception e) {
			logger.info(e.getMessage(),e);		
			}
	return uppercasename;
	}

	@Override
	public List<AssignedCandidateDto> getAssignedCandidateList() {
		List<AssignedCandidateDto> candiList = null;
		try {
			candiList = bgcDao.getAssignedCandidateList();
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return candiList;	
	}

	@Override
	public CandidateBGCDetails getBGCDetailsByCandidateId(String bgcid) {
		CandidateBGCDetails candidateObj = null;
		try {
			Integer bgc_id=0;
			if (bgcid!="") {
				bgc_id = Integer.parseInt(bgcid);
			}
			candidateObj = bgcDao.getBGCDetailsByCandidateId(bgc_id);
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return candidateObj;
	}

	@Override
	public List<Integer> getSubCategoriesByProfileId(String profile_id) {
		List<Integer> mastersubList = null;
		try {
			Integer profileid =0; if(profile_id!="") { profileid = Integer.parseInt(profile_id); }
			 mastersubList = bgcDao.getSubCategoiesByProfileId(profileid);
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return mastersubList;	
		
	}

	@Override
	public List<Integer> getCandidateBGCCheckList(String bgcid) {
		List<Integer> candiList = null;
		try {
			Integer bgc_Id =0; if(bgcid!="") { bgc_Id = Integer.parseInt(bgcid); }
			candiList = bgcDao.getCandidateBGCCheckList(bgc_Id);
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return candiList;
	}

	@Override
	public void deleteBGCCheckListById(Integer catid, Integer scatid, Integer bgc_id) {
		try {
			bgcDao.deleteBGCCheckListById(catid, scatid,bgc_id);
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
	}

	@Override
	public Integer updateCandidateBGCDetail(Integer profileid, String candidate, String status,Integer bgc_id, 
										Integer lgempno ,String baicform) {
		Integer bgcId=0;
		try {
			Integer candidate_id=0;
			if (candidate!="") {
				candidate_id = Integer.parseInt(candidate);
			}
			CandidateBGCDetails candidateObjDb = bgcDao.getBGCDetailsByCandidateId(bgc_id);
			if(!candidateObjDb.getPredefined_forms().equalsIgnoreCase(baicform) || !candidateObjDb.getTask_status().equalsIgnoreCase(status)) {
				    candidateObjDb.setPredefined_forms(baicform);
					bgcDao.updateCandidateBGCDetail(candidateObjDb);
			}else if(candidateObjDb.getProfile_id()!=profileid || candidateObjDb.getCandidate_id()!=candidate_id){
				System.out.println("Inside else****if****");
				candidateObjDb.setStatus("InActive");
				bgcDao.updateCandidateBGCDetail(candidateObjDb);
				CandidateBGCDetails candidateObjNew=new CandidateBGCDetails();
				candidateObjNew.setProfile_id(profileid);
				candidateObjNew.setCandidate_id(candidate_id);
				candidateObjNew.setTask_status(status);
				candidateObjNew.setPosted_by(lgempno);
				candidateObjNew.setStatus("Active");
				candidateObjNew.setPredefined_forms(baicform);
				candidateObjNew.setSubmitted_date(new Date());
				candidateObjNew.setPredefined_forms(baicform);
				bgcId=bgcDao.saveCandidateBGCDetails(candidateObjNew);
			}else {
				System.out.println("****No Changes****");
			}
			
			/*if(candidateObjDb.getProfile_id()!=profileid || candidateObjDb.getCandidate_id()!=candidate_id || !candidateObjDb.getTask_status().equalsIgnoreCase(status)) {
				System.out.println("Inside If********");
				candidateObjDb.setStatus("InActive");
				bgcDao.updateCandidateBGCDetail(candidateObjDb);
				CandidateBGCDetails candidateObjNew=new CandidateBGCDetails();
				candidateObjNew.setProfile_id(profileid);
				candidateObjNew.setCandidate_id(candidate_id);
				candidateObjNew.setTask_status(status);
				candidateObjNew.setPosted_by(lgempno);
				candidateObjNew.setStatus("Active");
				candidateObjNew.setPredefined_forms(baicform);
				candidateObjNew.setSubmitted_date(new Date());
				candidateObjNew.setPredefined_forms(baicform);
				Integer profileId=bgcDao.saveCandidateBGCDetails(candidateObjNew);
			  }else {
				    candidateObjDb.setPredefined_forms(baicform);
					bgcDao.updateCandidateBGCDetail(candidateObjDb);
			  }*/		
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return bgcId;
		
	}

	@Override
	public void saveBGCCheckListByProfileId(String candidate, int subcategory_id, Integer lgempno, String profile,
			Integer catid, Integer bgc_id) {
		try {
			CandidateBGCCheckList bgccheckObj=new CandidateBGCCheckList();
			Integer profile_Id=0;Integer candidate_Id=0;
			if (profile!="") {
				profile_Id = Integer.parseInt(profile);
			}if (candidate!="") {
				candidate_Id = Integer.parseInt(candidate);
			}
			bgccheckObj.setPosted_by(lgempno);
			bgccheckObj.setSubmitted_date(new Date());
			bgccheckObj.setProfile_id(profile_Id);
			bgccheckObj.setSubcategory_id(subcategory_id);
			bgccheckObj.setCategory_id(catid);
			bgccheckObj.setBgc_id(bgc_id);
			bgccheckObj.setCandidate_id(candidate_Id);
			bgcDao.saveCandidateBGCCheckList(bgccheckObj);
		
			}
		 catch (Exception e) {
			logger.info(e.getMessage(),e);		
			}
	}

	@Override
	public int saveCandidateDetails(String fname, String ssn, String phne_no, String emailid, Integer lgempno,
			String lname) {
		int candidateId = 0;
		try {
			String pwd="asdASD123";
			String bytes_ssn_emp = Base64.encode(ssn.getBytes());
			String bytes_pwd = Base64.encode(pwd.getBytes());
			TemporaryCandidateDetails candidateObj = new TemporaryCandidateDetails();
			candidateObj.setSsn(bytes_ssn_emp);
			candidateObj.setFull_name(fname + " " + lname);
			candidateObj.setFirst_name(fname);
			candidateObj.setLast_name(lname);
			candidateObj.setContact_number(phne_no);
			candidateObj.setEmail_id(emailid);
			candidateObj.setPassword(bytes_pwd);
			candidateObj.setStatus("Active");
			candidateObj.setSubmitted_date(new Date());
			candidateObj.setPosted_by(lgempno);
			try {
				candidateId = bgcDao.saveCandidateDetails(candidateObj);
			} catch (Exception e) {
				logger.info(e.getMessage(), e);
			}
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return candidateId;
	}

	@Override
	public String updatecandidate(String candidateId, String ssn, String fname, String lname, String phne_no,
			String emailid, Integer lgempno) {
		String message = null;
		try {
			Integer candidate_Id = 0;
			if (candidateId != "") {
				candidate_Id = Integer.parseInt(candidateId);
			}
			String bytes_ssn_emp = Base64.encode(ssn.getBytes());
			System.out.println("In service impl ssn***" + ssn + "name&&&" + fname + "phne_no$$" + phne_no
					+ "emailid@@@@" + emailid);
			TemporaryCandidateDetails candDbObj = bgcDao.getCandidateByCandidateId(candidate_Id);
			if (candDbObj != null) {
				candDbObj.setSsn(bytes_ssn_emp);
				candDbObj.setFull_name(fname + " " + lname);
				candDbObj.setFirst_name(fname);
				candDbObj.setLast_name(lname);
				candDbObj.setContact_number(phne_no);
				candDbObj.setEmail_id(emailid);
				candDbObj.setStatus("Active");
				candDbObj.setSubmitted_date(new Date());
				candDbObj.setPosted_by(lgempno);
				bgcDao.updatecandidate(candDbObj);
				message = fname + " " + lname + " updated successfully";
			} else {
				message = "Candidate details not updated";
			}
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return message;
	}

	// contract panel...
	@Override
	public List<TempCandidateDetailsDTO> getAllCandidates() {
		List<TempCandidateDetailsDTO> catList = null;
		try {
			catList = bgcDao.getAllCandidates();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return catList;
	}

	@Override
	public ContractsPanelDetails_DTO getContrctsPanelDetailsById(String candidateId, String profileId) {
		ContractsPanelDetails_DTO bgcList=new ContractsPanelDetails_DTO();
		try {
			Integer candidate_Id = 0;
			if (candidateId != "") {
				candidate_Id = Integer.parseInt(candidateId);
			}
			Integer profile_Id = 0;
			if (profileId != "") {
				profile_Id = Integer.parseInt(profileId);
			}
			
			Integer bgcId=bgcDao.getBGCIdByCandidateIdProfileID(candidate_Id, profile_Id);
			List<ContractsPanelDetails_DTO> adminList = bgcDao.getContrctsPanelAdminList(bgcId, profile_Id);
			List<ContractsPanelDetails_DTO> candidateList = bgcDao.getContrctsPanelCandidateList(bgcId, profile_Id);
			
			bgcList.setAdminList(adminList);
			bgcList.setCandidateList(candidateList);
		/*	CandidateBGCPersonalEntity  personalObj=bgcDao.getBGVCandidatePersonalDetailsById(candidate_Id);
			if(personalObj!=null) {
				bgcList.setPersonal_status(personalObj.getCandidate_status());
				bgcList.setPersonal_Apprstatus(personalObj.getApproved_status());
			}
			
			//CandidateBGCEducationEntity  educationObj=bgcDao.getBGVCandidateEducationDetailsById(candidate_Id);
			ContractsPanelDetails_DTO  educationObj=bgcDao.getEducationLastrowDetails(candidate_Id);
			if(personalObj!=null) {
				bgcList.setEducation_status(educationObj.getCandidate_status());
				bgcList.setEducation_Apprstatus(educationObj.getApproved_status());
			}
			ContractsPanelDetails_DTO  employmentObj=bgcDao.getEmploymentLastrowDetails(candidate_Id);
			//CandidateBGCEmploymentEntity  employmentObj=bgcDao.getBGVCandidateEmploymentDetailsById(candidate_Id);
			if(personalObj!=null) {
				bgcList.setEmployment_status(employmentObj.getCandidate_status());
				bgcList.setEmployment_Apprstatus(employmentObj.getApproved_status());
			}*/
			
			
			BGCCandidateFormsStatusEntity candformsStatusDBObj = bgcDao.getBGCFormsStatusByCandidateId(candidate_Id);
			if(candformsStatusDBObj!=null) {
				bgcList.setPersonal_status(candformsStatusDBObj.getCandidate_personal_status());
				bgcList.setPersonal_Apprstatus(candformsStatusDBObj.getVerifier_personal_status());
				bgcList.setEducation_status(candformsStatusDBObj.getCandidate_education_status());
				bgcList.setEducation_Apprstatus(candformsStatusDBObj.getVerifier_education_status());
				bgcList.setEmployment_status(candformsStatusDBObj.getCandidate_employment_status());
				bgcList.setEmployment_Apprstatus(candformsStatusDBObj.getVerifier_employment_status());
			}
			
			CandidateBGCDetails bgcObject=bgcDao.getBGCDetailsByCandidateId(bgcId);
			if(bgcObject.getPredefined_forms()!=null) {
					String[] str_array = bgcObject.getPredefined_forms().split(",");
					boolean personal = Arrays.stream(str_array).anyMatch("Personal"::equals);
					boolean education = Arrays.stream(str_array).anyMatch("Education"::equals);
					boolean employment = Arrays.stream(str_array).anyMatch("Employment"::equals);
					bgcList.setPersonal_Details(personal);
					bgcList.setEducation_Details(education);
					bgcList.setEmployment_Details(employment);
			  }
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return bgcList;
	}

	@Override
	public List<ProfileLableMaster> getAllProfiles() {
		List<ProfileLableMaster> profileList = null;
		try {
			profileList = bgcDao.getAllProfiles();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return profileList;
	}

	@Override
	public List<TempCandidateDetailsDTO> getCandidatesByProfileId(String profileId) {
		List<TempCandidateDetailsDTO> candidateList = null;
		try {
			Integer profile_Id = 0;
			if (profileId != "") {
				profile_Id = Integer.parseInt(profileId);
			}
			candidateList = bgcDao.getCandidatesByProfileId(profile_Id);
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return candidateList;
	}

	@Override
	public String saveCommentDetails(String bgcChkId, String bgcChkStatus, String comment, Integer lgempno , 
			MultipartFile[] bgcfile,  String bgcCandidateId) {
		String message = null;
		try {
			Integer bgcChk_Id = 0;
			if (bgcChkId != "") {
				bgcChk_Id = Integer.parseInt(bgcChkId);
			}
			
			Integer Candidate_Id = 0;
			if (bgcCandidateId!= "") {
				Candidate_Id = Integer.parseInt(bgcCandidateId);
			}
			
			CandidateBGCCheckList candidateBgcObj = bgcDao.getBGCCheckListById(bgcChk_Id);
			if(candidateBgcObj!=null) {
				candidateBgcObj.setStatus(bgcChkStatus);
				bgcDao.updateCommentDetails(candidateBgcObj);
			}
			
			BGCCheckListCommentsHistory commentHistory = new BGCCheckListCommentsHistory();
			commentHistory.setBgc_checklist_id(candidateBgcObj.getBgc_checklist_id());
			commentHistory.setComments(comment);
			commentHistory.setStatus(bgcChkStatus);
			commentHistory.setPosted_by(lgempno);
			commentHistory.setSubmitted_date(new Date());
			bgcDao.saveCommentHistory(commentHistory);
			
			message = "Comment saved Successfully";

			if(bgcfile!=null) {
			if(bgcfile.length!=0) {
				for(int i=0;i<bgcfile.length;i++) {
					BGCCheckListFileHistory filehisory= new BGCCheckListFileHistory();
					System.out.println("bgcfile******name******"+bgcfile[i].getOriginalFilename());
					if(!bgcfile[i].getOriginalFilename().isEmpty()) {
						filehisory.setBgc_checklist_id(bgcChk_Id);
						filehisory.setFile_name(bgcfile[i].getOriginalFilename());
						filehisory.setPosted_by(lgempno);
						filehisory.setSubmitted_date(new Date());
						try {
							commonObj.bgvfileToDirectory(Candidate_Id, bgcfile[i],null);
						} catch (MessagingException e) {
							e.printStackTrace();
						}
						bgcDao.saveDocumentHistory(filehisory);
						//message="Success";
					}
				}
			}
		}
			
			
			/*if(candidateBgcObj.getComments()!=null) {
				CandidateBGCCheckListHistory candHistoryObj=new CandidateBGCCheckListHistory();
				candHistoryObj.setBgc_checklist_id(candidateBgcObj.getBgc_checklist_id());
				candHistoryObj.setBgc_id(candidateBgcObj.getBgc_id());
				candHistoryObj.setProfile_id(candidateBgcObj.getProfile_id());
				candHistoryObj.setCandidate_id(candidateBgcObj.getCandidate_id());
				candHistoryObj.setCategory_id(candidateBgcObj.getCategory_id());
				candHistoryObj.setSubcategory_id(candidateBgcObj.getSubcategory_id());
				candHistoryObj.setChecklist_id(candidateBgcObj.getChecklist_id());
				if(candidateBgcObj.getFile_name()!=null) {
					candHistoryObj.setFile_name(candidateBgcObj.getFile_name());
				}else {
					
				}
				candHistoryObj.setStatus(candidateBgcObj.getStatus());
				candHistoryObj.setPosted_by(candidateBgcObj.getPosted_by());
				candHistoryObj.setSubmitted_date(candidateBgcObj.getSubmitted_date());
				candHistoryObj.setComments(candidateBgcObj.getComments());
				bgcDao.saveCandidateBGCCheckListHistory(candHistoryObj);
				
				candidateBgcObj.setStatus(bgcChkStatus);
				candidateBgcObj.setComments(comment);
				candidateBgcObj.setPosted_by(lgempno);
				candidateBgcObj.setSubmitted_date(new Date());
				bgcDao.updateCommentDetails(candidateBgcObj);
				message = "Comment saved Successfully";
		
			}
			else {
				candidateBgcObj.setStatus(bgcChkStatus);
				candidateBgcObj.setComments(comment);
				candidateBgcObj.setPosted_by(lgempno);
				candidateBgcObj.setSubmitted_date(new Date());
				bgcDao.updateCommentDetails(candidateBgcObj);
				message = "Comment saved Successfully";
			}*/
			
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return message;
	}

	@Override
	public List<commentHistoryDto> viewCommentHistoryById(String chkListId) {
		List<commentHistoryDto> commentHistoryList = null;
		try {
			Integer chkList_Id = 0;
			if (chkListId != "") {
				chkList_Id = Integer.parseInt(chkListId);
			}
			commentHistoryList = bgcDao.viewCommentHistoryById(chkList_Id);
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return commentHistoryList;
	}

	@Override
	public List<fileHistoryDto> viewfileHistoryByChkListId(String chkListId) {
		List<fileHistoryDto> fileHistoryList = null;
		try {
			Integer chkList_Id = 0;
			if (chkListId != "") {
				chkList_Id = Integer.parseInt(chkListId);
			}
			fileHistoryList = bgcDao.viewfileHistoryByChkListId(chkList_Id);
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return fileHistoryList;
	}

	@Override
	public List<CandidateBGCCheckList> getBGCListByIds(Integer catid, String subcategoryId, Integer bgc_id,
			String candidate) {
		List<CandidateBGCCheckList> checkList = null;
		try {
			Integer subcatId=0;Integer candidateId=0;
			if (subcategoryId!="") {
				subcatId = Integer.parseInt(subcategoryId);
			}if (candidate!="") {
				candidateId = Integer.parseInt(candidate);
			}
			checkList = bgcDao.getBGCListByIds(bgc_id,subcatId,catid,candidateId);
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return checkList;
	}

	@Override
	public String updateProfileStatus(String profileid, String status) {
		String message=null;
		try {
			Integer profile_Id=0;
			if (profileid!="") {
				profile_Id = Integer.parseInt(profileid);
			}
			ProfileLableMaster profileObj=bgcDao.getprofileMasterByprofileId(profile_Id);
			if(profileObj!=null) {
				profileObj.setStatus(status);
				bgcDao.updateprofileName(profileObj);
				
				message = profileObj.getProfile_name()+" Grouping Profile is made "+status+"";
			}
			
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return message;
	}

	@Override
	public List<ProfileLableMaster> getInactiveProfileList() {
		List<ProfileLableMaster> profileList = null;
		try {
			profileList = bgcDao.getInactiveProfileList();
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return profileList;	
	}

	@Override
	public List<ContractsPanelDetails_DTO> getBGCPendingList() {
		List<ContractsPanelDetails_DTO> bgcpendingList = null;
		try {
			bgcpendingList = bgcDao.getBGCPendingList();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return bgcpendingList;
	}

	@Override
	public String saveBgcStatusById(String candidateId, String profileId, String bgcStatus) {
		String message=null;
		try {
			Integer candidate_Id=0;
			if (candidateId!="") {
				candidate_Id = Integer.parseInt(candidateId);
			}
			
			Integer profile_Id=0;
			if (profileId!="") {
				profile_Id = Integer.parseInt(profileId);
			}
			Integer bgcId=bgcDao.getBGCIdByCandidateIdProfileID(candidate_Id,profile_Id);
			CandidateBGCDetails candBgcObj=bgcDao.getBGCDetailsByCandidateId(bgcId);
			System.out.println("candBgcObj-----"+candBgcObj);
			if(candBgcObj!=null) {
				candBgcObj.setBgc_status(bgcStatus);
				bgcDao.updateCandidateBGCDetail(candBgcObj);
				message = "Details updated successfully";
			}
			else {
				message="Details not updated";
			}
			
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return message;
	}
	
	@Override
	public String ssncheckInTempReg(String ssn_emp) {
		String ssn=null;
		try {
			ssn=bgcDao.ssncheckInTempReg(ssn_emp);
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return ssn;
	}

	/*@Override
	public String updatecanstatus(String bgcChkId, String bgcChkStatus, String comment, Integer lgempno,
			String bgcCandidateId) {
		String message = null;
		try {
			Integer bgcChk_Id = 0;
			if (bgcChkId != "") {
				bgcChk_Id = Integer.parseInt(bgcChkId);
			}
			
			Integer Candidate_Id = 0;
			if (bgcCandidateId!= "") {
				Candidate_Id = Integer.parseInt(bgcCandidateId);
			}
			
			CandidateBGCCheckList candidateBgcObj = bgcDao.getBGCCheckListById(bgcChk_Id);
			if(candidateBgcObj!=null) {
				candidateBgcObj.setStatus(bgcChkStatus);
				bgcDao.updateCommentDetails(candidateBgcObj);
			}
			BGCCheckListCommentsHistory commentHistory = new BGCCheckListCommentsHistory();
			commentHistory.setBgc_checklist_id(candidateBgcObj.getBgc_checklist_id());
			commentHistory.setComments(comment);
			commentHistory.setStatus(bgcChkStatus);
			commentHistory.setPosted_by(lgempno);
			commentHistory.setSubmitted_date(new Date());
			bgcDao.saveCommentHistory(commentHistory);
			
			message = "Details saved Successfully";

		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return message;
	}*/
	

	@Override
	public String emailcheckInTempReg(String email_emp) {
			String msg=null;
			try {
				msg=bgcDao.emailcheckInTempReg(email_emp);
			} catch (Exception e) {
				logger.info(e.getMessage(),e);
			}
			return msg;
	}
	
	@Override
	public String emailcheckInTempRegForgotPassword(String email_emp) {
			String msg=null;
			try {
				TemporaryCandidateDetails emailObj=bgcDao.getCandidateByCandidateEmailId(email_emp);
				if(emailObj!=null) {
					msg="Success";
					byte[] passworddecodedBytes = Base64.decode(emailObj.getPassword());
					String password = new String(passworddecodedBytes);
					String subject="Forgot Password";
					sendmail.sendLinkToEmailId(emailObj.getEmail_id(),emailObj.getFull_name(),emailObj.getEmail_id(),password,subject);
				}else {
					msg="Error";
				}
				
			} catch (Exception e) {
				logger.info(e.getMessage(),e);
			}
			return msg;
	}

	@Override
	public TemporaryCandidateDetails checkLoginWithEmailId(String emailId, String password) {
		TemporaryCandidateDetails tempRegObj = null;
		try {
			tempRegObj = bgcDao.checkLoginWithEmailId(emailId, password);
		} catch (Exception e) {
			logger.info(e.getMessage(), e); 
		}
		return tempRegObj;
	}

	@Override
	public String checkPasswordTempReg(String lgemailid, String currentPassword) {
			String msg = "";
			try {
				msg = bgcDao.checkPasswordTempReg(lgemailid, currentPassword);
			} catch (Exception e) {
				logger.info(e.getMessage(),e);
			}
			return msg;
		}
	@Override
	public String changePasswordTempReg(String lgemailid, String confirmPassword) {
		String msg2 = "";
		try {
			msg2 = bgcDao.changePasswordTempReg(lgemailid, confirmPassword);
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return msg2;
	}

	@Override
	public String resetPasswordTempReg(String emailId) {
		String msg2 = "";
		try {
			String resetpass_word="asdASD123";
			msg2 = bgcDao.resetPasswordTempReg(emailId, resetpass_word);
			if(msg2.equalsIgnoreCase("Success")) {
				TemporaryCandidateDetails emailObj=bgcDao.getCandidateByCandidateEmailId(emailId);
				byte[] passworddecodedBytes = Base64.decode(emailObj.getPassword());
				String password = new String(passworddecodedBytes);
				String subject="Reset Password";
				sendmail.sendLinkToEmailId(emailObj.getEmail_id(),emailObj.getFull_name(),emailObj.getEmail_id(),password,subject);
			}
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return msg2;
	}

	@Override
	public String savePersonalDetails(String ssn_emp, String firstName, String middleName, String familyName,
			String fatherName, String dob, String genderType, String nationality, String contactTeleNo, String email_id,
			String mobile, Integer loginempno, String title, String line1, String line2, String city, String state,
			String zipcode, String fromDate, String toDate, String[] othr_line1s, String[] othr_line2s,
			String[] othr_citys, String[] othr_states, String[] othr_zipcodes, String[] othr_fromDates,
			String[] othr_toDates) {
		String message=null;
		try {
			System.out.println("In service");
			CandidateBGCPersonalEntity personalDetailObj = new CandidateBGCPersonalEntity();
			String bytes_ssn_emp = Base64.encode(ssn_emp.getBytes());
			personalDetailObj.setSsn_no(bytes_ssn_emp);
			personalDetailObj.setTitle(title);
			personalDetailObj.setFirst_name(firstName);
			personalDetailObj.setMiddle_name(middleName);
			personalDetailObj.setLast_name(familyName);
			personalDetailObj.setFather_name(fatherName);
			personalDetailObj.setContact_no(contactTeleNo);
			personalDetailObj.setDob(dob);
			personalDetailObj.setEmail_id(email_id);
			personalDetailObj.setGender(genderType);
			personalDetailObj.setNationality(nationality);
			personalDetailObj.setMobile_number(mobile);
			personalDetailObj.setSubmitted_on(new Date());	
			personalDetailObj.setCandidate_status("Submitted");
			personalDetailObj.setCandidate_id(loginempno);
			
			Integer personalId = bgcDao.savePersonalDetails(personalDetailObj);
			if(personalId>0) {
				message="Personal Details Saved Successfully";
				CandidateBGCAddressEntity candAddressObj = new CandidateBGCAddressEntity();
					candAddressObj.setPersonal_id(personalId);
					candAddressObj.setLine1(line1);
					candAddressObj.setLine2(line2);
					candAddressObj.setCity(city);
					candAddressObj.setState(state);
					candAddressObj.setZipcode(zipcode);
					candAddressObj.setFrom_date(fromDate);
					candAddressObj.setTo_date(toDate);
					candAddressObj.setIsCurrentAddress(1);
					candAddressObj.setSubmitted_on(new Date());
					bgcDao.saveCandidateBGCAddressDetails(candAddressObj);
				if (othr_line1s != null) {
					for (int t = 1; t < othr_line1s.length; t++) {
						 String othr_line1=othr_line1s[t];
		    			 String othr_line2=othr_line2s[t];
		    			 String othr_city=othr_citys[t];
		    			 String othr_state=othr_states[t];
		    			 String othr_zipcode=othr_zipcodes[t];
		    			 String othr_fromDate=othr_fromDates[t];
		    			 String othr_toDate=othr_toDates[t];
		    			 CandidateBGCAddressEntity candOtherAddressObj = new CandidateBGCAddressEntity();
		    			 candOtherAddressObj.setPersonal_id(personalId);
		    			 candOtherAddressObj.setLine1(othr_line1);
		    			 candOtherAddressObj.setLine2(othr_line2);
		    			 candOtherAddressObj.setCity(othr_city);
		    			 candOtherAddressObj.setState(othr_state);
		    			 candOtherAddressObj.setZipcode(othr_zipcode);
		    			 candOtherAddressObj.setFrom_date(othr_fromDate);
		    			 candOtherAddressObj.setTo_date(othr_toDate);
		    			 candOtherAddressObj.setIsCurrentAddress(0);
		    			 candOtherAddressObj.setSubmitted_on(new Date());
		    			bgcDao.saveCandidateBGCAddressDetails(candOtherAddressObj);
					   }
				 }
			}
			
			BGCCandidateFormsStatusEntity candformsStatusDBObj = bgcDao.getBGCFormsStatusByCandidateId(loginempno);
			if(candformsStatusDBObj!=null) {
				candformsStatusDBObj.setCandidate_personal_status("Submitted");
				bgcDao.updateCandidateFormsStatusDetails(candformsStatusDBObj);
			}else {
				BGCCandidateFormsStatusEntity candformsStatusObj = new BGCCandidateFormsStatusEntity();
				candformsStatusObj.setCandidate_id(loginempno);
				candformsStatusObj.setCandidate_personal_status("Submitted");
				bgcDao.saveCandidateFormsStatusDetails(candformsStatusObj);
			}
			
			TemporaryCandidateDetails bgccandidateObj=bgcDao.getCandidateByCandidateId(loginempno);
			String fromail=bgccandidateObj.getEmail_id(),tomail=env.getProperty("contractsmailid"),
				   fromname=bgccandidateObj.getFull_name(),toname="Team", 
				   body="",ccmail="";
					String subject=" "+bgccandidateObj.getFull_name()+"  BGC: Personal Details Form  has been submitted";
					body="I have submitted my Personal Details Form, please check.";
					try {
						sendmail.sendBGCStatusMail(fromail, tomail, fromname,toname, subject, body,ccmail);
					}catch (Exception e) {
						// TODO: handle exception
					}
			
			
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return message;
	}

	@Override
	public String saveEmploymentDetails(String company_name, String reported_to_name, String hrmgr, String positionheld,
			String employmentType, String company_phone, String fromDate, String toDate, String cpname, String cpemail,
			String cpnumber, String acpname, String acpnumber, String line1, String line2, String city,
			String state, String zipcode, String[] othr_company_names, String[] othr_reported_to_names, String[] othr_hrmgrs,
			String[] othr_positionhelds, String[] othr_employmentTypes, String[] othr_company_teles, String[] othr_cpnames,
			String[] othr_cpemails, String[] othr_cpnumbers, String[] othr_acpnames,
			String[] othr_acpnumbers, String[] othr_line1s, String[] othr_line2s, String[] othr_citys,
			String[] othr_states, String[] othr_zipcodes, String[] othr_fromDates, String[] othr_toDates,
			String reported_to_position, String[] othr_reported_to_positions, Integer loginempno) {
		String message=null;
		try {
			System.out.println("In service");
			CandidateBGCEmploymentEntity employmentDetailObj = new CandidateBGCEmploymentEntity();
			employmentDetailObj.setCompany_name(company_name);
			employmentDetailObj.setReported_to_name(reported_to_name);
			employmentDetailObj.setReported_to_position(reported_to_position);
			employmentDetailObj.setHr_name(hrmgr);
			employmentDetailObj.setPositionheld(positionheld);
			employmentDetailObj.setEmploymentType(employmentType);
			//employmentDetailObj.setEmploment_fromDate(fromDate);
			//employmentDetailObj.setEmploment_toDate(toDate);
			employmentDetailObj.setCompany_phone(company_phone);
			employmentDetailObj.setContact_person_name(cpname);
			employmentDetailObj.setContact_person_email(cpemail);
			employmentDetailObj.setContact_person_number(cpnumber);
			employmentDetailObj.setAdditional_contact_person_name(acpname);
			employmentDetailObj.setAdditional_contact_person_pnumber(acpnumber);
			employmentDetailObj.setSubmitted_on(new Date());	
			employmentDetailObj.setCandidate_status("Submitted");
			employmentDetailObj.setCandidate_id(loginempno);
			Integer employmentId = bgcDao.saveEmploymentDetails(employmentDetailObj);
			if(employmentId>0) {
				message="Employment Details Saved Successfully";
				CandidateBGCAddressEntity candAddressObj = new CandidateBGCAddressEntity();
					candAddressObj.setEmployment_id(employmentId);
					candAddressObj.setLine1(line1);
					candAddressObj.setLine2(line2);
					candAddressObj.setCity(city);
					candAddressObj.setState(state);
					candAddressObj.setZipcode(zipcode);
					candAddressObj.setFrom_date(fromDate);
					candAddressObj.setTo_date(toDate);
					candAddressObj.setSubmitted_on(new Date());
					bgcDao.saveCandidateBGCAddressDetails(candAddressObj);
			}
			if (othr_company_names != null) {
				for (int t = 1; t < othr_company_names.length; t++) {
					
					 String othr_company_name=othr_company_names[t];
	    			 String othr_reported_to_name=othr_reported_to_names[t];
	    			 String othr_reported_to_position=othr_reported_to_positions[t];
	    			 String othr_hrmgr=othr_hrmgrs[t];
	    			 String othr_positionheld=othr_positionhelds[t];
	    			 String othr_employmentType=othr_employmentTypes[t];
	    			 String othr_company_phone=othr_company_teles[t];
	    			 String othr_fromDate=othr_fromDates[t];
	    			 String othr_toDate=othr_toDates[t];
	    			 
	    			 String othr_cpname=othr_cpnames[t];	
					 String othr_cpemail=othr_cpemails[t];
	    			 String othr_cpnumber=othr_cpnumbers[t];
	    			 String othr_acpname=othr_acpnames[t];
	    			 String othr_acpnumber=othr_acpnumbers[t];
	    			
	    			 
	    			 CandidateBGCEmploymentEntity otheremploymentDetailObj = new CandidateBGCEmploymentEntity();
	    			 	otheremploymentDetailObj.setCompany_name(othr_company_name);
	    			 	otheremploymentDetailObj.setReported_to_name(othr_reported_to_name);
	    			 	otheremploymentDetailObj.setReported_to_position(othr_reported_to_position);
	    			 	otheremploymentDetailObj.setHr_name(othr_hrmgr);
	    			 	otheremploymentDetailObj.setPositionheld(othr_positionheld);
	    			 	otheremploymentDetailObj.setEmploymentType(othr_employmentType);
	    			 	//otheremploymentDetailObj.setEmploment_fromDate(othr_fromDate);
	    			 	//otheremploymentDetailObj.setEmploment_toDate(othr_toDate);
	    			 	otheremploymentDetailObj.setCompany_phone(othr_company_phone);
	    			 	otheremploymentDetailObj.setContact_person_name(othr_cpname);
	    			 	otheremploymentDetailObj.setContact_person_email(othr_cpemail);
	    			 	otheremploymentDetailObj.setContact_person_number(othr_cpnumber);
	    			 	otheremploymentDetailObj.setAdditional_contact_person_name(othr_acpname);
	    			 	otheremploymentDetailObj.setAdditional_contact_person_pnumber(othr_acpnumber);
	    			 	otheremploymentDetailObj.setSubmitted_on(new Date());	
	    			 	otheremploymentDetailObj.setCandidate_status("Submitted");
	    			 	otheremploymentDetailObj.setCandidate_id(loginempno);
	    			 	Integer otheremploymentId = bgcDao.saveEmploymentDetails(otheremploymentDetailObj);
					
					 String othr_line1=othr_line1s[t];
	    			 String othr_line2=othr_line2s[t];
	    			 String othr_city=othr_citys[t];
	    			 String othr_state=othr_states[t];
	    			 String othr_zipcode=othr_zipcodes[t];
	    			 
	    			 CandidateBGCAddressEntity candOtherAddressObj = new CandidateBGCAddressEntity();
	    			 candOtherAddressObj.setEmployment_id(otheremploymentId);
	    			 candOtherAddressObj.setLine1(othr_line1);
	    			 candOtherAddressObj.setLine2(othr_line2);
	    			 candOtherAddressObj.setCity(othr_city);
	    			 candOtherAddressObj.setState(othr_state);
	    			 candOtherAddressObj.setZipcode(othr_zipcode);
	    			 candOtherAddressObj.setFrom_date(othr_fromDate);
	    			 candOtherAddressObj.setTo_date(othr_toDate);
	    			 candOtherAddressObj.setSubmitted_on(new Date());
	    			bgcDao.saveCandidateBGCAddressDetails(candOtherAddressObj);
				   }
			 }
			
			
			
			// sendmail.sendMail(frommail, toemail, toName, comments, subject);
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return message;
	}

	@Override
	public String saveEducationDetails(String collegeNameAddr, String universityNameAddr, String graduatedYear,
			String enrollNo, String typeofeducation , String subMajor, String qualification,
			String fromDate, String toDate, String courseType, Integer loginempno) {
		String message=null;
		try {
			System.out.println("In service EducationDetails");
			CandidateBGCEducationEntity educationDetailObj = new CandidateBGCEducationEntity();
			educationDetailObj.setCollege_name(collegeNameAddr);
			educationDetailObj.setUniversity_name(universityNameAddr);
			educationDetailObj.setGraduation(graduatedYear);
			educationDetailObj.setStudent_id(enrollNo);
			educationDetailObj.setType_of_degree(typeofeducation);
			educationDetailObj.setGraduation(graduatedYear);
			educationDetailObj.setEducation_fromDate(fromDate);
			educationDetailObj.setEducation_toDate(toDate);
			educationDetailObj.setQualification(qualification);
			educationDetailObj.setCourse_Type(courseType);
			educationDetailObj.setMajor_subject(subMajor);
			educationDetailObj.setSubmitted_on(new Date());	
			educationDetailObj.setCandidate_status("Submitted");
			educationDetailObj.setCandidate_id(loginempno);
			Integer educationId = bgcDao.saveEducationDetails(educationDetailObj);
			if(educationId>0) {
				message="Education Details Saved Successfully";
			
				/*	CandidateBGCCandidateAddressDetailsEntity candAddressObj = new CandidateBGCCandidateAddressDetailsEntity();
					candAddressObj.setEmployment_id(employmentId);
					candAddressObj.setLine1(line1);
					candAddressObj.setLine2(line2);
					candAddressObj.setCity(city);
					candAddressObj.setState(state);
					candAddressObj.setZipcode(zipcode);
					candAddressObj.setFrom_date(fromDate);
					candAddressObj.setTo_date(toDate);
					candAddressObj.setIsCurrentAddress(1);
					candAddressObj.setSubmitted_on(new Date());
					bgcDao.saveCandidateBGCAddressDetails(candAddressObj);*/
			}
			
			BGCCandidateFormsStatusEntity candformsStatusDBObj = bgcDao.getBGCFormsStatusByCandidateId(loginempno);
			if(candformsStatusDBObj!=null) {
				candformsStatusDBObj.setCandidate_education_status("Submitted");
				bgcDao.updateCandidateFormsStatusDetails(candformsStatusDBObj);
			}else {
				BGCCandidateFormsStatusEntity candformsStatusObj = new BGCCandidateFormsStatusEntity();
				candformsStatusObj.setCandidate_id(loginempno);
				candformsStatusObj.setCandidate_education_status("Submitted");
				bgcDao.saveCandidateFormsStatusDetails(candformsStatusObj);
			}
			
			
			TemporaryCandidateDetails bgccandidateObj=bgcDao.getCandidateByCandidateId(loginempno);
			
			String fromail=bgccandidateObj.getEmail_id(),tomail=env.getProperty("contractsmailid"),
				   fromname=bgccandidateObj.getFull_name(),toname="Team", 
				   body="",ccmail="";
					String subject=" "+bgccandidateObj.getFull_name()+"  BGC: Education Details Form  has been submitted";
					body="I have submitted my Education Details Form, please check.";
					try {
						sendmail.sendBGCStatusMail(fromail, tomail, fromname,toname, subject, body,ccmail);
					}catch (Exception e) {
						// TODO: handle exception
					}
			// sendmail.sendMail(frommail, toemail, toName, comments, subject);
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return message;
	}

	@Override
	public ContractsPanelDetails_DTO getBgvDocFormsDetailsById(Integer candidate_Id) {
		ContractsPanelDetails_DTO bgcList=new ContractsPanelDetails_DTO();
		try {
		/*	Integer candidate_Id = 0;
			if (candidateId != "") {
				candidate_Id = Integer.parseInt(candidateId);
			}*/
			
			Integer bgcId=bgcDao.getTop1ProfileIdByCandidate(candidate_Id);
			
			
			BGCCandidateFormsStatusEntity candformsStatusDBObj = bgcDao.getBGCFormsStatusByCandidateId(candidate_Id);
			if(candformsStatusDBObj!=null) {
				bgcList.setPersonal_status(candformsStatusDBObj.getCandidate_personal_status());
				bgcList.setPersonal_Apprstatus(candformsStatusDBObj.getVerifier_personal_status());
				bgcList.setEducation_status(candformsStatusDBObj.getCandidate_education_status());
				bgcList.setEducation_Apprstatus(candformsStatusDBObj.getVerifier_education_status());
				bgcList.setEmployment_status(candformsStatusDBObj.getCandidate_employment_status());
				bgcList.setEmployment_Apprstatus(candformsStatusDBObj.getVerifier_employment_status());
			}
			
			CandidateBGCDetails bgcObject=bgcDao.getBGCDetailsByCandidateId(bgcId);
			if(bgcObject.getPredefined_forms()!=null) {
					String[] str_array = bgcObject.getPredefined_forms().split(",");
					boolean personal = Arrays.stream(str_array).anyMatch("Personal"::equals);
					boolean education = Arrays.stream(str_array).anyMatch("Education"::equals);
					boolean employment = Arrays.stream(str_array).anyMatch("Employment"::equals);
					bgcList.setPersonal_Details(personal);
					bgcList.setEducation_Details(education);
					bgcList.setEmployment_Details(employment);
			  }
			
		//	Integer bgcId=bgcDao.getBGCIdByCandidateIdProfileID(candidate_Id, profile_Id);
			
	/*		CandidateBGCPersonalEntity  personalObj=bgcDao.getBGVCandidatePersonalDetailsById(candidate_Id);
			if(personalObj!=null) {
				bgcList.setPersonal_status(personalObj.getCandidate_status());
				bgcList.setPersonal_Apprstatus(personalObj.getApproved_status());
			}
			
		//CandidateBGCEducationEntity  educationObj=bgcDao.getBGVCandidateEducationDetailsById(candidate_Id);
			ContractsPanelDetails_DTO  educationObj=bgcDao.getEducationLastrowDetails(candidate_Id);
		if(educationObj!=null) {
				bgcList.setEducation_status(educationObj.getCandidate_status());
				bgcList.setEducation_Apprstatus(educationObj.getApproved_status());
			}
		//CandidateBGCEmploymentEntity  employmentObj=bgcDao.getBGVCandidateEmploymentDetailsById(candidate_Id);
		ContractsPanelDetails_DTO  employmentObj=bgcDao.getEmploymentLastrowDetails(candidate_Id);
			if(employmentObj!=null) {
				bgcList.setEmployment_status(employmentObj.getCandidate_status());
				bgcList.setEmployment_Apprstatus(employmentObj.getApproved_status());
			}*/
			List<ContractsPanelDetails_DTO> candidateList = bgcDao.getContrctsPanelCandidateList(bgcId, 0);
			System.out.println("candidateList*******"+candidateList.size());
			if(candidateList.size()>0) {
			bgcList.setCandidateList(candidateList);
			}
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return bgcList;
	}

	/*@Override
	public CandidateBGCPersonalDetailsDto viewCandidateBGCPersonalDetailsById(String candidateId) {
		CandidateBGCPersonalDetailsDto personalDetailsObj=null;
		try {
			Integer candidate_id = 0;
			if (candidateId!="") {
				candidate_id = Integer.parseInt(candidateId);
			}
			personalDetailsObj = bgcDao.viewCandidateBGCPersonalDetailsById(candidate_id);
			List<CandidateBGCAddressDetailsDto> adressListp = bgcDao.getCandidateBGCAddressDetailsById(personalDetailsObj.getPersonal_id());
			personalDetailsObj.setAddressList(adressListp);
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return personalDetailsObj;
	}*/

	@Override
	public String updateCandidateBGCPersonalDetails(String ssn_emp, String firstName, String middleName,
			String familyName, String fatherName, String dob, String genderType, String nationality,
			String contactTeleNo, String email_id, String mobile, Integer candidate_Id, String title, String[] contact_ids,
			String[] line1s, String[] line2s, String[] citys, String[] states, String[] zipcodes, String[] fromDates,
			String[] toDates, String[] othr_line1s, String[] othr_line2s, String[] othr_citys, String[] othr_states,
			String[] othr_zipcodes, String[] othr_fromDates, String[] othr_toDates) {
		String message=null;
		try {
			System.out.println("In service");
			CandidateBGCPersonalEntity updatepersonalDetailObj = bgcDao.getBGVCandidatePersonalDetailsById(candidate_Id);
			String bytes_ssn_emp = Base64.encode(ssn_emp.getBytes());
			if(!updatepersonalDetailObj.getSsn_no().equalsIgnoreCase(bytes_ssn_emp) || !updatepersonalDetailObj.getTitle().equalsIgnoreCase(title) || 
				!updatepersonalDetailObj.getFirst_name().equalsIgnoreCase(firstName) || !updatepersonalDetailObj.getMiddle_name().equalsIgnoreCase(middleName) ||
				!updatepersonalDetailObj.getLast_name().equals(familyName) || !updatepersonalDetailObj.getFather_name().equals(fatherName) ||
				!updatepersonalDetailObj.getContact_no().equals(contactTeleNo) || !updatepersonalDetailObj.getEmail_id().equals(email_id) || 
				!updatepersonalDetailObj.getMobile_number().equals(mobile) || !updatepersonalDetailObj.getNationality().equals(nationality)) {
				updatepersonalDetailObj.setSsn_no(bytes_ssn_emp);
				updatepersonalDetailObj.setTitle(title);
				updatepersonalDetailObj.setFirst_name(firstName);
				updatepersonalDetailObj.setMiddle_name(middleName);
				updatepersonalDetailObj.setLast_name(familyName);
				updatepersonalDetailObj.setFather_name(fatherName);
				updatepersonalDetailObj.setContact_no(contactTeleNo);
				updatepersonalDetailObj.setDob(dob);
				updatepersonalDetailObj.setEmail_id(email_id);
				updatepersonalDetailObj.setGender(genderType);
				updatepersonalDetailObj.setNationality(nationality);
				updatepersonalDetailObj.setMobile_number(mobile);
				updatepersonalDetailObj.setSubmitted_on(new Date());	
				bgcDao.updatePersonalDetails(updatepersonalDetailObj);
			    message="Personal Details Updated Successfully";
			}else {
				
			}
			//CandidateBGCPersonalDetailsEntity personalDetailObj = new CandidateBGCPersonalDetailsEntity();
		   /* Integer personalId = bgcDao.savePersonalDetails(personalDetailObj);
			if(personalId>0) {
				
			}*/
		    if(contact_ids!=null) {
				for (int t = 0; t < contact_ids.length; t++) {
					 Integer contact_id=Integer.parseInt(contact_ids[t]);
					  System.out.println("contact_id******"+contact_id);
					 String line1=line1s[t];
	    			 String line2=line2s[t];
	    			 String city=citys[t];
	    			 String state=states[t];
	    			 String zipcode=zipcodes[t];
	    			 String fromDate=fromDates[t];
	    			 String toDate=toDates[t];
	    			 CandidateBGCAddressEntity updateCandAddressObj =bgcDao.getBGVCandidateAdressDetailsById(contact_id);
	    				if(!updateCandAddressObj.getLine1().equalsIgnoreCase(line1) || !updateCandAddressObj.getLine2().equalsIgnoreCase(line2) || !updateCandAddressObj.getCity().equalsIgnoreCase(city) || !updateCandAddressObj.getState().equalsIgnoreCase(state) || !updateCandAddressObj.getZipcode().equals(zipcode) || !updateCandAddressObj.getFrom_date().equals(fromDate) || !updateCandAddressObj.getTo_date().equals(toDate)) {
	    					updateCandAddressObj.setLine1(line1);
	  						updateCandAddressObj.setLine2(line2);
	  						updateCandAddressObj.setCity(city);
	  						updateCandAddressObj.setState(state);
	  						updateCandAddressObj.setZipcode(zipcode);
	  						updateCandAddressObj.setFrom_date(fromDate);
	  						updateCandAddressObj.setTo_date(toDate);
	  						bgcDao.updateCandidateBGCAddressDetails(updateCandAddressObj);
	  					    message="Personal Details Updated Successfully";	
	    				}else {
	    					
	    				}
				   }
				}
				if (othr_line1s != null) {
					for (int t = 1; t < othr_line1s.length; t++) {
						 String othr_line1=othr_line1s[t];
		    			 String othr_line2=othr_line2s[t];
		    			 String othr_city=othr_citys[t];
		    			 String othr_state=othr_states[t];
		    			 String othr_zipcode=othr_zipcodes[t];
		    			 String othr_fromDate=othr_fromDates[t];
		    			 String othr_toDate=othr_toDates[t];
		    			 CandidateBGCAddressEntity candOtherAddressObj = new CandidateBGCAddressEntity();
		    			 candOtherAddressObj.setPersonal_id(updatepersonalDetailObj.getPersonal_id());
		    			 candOtherAddressObj.setLine1(othr_line1);
		    			 candOtherAddressObj.setLine2(othr_line2);
		    			 candOtherAddressObj.setCity(othr_city);
		    			 candOtherAddressObj.setState(othr_state);
		    			 candOtherAddressObj.setZipcode(othr_zipcode);
		    			 candOtherAddressObj.setFrom_date(othr_fromDate);
		    			 candOtherAddressObj.setTo_date(othr_toDate);
		    			 candOtherAddressObj.setIsCurrentAddress(0);
		    			 candOtherAddressObj.setSubmitted_on(new Date());
		    			 bgcDao.saveCandidateBGCAddressDetails(candOtherAddressObj);
		    			 message="Personal Details Updated Successfully";	
					   }
				 }
				
				BGCCandidateFormsStatusEntity candformsStatusDBObj = bgcDao.getBGCFormsStatusByCandidateId(updatepersonalDetailObj.getCandidate_id());
				candformsStatusDBObj.setCandidate_personal_status("Submitted");
			    bgcDao.updateCandidateFormsStatusDetails(candformsStatusDBObj);	
			    
			    TemporaryCandidateDetails bgccandidateObj=bgcDao.getCandidateByCandidateId(candidate_Id);
    			String fromail=bgccandidateObj.getEmail_id(),tomail=env.getProperty("contractsmailid"),
    				   fromname=bgccandidateObj.getFull_name(),toname="Team", 
    				   body="",ccmail="";
    					String subject=" "+bgccandidateObj.getFull_name()+"  BGC: Personal Details Form  has been updated";
    					body="I have updated my Personal Details Form, please check.";
    					try {
    						sendmail.sendBGCStatusMail(fromail, tomail, fromname,toname, subject, body,ccmail);
    					}catch (Exception e) {
    						// TODO: handle exception
    					}
    			
				
			// sendmail.sendMail(frommail, toemail, toName, comments, subject);
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return message;
	}

	/*@Override
	public List<CandidateBgvEmploymentDto> viewCandidateBgvEmploymentDetailsById(String candidateId) {
		List<CandidateBgvEmploymentDto> employmentDetailsList=null;
		try {
			Integer candidate_id = 0;
			if (candidateId!="") {
				candidate_id = Integer.parseInt(candidateId);
			}
			employmentDetailsList = bgcDao.viewCandidateBgvEmploymentDetailsById(candidate_id);
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return employmentDetailsList;
	}*/

	@Override
	public String updateEmploymentDetails(String[] company_names, String[] reported_to_names, String[] hrmgrs,
			String[] positionhelds, String[] employmentTypes, String[] company_teles, String[] reported_to_positions,
			String[] fromDates, String[] toDates, String[] cpnames, String[] cpemails, String[] cpnumbers,
			String[] acpnames, String[] acpnumbers, String[] line1s, String[] line2s, String[] citys, String[] states,
			String[] zipcodes, String[] othr_company_names, String[] othr_reported_to_names,
			String[] othr_reported_to_positions, String[] othr_hrmgrs, String[] othr_positionhelds,
			String[] othr_employmentTypes, String[] othr_company_teles, String[] othr_cpnames, String[] othr_cpemails,
			String[] othr_cpnumbers, String[] othr_acpnames, String[] othr_acpnumbers, String[] othr_line1s,
			String[] othr_line2s, String[] othr_citys, String[] othr_states, String[] othr_zipcodes,
			String[] othr_fromDates, String[] othr_toDates, Integer loginempno,  String[] employment_ids, String[] contact_ids) {
		String message=null;
		try {
			System.out.println("In service");
			if(employment_ids!=null) {
				for (int i = 0; i < employment_ids.length; i++) {
					 Integer employment_id=Integer.parseInt(employment_ids[i]);
					 Integer contact_id=Integer.parseInt(contact_ids[i]);
					 String company_name=company_names[i];
	    			 String reported_to_name=reported_to_names[i];
	    			 String reported_to_position=reported_to_positions[i];
	    			 String hrmgr=hrmgrs[i];
	    			 String positionheld=positionhelds[i];
	    			 String employmentType=employmentTypes[i];
	    			 String company_phone=company_teles[i];
	    			 String fromDate=fromDates[i];
	    			 String toDate=toDates[i];
	    			 String cpname=cpnames[i];	
					 String cpemail=cpemails[i];
	    			 String cpnumber=cpnumbers[i];
	    			 String acpname=acpnames[i];
	    			 String acpnumber=acpnumbers[i];
	    			 
	    			 String line1=line1s[i];
	    			 String line2=line2s[i];
	    			 String city=citys[i];
	    			 String state=states[i];
	    			 String zipcode=zipcodes[i];
					 
	    			 CandidateBGCEmploymentEntity updateEmploymentDetailObj = bgcDao.getBGVCandidateEmploymentDetailsByEmploymentId(employment_id);
					 if(!updateEmploymentDetailObj.getCompany_name().equalsIgnoreCase(company_name) || !updateEmploymentDetailObj.getReported_to_name().equalsIgnoreCase(reported_to_name) || 
								!updateEmploymentDetailObj.getReported_to_position().equalsIgnoreCase(reported_to_position) || !updateEmploymentDetailObj.getHr_name().equalsIgnoreCase(hrmgr) ||
								!updateEmploymentDetailObj.getEmploymentType().equals(employmentType) || !updateEmploymentDetailObj.getCompany_phone().equals(company_phone) ||
								!updateEmploymentDetailObj.getContact_person_name().equals(cpname) || !updateEmploymentDetailObj.getContact_person_email().equals(cpemail) || 
								!updateEmploymentDetailObj.getContact_person_number().equals(cpnumber) || !updateEmploymentDetailObj.getAdditional_contact_person_name().equals(acpname) || 
								!updateEmploymentDetailObj.getAdditional_contact_person_pnumber().equals(acpnumber) || !updateEmploymentDetailObj.getPositionheld().equals(positionheld)) {
						 
						 	updateEmploymentDetailObj.setCompany_name(company_name);
							updateEmploymentDetailObj.setReported_to_name(reported_to_name);
							updateEmploymentDetailObj.setReported_to_position(reported_to_position);
							updateEmploymentDetailObj.setHr_name(hrmgr);
							updateEmploymentDetailObj.setPositionheld(positionheld);
							updateEmploymentDetailObj.setEmploymentType(employmentType);
							//updateEmploymentDetailObj.setEmploment_fromDate(fromDate);
							//updateEmploymentDetailObj.setEmploment_toDate(toDate);
							updateEmploymentDetailObj.setCompany_phone(company_phone);
							updateEmploymentDetailObj.setContact_person_name(cpname);
							updateEmploymentDetailObj.setContact_person_email(cpemail);
							updateEmploymentDetailObj.setContact_person_number(cpnumber);
							updateEmploymentDetailObj.setAdditional_contact_person_name(acpname);
							updateEmploymentDetailObj.setAdditional_contact_person_pnumber(acpnumber);
							bgcDao.updateCandidateBGvEmploymentDetails(updateEmploymentDetailObj);
	  					    message="Employment Details Updated Successfully";
					    }
						 CandidateBGCAddressEntity updateCandAddressObj =bgcDao.getBGVCandidateAdressDetailsById(contact_id);
						 if((line2=="" || line2!="") && updateCandAddressObj.getLine2()!=null) {	
						 if(!updateCandAddressObj.getLine1().equalsIgnoreCase(line1) || !updateCandAddressObj.getLine2().equalsIgnoreCase(line2) || !updateCandAddressObj.getCity().equalsIgnoreCase(city) || !updateCandAddressObj.getState().equalsIgnoreCase(state) || !updateCandAddressObj.getZipcode().equals(zipcode) || !updateCandAddressObj.getFrom_date().equals(fromDate) || !updateCandAddressObj.getTo_date().equals(toDate)) {
		    					updateCandAddressObj.setLine1(line1);
		  						updateCandAddressObj.setLine2(line2);
		  						updateCandAddressObj.setCity(city);
		  						updateCandAddressObj.setState(state);
		  						updateCandAddressObj.setZipcode(zipcode);
		  						updateCandAddressObj.setFrom_date(fromDate);
		  						updateCandAddressObj.setTo_date(toDate);
		  						bgcDao.updateCandidateBGCAddressDetails(updateCandAddressObj);
		  					    message="Employment Details Updated Successfully";	
		    				}else {
		    					
		    				}	
						 }else  if((line2=="" || line2!="") && updateCandAddressObj.getLine2()==null) {	
							 if(!updateCandAddressObj.getLine1().equalsIgnoreCase(line1) || !updateCandAddressObj.getCity().equalsIgnoreCase(city) || !updateCandAddressObj.getState().equalsIgnoreCase(state) || !updateCandAddressObj.getZipcode().equals(zipcode) || !updateCandAddressObj.getFrom_date().equals(fromDate) || !updateCandAddressObj.getTo_date().equals(toDate)) {
								    if(line2!="") {
								    	updateCandAddressObj.setLine2(line2);
								    }
								 	updateCandAddressObj.setLine1(line1);
			  						updateCandAddressObj.setLine2(line2);
			  						updateCandAddressObj.setCity(city);
			  						updateCandAddressObj.setState(state);
			  						updateCandAddressObj.setZipcode(zipcode);
			  						updateCandAddressObj.setFrom_date(fromDate);
			  						updateCandAddressObj.setTo_date(toDate);
			  						bgcDao.updateCandidateBGCAddressDetails(updateCandAddressObj);
			  					    message="Employment Details Updated Successfully";	
			    				}else {
			    					
			    				}
							 
						 }
				}
			}
			
			if (othr_company_names != null) {
				for (int t = 1; t < othr_company_names.length; t++) {
					
					 String othr_company_name=othr_company_names[t];
	    			 String othr_reported_to_name=othr_reported_to_names[t];
	    			 String othr_reported_to_position=othr_reported_to_positions[t];
	    			 String othr_hrmgr=othr_hrmgrs[t];
	    			 String othr_positionheld=othr_positionhelds[t];
	    			 String othr_employmentType=othr_employmentTypes[t];
	    			 String othr_company_phone=othr_company_teles[t];
	    			 String othr_fromDate=othr_fromDates[t];
	    			 String othr_toDate=othr_toDates[t];
	    			 
	    			 String othr_cpname=othr_cpnames[t];	
					 String othr_cpemail=othr_cpemails[t];
	    			 String othr_cpnumber=othr_cpnumbers[t];
	    			 String othr_acpname=othr_acpnames[t];
	    			 String othr_acpnumber=othr_acpnumbers[t];	    			
	    			 
	    			 CandidateBGCEmploymentEntity otheremploymentDetailObj = new CandidateBGCEmploymentEntity();
	    			 	otheremploymentDetailObj.setCompany_name(othr_company_name);
	    			 	otheremploymentDetailObj.setReported_to_name(othr_reported_to_name);
	    			 	otheremploymentDetailObj.setReported_to_position(othr_reported_to_position);
	    			 	otheremploymentDetailObj.setHr_name(othr_hrmgr);
	    			 	otheremploymentDetailObj.setPositionheld(othr_positionheld);
	    			 	otheremploymentDetailObj.setEmploymentType(othr_employmentType);
	    			 	//otheremploymentDetailObj.setEmploment_fromDate(othr_fromDate);
	    			 //	otheremploymentDetailObj.setEmploment_toDate(othr_toDate);
	    			 	otheremploymentDetailObj.setCompany_phone(othr_company_phone);
	    			 	otheremploymentDetailObj.setContact_person_name(othr_cpname);
	    			 	otheremploymentDetailObj.setContact_person_email(othr_cpemail);
	    			 	otheremploymentDetailObj.setContact_person_number(othr_cpnumber);
	    			 	otheremploymentDetailObj.setAdditional_contact_person_name(othr_acpname);
	    			 	otheremploymentDetailObj.setAdditional_contact_person_pnumber(othr_acpnumber);
	    			 	otheremploymentDetailObj.setSubmitted_on(new Date());	
	    			 	otheremploymentDetailObj.setCandidate_status("Submitted");
	    			 	otheremploymentDetailObj.setCandidate_id(loginempno);
	    			 	Integer otheremploymentId = bgcDao.saveEmploymentDetails(otheremploymentDetailObj);
					
					 String othr_line1=othr_line1s[t];
	    			 String othr_line2=othr_line2s[t];
	    			 String othr_city=othr_citys[t];
	    			 String othr_state=othr_states[t];
	    			 String othr_zipcode=othr_zipcodes[t];
	    			 
	    			 CandidateBGCAddressEntity candOtherAddressObj = new CandidateBGCAddressEntity();
	    			 candOtherAddressObj.setEmployment_id(otheremploymentId);
	    			 candOtherAddressObj.setLine1(othr_line1);
	    			 candOtherAddressObj.setLine2(othr_line2);
	    			 candOtherAddressObj.setCity(othr_city);
	    			 candOtherAddressObj.setState(othr_state);
	    			 candOtherAddressObj.setZipcode(othr_zipcode);
	    			 candOtherAddressObj.setFrom_date(othr_fromDate);
	    			 candOtherAddressObj.setTo_date(othr_toDate);
	    			 candOtherAddressObj.setIsCurrentAddress(0);
	    			 candOtherAddressObj.setSubmitted_on(new Date());
	    			 bgcDao.saveCandidateBGCAddressDetails(candOtherAddressObj);
				   }
			 }

				
			// sendmail.sendMail(frommail, toemail, toName, comments, subject);
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return message;
	}

	@Override
	public String saveBgvEmploymentDetails(String company_name, String reported_to_name, String hrmgr,
			String positionheld, String employmentType, String company_phone, String cpname, String cpemail, 
			String cpnumber, String acpname, String acpnumber, String line1, String line2, String city, String state,
			String zipcode, String reported_to_position, Integer loginempno,
			String startedYear, String startedMonth, String workedTillYear, String workedTillMonth) {

		String message=null;
		try {
			System.out.println("In service");
			CandidateBGCEmploymentEntity employmentDetailObj = new CandidateBGCEmploymentEntity();
			employmentDetailObj.setCompany_name(company_name);
			employmentDetailObj.setReported_to_name(reported_to_name);
			employmentDetailObj.setReported_to_position(reported_to_position);
			employmentDetailObj.setHr_name(hrmgr);
			employmentDetailObj.setPositionheld(positionheld);
			employmentDetailObj.setEmploymentType(employmentType);
			//employmentDetailObj.setEmploment_fromDate(fromDate);
		//	employmentDetailObj.setEmploment_toDate(toDate);
			employmentDetailObj.setStartedYear(startedYear);
			employmentDetailObj.setStartedMonth(startedMonth);
			employmentDetailObj.setWorkedTillYear(workedTillYear);
			employmentDetailObj.setWorkedTillMonth(workedTillMonth);
			employmentDetailObj.setCompany_phone(company_phone);
			employmentDetailObj.setContact_person_name(cpname);
			employmentDetailObj.setContact_person_email(cpemail);
			employmentDetailObj.setContact_person_number(cpnumber);
			employmentDetailObj.setAdditional_contact_person_name(acpname);
			employmentDetailObj.setAdditional_contact_person_pnumber(acpnumber);
			employmentDetailObj.setSubmitted_on(new Date());	
			employmentDetailObj.setCandidate_status("Submitted");
			employmentDetailObj.setCandidate_id(loginempno);
			Integer employmentId = bgcDao.saveEmploymentDetails(employmentDetailObj);
			if(employmentId>0) {
				message="Employment Details Saved Successfully";
				CandidateBGCAddressEntity candAddressObj = new CandidateBGCAddressEntity();
					candAddressObj.setEmployment_id(employmentId);
					candAddressObj.setLine1(line1);
					candAddressObj.setLine2(line2);
					candAddressObj.setCity(city);
					candAddressObj.setState(state);
					candAddressObj.setZipcode(zipcode);
					candAddressObj.setSubmitted_on(new Date());
					bgcDao.saveCandidateBGCAddressDetails(candAddressObj);
			}
			
			BGCCandidateFormsStatusEntity candformsStatusDBObj = bgcDao.getBGCFormsStatusByCandidateId(loginempno);
			if(candformsStatusDBObj!=null) {
				candformsStatusDBObj.setCandidate_employment_status("Submitted");
				bgcDao.updateCandidateFormsStatusDetails(candformsStatusDBObj);
			}else {
				BGCCandidateFormsStatusEntity candformsStatusObj = new BGCCandidateFormsStatusEntity();
				candformsStatusObj.setCandidate_id(loginempno);
				candformsStatusObj.setCandidate_employment_status("Submitted");
				bgcDao.saveCandidateFormsStatusDetails(candformsStatusObj);
			}
			
			TemporaryCandidateDetails bgccandidateObj=bgcDao.getCandidateByCandidateId(loginempno);
  			String fromail=bgccandidateObj.getEmail_id(),tomail=env.getProperty("contractsmailid"),
  				   fromname=bgccandidateObj.getFull_name(),toname="Team", 
  				   body="",ccmail="";
  					String subject=" "+bgccandidateObj.getFull_name()+"  BGC: Employment Details Form  has been submitted";
  					body="I have submitted my Employment Details Form, please check.";
  					try {
  						sendmail.sendBGCStatusMail(fromail, tomail, fromname,toname, subject, body,ccmail);
  					}catch (Exception e) {
  						// TODO: handle exception
  					}
  					
			// sendmail.sendMail(frommail, toemail, toName, comments, subject);
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return message;
	
	}

	@Override
	public String updateBgvEmploymentDetails(String company_name, String reported_to_name, String hrmgr,
			String positionheld, String employmentType, String company_phone, String cpname, String cpemail,
			String cpnumber, String acpname, String acpnumber, String line1, String line2, String city, String state,
			String zipcode, String reported_to_position, String startedYear, String startedMonth,
			String workedTillYear, String workedTillMonth, Integer loginempno, String employment_id,
			String contact_id) {
		String message=null;
		try {
					 //  System.out.println("In service"+employment_id+"*********"+contact_id);
					   Integer employmentId = 0;
						if (employment_id!="") {
							employmentId = Integer.parseInt(employment_id);
						}
						Integer contactId = 0;
						if (contact_id!="") {
							contactId = Integer.parseInt(contact_id);
						}
	    			 CandidateBGCEmploymentEntity updateEmploymentDetailObj = bgcDao.getBGVCandidateEmploymentDetailsByEmploymentId(employmentId);
		    			if(!updateEmploymentDetailObj.getCompany_name().equalsIgnoreCase(company_name) || !updateEmploymentDetailObj.getReported_to_name().equalsIgnoreCase(reported_to_name) || 
								!updateEmploymentDetailObj.getReported_to_position().equalsIgnoreCase(reported_to_position) || !updateEmploymentDetailObj.getHr_name().equalsIgnoreCase(hrmgr) ||
								!updateEmploymentDetailObj.getEmploymentType().equals(employmentType) || !updateEmploymentDetailObj.getCompany_phone().equals(company_phone) ||
								!updateEmploymentDetailObj.getContact_person_name().equals(cpname) || !updateEmploymentDetailObj.getContact_person_email().equals(cpemail) || 
								!updateEmploymentDetailObj.getContact_person_number().equals(cpnumber)  || !updateEmploymentDetailObj.getPositionheld().equals(positionheld) ||
								!updateEmploymentDetailObj.getStartedYear().equals(startedYear) || !updateEmploymentDetailObj.getStartedMonth().equals(startedMonth) || 
								!updateEmploymentDetailObj.getWorkedTillYear().equals(workedTillYear) || !updateEmploymentDetailObj.getWorkedTillMonth().equals(workedTillMonth)) {
						 
						 	updateEmploymentDetailObj.setCompany_name(company_name);
							updateEmploymentDetailObj.setReported_to_name(reported_to_name);
							updateEmploymentDetailObj.setReported_to_position(reported_to_position);
							updateEmploymentDetailObj.setHr_name(hrmgr);
							updateEmploymentDetailObj.setPositionheld(positionheld);
							updateEmploymentDetailObj.setEmploymentType(employmentType);
							updateEmploymentDetailObj.setCompany_phone(company_phone);
							updateEmploymentDetailObj.setContact_person_name(cpname);
							updateEmploymentDetailObj.setContact_person_email(cpemail);
							updateEmploymentDetailObj.setContact_person_number(cpnumber);
							updateEmploymentDetailObj.setStartedYear(startedYear);
							updateEmploymentDetailObj.setStartedMonth(startedMonth);
							updateEmploymentDetailObj.setWorkedTillYear(workedTillYear);
							updateEmploymentDetailObj.setWorkedTillMonth(workedTillMonth);
							updateEmploymentDetailObj.setAdditional_contact_person_name(acpname);
							updateEmploymentDetailObj.setAdditional_contact_person_pnumber(acpnumber);
							bgcDao.updateCandidateBGvEmploymentDetails(updateEmploymentDetailObj);
	  					    message="Employment Details Updated Successfully";
					    }else {
					    	  System.out.println("In 1st else "+acpname+"*********"+acpnumber);
					   	 if((acpname=="" || acpname!="") || (acpnumber=="" || acpnumber!="")) {
		    				 if(updateEmploymentDetailObj.getAdditional_contact_person_name()!=null) {
		    					 if(!updateEmploymentDetailObj.getAdditional_contact_person_name().equalsIgnoreCase(acpname)){
		    						 updateEmploymentDetailObj.setAdditional_contact_person_name(acpname);
		    					 }
		    				 }else {
		    					 updateEmploymentDetailObj.setAdditional_contact_person_name(acpname);
		    				 }
		    				 if(updateEmploymentDetailObj.getAdditional_contact_person_pnumber()!=null) {
		    					 	if(!updateEmploymentDetailObj.getAdditional_contact_person_pnumber().equalsIgnoreCase(acpnumber)){
		    					 		updateEmploymentDetailObj.setAdditional_contact_person_pnumber(acpnumber); 
		    					   }
		    				 }else {
		    					 updateEmploymentDetailObj.setAdditional_contact_person_pnumber(acpnumber); 
		    				 }
		    				 bgcDao.updateCandidateBGvEmploymentDetails(updateEmploymentDetailObj);
		  					 message="Employment Details Updated Successfully";
			    		   }
					    }
		    	
	    			/* if(!updateEmploymentDetailObj.getCompany_name().equalsIgnoreCase(company_name) || !updateEmploymentDetailObj.getReported_to_name().equalsIgnoreCase(reported_to_name) || 
								!updateEmploymentDetailObj.getReported_to_position().equalsIgnoreCase(reported_to_position) || !updateEmploymentDetailObj.getHr_name().equalsIgnoreCase(hrmgr) ||
								!updateEmploymentDetailObj.getEmploymentType().equals(employmentType) || !updateEmploymentDetailObj.getCompany_phone().equals(company_phone) ||
								!updateEmploymentDetailObj.getContact_person_name().equals(cpname) || !updateEmploymentDetailObj.getContact_person_email().equals(cpemail) || 
								!updateEmploymentDetailObj.getContact_person_number().equals(cpnumber)  || !updateEmploymentDetailObj.getPositionheld().equals(positionheld) ||
								!updateEmploymentDetailObj.getStartedYear().equals(startedYear) || !updateEmploymentDetailObj.getStartedMonth().equals(startedMonth) || 
								!updateEmploymentDetailObj.getWorkedTillYear().equals(workedTillYear) || !updateEmploymentDetailObj.getWorkedTillMonth().equals(workedTillMonth)) {
						 
						 	updateEmploymentDetailObj.setCompany_name(company_name);
							updateEmploymentDetailObj.setReported_to_name(reported_to_name);
							updateEmploymentDetailObj.setReported_to_position(reported_to_position);
							updateEmploymentDetailObj.setHr_name(hrmgr);
							updateEmploymentDetailObj.setPositionheld(positionheld);
							updateEmploymentDetailObj.setEmploymentType(employmentType);
							updateEmploymentDetailObj.setCompany_phone(company_phone);
							updateEmploymentDetailObj.setContact_person_name(cpname);
							updateEmploymentDetailObj.setContact_person_email(cpemail);
							updateEmploymentDetailObj.setContact_person_number(cpnumber);
							updateEmploymentDetailObj.setAdditional_contact_person_name(acpname);
							updateEmploymentDetailObj.setAdditional_contact_person_pnumber(acpnumber);
							updateEmploymentDetailObj.setStartedYear(startedYear);
							updateEmploymentDetailObj.setStartedMonth(startedMonth);
							updateEmploymentDetailObj.setWorkedTillYear(workedTillYear);
							updateEmploymentDetailObj.setWorkedTillMonth(workedTillMonth);
							bgcDao.updateCandidateBGvEmploymentDetails(updateEmploymentDetailObj);
	  					    message="Employment Details Updated Successfully";
					    }*/
	    			 
						 CandidateBGCAddressEntity updateCandAddressObj =bgcDao.getBGVCandidateAdressDetailsById(contactId);
						 if(!updateCandAddressObj.getLine1().equalsIgnoreCase(line1) || !updateCandAddressObj.getCity().equalsIgnoreCase(city) || !updateCandAddressObj.getState().equalsIgnoreCase(state) || !updateCandAddressObj.getZipcode().equals(zipcode)) {
		    					updateCandAddressObj.setLine1(line1);
		  						updateCandAddressObj.setLine2(line2);
		  						updateCandAddressObj.setCity(city);
		  						updateCandAddressObj.setState(state);
		  						updateCandAddressObj.setZipcode(zipcode);
		  						bgcDao.updateCandidateBGCAddressDetails(updateCandAddressObj);
		  					    message="Employment Details Updated Successfully";	
		    				}else {
		    					if(line2=="" || line2!="") {
		    						if(updateCandAddressObj.getLine2()!=null) {
				    					 if(!updateCandAddressObj.getLine2().equalsIgnoreCase(line2)){
				    						 updateCandAddressObj.setLine2(line2);
				    					 }
				    				 }else {
				    					 updateCandAddressObj.setLine2(line2);
				    				 }
		    						bgcDao.updateCandidateBGCAddressDetails(updateCandAddressObj);
			  					    message="Employment Details Updated Successfully";	
		    					}
		    				}	
						 BGCCandidateFormsStatusEntity candformsStatusDBObj = bgcDao.getBGCFormsStatusByCandidateId(updateEmploymentDetailObj.getCandidate_id());
	  					 candformsStatusDBObj.setCandidate_employment_status("Submitted");
	  					 bgcDao.updateCandidateFormsStatusDetails(candformsStatusDBObj);			
	  					 
	  					TemporaryCandidateDetails bgccandidateObj=bgcDao.getCandidateByCandidateId(updateEmploymentDetailObj.getCandidate_id());
	  	    			String fromail=bgccandidateObj.getEmail_id(),tomail=env.getProperty("contractsmailid"),
	  	    				   fromname=bgccandidateObj.getFull_name(),toname="Team", 
	  	    				   body="",ccmail="";
	  	    					String subject=" "+bgccandidateObj.getFull_name()+"  BGC: Employment Details Form  has been updated";
	  	    					body="I have updated my Employment Details Form, please check.";
	  	    					try {
	  	    						sendmail.sendBGCStatusMail(fromail, tomail, fromname,toname, subject, body,ccmail);
	  	    					}catch (Exception e) {
	  	    						// TODO: handle exception
	  	    					}
	  	    			
						 
			// sendmail.sendMail(frommail, toemail, toName, comments, subject);
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return message;
	}

	@Override
	public List<CandidateBgvEducationDto> viewCandidateBgvEducationDetailsById(String candidateId) {
		List<CandidateBgvEducationDto> educationtDetailsList=null;
		try {
			Integer candidate_id = 0;
			if (candidateId!="") {
				candidate_id = Integer.parseInt(candidateId);
			}
			educationtDetailsList = bgcDao.viewCandidateBgvEducationDetailsById(candidate_id);
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return educationtDetailsList;
	}
	
	@Override
	public String updatecanstatus(String bgcChkId, String bgcChkStatus, String comment, Integer lgempno,
			String bgcCandidateId,Integer logincandidateid) {
		String message = null;
		try {
			Integer bgcChk_Id = 0;
			if (bgcChkId != "") {
				bgcChk_Id = Integer.parseInt(bgcChkId);
			}
			
			Integer Candidate_Id = 0;
			if (bgcCandidateId!= "") {
				Candidate_Id = Integer.parseInt(bgcCandidateId);
			}
			
			CandidateBGCCheckList candidateBgcObj = bgcDao.getBGCCheckListById(bgcChk_Id);
			if(candidateBgcObj!=null) {
				candidateBgcObj.setStatus(bgcChkStatus);
				bgcDao.updateCommentDetails(candidateBgcObj);
				
				SubCategoryEntity sucatName=bgcDao.getSubCategoryBysubCategoryId(candidateBgcObj.getSubcategory_id());
				TemporaryCandidateDetails bgccandidateObj=bgcDao.getCandidateByCandidateId(Candidate_Id);
				
				BasicDetailsDto loginObj=empDao.viewEmployeeNotWithAddress(logincandidateid);
				String fromail=env.getProperty("contractsmailid"),tomail=bgccandidateObj.getEmail_id(),
					   fromname=loginObj.getFullname(),toname=bgccandidateObj.getFull_name(), 
					   body="",ccmail=env.getProperty("contractsmailid");
						
						String subject="BGC: Document "+sucatName.getSubcategory_name()+" status has been "+bgcChkStatus+" ";
						if(bgcChkStatus.equalsIgnoreCase("Rejected")) {
							 body="Your document "+sucatName.getSubcategory_name()+" status has been "+bgcChkStatus+", please reupload.";
						}else {
							 body="Your document "+sucatName.getSubcategory_name()+" status has been "+bgcChkStatus+".";
						}
						sendmail.sendBGCStatusMail(fromail, tomail, fromname,toname, subject, body,ccmail);
				
			}
			BGCCheckListCommentsHistory commentHistory = new BGCCheckListCommentsHistory();
			commentHistory.setBgc_checklist_id(candidateBgcObj.getBgc_checklist_id());
			commentHistory.setComments(comment);
			commentHistory.setStatus(bgcChkStatus);
			commentHistory.setPosted_by(lgempno);
			commentHistory.setSubmitted_date(new Date());
			bgcDao.saveCommentHistory(commentHistory);
			
			message = "Details saved Successfully";

		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return message;
	}
	
	@Override
	public CandidateBGCPersonalDetailsDto viewCandidateBGCPersonalDetailsById(String candidateId) {
		CandidateBGCPersonalDetailsDto personalDetailsObj=null;
		try {
			Integer candidate_id = 0;
			if (candidateId!="") {
				candidate_id = Integer.parseInt(candidateId);
			}
			personalDetailsObj = bgcDao.viewCandidateBGCPersonalDetailsById(candidate_id);
			List<CandidateBGCAddressDetailsDto> adressListp = bgcDao.getCandidateBGCAddressDetailsById(personalDetailsObj.getPersonal_id());
			BGCCandidateFormsStatusEntity candformsStatusDBObj = bgcDao.getBGCFormsStatusByCandidateId(candidate_id);
			if(candformsStatusDBObj!=null) {
				personalDetailsObj.setCandformsStatus(candformsStatusDBObj);
			}
			
			personalDetailsObj.setAddressList(adressListp);
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return personalDetailsObj;
	}

	@Override
	public String updatepersonalstatus(String bgcChkStatus, String comment, Integer lgempno, String candidate_id,Integer logincandidateid) {
		String message = null;
		try {
			
			Integer candidateid = 0;
			if (candidate_id!= "") {
				candidateid = Integer.parseInt(candidate_id);
			}
			
			BGCCandidateFormsStatusEntity candformsStatusDBObj = bgcDao.getBGCFormsStatusByCandidateId(candidateid);
			if(candformsStatusDBObj!=null) {
				candformsStatusDBObj.setVerifier_personal_status(bgcChkStatus);
				if(bgcChkStatus.equalsIgnoreCase("Rejected")) {
					candformsStatusDBObj.setCandidate_personal_status(null);
				}else {
					candformsStatusDBObj.setCandidate_personal_status(candformsStatusDBObj.getCandidate_personal_status());
				}
				candformsStatusDBObj.setPersonal_verified_by(lgempno);
				candformsStatusDBObj.setVerifier_personal_submitted_on(new Date());
				bgcDao.updateCandidateFormsStatusDetails(candformsStatusDBObj);
			}
			
		/*	CandidateBGCPersonalEntity  personalObj=bgcDao.getBGVCandidatePersonalDetailsById(candidateid);
			if(personalObj!=null) {
				personalObj.setApproved_status(bgcChkStatus);
				if(bgcChkStatus.equalsIgnoreCase("Rejected")) {
					personalObj.setCandidate_status(null);
				}else {
					personalObj.setCandidate_status(personalObj.getCandidate_status());
				}
				personalObj.setApproved_by(lgempno);
				personalObj.setApproved_on(new Date());
				bgcDao.updatePersonalDetails(personalObj);
			}*/
				FormsCommentsHistory commentHistory = new FormsCommentsHistory();
				if(bgcChkStatus!="") {
					commentHistory.setApproved_by(lgempno);
					commentHistory.setCandidate_id(candidateid);
				}else {
					commentHistory.setCandidate_id(candidateid);
				}
				commentHistory.setComments(comment);
				commentHistory.setStatus(bgcChkStatus);
				commentHistory.setSubmitted_date(new Date());
				commentHistory.setForm_type("Personal");
				bgcDao.saveFormsHistory(commentHistory);
				message = "Details saved Successfully";
				
				TemporaryCandidateDetails bgccandidateObj=bgcDao.getCandidateByCandidateId(candidateid);
			//	BasicDetailsDto loginObj=empDao.viewEmployeeInfo(logincandidateid);
				BasicDetailsDto loginObj=empDao.viewEmployeeNotWithAddress(logincandidateid);
				String fromail=env.getProperty("contractsmailid"),tomail=bgccandidateObj.getEmail_id(),
					   fromname=loginObj.getFullname(),toname=bgccandidateObj.getFull_name(), 
					   body="",ccmail=env.getProperty("contractsmailid");
						
						String subject="BGC: Personal Details Form status has been "+bgcChkStatus+" ";
						if(bgcChkStatus.equalsIgnoreCase("Rejected")) {
							 body="Your Personal Details Form status has been "+bgcChkStatus+", please submit again.";
						}else {
							 body="Your Personal Details Form status has been "+bgcChkStatus+".";
						}
						sendmail.sendBGCStatusMail(fromail, tomail, fromname,toname, subject, body,ccmail);

			

		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return message;
	}

	@Override
	public List<commentHistoryDto> viewpersonalhistory(String candidateId,String formtype) {
		List<commentHistoryDto> commentHistoryList = null;
		try {
			Integer candidate_id = 0;
			if (candidateId != "") {
				candidate_id = Integer.parseInt(candidateId);
			}
			commentHistoryList = bgcDao.viewpersonalhistory(candidate_id,formtype);
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return commentHistoryList;
	}

	@Override
	public String updateeducationstatus(String bgcChkStatus, String comment, Integer lgempno, String candidate_id,Integer logincandidateid) {
		String message = null;
		try {
			
			Integer candidateid = 0;
			if (candidate_id!= "") {
				candidateid = Integer.parseInt(candidate_id);
			}
			
			Integer educationId=bgcDao.getEducationLastrowIdByCandidateId(candidateid);
			
			
			BGCCandidateFormsStatusEntity candformsStatusDBObj = bgcDao.getBGCFormsStatusByCandidateId(candidateid);
			if(candformsStatusDBObj!=null) {
				candformsStatusDBObj.setVerifier_education_status(bgcChkStatus);
				if(bgcChkStatus.equalsIgnoreCase("Rejected")) {
					candformsStatusDBObj.setCandidate_education_status(null);
				}else {
					candformsStatusDBObj.setCandidate_education_status(candformsStatusDBObj.getCandidate_education_status());
				}
				candformsStatusDBObj.setEducation_verified_by(lgempno);
				candformsStatusDBObj.setVerifier_education_submitted_on(new Date());
				bgcDao.updateCandidateFormsStatusDetails(candformsStatusDBObj);
			}
			
			/*CandidateBGCEducationEntity  educationObj=bgcDao.getBGVCandidateEducationDetailsByEducationId(educationId);
			
			if(educationObj!=null) {
				educationObj.setApproved_status(bgcChkStatus);
				if(bgcChkStatus.equalsIgnoreCase("Rejected")) {
					educationObj.setCandidate_status(null);
				}else {
					educationObj.setCandidate_status(educationObj.getCandidate_status());
				//}
				educationObj.setApproved_by(lgempno);
				educationObj.setApproved_on(new Date());
				bgcDao.updateEducationDetails(educationObj);
			}*/
				FormsCommentsHistory commentHistory = new FormsCommentsHistory();
				if(bgcChkStatus!="") {
					commentHistory.setApproved_by(lgempno);
					commentHistory.setCandidate_id(candidateid);
				}else {
					commentHistory.setCandidate_id(candidateid);
				}
				commentHistory.setComments(comment);
				commentHistory.setStatus(bgcChkStatus);
				commentHistory.setSubmitted_date(new Date());
				commentHistory.setForm_type("Education");
				bgcDao.saveFormsHistory(commentHistory);
				
				message = "Details saved Successfully";
				TemporaryCandidateDetails bgccandidateObj=bgcDao.getCandidateByCandidateId(candidateid);
			//	BasicDetailsDto loginObj=empDao.viewEmployeeInfo(logincandidateid);
				BasicDetailsDto loginObj=empDao.viewEmployeeNotWithAddress(logincandidateid);
				String fromail=env.getProperty("contractsmailid"),tomail=bgccandidateObj.getEmail_id(),
					   fromname=loginObj.getFullname(),toname=bgccandidateObj.getFull_name(), 
					   body="",ccmail=env.getProperty("contractsmailid");
						
						String subject="BGC: Education Details Form status has been "+bgcChkStatus+" ";
						if(bgcChkStatus.equalsIgnoreCase("Rejected")) {
							 body="Your Education Details Form status has been "+bgcChkStatus+", please submit again.";
						}else {
							 body="Your Education Details Form status has been "+bgcChkStatus+".";
						}
						sendmail.sendBGCStatusMail(fromail, tomail, fromname,toname, subject, body,ccmail);
			

		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return message;
	}

	@Override
	public String updateemploymentstatus(String bgcChkStatus, String comment, Integer lgempno, String candidate_id, Integer logincandidateid) {
		String message = null;
		try {
			
			Integer candidateid = 0;
			if (candidate_id!= "") {
				candidateid = Integer.parseInt(candidate_id);
			}
			Integer employmentId=bgcDao.getEmploymentLastrowIdByCandidateId(candidateid);
			
			BGCCandidateFormsStatusEntity candformsStatusDBObj = bgcDao.getBGCFormsStatusByCandidateId(candidateid);
			if(candformsStatusDBObj!=null) {
				candformsStatusDBObj.setVerifier_employment_status(bgcChkStatus);
				if(bgcChkStatus.equalsIgnoreCase("Rejected")) {
					candformsStatusDBObj.setCandidate_employment_status(null);
				}else {
					candformsStatusDBObj.setCandidate_employment_status(candformsStatusDBObj.getCandidate_employment_status());
				}
				candformsStatusDBObj.setEmployment_verified_by(lgempno);
				candformsStatusDBObj.setVerifier_employment_submitted_on(new Date());
				bgcDao.updateCandidateFormsStatusDetails(candformsStatusDBObj);
			}
			
		/*	CandidateBGCEmploymentEntity  employmentObj=bgcDao.getBGVCandidateEmploymentDetailsByEmploymentId(employmentId);
			if(employmentObj!=null) {
				employmentObj.setApproved_status(bgcChkStatus);
				if(bgcChkStatus.equalsIgnoreCase("Rejected")) {
					employmentObj.setCandidate_status(null);
				}else {
					employmentObj.setCandidate_status(employmentObj.getCandidate_status());
				}
				employmentObj.setApproved_by(lgempno);
				employmentObj.setApproved_on(new Date());
				bgcDao.updateEmploymentDetails(employmentObj);
			}*/
				FormsCommentsHistory commentHistory = new FormsCommentsHistory();
				if(bgcChkStatus!="") {
					commentHistory.setApproved_by(lgempno);
					commentHistory.setCandidate_id(candidateid);
				}else {
					commentHistory.setCandidate_id(candidateid);
				}
				commentHistory.setComments(comment);
				commentHistory.setStatus(bgcChkStatus);
				commentHistory.setSubmitted_date(new Date());
				commentHistory.setForm_type("Employment");
				bgcDao.saveFormsHistory(commentHistory);
				
				message = "Details saved Successfully";
				
				TemporaryCandidateDetails bgccandidateObj=bgcDao.getCandidateByCandidateId(candidateid);
			//	BasicDetailsDto loginObj=empDao.viewEmployeeInfo(logincandidateid);
				BasicDetailsDto loginObj=empDao.viewEmployeeNotWithAddress(logincandidateid);
				String fromail=env.getProperty("contractsmailid"),tomail=bgccandidateObj.getEmail_id(),
					   fromname=loginObj.getFullname(),toname=bgccandidateObj.getFull_name(), 
					   body="",ccmail=env.getProperty("contractsmailid");
						
						String subject="BGC: Employment Details Form status has been "+bgcChkStatus+" ";
						if(bgcChkStatus.equalsIgnoreCase("Rejected")) {
							 body="Your Employment Details Form status has been "+bgcChkStatus+", please submit again.";
						}else {
							 body="Your Employment Details Form status has been "+bgcChkStatus+".";
						}
						sendmail.sendBGCStatusMail(fromail, tomail, fromname,toname, subject, body,ccmail);

		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return message;
	}

	@Override
	public List<CandidateBgvEmploymentDto> viewCandidateBgvEmploymentDetailsById(String candidateId) {
		List<CandidateBgvEmploymentDto> employmentDetailsList=null;
		try {
			Integer candidate_id = 0;
			if (candidateId!="") {
				candidate_id = Integer.parseInt(candidateId);
			}
			employmentDetailsList = bgcDao.viewCandidateBgvEmploymentDetailsById(candidate_id);
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return employmentDetailsList;
	}

	@Override
	public String getEmploymentLastrowStatus(String candidateId) {
		String top1status=null;
		try {
			Integer candidate_id = 0;
			if (candidateId!="") {
				candidate_id = Integer.parseInt(candidateId);
			}
			top1status = bgcDao.getEmploymentLastrowStatus(candidate_id);
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return top1status;
	}

	@Override
	public String updateBgvEducationDetails(String collegeNameAddr, String universityNameAddr, String graduatedYear,
			String enrollNo, String typeofeducation, String gradDate, String subMajor, String qualification,
			String fromDate, String toDate, String courseType, Integer loginempno, String educationId) {
		String message=null;
		try {
					 System.out.println("In serviceImpl updateBgvEducationDetails"+educationId);
					   Integer education_Id = 0;
						if (educationId!="") {
							education_Id = Integer.parseInt(educationId);
						}
	    			 CandidateBGCEducationEntity updateEducationDetailObj = bgcDao.getBGVCandidateEducationDetailsByEducationId(education_Id);
		    			if(!updateEducationDetailObj.getCollege_name().equalsIgnoreCase(collegeNameAddr) || !updateEducationDetailObj.getUniversity_name().equalsIgnoreCase(universityNameAddr) || 
								!updateEducationDetailObj.getGraduation().equalsIgnoreCase(graduatedYear) || !updateEducationDetailObj.getStudent_id().equals(enrollNo) || 
								!updateEducationDetailObj.getType_of_degree().equals(typeofeducation) || !updateEducationDetailObj.getCourse_Type().equals(courseType) || 
								!updateEducationDetailObj.getMajor_subject().equals(subMajor) || !updateEducationDetailObj.getQualification().equals(qualification)  ||
								!updateEducationDetailObj.getEducation_fromDate().equals(fromDate) || !updateEducationDetailObj.getEducation_toDate().equals(toDate)) {
		    				updateEducationDetailObj.setCollege_name(collegeNameAddr);
		    				updateEducationDetailObj.setUniversity_name(universityNameAddr);
		    				updateEducationDetailObj.setGraduation(graduatedYear);
		    				updateEducationDetailObj.setStudent_id(enrollNo);
		    				updateEducationDetailObj.setType_of_degree(typeofeducation);
		    				updateEducationDetailObj.setGraduation(graduatedYear);
		    				updateEducationDetailObj.setEducation_fromDate(fromDate);
		    				updateEducationDetailObj.setEducation_toDate(toDate);
		    				updateEducationDetailObj.setQualification(qualification);
		    				updateEducationDetailObj.setCourse_Type(courseType);
		    				updateEducationDetailObj.setMajor_subject(subMajor);
		    				updateEducationDetailObj.setSubmitted_on(new Date());	
		    				updateEducationDetailObj.setCandidate_status("Submitted");
		    				updateEducationDetailObj.setCandidate_id(loginempno);
		    				bgcDao.updateEducationDetails(updateEducationDetailObj);
	  					    message="Education Details Updated Successfully";
	  					    
	  					  BGCCandidateFormsStatusEntity candformsStatusDBObj = bgcDao.getBGCFormsStatusByCandidateId(updateEducationDetailObj.getCandidate_id());
	  					  candformsStatusDBObj.setCandidate_education_status("Submitted");
	  					  bgcDao.updateCandidateFormsStatusDetails(candformsStatusDBObj);
	  					  
					    }else {
					    	
					    }
		    			
		    			TemporaryCandidateDetails bgccandidateObj=bgcDao.getCandidateByCandidateId(loginempno);
		    			
		    			String fromail=bgccandidateObj.getEmail_id(),tomail=env.getProperty("contractsmailid"),
		    				   fromname=bgccandidateObj.getFull_name(),toname="Team", 
		    				   body="",ccmail="";
		    					String subject=" "+bgccandidateObj.getFull_name()+"  BGC: Education Details Form  has been updated";
		    					body="I have updated my Education Details Form, please check.";
		    					try {
		    						sendmail.sendBGCStatusMail(fromail, tomail, fromname,toname, subject, body,ccmail);
		    					}catch (Exception e) {
		    						// TODO: handle exception
		    					}
		    			
		    			
			// sendmail.sendMail(frommail, toemail, toName, comments, subject);
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return message;
	}

	@Override
	public String savebgvcandidatedocs(String bgcChkId, String comment, Integer lgempno, MultipartFile[] bgcfile,
			String bgcCandidateId) {
		String message = null;
		try {
			Integer bgcChk_Id = 0;
			if (bgcChkId != "") {
				bgcChk_Id = Integer.parseInt(bgcChkId);
			}
			
			Integer Candidate_Id = 0;
			if (bgcCandidateId!= "") {
				Candidate_Id = Integer.parseInt(bgcCandidateId);
			}
			
			CandidateBGCCheckList candidateBgcObj = bgcDao.getBGCCheckListById(bgcChk_Id);
			if(candidateBgcObj!=null) {
				candidateBgcObj.setCandidate_status("Submitted");
				bgcDao.updateCommentDetails(candidateBgcObj);
				
				SubCategoryEntity sucatName=bgcDao.getSubCategoryBysubCategoryId(candidateBgcObj.getSubcategory_id());
				TemporaryCandidateDetails bgccandidateObj=bgcDao.getCandidateByCandidateId(Candidate_Id);
				
				//BasicDetailsDto loginObj=empDao.viewEmployeeInfo(logincandidateid);//contracts@tekskillsinc.com
				//env.getProperty("contractsemailid")
				String fromail=bgccandidateObj.getEmail_id(),tomail=env.getProperty("contractsmailid"),
					   fromname=bgccandidateObj.getFull_name(),toname="Team", 
					   body="",ccmail="";
						String subject=""+bgccandidateObj.getFull_name()+" BGC: "+sucatName.getSubcategory_name()+"  has been submitted";
						body="I have submitted my "+sucatName.getSubcategory_name()+" document, please check.";
						
						try {
							sendmail.sendBGCStatusMail(fromail, tomail, fromname,toname, subject, body,ccmail);
						}catch (Exception e) {
							// TODO: handle exception
						}
			}
			
			BGCCheckListCommentsHistory commentHistory = new BGCCheckListCommentsHistory();
			commentHistory.setBgc_checklist_id(candidateBgcObj.getBgc_checklist_id());
			commentHistory.setComments(comment);
			//commentHistory.setStatus(bgcChkStatus);
			commentHistory.setPosted_by(0);
			commentHistory.setCandidate_id(Candidate_Id);
			commentHistory.setSubmitted_date(new Date());
			bgcDao.saveCommentHistory(commentHistory);
			
			message = "Details saved Successfully";

			if(bgcfile!=null) {
			if(bgcfile.length!=0) {
				for(int i=0;i<bgcfile.length;i++) {
					BGCCheckListFileHistory filehisory= new BGCCheckListFileHistory();
					if(!bgcfile[i].getOriginalFilename().isEmpty()) {
						filehisory.setBgc_checklist_id(bgcChk_Id);
						filehisory.setFile_name(bgcfile[i].getOriginalFilename());
						filehisory.setPosted_by(0);
						filehisory.setCandidate_id(Candidate_Id);
						filehisory.setSubmitted_date(new Date());
						try {
							commonObj.bgvfileToDirectory(Candidate_Id, bgcfile[i],null);
						} catch (MessagingException e) {
							e.printStackTrace();
						}
						bgcDao.saveDocumentHistory(filehisory);
						//message="Success";
					}
				}
			}
		}
			
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return message;
	
	}

	@Override
	public String ceckBGCCandidateIdExists(int candidate_id) {
		String message = null;
		try {
			Integer candidateId = bgcDao.ceckBGCCandidateIdExists(candidate_id);
			if(candidateId!=null) {
				message="Exist";
			}else {
				message="Not Exist";
			}
			
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return message;
	}

	@Override
	public TemporaryCandidateDetails getTempCandidateByCandidateId(Integer candidateId) {
		TemporaryCandidateDetails tempObj = null;
		try {
			tempObj = bgcDao.getCandidateByCandidateId(candidateId);
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return tempObj;
	}

	@Override
	public List<ProfileMasterDTO> getProfilesByCandidateId(String candidateId) {
		List<ProfileMasterDTO> profileList = null;
		try {
			Integer candidate_Id = 0;
			if (candidateId!= "") {
				candidate_Id = Integer.parseInt(candidateId);
			}
			profileList = bgcDao.getProfilesByCandidateId(candidate_Id);
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return profileList;
	}
	
	@Override
	public List<AssignedCandidateDto> getAssignedCandidatesList() {
		List<AssignedCandidateDto> candiList = null;
		try {
			candiList = bgcDao.getAssignedCandidatesList();
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return candiList;	
	}

	@Override
	public List<DocumentTypeEntity> getDocumentTypeList() {
		List<DocumentTypeEntity> docTypeList = null;
		try {
			docTypeList = bgcDao.getDocumentTypeList();
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return docTypeList;	
	}

	@Override
	public List<DocEmpBean> candidateDocumentsByType(String candidateId, String documentId) {
		List<DocEmpBean> documentList = null;
		try {
			Integer candidate_Id = 0;Integer document_Id = 0;
			if (candidateId!= "") {
				candidate_Id = Integer.parseInt(candidateId);
			}if (documentId!= "") {
				document_Id = Integer.parseInt(documentId);
			}
			documentList = bgcDao.candidateDocumentsByType(candidate_Id,document_Id);
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return documentList;	
	}

	@Override
	public String savedoctype(String docname, Integer lgempno) {
		String message=null;
		try {
			DocumentTypeEntity docObj=new DocumentTypeEntity();
			String uppercaseString=uppercaseString(docname);
			docObj.setDocument_type(uppercaseString);
			docObj.setStatus("Active");
			docObj.setPosted_by(lgempno);
			docObj.setSubmitted_date(new Date());
			Integer doc_id=bgcDao.savedocumentType(docObj);
			if(doc_id!=0) {
				message = uppercaseString+" added successfully";
			}else {
				message = uppercaseString+" not added";
			}
			
		} catch (Exception e) {
			logger.info(e.getMessage(),e);		}
		return message;
	}

	@Override
	public String updatedoctype(String docname, String docid) {
		String message=null;
		try {
			Integer doc_id=0;
			if (docid!="") {
				doc_id = Integer.parseInt(docid);
			}
			DocumentTypeEntity docObj=bgcDao.getDocumentTypeById(doc_id);
			String uppercaseString=uppercaseString(docname);
			if(docObj!=null) {
				docObj.setDocument_type(uppercaseString);
				bgcDao.updateDocumentType(docObj);
				message = uppercaseString+" updated successfully";
			}
			else {
				message=uppercaseString+" not updated";
			}
			
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return message;
	}

	@Override
	public String checkDocumentType(String docname) {
		String doc_name = null;
		try {
			doc_name = bgcDao.checkDocumentType(docname);
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return doc_name;
	}
	
	@Override
	public BGCCandidateFormsStatusEntity getBGCFormsStatusByCandidateId(String candidateId) {
		BGCCandidateFormsStatusEntity candformsStatusObj = null;
		try {
			Integer candidate_Id = 0;
			if (candidateId!= "") {
				candidate_Id = Integer.parseInt(candidateId);
			}
			candformsStatusObj = bgcDao.getBGCFormsStatusByCandidateId(candidate_Id);
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return candformsStatusObj;
	}
	
	@Override
	public CandidateBgvEmploymentDto getCandidateEmploymentDetailsByEmploymentId(String employmentId) {
		CandidateBgvEmploymentDto employmentDetailsObj=null;
		try {
			Integer employment_id = 0;
			if (employmentId!="") {
				employment_id = Integer.parseInt(employmentId);
			}
			employmentDetailsObj = bgcDao.getCandidateEmploymentDetailsByEmploymentId(employment_id);
			BGCCandidateFormsStatusEntity candformsStatusDBObj = bgcDao.getBGCFormsStatusByCandidateId(employmentDetailsObj.getCandidate_id());
			System.out.println("candformsStatusDBObj"+candformsStatusDBObj.getVerifier_employment_status());
			if(candformsStatusDBObj!=null) {
				employmentDetailsObj.setVerifier_employment_status(candformsStatusDBObj.getVerifier_employment_status());
			}
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return employmentDetailsObj;
	}

	@Override
	public List<SubCategoryDocumentsEntity> viewSubCatDocListBySubCatId(String subCatId) {
		List<SubCategoryDocumentsEntity> subCatDocList = null;
		try {
			Integer subCat_Id = 0;
			if (subCatId!= "") {
				subCat_Id = Integer.parseInt(subCatId);
			}
			subCatDocList = bgcDao.viewSubCatDocListBySubCatId(subCat_Id);
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return subCatDocList;	
	}

	@Override
	public String updateSubCatDocumentStatus(String docid, String docstatus) {
		String message=null;
		try {
			Integer doc_id=0;
			if (docid!="") {
				doc_id = Integer.parseInt(docid);
			}
			SubCategoryDocumentsEntity docObj=bgcDao.getSubCatDocumentBySubCatId(doc_id);
			System.out.println("docstatus***"+docstatus);
			if(docObj!=null) {
				if(docstatus.equalsIgnoreCase("InActive")) {
					docObj.setDocStatus("Active");
					SubCategoryEntity subcatObj=bgcDao.getSubCategoryBysubCategoryId(docObj.getSubcat_id());
					if(!subcatObj.getDocStatus().equalsIgnoreCase("Yes")) {
						subcatObj.setDocStatus("Yes");
						bgcDao.updatesubcategory(subcatObj);
					}
				}else {
					docObj.setDocStatus("InActive");
				}
				bgcDao.updateSubCatDocument(docObj);
				message="updated";
			  }
			else {
				message="not updated";
			}
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return message;
	}
	
	@Override
	public List<String> getSubcategoryDocuments(String subcat_id) {
		List<String> fileList = null;
		try {
			Integer subcatid = 0;
			if (subcat_id!="") {
				subcatid = Integer.parseInt(subcat_id);
			}
			
			fileList = bgcDao.getSubcategoryDocuments(subcatid);
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return fileList;
	}

	@Override
	public List<ContractsPanelDetails_DTO> ContrctsPanelHistoryById(String candidateId, String profileId) {
		List<ContractsPanelDetails_DTO> bgcList=new ArrayList<ContractsPanelDetails_DTO>();
		try {
			Integer candidate_Id = 0;
			if (candidateId != "") {
				candidate_Id = Integer.parseInt(candidateId);
			}
			Integer profile_Id = 0;
			if (profileId != "") {
				profile_Id = Integer.parseInt(profileId);
			}
			
		/*	Integer bgcId=bgcDao.getBGCIdByCandidateIdProfileID(candidate_Id, profile_Id);*/

			List<Integer> bgcIdList=bgcDao.getBGCIdsByCandidateIdProfileID(candidate_Id, profile_Id);
			for (Integer bgcId :  bgcIdList) {
				//List<ContractsPanelDetails_DTO> adminList = bgcDao.getContrctsPanelAdminList(bgcId, profile_Id);
				List<ContractsPanelDetails_DTO> candidateList = bgcDao.getContrctsPanelCandidateList(bgcId, profile_Id);
				
				//bgcList.setAdminList(adminList);
				//bgcList.setCandidateList(candidateList);
				//bgcList.addAll(adminList);
				bgcList.addAll(candidateList);
				
			}
			
			/*BGCCandidateFormsStatusEntity candformsStatusDBObj = bgcDao.getBGCFormsStatusByCandidateId(candidate_Id);
			if(candformsStatusDBObj!=null) {
				bgcList.setPersonal_status(candformsStatusDBObj.getCandidate_personal_status());
				bgcList.setPersonal_Apprstatus(candformsStatusDBObj.getVerifier_personal_status());
				bgcList.setEducation_status(candformsStatusDBObj.getCandidate_education_status());
				bgcList.setEducation_Apprstatus(candformsStatusDBObj.getVerifier_education_status());
				bgcList.setEmployment_status(candformsStatusDBObj.getCandidate_employment_status());
				bgcList.setEmployment_Apprstatus(candformsStatusDBObj.getVerifier_employment_status());
			}*/
			
			
		

		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return bgcList;
	}
	
	@Override
	public DocumentTypeDto bgccheckDocumentTypeissame(String docTypeid) {
		 DocumentTypeDto docDto = new DocumentTypeDto();
			try {
				Integer docType_id = 0;
				if (docTypeid!="") {
					docType_id = Integer.parseInt(docTypeid);
				}
				Integer issame=bgcDao.bgccheckDocumentTypeIssame(docType_id);
				Integer subdocTypeCount=bgcDao.bgccheckDocumentTypeSubocTypeCount(docType_id);
				docDto.setIsameas_doctype(issame);
				docDto.setSubdocTypeCount(subdocTypeCount);
			   
			} catch (Exception e) {
				logger.info(e.getMessage(),e);
			}
			return docDto;
	}
	
	@Override
	public List<DocumentTypeDto> viewSubCatDocListBySubCategories(String subCatId) {
		List<DocumentTypeDto> subCatDocList = null;
		try {
			Integer subCat_Id = 0;
			if (subCatId!= "") {
				subCat_Id = Integer.parseInt(subCatId);
			}
			subCatDocList = bgcDao.viewSubCatDocListBySubCategories(subCat_Id);
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		return subCatDocList;	
	}
}
