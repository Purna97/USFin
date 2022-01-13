package com.tekskills.DaoImpl;

import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.transform.AliasToBeanResultTransformer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.sun.org.apache.xerces.internal.impl.dv.util.Base64;
import com.tekskills.Dao.BGCDao;
import com.tekskills.Dto.AssignedCandidateDto;
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
@Repository
public class BGCDaoImpl implements BGCDao {
	private static final Logger logger = Logger.getLogger(BGCDaoImpl.class);
	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory sessfact;

	@Override
	public int saveCategory(CategoryEntity categoryObj) {
		Session session = null;  
		Transaction tx = null;
		Integer categoryId=0;
		try {
			session = sessfact.openSession();  
			tx = session.beginTransaction();
			categoryId=(Integer) session.save(categoryObj);
		} catch (Exception e) {
			tx.rollback(); 
			//logger.error("Error in saveCategory Method "+e.getStackTrace());
			logger.info(e.getMessage(),e);
		}
		finally {
			tx.commit();
			session.close();}
		return categoryId;
	}
	@Override
	public List<CategoryEntity> getAllCategeories() {
		Session session = null;  
		List<CategoryEntity> catList=null;
		try {
			session = sessfact.openSession();  
			String hql="from CategoryEntity ORDER BY category_name ASC";
			catList= session.createQuery(hql).list();
		} catch (Exception e) {
			//logger.error("Error in UserDaoImpl Class getAllUserGroups Method"+e.getStackTrace());
			logger.info(e.getMessage(),e);
		}
		finally {
			session.close();}  
		return catList;
	}
	@Override
	public String checkCategory(String category) {
		String categoryName=null;
		Session session = null;  
		try { 
		session = sessfact.openSession();
		String sql="Select category_name from Tbl_CategoryMaster  where category_name='"+category+"'";
		categoryName=(String) session.createSQLQuery(sql).uniqueResult();
		}catch (Exception e) {
			logger.info(e.getMessage(),e);
		}finally {
			session.close();
			} 
		return categoryName;
	}
	@Override
	public CategoryEntity getCategoryByCategoryId(Integer categoryId) {
		Session session = null;  
		CategoryEntity catObj=null;
		try {
			session = sessfact.openSession();  
			String hql="from CategoryEntity where category_id="+categoryId+"";
			catObj= (CategoryEntity) session.createQuery(hql).uniqueResult();
		} catch (Exception e) {
			//logger.error("Error in UserDaoImpl Class getAllUserGroups Method"+e.getStackTrace());
			logger.info(e.getMessage(),e);
		}
		finally {
			session.close();}  
		return catObj;
	}
	@Override
	public void updatecategory(CategoryEntity catObj) {
		Session session = null;
		try {
			session = sessfact.openSession();
			Transaction tx = session.beginTransaction();
			session.update(catObj);
			tx.commit();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		
	}
	@Override
	public List<SubCategoryEntity> getAllSubCategeories() {
		Session session = null;  
		List<SubCategoryEntity> subcatList=null;
		try {
			session = sessfact.openSession();  
			String hql="from SubCategoryEntity ORDER BY subcategory_name ASC";
			subcatList= session.createQuery(hql).list();
		} catch (Exception e) {
			//logger.error("Error in UserDaoImpl Class getAllUserGroups Method"+e.getStackTrace());
			logger.info(e.getMessage(),e);
		}
		finally {
			session.close();}  
		return subcatList;
	}
	@Override
	public int saveSubCategory(SubCategoryEntity subcatObj) {
		Session session = null;  
		Transaction tx = null;
		Integer categoryId=0;
		try {
			session = sessfact.openSession();  
			tx = session.beginTransaction();
			categoryId=(Integer) session.save(subcatObj);
		} catch (Exception e) {
			tx.rollback(); 
			//logger.error("Error in saveCategory Method "+e.getStackTrace());
			logger.info(e.getMessage(),e);
		}
		finally {
			tx.commit();
			session.close();}
		return categoryId;
	}
	@Override
	public String checkSubCategory(String subCategory) {
		String categoryName=null;
		Session session = null;  
		try { 
		session = sessfact.openSession();
		String sql="Select subcategory_name from Tbl_SubCategoryMaster  where subcategory_name='"+subCategory+"'";
		categoryName=(String) session.createSQLQuery(sql).uniqueResult();
		}catch (Exception e) {
			logger.info(e.getMessage(),e);
		}finally {
			session.close();
			} 
		return categoryName;
	}
	@Override
	public List<CategoreisDTO> getSubCategeoriesList() {
		Session session = null;  
		List<CategoreisDTO> subcatList=null;
		try {
			session = sessfact.openSession();  
			String sql="select c.category_id as category_id,s.subcategory_id as subcategory_id,c.category_name as category_name,s.subcategory_name as subcategory_name,s.is_same as isameas_category,s.subcategory_type as subcategory_type,dbo.fnGetBgcDocumentNameById(s.documenttype_id) documentType,s.documenttype_id  as documenttype_id,s.document_status as docStatus from Tbl_CategoryMaster c join Tbl_SubCategoryMaster s on c.category_id=s.category_id ORDER BY s.subcategory_name ASC";
			subcatList=(List<CategoreisDTO>) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(CategoreisDTO.class)).list();
		} catch (Exception e) {
			//logger.error("Error in UserDaoImpl Class getAllUserGroups Method"+e.getStackTrace());
			logger.info(e.getMessage(),e);
		}
		finally {
			session.close();}  
		return subcatList;
	}
	@Override
	public SubCategoryEntity getSubCategoryBysubCategoryId(Integer subcategoryId) {
		SubCategoryEntity subcatObj=null;
		Session session = null;  
		try { 
		session = sessfact.openSession();
		String sql="from SubCategoryEntity where subcategory_id="+subcategoryId+"";
		subcatObj=(SubCategoryEntity) session.createQuery(sql).uniqueResult();
		}catch (Exception e) {
			logger.info(e.getMessage(),e);
		}finally {
			session.close();
			} 
		return subcatObj;
	}
	@Override
	public void updatesubcategory(SubCategoryEntity subcatObj) {
		Session session = null;
		try {
			session = sessfact.openSession();
			Transaction tx = session.beginTransaction();
			session.update(subcatObj);
			tx.commit();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		
	}
	@Override
	public SubCategoryEntity getSubCategoryByCategoryId(Integer categoryId) {
		SubCategoryEntity subcatObj=null;
		Session session = null;  
		try { 
		session = sessfact.openSession();
		String sql="from SubCategoryEntity where category_id="+categoryId+" and is_same=1";
		subcatObj=(SubCategoryEntity) session.createQuery(sql).uniqueResult();
		}catch (Exception e) {
			logger.info(e.getMessage(),e);
		}finally {
			session.close();
			} 
		return subcatObj;
	}
	@Override
	public String checkprofilemaster(String profilename) {
		String profile_name=null;
		Session session = null;  
		try { 
		session = sessfact.openSession();
		String sql="Select profile_name from Tbl_ProfileLableMaster  where profile_name='"+profilename+"'";
		profile_name=(String) session.createSQLQuery(sql).uniqueResult();
		}catch (Exception e) {
			logger.info(e.getMessage(),e);
		}finally {
			session.close();
			} 
		return profile_name;
	}
	@Override
	public List<SubCategoryEntity> getSubCategoriesByCatid(Integer categoryId) {
		Session session = null;  
		List<SubCategoryEntity> subcatList=null;
		try {
			session = sessfact.openSession();  
			String hql="from SubCategoryEntity where category_id="+categoryId+"";
			subcatList=session.createQuery(hql).list();
		} catch (Exception e) {
			//logger.error("Error in UserDaoImpl Class getAllUserGroups Method"+e.getStackTrace());
			logger.info(e.getMessage(),e);
		}
		finally {
			session.close();}  
		return subcatList;
	}
	@Override
	public int saveGroupingProfileName(ProfileLableMaster lableObj) {
		Session session = null;	Transaction tx = null;	Integer profileid=0;
		try {
			session = sessfact.openSession();  
			tx = session.beginTransaction();
			profileid=(Integer) session.save(lableObj);
		} catch (Exception e) {
			tx.rollback(); 
			logger.info(e.getMessage(),e);
		}
		finally {
			tx.commit();
			session.close();}
		return profileid;
	}
	@Override
	public void saveProfileMaster(ProfileMasterCheckList profileMasterObj) {
		Session session = null;	Transaction tx = null;	
		try {
			session = sessfact.openSession();  
			tx = session.beginTransaction();
			session.save(profileMasterObj);
		} catch (Exception e) {
			tx.rollback(); 
			logger.info(e.getMessage(),e);
		}
		finally {
			tx.commit();
			session.close();}
		
	}
	@Override
	public List<ProfileLableMaster> getProfileList() {
		Session session = null;  
		List<ProfileLableMaster> profileList=null;
		try {
			session = sessfact.openSession();  
			String hql="from ProfileLableMaster where status='Active' ORDER BY profile_name ASC";
			profileList= session.createQuery(hql).list();
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		finally {
			session.close();}  
		return profileList;
	}
	@Override
	public List<ProfileMasterDTO> getProfileListByProfileId(Integer profile_Id) {
		Session session = null;  
		List<ProfileMasterDTO> profileList=null;
		try {
			session = sessfact.openSession();  
			String sql="select cm.category_id as categoryid,cm.category_name as category,sm.subcategory_id as subcategoryid,\r\n" + 
					"sm.subcategory_name as subcategory,pm.profile_id as profileid\r\n" + 
					"from Tbl_ProfileMasterCheckList pm join Tbl_SubCategoryMaster sm \r\n" + 
					"on pm.subcategory_id=sm.subcategory_id join Tbl_CategoryMaster cm on \r\n" + 
					"cm.category_id=sm.category_id where profile_id="+profile_Id+"";
			profileList=(List<ProfileMasterDTO>) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(ProfileMasterDTO.class)).list();
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		finally {
			session.close();}  
		return profileList;
	}
	
	
	@Override
	public String getProfileNameById(Integer profile_Id) {
		String profile_name=null;
		Session session = null;  
		try { 
		session = sessfact.openSession();
		String sql="Select profile_name from Tbl_ProfileLableMaster  where profile_id="+profile_Id+"";
		profile_name=(String) session.createSQLQuery(sql).uniqueResult();
		}catch (Exception e) {
			logger.info(e.getMessage(),e);
		}finally {
			session.close();
			} 
		return profile_name;
	}
	@Override
	public List<ProfileMasterCheckList> getProfileMasterListById(Integer profile_Id) {
		Session session = null;  
		List<ProfileMasterCheckList> masterList=null;
		try {
			session = sessfact.openSession();  
			String hql="from ProfileMasterCheckList where profile_id="+profile_Id+"";
			masterList=session.createQuery(hql).list();
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		finally {
			session.close();}  
		return masterList;
	}
	@Override
	public void deleteMasterListById(Integer lableId, Integer scatid) {
		Session session = null;String msg="";
		try {
			session = sessfact.openSession();String stringQuery =null;
			Transaction tx = session.beginTransaction();
			if(scatid!=0 || scatid!=null) {
				 stringQuery = "DELETE FROM ProfileMasterCheckList WHERE  subcategory_id="+scatid+" and profile_id = " + lableId;
			}else {
			 stringQuery = "DELETE FROM ProfileMasterCheckList WHERE profile_id = " + lableId;
			}
			Query query = session.createQuery(stringQuery);
			query.executeUpdate();
			
		
			tx.commit();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		
	}
	@Override
	public ProfileLableMaster geProfileLableMasterById(Integer profileId) {
		ProfileLableMaster lableObj=null;
		Session session = null;  
		try { 
		session = sessfact.openSession();
		String sql=" from ProfileLableMaster  where profile_id="+profileId+"";
		lableObj=(ProfileLableMaster) session.createQuery(sql).uniqueResult();
		}catch (Exception e) {
			logger.info(e.getMessage(),e);
		}finally {
			session.close();
			} 
		return lableObj;
	}
	@Override
	public void updateprofileName(ProfileLableMaster lableObj) {
		Session session = null;	Transaction tx = null;	
		try {
			session = sessfact.openSession();  
			tx = session.beginTransaction();
			session.update(lableObj);
		} catch (Exception e) {
			tx.rollback(); 
			logger.info(e.getMessage(),e);
		}
		finally {
			tx.commit();
			session.close();}
		
	}
	@Override
	public List<TemporaryCandidateDetails> getTempCandidateList() {
		Session session = null;  
		List<TemporaryCandidateDetails> cadiList=null;
		try {
			session = sessfact.openSession();  
			String hql="from TemporaryCandidateDetails ORDER BY full_name ASC";
			cadiList= session.createQuery(hql).list();
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		finally {
			session.close();}  
		return cadiList;
	}
	@Override
	public SubCategoryEntity getCategoryBySubCatid(Integer subcategoryId) {
		SubCategoryEntity subcatObj=null;
		Session session = null;  
		try { 
		session = sessfact.openSession();
		String sql=" from SubCategoryEntity  where subcategory_id="+subcategoryId+"";
		subcatObj=(SubCategoryEntity) session.createQuery(sql).uniqueResult();
		}catch (Exception e) {
			logger.info(e.getMessage(),e);
		}finally {
			session.close();
			} 
		return subcatObj;
	}
	@Override
	public List<Integer> getSubCategoiesByProfileId(Integer profile_Id) {
		Session session = null; List<Integer> catList=null;
		try {
			session = sessfact.openSession();  
			String hql="select subcategory_id from Tbl_ProfileMasterCheckList  where profile_id="+profile_Id+"";
			catList= session.createSQLQuery(hql).list();
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}finally {
			session.close();}  
		return catList;
	}
	@Override
	public List<Integer> getSubCategoryIds() {
		Session session = null; List<Integer> catList=null;
		try {
			session = sessfact.openSession();  
			String hql="select distinct subcategory_id from Tbl_SubCategoryMaster";
			catList= session.createSQLQuery(hql).list();
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}finally {
			session.close();}  
		return catList;
	}
	
	@Override
	public ProfileMasterDTO getCatSubcatBySubcatId(Integer subcatid) {
		Session session = null;  
		ProfileMasterDTO catsubcatObj=null;
		try {
			session = sessfact.openSession();  
			String sql="select cm.category_id as categoryid,cm.category_name as category,sm.subcategory_id as subcategoryid,sm.subcategory_name as subcategory,sm.subcategory_type as subcategory_type\r\n" + 
					"from  Tbl_SubCategoryMaster sm join Tbl_CategoryMaster cm on cm.category_id=sm.category_id where sm.subcategory_id="+subcatid+"";
			catsubcatObj=(ProfileMasterDTO) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(ProfileMasterDTO.class)).uniqueResult();
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		finally {
			session.close();}  
		return catsubcatObj;
	}
	
	@Override
	public List<Integer> getSubCategoryByCatId(Integer catid) {
		Session session = null; List<Integer> catList=null;
		try {
			session = sessfact.openSession();  
			String hql="select distinct subcategory_id from Tbl_SubCategoryMaster where category_id="+catid+"";
			catList= session.createSQLQuery(hql).list();
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}finally {
			session.close();}  
		return catList;
	}
	@Override
	public Integer saveCandidateBGCDetails(CandidateBGCDetails candidateObj) {
		Session session = null;  
		Transaction tx = null;
		Integer candidateId=0;
		try {
			session = sessfact.openSession();  
			tx = session.beginTransaction();
			candidateId=(Integer) session.save(candidateObj);
		} catch (Exception e) {
			tx.rollback(); 
			//logger.error("Error in saveCategory Method "+e.getStackTrace());
			logger.info(e.getMessage(),e);
		}
		finally {
			tx.commit();
			session.close();}
		return candidateId;
	}
	@Override
	public void saveCandidateBGCCheckList(CandidateBGCCheckList bgccheckObj) {
		Session session = null;  
		Transaction tx = null;
		try {
			session = sessfact.openSession();  
			tx = session.beginTransaction();
			 session.save(bgccheckObj);
		} catch (Exception e) {
			tx.rollback(); 
			//logger.error("Error in saveCategory Method "+e.getStackTrace());
			logger.info(e.getMessage(),e);
		}
		finally {
			tx.commit();
			session.close();}
	}
	@Override
	public TemporaryCandidateDetails getCandidateDetailsById(int candidate_id) {
		TemporaryCandidateDetails candiObj=null;
		Session session = null;  
		try { 
		session = sessfact.openSession();
		String sql="from TemporaryCandidateDetails where candidate_id="+candidate_id+"";
		candiObj=(TemporaryCandidateDetails) session.createQuery(sql).uniqueResult();
		}catch (Exception e) {
			logger.info(e.getMessage(),e);
		}finally {
			session.close();
			} 
		return candiObj;
	}
	@Override
	public void updateCandidateStatus(TemporaryCandidateDetails candiOb) {
		Session session = null;  Transaction tx = null;
		try {
			session = sessfact.openSession();  
			tx = session.beginTransaction();
			session.update(candiOb);
		} catch (Exception e) {
			tx.rollback(); 
			logger.info(e.getMessage(),e);
		}
		finally {
			tx.commit();
			session.close();
		}
		
	}
	@Override
	public List<AssignedCandidateDto> getAssignedCandidateList() {
		Session session = null;  
		List<AssignedCandidateDto> candiList=null;
		try {
			session = sessfact.openSession();  
			String sql="select c.candidate_id as candidate_id,b.bgc_id as bgc_id,c.full_name as full_name,\r\n" + 
					"b.task_status as task_status,l.profile_id as profile_id,l.profile_name as profile_name\r\n" + 
					"from  Tbl_TemporaryCandidateDetails c join Tbl_CandidateBGCDetails b\r\n" + 
					"on c.candidate_id=b.candidate_id join \r\n" + 
					"Tbl_ProfileLableMaster l on l.profile_id=b.profile_id and b.status='Active'";
			candiList=(List<AssignedCandidateDto>) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(AssignedCandidateDto.class)).list();
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		finally {
			session.close();}  
		return candiList;
	}
	@Override
	public CandidateBGCDetails getBGCDetailsByCandidateId(Integer bgc_id) {
		Session session = null;  
		CandidateBGCDetails candiObj=null;
		try {
			session = sessfact.openSession();  
			String hql="from CandidateBGCDetails where bgc_id="+bgc_id+"";
			candiObj= (CandidateBGCDetails) session.createQuery(hql).uniqueResult();
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		finally {
			session.close();}  
		return candiObj;
	}
	@Override
	public List<ProfileMasterCheckList> getProfileListByProfileSubcatId(Integer lableId, Integer subcatid) {
		Session session = null;  
		List<ProfileMasterCheckList> candiObj=null;
		try {
			session = sessfact.openSession();  
			String hql="from ProfileMasterCheckList where profile_id="+lableId+" and subcategory_id="+subcatid+"";
			candiObj= (List<ProfileMasterCheckList>) session.createQuery(hql).list();
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		finally {
			session.close();}  
		return candiObj;
	}
	@Override
	public List<Integer> getCandidateBGCCheckList(Integer bgc_Id) {
		Session session = null;  
		List<Integer> catList=null;
		try {
			session = sessfact.openSession();  
			String hql="select subcategory_id from Tbl_CandidateBGCCheckList where bgc_id="+bgc_Id+" and profile_id=0 ";
			catList= session.createSQLQuery(hql).list();
		} catch (Exception e) {
			//logger.error("Error in UserDaoImpl Class getAllUserGroups Method"+e.getStackTrace());
			logger.info(e.getMessage(),e);
		}
		finally {
			session.close();}  
		return catList;
	}
	@Override
	public void deleteBGCCheckListById(Integer catid, Integer scatid, Integer bgc_id) {
		Session session = null;String msg="";
		try {
			session = sessfact.openSession();
			Transaction tx = session.beginTransaction();
			String stringQuery = "DELETE FROM CandidateBGCCheckList WHERE category_id="+catid+" and subcategory_id="+scatid+" and bgc_id = " + bgc_id;
			
			Query query = session.createQuery(stringQuery);
			query.executeUpdate();
			
		
			tx.commit();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		
	}
	@Override
	public void updateCandidateBGCDetail(CandidateBGCDetails candidateObj) {
		Session session = null;  Transaction tx = null;
		try {
			session = sessfact.openSession();  
			tx = session.beginTransaction();
			session.update(candidateObj);
		} catch (Exception e) {
			tx.rollback(); 
			logger.info(e.getMessage(),e);
		}
		finally {
			tx.commit();
			session.close();
		}
	}
	
	
	
	@Override
	public int saveCandidateDetails(TemporaryCandidateDetails candidateObj) {
		Session session = null;
		Transaction tx = null;
		Integer candidateId = 0;
		try {
			session = sessfact.openSession();
			tx = session.beginTransaction();
			candidateId = (Integer) session.save(candidateObj);
		} catch (Exception e) {
			tx.rollback();
			// logger.error("Error in saveCandidateDetails Method "+e.getStackTrace());
			logger.info(e.getMessage(), e);
		} finally {
			tx.commit();
			session.close();
		}
		return candidateId;
	}

	@Override
	public List<TempCandidateDetailsDTO> getAllCandidates() {
		Session session = null;
		List<TempCandidateDetailsDTO> candidateList = null;
		try {
			session = sessfact.openSession();
			// String hql="from CandidateEntity ORDER BY candidate_id ASC";
			// candidateList= session.createQuery(hql).list();
			String sql = "select candidate_id as candidate_id,first_name as firstname ,last_name as lastname,full_name as fullname, CONVERT(VARCHAR(MAX),CAST('' AS XML).value('xs:base64Binary(sql:column(\"ssn\"))', 'VARBINARY(MAX)')) as ssn,email_id as email, posted_by as posted_by ,status as status, contact_number as phone from Tbl_TemporaryCandidateDetails where status is not null ORDER BY full_name ASC";
			candidateList = (List<TempCandidateDetailsDTO>) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(TempCandidateDetailsDTO.class)).list();
		} catch (Exception e) {
			// logger.error("Error in UserDaoImpl Class getAllCandidates
			// Method"+e.getStackTrace());
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return candidateList;
	}

	// updateCadidate by Deepak

	public void updatecandidate(TemporaryCandidateDetails candObj) {
		Session session = null;
		try {
			session = sessfact.openSession();
			Transaction tx = session.beginTransaction();
			session.update(candObj);
			tx.commit();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
	}

	@Override
	public TemporaryCandidateDetails getCandidateByCandidateId(Integer CandidateId) {
		Session session = null;
		TemporaryCandidateDetails candObj = null;
		try {
			session = sessfact.openSession();
			String hql = "from TemporaryCandidateDetails where candidate_id=" + CandidateId + "";
			candObj = (TemporaryCandidateDetails) session.createQuery(hql).uniqueResult();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return candObj;
	}

	@Override
	public List<ProfileLableMaster> getAllProfiles() {
		Session session = null;
		List<ProfileLableMaster> profileList = null;
		try {
			session = sessfact.openSession();
			String hql = "from ProfileLableMaster order by profile_name asc";
			profileList = session.createQuery(hql).list();
		} catch (Exception e) {
			// logger.error("Error in UserDaoImpl Class getAllUserGroups
			// Method"+e.getStackTrace());
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return profileList;
	}

	@Override
	public List<TempCandidateDetailsDTO> getCandidatesByProfileId(Integer profile_Id) {
		Session session = null;
		List<TempCandidateDetailsDTO> candidateList = null;
		try {
			session = sessfact.openSession();
			String sql = "SELECT distinct tc.candidate_id as candidate_id,tc.full_name as fullname FROM Tbl_TemporaryCandidateDetails tc INNER JOIN Tbl_CandidateBGCDetails cd ON cd.candidate_id = tc.candidate_id and cd.profile_id="
					+ profile_Id + " order by tc.full_name asc";
			candidateList = (List<TempCandidateDetailsDTO>) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(TempCandidateDetailsDTO.class)).list();
		} catch (Exception e) {
			// logger.error("Error in UserDaoImpl Class getAllCandidates
			// Method"+e.getStackTrace());
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return candidateList;
	}

	@Override
	public List<Integer> getCategoryIdsById(Integer candidate_Id, Integer profile_Id) {
		List<Integer> catlist = null;
		Session session = null;
		try {
			session = sessfact.openSession();
			String sql = "select distinct category_id from Tbl_CandidateBGCCheckList where profile_id=" + profile_Id
					+ " and candidate_id=" + candidate_Id + "";
			catlist = (List<Integer>) session.createSQLQuery(sql).list();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return catlist;
	}

	@Override
	public List<Integer> getSubCategoryIdsById(Integer candidate_Id, Integer profile_Id, Integer catId) {
		List<Integer> catlist = null;
		Session session = null;
		try {
			session = sessfact.openSession();
			String sql = "select subcategory_id from Tbl_CandidateBGCCheckList where profile_id=" + profile_Id
					+ " and candidate_id=" + candidate_Id + " and category_id=" + catId + "";
			catlist = (List<Integer>) session.createSQLQuery(sql).list();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return catlist;
	}

	@Override
	public List<ContractsPanelDetails_DTO> getContrctsPanelDetailsById(Integer candidate_Id, Integer profile_Id) {
		List<ContractsPanelDetails_DTO> candidateList = null;
		Session session = null;
		try {
			session = sessfact.openSession();
			String sql = "select bgc_checklist_id as bgc_checklist_id,\r\n"
					+ "dbo.fnGetCategoryNameById(category_id) as catName,\r\n"
					+ "dbo.fnGetSubCategoryNameById(subcategory_id) as subcatName,\r\n"
					+ "dbo.fnGetTaskStatusById(candidate_id) as taskStatus,status as status,\r\n"
					+ "dbo.fnGetBgcCandidateNameByCandidateId(candidate_id) as candidateName,dbo.fnGetBgcProfileNameById(profile_id) as profileName \r\n" + "from Tbl_CandidateBGCCheckList where candidate_id=" + candidate_Id + "";
			candidateList = (List<ContractsPanelDetails_DTO>) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(ContractsPanelDetails_DTO.class)).list();
		} catch (Exception e) {
			// logger.error("Error in UserDaoImpl Class getContrctsPanelDetailsById
			// Method"+e.getStackTrace());
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return candidateList;
	}

	@Override
	public CandidateBGCCheckList getBGCCheckListById(Integer bgcChk_Id) {
		Session session = null;
		CandidateBGCCheckList candidateBgcObj = null;
		try {
			session = sessfact.openSession();
			String hql = "from CandidateBGCCheckList where bgc_checklist_id=" + bgcChk_Id + "";
			candidateBgcObj = (CandidateBGCCheckList) session.createQuery(hql).uniqueResult();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return candidateBgcObj;
	}

	@Override
	public void updateCommentDetails(CandidateBGCCheckList candidateBgcObj) {
		Session session = null;Transaction tx = null;
		try {
			session = sessfact.openSession();
			tx = session.beginTransaction();
			session.update(candidateBgcObj);	
			tx.commit();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			
			session.close();
		}

	}

	/*@Override
	public void saveCandidateBGCCheckListHistory(CandidateBGCCheckList candHistoryObj) {
		Session session = null;
		Transaction tx = null;
		try {
			session = sessfact.openSession();
			tx = session.beginTransaction();
			session.save(candHistoryObj);
		} catch (Exception e) {
			tx.rollback();
			// logger.error("Error in saveCandidateBGCCheckListHistory Method "+e.getStackTrace());
			logger.info(e.getMessage(), e);
		} finally {
			tx.commit();
			session.close();
		}
	}
*/
	@Override
	public void saveCommentHistory(BGCCheckListCommentsHistory commentHistory) {
		Session session = null;
		Transaction tx = null;
		try {
			session = sessfact.openSession();
			tx = session.beginTransaction();
			session.save(commentHistory);
			tx.commit();
		} catch (Exception e) {
			tx.rollback();
			// logger.error("Error in saveCommentHistory Method "+e.getStackTrace());
			logger.info(e.getMessage(), e);
		} finally {
			
			session.close();
		}
	}

	@Override
	public void saveDocumentHistory(BGCCheckListFileHistory fileHistory) {
		Session session = null;
		Transaction tx = null;
		try {
			session = sessfact.openSession();
			tx = session.beginTransaction();
			session.save(fileHistory);
		} catch (Exception e) {
			tx.rollback();
			// logger.error("Error in saveDocumentHistory Method "+e.getStackTrace());
			logger.info(e.getMessage(), e);
		} finally {
			tx.commit();
			session.close();
		}
	}

	@Override
	public List<commentHistoryDto> viewCommentHistoryById(Integer chkList_Id) {
		Session session = null;
		List<commentHistoryDto> commentHistoryList = null;
		try {
			session = sessfact.openSession();
			String sql = " SELECT comments as comments,comments_id as commentid, status as status,CONVERT(VARCHAR(10), submitted_date, 103) + ' '  + convert(VARCHAR(8), submitted_date, 14) as subdate,dbo.fnGetNameByEmpno(posted_by) as posted_by,dbo.fnGetBgcCandidateNameByCandidateId(candidate_id)  as candidatename FROM Tbl_BGCCheckListCommentsHistory where bgc_checklist_id="+chkList_Id+"";
			commentHistoryList = (List<commentHistoryDto>) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(commentHistoryDto.class)).list();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return commentHistoryList;
	}

	@Override
	public List<fileHistoryDto> viewfileHistoryByChkListId(Integer chkList_Id) {
		Session session = null;
		List<fileHistoryDto> fileHistoryList = null;
		try {
			session = sessfact.openSession();
			String sql = " SELECT file_name as fileName ,file_id as fileid,CONVERT(VARCHAR(10), submitted_date, 103) + ' '  + convert(VARCHAR(8), submitted_date, 14) as subdate,dbo.fnGetNameByEmpno(posted_by) as posted_by,dbo.fnGetBgcCandidateNameByCandidateId(candidate_id)  as candidatename FROM Tbl_BGCCheckListFileHistory where bgc_checklist_id="+chkList_Id+"";
			fileHistoryList = (List<fileHistoryDto>) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(fileHistoryDto.class)).list();
		} catch (Exception e) {
			// logger.error("Error in UserDaoImpl Class viewCommentHistoryByChkListId
			// Method"+e.getStackTrace());
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return fileHistoryList;
	}
	@Override
	public List<CandidateBGCCheckList> getBGCListByIds(Integer bgc_id, Integer subcatId, Integer catid, Integer candidateId) {
		List<CandidateBGCCheckList> bgcCheckList=null;
		Session session = null;  
		try { 
		session = sessfact.openSession();
		String sql="from CandidateBGCCheckList where category_id="+catid+" and subcategory_id="+subcatId+" and bgc_id="+bgc_id+" and candidate_id="+candidateId+"";
		bgcCheckList=(List<CandidateBGCCheckList>) session.createQuery(sql).list();
		}catch (Exception e) {
			logger.info(e.getMessage(),e);
		}finally {
			session.close();
			} 
		return bgcCheckList;
	}
	@Override
	public ProfileLableMaster getprofileMasterByprofileId(Integer profile_Id) {
		Session session = null;
		ProfileLableMaster profileObj = null;
		try {
			session = sessfact.openSession();
			String hql = "from ProfileLableMaster where profile_id="+profile_Id+"";
			profileObj = (ProfileLableMaster) session.createQuery(hql).uniqueResult();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return profileObj;
	}
	@Override
	public List<ProfileLableMaster> getInactiveProfileList() {
		Session session = null;  
		List<ProfileLableMaster> profileList=null;
		try {
			session = sessfact.openSession();  
			String hql="from ProfileLableMaster where status='InActive' ORDER BY profile_name ASC";
			profileList= session.createQuery(hql).list();
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		finally {
			session.close();}  
		return profileList;
	}
	
	@Override
	public List<ContractsPanelDetails_DTO> getBGCPendingList() {
		List<ContractsPanelDetails_DTO> candidateList = null;
		Session session = null;
		try {
			session = sessfact.openSession();
			String sql = "select candidate_id as candidateId,bgc_checklist_id as bgc_checklist_id,\r\n"
					+ "dbo.fnGetCategoryNameById(category_id) as catName,\r\n"
					+ "dbo.fnGetSubCategoryNameById(subcategory_id) as subcatName,\r\n"
					+ "dbo.fnGetTaskStatusById(candidate_id) as taskStatus,status as status,\r\n"
					+ "dbo.fnGetBgcCandidateNameByCandidateId(candidate_id) as candidateName\r\n" + 
					",dbo.fnGetBgcProfileNameById(profile_id) as profileName \r\n" + "from Tbl_CandidateBGCCheckList where status in ('In Progress','Initiate') OR status IS NULL "
							+ "and subcategory_id in (select subcategory_id from Tbl_SubCategoryMaster where subcategory_type=0) "
							+ "and bgc_id in (select bgc_id from Tbl_CandidateBGCDetails where status='Active')";
			candidateList = (List<ContractsPanelDetails_DTO>) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(ContractsPanelDetails_DTO.class)).list();
		} catch (Exception e) {
			// logger.error("Error in UserDaoImpl Class getContrctsPanelDetailsById
			// Method"+e.getStackTrace());
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return candidateList;
	}
	@Override
	public Integer getBGCIdByCandidateIdProfileID(Integer candidate_Id, Integer profile_Id) {
		Integer bgcId=null;
		Session session = null;  
		try { 
		session = sessfact.openSession();
		String sql="select top 1 bgc_id from Tbl_CandidateBGCDetails where candidate_id="+candidate_Id+" and profile_id="+profile_Id+" order by bgc_id desc";
		bgcId=(Integer) session.createSQLQuery(sql).uniqueResult();
		}catch (Exception e) {
			logger.info(e.getMessage(),e);
		}finally {
			session.close();
			} 
		return bgcId;
	}
	
	@Override
	public String ssncheckInTempReg(String ssn_emp) {
		String ssn=null;
		Session session = null;  
		try { 
		session = sessfact.openSession();
		String bytesEncoded = Base64.encode(ssn_emp.getBytes());
		String sql="select ssn from Tbl_TemporaryCandidateDetails where ssn='"+bytesEncoded+"'";
		ssn=(String) session.createSQLQuery(sql).uniqueResult();
		}catch (Exception e) {
			logger.info(e.getMessage(),e);
		}finally {
			session.close();
			} 
		return ssn;
	}
	
	@Override
	public List<ContractsPanelDetails_DTO> getContrctsPanelAdminList(Integer bgc_id, Integer profile_Id) {
		List<ContractsPanelDetails_DTO> candidateList = null;
		Session session = null;
		try {
			session = sessfact.openSession();
			String sql = "select b.bgc_checklist_id as bgc_checklist_id,\r\n" + 
					"dbo.fnGetCategoryNameById(b.category_id) as catName,\r\n" + 
					"dbo.fnGetSubCategoryNameById(b.subcategory_id) as subcatName,\r\n" + 
					"dbo.fnGetTaskStatusById(b.candidate_id) as taskStatus,b.status as status,\r\n" + 
					"dbo.fnGetBgcCandidateNameByCandidateId(b.candidate_id) as candidateName,\r\n" + 
					"dbo.fnGetBgcProfileNameById(b.profile_id) as profileName \r\n" + 
					"from Tbl_CandidateBGCCheckList b,Tbl_SubCategoryMaster s where b.bgc_id="+bgc_id+" and\r\n" + 
					"s.subcategory_id=b.subcategory_id and s.subcategory_type=0";
			/*String sql = "select bgc_checklist_id as bgc_checklist_id,\r\n"
					+ "dbo.fnGetCategoryNameById(category_id) as catName,\r\n"
					+ "dbo.fnGetSubCategoryNameById(subcategory_id) as subcatName,\r\n"
					+ "dbo.fnGetTaskStatusById(candidate_id) as taskStatus,status as status,\r\n"
					+ "dbo.fnGetBgcCandidateNameByCandidateId(candidate_id) as candidateName,dbo.fnGetBgcProfileNameById(profile_id) as profileName \r\n" + "from Tbl_CandidateBGCCheckList where candidate_id=" + candidate_Id + "";*/
			candidateList = (List<ContractsPanelDetails_DTO>) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(ContractsPanelDetails_DTO.class)).list();
		} catch (Exception e) {
			// logger.error("Error in UserDaoImpl Class getContrctsPanelDetailsById
			// Method"+e.getStackTrace());
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return candidateList;
	}
	
	@Override
	public List<ContractsPanelDetails_DTO> getContrctsPanelCandidateList(Integer bgc_id, Integer profile_Id) {
		List<ContractsPanelDetails_DTO> candidateList = null;
		Session session = null;
		try {
			session = sessfact.openSession();
			/*String sql = "select bgc_checklist_id as bgc_checklist_id,\r\n"
					+ "dbo.fnGetCategoryNameById(category_id) as catName,\r\n"
					+ "dbo.fnGetSubCategoryNameById(subcategory_id) as subcatName,\r\n"
					+ "dbo.fnGetTaskStatusById(candidate_id) as taskStatus,status as status,\r\n"
					+ "dbo.fnGetBgcCandidateNameByCandidateId(candidate_id) as candidateName,dbo.fnGetBgcProfileNameById(profile_id) as profileName \r\n" + "from Tbl_CandidateBGCCheckList where candidate_id=" + candidate_Id + "";*/
			
			String sql = "select b.bgc_checklist_id as bgc_checklist_id,\r\n" + 
					"dbo.fnGetCategoryNameById(b.category_id) as catName,\r\n" + 
					"dbo.fnGetSubCategoryNameById(b.subcategory_id) as subcatName,\r\n" + 
					"dbo.fnGetTaskStatusById(b.candidate_id) as taskStatus,b.status as status,\r\n" + 
					"dbo.fnGetBgcCandidateNameByCandidateId(b.candidate_id) as candidateName,\r\n" + 
					"dbo.fnGetBgcProfileNameById(b.profile_id) as profileName,b.candidate_status as  candidate_status,b.subcategory_id as subcategory_id, s.document_status as document_status \r\n" + 
					"from Tbl_CandidateBGCCheckList b,Tbl_SubCategoryMaster s where b.bgc_id="+bgc_id+" and\r\n" + 
					"s.subcategory_id=b.subcategory_id and s.subcategory_type=1";
			candidateList = (List<ContractsPanelDetails_DTO>) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(ContractsPanelDetails_DTO.class)).list();
		} catch (Exception e) {
			// logger.error("Error in UserDaoImpl Class getContrctsPanelDetailsById
			// Method"+e.getStackTrace());
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return candidateList;
	}
	@Override
	public CandidateBGCPersonalEntity getBGVCandidatePersonalDetailsById(Integer candidate_Id) {
		Session session = null;  
		CandidateBGCPersonalEntity catObj=null;
		try {
			session = sessfact.openSession();  
			String hql="from CandidateBGCPersonalEntity where candidate_id="+candidate_Id+"";
			catObj= (CandidateBGCPersonalEntity) session.createQuery(hql).uniqueResult();
		} catch (Exception e) {
			//logger.error("Error in UserDaoImpl Class getAllUserGroups Method"+e.getStackTrace());
			logger.info(e.getMessage(),e);
		}
		finally {
			session.close();}  
		return catObj;
	}
	@Override
	public CandidateBGCEducationEntity getBGVCandidateEducationDetailsById(Integer candidate_Id) {
		Session session = null;  
		CandidateBGCEducationEntity catObj=null;
		try {
			session = sessfact.openSession();  
			String hql="from CandidateBGCEducationEntity where candidate_id="+candidate_Id+"";
			catObj= (CandidateBGCEducationEntity) session.createQuery(hql).uniqueResult();
		} catch (Exception e) {
			//logger.error("Error in UserDaoImpl Class getAllUserGroups Method"+e.getStackTrace());
			logger.info(e.getMessage(),e);
		}
		finally {
			session.close();}  
		return catObj;
	}
	@Override
	public CandidateBGCEmploymentEntity getBGVCandidateEmploymentDetailsById(Integer candidate_Id) {
		Session session = null;  
		CandidateBGCEmploymentEntity catObj=null;
		try {
			session = sessfact.openSession();  
			String hql="from CandidateBGCEmploymentEntity where candidate_id="+candidate_Id+"";
			catObj= (CandidateBGCEmploymentEntity) session.createQuery(hql).uniqueResult();
		} catch (Exception e) {
			//logger.error("Error in UserDaoImpl Class getAllUserGroups Method"+e.getStackTrace());
			logger.info(e.getMessage(),e);
		}
		finally {
			session.close();}  
		return catObj;
	}
	
	@Override
	public String emailcheckInTempReg(String email_emp) {
		String email=null;
		Session session = null;  
		try { 
		session = sessfact.openSession();
		String sql="select email_id from Tbl_TemporaryCandidateDetails where email_id='"+email_emp+"'";
		email=(String) session.createSQLQuery(sql).uniqueResult();
		}catch (Exception e) {
			logger.info(e.getMessage(),e);
		}finally {
			session.close();
			} 
		return email;
	}
	@Override
	public TemporaryCandidateDetails checkLoginWithEmailId(String emailId, String password) {
		TemporaryCandidateDetails tempRegObj = null;
		Session session = null;
		try {
			session = sessfact.openSession();
			String encodedPwd = Base64.encode(password.getBytes());
			String sql = "from TemporaryCandidateDetails  where email_id='" + emailId + "' and password='"+encodedPwd+"'";
			tempRegObj = (TemporaryCandidateDetails) session.createQuery(sql).uniqueResult();

		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return tempRegObj;
	}
	@Override
	public TemporaryCandidateDetails getCandidateByCandidateEmailId(String email) {
		TemporaryCandidateDetails tempRegObj = null;
		Session session = null;
		try {
			session = sessfact.openSession();
			String sql = "from TemporaryCandidateDetails  where email_id='" + email + "'";
			tempRegObj = (TemporaryCandidateDetails) session.createQuery(sql).uniqueResult();

		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return tempRegObj;
	}
	@Override
	public String checkPasswordTempReg(String lgemailid, String currentPassword) {
		String message=null;
		Session session = null;  
		Transaction tx = null; 
		String   bytesCurrepwd = Base64.encode(currentPassword.getBytes());
		try {
			session = sessfact.openSession();  
			tx = session.beginTransaction();
			String sql="select email_id from TemporaryCandidateDetails  where email_id='"+lgemailid +"' and password='"+bytesCurrepwd+"'";
			message=(String) session.createQuery(sql).uniqueResult();
		}
		catch (Exception ex) {
			logger.info(ex.getMessage(), ex);
		}
		finally {
			session.close();}
		return message;
	}
	@Override
	public String changePasswordTempReg(String lgemailid, String confirmPassword) {
		String message=null;
		Session session = null;  
		Transaction tx = null; 
		String   bytesEncodepwd = Base64.encode(confirmPassword.getBytes());
		try {
			session = sessfact.openSession();  
			tx = session.beginTransaction();
			Query rs1=session.createQuery("Update TemporaryCandidateDetails set password='" +bytesEncodepwd+"'  where email_id='" + lgemailid + "'");
		    int i= rs1.executeUpdate();
				if(i>0){
					tx.commit();
					message = "success";
					}
				else {
					message = "Failed";
				} 
		}
		catch (Exception ex) {
			logger.info(ex.getMessage(), ex);
		}
		finally {
			session.close();
			}
		return message;
	}
	@Override
	public String resetPasswordTempReg(String emailId, String resetpass_word) {
		String message=null;
		Session session = null;  
		Transaction tx = null; 
		String   bytesEncodepwd = Base64.encode(resetpass_word.getBytes());
		try {
			session = sessfact.openSession();  
			tx = session.beginTransaction();
			Query rs1=session.createQuery("Update TemporaryCandidateDetails set password='" +bytesEncodepwd+"'  where email_id='" + emailId + "'");
		    int i= rs1.executeUpdate();
				if(i>0){
					tx.commit();
					message = "success";
					}
				else {
					message = "Failed";
				} 
		}
		catch (Exception ex) {
			logger.info(ex.getMessage(), ex);
		}
		finally {
			session.close();
			}
		return message;
	}
	@Override
	public Integer savePersonalDetails(CandidateBGCPersonalEntity personalDetailObj) {
		Session session = null;  
		Transaction tx = null;
		Integer personalId=0;
		try {
			session = sessfact.openSession();  
			tx = session.beginTransaction();
			personalId=(Integer) session.save(personalDetailObj);
		} catch (Exception e) {
			tx.rollback(); 
			//logger.error("Error in savePersonalDetails Method "+e.getStackTrace());
			logger.info(e.getMessage(),e);
		}
		finally {
			tx.commit();
			session.close();
			}
		return personalId;
	}
	@Override
	public void saveCandidateBGCAddressDetails(CandidateBGCAddressEntity candAddressObj) {
		Session session = null;  
		Transaction tx = null;
		try {
			session = sessfact.openSession();  
			tx = session.beginTransaction();
			session.save(candAddressObj);
		} catch (Exception e) {
			tx.rollback(); 
			logger.info(e.getMessage(),e);
		}
		finally {
			tx.commit();
			session.close();
		}
	}
	@Override
	public Integer saveEmploymentDetails(CandidateBGCEmploymentEntity employmentDetailObj) {
		Session session = null;  
		Transaction tx = null;
		Integer employmentId=0;
		try {
			session = sessfact.openSession();  
			tx = session.beginTransaction();
			employmentId=(Integer) session.save(employmentDetailObj);
		} catch (Exception e) {
			tx.rollback(); 
			//logger.error("Error in saveEmploymentDetails Method "+e.getStackTrace());
			logger.info(e.getMessage(),e);
		}
		finally {
			tx.commit();
			session.close();
			}
		return employmentId;
	}
	@Override
	public Integer saveEducationDetails(CandidateBGCEducationEntity educationDetailObj) {
		Session session = null;  
		Transaction tx = null;
		Integer educatioId=0;
		try {
			session = sessfact.openSession();  
			tx = session.beginTransaction();
			educatioId=(Integer) session.save(educationDetailObj);
		} catch (Exception e) {
			tx.rollback(); 
			//logger.error("Error in saveEmploymentDetails Method "+e.getStackTrace());
			logger.info(e.getMessage(),e);
		}
		finally {
			tx.commit();
			session.close();
			}
		return educatioId;
	}

	@Override
	public CandidateBGCAddressEntity getBGVCandidateAdressDetailsById(Integer contact_id) {
		Session session = null;  
		CandidateBGCAddressEntity catObj=null;
		try {
			session = sessfact.openSession();  
			String hql="from CandidateBGCAddressEntity where contact_id="+contact_id+"";
			catObj= (CandidateBGCAddressEntity) session.createQuery(hql).uniqueResult();
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		finally {
			session.close();}  
		return catObj;
	}
	@Override
	public void updateCandidateBGCAddressDetails(CandidateBGCAddressEntity updateCandAddressObj) {
		Session session = null;
		try {
			session = sessfact.openSession();
			Transaction tx = session.beginTransaction();
			session.update(updateCandAddressObj);
			tx.commit();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
	}
	@Override
	public List<CandidateBgvEmploymentDto> viewCandidateBgvEmploymentDetailsById(Integer candidate_id) {
		List<CandidateBgvEmploymentDto>  employmentDetailsList = null;
		Session session = null;
		try {
			session = sessfact.openSession();
			String sql ="select e.employment_id as employment_id, e.company_name as company_name,"
					+ "e.startedYear as startedYear, e.startedMonth as startedMonth, e.workedTillYear as workedTillYear, "
					+ "e.workedTillMonth as workedTillMonth , e.company_phone as company_phone, \r\n" + 
					"	e.positionheld as positionheld,e.reported_to_name as reported_to_name,e.reported_to_position as reported_to_position,\r\n" + 
					"	e.hr_name as hrmgr_name,e.employmentType as employmentType,e.contact_person_name as cpname,e.contact_person_email as cpemail,\r\n" + 
					"	e.contact_person_number as cpnumber,e.additional_contact_person_name as acpname,\r\n" + 
					"	e.additional_contact_person_pnumber as acpnumber,e.candidate_status as candidate_status,\r\n" + 
					"	a.contact_id as contact_id, a.line1 as line1, a.line2 as line2, a.city as city, a.state as state , a.zipcode as zipcode \r\n" + 
					"	from Tbl_BgvCandidateEmployment e,Tbl_bgv_CandidateAddressDetails a where e.employment_id=a.employment_id and e.candidate_id="+candidate_id+"";
			employmentDetailsList =  (List<CandidateBgvEmploymentDto>) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(CandidateBgvEmploymentDto.class)).list();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return employmentDetailsList;
	}
	@Override
	public CandidateBGCEmploymentEntity getBGVCandidateEmploymentDetailsByEmploymentId(Integer employment_id) {
		Session session = null;  
		CandidateBGCEmploymentEntity updateEmploymentDetailObj=null;
		try {
			session = sessfact.openSession();  
			String hql="from CandidateBGCEmploymentEntity where employment_id="+employment_id+"";
			updateEmploymentDetailObj= (CandidateBGCEmploymentEntity) session.createQuery(hql).uniqueResult();
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		finally {
			session.close();}  
		return updateEmploymentDetailObj;
	}
	@Override
	public void updateCandidateBGvEmploymentDetails(CandidateBGCEmploymentEntity updateEmploymentDetailObj) {
		Session session = null;
		try {
			session = sessfact.openSession();
			Transaction tx = session.beginTransaction();
			session.update(updateEmploymentDetailObj);
			tx.commit();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
	}
	@Override
	public List<CandidateBgvEducationDto> viewCandidateBgvEducationDetailsById(Integer candidate_id) {
		List<CandidateBgvEducationDto>  educationDetailsList = null;
		Session session = null;
		try {
			session = sessfact.openSession();
			String sql ="select education_id as education_id, college_name as college_name, \r\n" + 
					"	university_name as university_name, education_fromDate as education_fromDate,\r\n" + 
					"	education_toDate as education_toDate, course_Type as course_Type, student_id as student_id, \r\n" + 
					"	type_of_degree as type_of_degree, graduation as graduation , qualification as qualification,\r\n" + 
					"	candidate_status as candidate_status, major_subject as major_subject from Tbl_bgv_CandidateEducationalDetails where candidate_id="+candidate_id+"";
			educationDetailsList =  (List<CandidateBgvEducationDto>) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(CandidateBgvEducationDto.class)).list();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return educationDetailsList;
	}
		
	@Override
	public CandidateBGCPersonalDetailsDto viewCandidateBGCPersonalDetailsById(Integer candidate_id) {
		CandidateBGCPersonalDetailsDto  personalDetailsObj = null;
		Session session = null;
		try {
			session = sessfact.openSession();
			String sql ="Exec getCandidatePersonalDetails @candidateId="+candidate_id+"";
			personalDetailsObj =  (CandidateBGCPersonalDetailsDto) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(CandidateBGCPersonalDetailsDto.class)).uniqueResult();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return personalDetailsObj;
	}
	@Override
	public List<CandidateBGCAddressDetailsDto> getCandidateBGCAddressDetailsById(Integer personal_id) {
		List<CandidateBGCAddressDetailsDto> candidateBgcAddressList = null;
		Session session = null;
		try {
			session = sessfact.openSession();
			String sql = "select contact_id as contact_id, line1 as line1, line2 as line2, city as city, state as state , zipcode as zipcode, from_date as from_date, to_date as to_date, isCurrentAddress as isCurrentAddress,CONVERT(VARCHAR(10), submitted_on, 103) + ' '  + convert(VARCHAR(8), submitted_on, 14) as submitted_on from Tbl_bgv_CandidateAddressDetails where personal_id=" + personal_id + "";
			candidateBgcAddressList = (List<CandidateBGCAddressDetailsDto>) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(CandidateBGCAddressDetailsDto.class)).list();
		} catch (Exception e) {
			// logger.error("Error in UserDaoImpl Class getContrctsPanelDetailsById
			// Method"+e.getStackTrace());
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return candidateBgcAddressList;
   }
	@Override
	public void saveFormsHistory(FormsCommentsHistory commentHistory) {
		Session session = null;
		try {
			session = sessfact.openSession();
			Transaction tx = session.beginTransaction();
			session.save(commentHistory);
			tx.commit();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
	}
	@Override
	public void updatePersonalDetails(CandidateBGCPersonalEntity personalObj) {
		Session session = null;
		try {
			session = sessfact.openSession();
			Transaction tx = session.beginTransaction();
			session.update(personalObj);
			tx.commit();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
	}
	@Override
	public List<commentHistoryDto> viewpersonalhistory(Integer candidate_id,String formtype) {
		Session session = null;
		List<commentHistoryDto> commentHistoryList = null;
		try {
			session = sessfact.openSession();
			String sql = "SELECT comments as comments,comments_id as commentid, status as status,\r\n" + 
					"CONVERT(VARCHAR(10),submitted_date, 103) + ' '  + convert(VARCHAR(8), submitted_date, 14) as subdate,\r\n" + 
					"dbo.fnGetNameByEmpno(approved_by) as posted_by,dbo.fnGetBgcCandidateNameByCandidateId(candidate_id)  as candidatename \r\n" + 
					"FROM Tbl_BGVFormsCommentsHistory where candidate_id="+candidate_id+" and form_type='"+formtype+"'";
			commentHistoryList = (List<commentHistoryDto>) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(commentHistoryDto.class)).list();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return commentHistoryList;
	}
	@Override
	public void updateEducationDetails(CandidateBGCEducationEntity educationObj) {
		Session session = null;
		try {
			session = sessfact.openSession();
			Transaction tx = session.beginTransaction();
			session.update(educationObj);
			tx.commit();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
	}
	
	@Override
	public void updateEmploymentDetails(CandidateBGCEmploymentEntity employmentObj) {
		Session session = null;
		try {
			session = sessfact.openSession();
			Transaction tx = session.beginTransaction();
			session.update(employmentObj);
			tx.commit();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
	}
	
	@Override
	public String getEmploymentLastrowStatus(Integer candidate_id) {
		Session session = null;  
		String top1Status=null;
		try {
			session = sessfact.openSession(); 
			String hql="select top 1  approved_status from Tbl_BgvCandidateEmployment where candidate_id="+candidate_id+" order by employment_id desc";
			top1Status= (String) session.createSQLQuery(hql).uniqueResult();
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		finally {
			session.close();}  
		return top1Status;
	}
	
	
	@Override
	public ContractsPanelDetails_DTO getEducationLastrowDetails(Integer candidate_id) {
		Session session = null;  
		ContractsPanelDetails_DTO top1Status=null;
		try {
			session = sessfact.openSession(); 
			String hql="select top 1  approved_status,candidate_status from Tbl_bgv_CandidateEducationalDetails where candidate_id="+candidate_id+" order by education_id desc";
			top1Status= (ContractsPanelDetails_DTO) session.createSQLQuery(hql).setResultTransformer(new AliasToBeanResultTransformer(ContractsPanelDetails_DTO.class)).uniqueResult();
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		finally {
			session.close();}  
		return top1Status;
	}
	
	@Override
	public ContractsPanelDetails_DTO getEmploymentLastrowDetails(Integer candidate_id) {
		Session session = null;  
		ContractsPanelDetails_DTO top1Status=null;
		try {
			session = sessfact.openSession(); 
			String hql="select top 1  approved_status,candidate_status from Tbl_BgvCandidateEmployment where candidate_id="+candidate_id+" order by employment_id desc";
			top1Status= (ContractsPanelDetails_DTO) session.createSQLQuery(hql).setResultTransformer(new AliasToBeanResultTransformer(ContractsPanelDetails_DTO.class)).uniqueResult();
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		finally {
			session.close();}  
		return top1Status;
	}
	@Override
	public CandidateBGCEducationEntity getBGVCandidateEducationDetailsByEducationId(Integer education_Id) {
		Session session = null;  
		CandidateBGCEducationEntity updateEducationDetailObj=null;
		try {
			session = sessfact.openSession();  
			String hql="from CandidateBGCEducationEntity where education_id="+education_Id+"";
			updateEducationDetailObj= (CandidateBGCEducationEntity) session.createQuery(hql).uniqueResult();
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		finally {
			session.close();}  
		return updateEducationDetailObj;
	}
	@Override
	public Integer getEducationLastrowIdByCandidateId(Integer candidateid) {
		Session session = null;  
		Integer top1Id=null;
		try {
			session = sessfact.openSession(); 
			String hql="select top 1 education_id from Tbl_bgv_CandidateEducationalDetails where candidate_id="+candidateid+" order by education_id desc";
			top1Id= (Integer) session.createSQLQuery(hql).uniqueResult();
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		finally {
			session.close();}  
		return top1Id;
	}
	@Override
	public Integer getEmploymentLastrowIdByCandidateId(Integer candidateid) {
		Session session = null;  
		Integer top1Id=null;
		try {
			session = sessfact.openSession(); 
			String hql="select top 1 employment_id from Tbl_BgvCandidateEmployment where candidate_id="+candidateid+" order by employment_id desc";
			top1Id= (Integer) session.createSQLQuery(hql).uniqueResult();
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		finally {
			session.close();}  
		return top1Id;
	}
	@Override
	public Integer ceckBGCCandidateIdExists(int candidate_id) {
		Session session = null;  
		Integer top1Id=null;
		try {
			session = sessfact.openSession(); 
			String hql="select distinct candidate_id from Tbl_CandidateBGCDetails Where candidate_id="+candidate_id+" and status='Active'";
			top1Id= (Integer) session.createSQLQuery(hql).uniqueResult();
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		finally {
			session.close();}  
		return top1Id;
	}
	@Override
	public List<ProfileMasterDTO> getProfilesByCandidateId(Integer candidate_Id) {
		Session session = null;
		List<ProfileMasterDTO> candidateList = null;
		try {
			session = sessfact.openSession();
			String sql = "SELECT distinct pm.profile_id as profileid,pm.profile_name as profilename FROM Tbl_ProfileLableMaster pm \r\n" + 
					"	INNER JOIN Tbl_CandidateBGCDetails cd ON cd.profile_id = pm.profile_id and cd.candidate_id="+ candidate_Id + " order by pm.profile_name asc";
			candidateList = (List<ProfileMasterDTO>) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(ProfileMasterDTO.class)).list();
		} catch (Exception e) {
			// logger.error("Error in UserDaoImpl Class getProfilesByCandidateId
			// Method"+e.getStackTrace());
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return candidateList;
	}
	
	@Override
	public List<AssignedCandidateDto> getAssignedCandidatesList() {
		Session session = null;  
		List<AssignedCandidateDto> candiList=null;
		try {
			session = sessfact.openSession();  
			String sql="select candidate_id as candidate_id,full_name as full_name from Tbl_TemporaryCandidateDetails where candidate_id in\r\n" + 
					"(select distinct candidate_id from Tbl_CandidateBGCDetails)";
			candiList=(List<AssignedCandidateDto>) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(AssignedCandidateDto.class)).list();
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		finally {
			session.close();}  
		return candiList;
	}
	@Override
	public Integer getTop1ProfileIdByCandidate(Integer candidate_Id) {
		Session session = null;  
		Integer top1Id=null;
		try {
			session = sessfact.openSession(); 
			String hql="select top 1 bgc_id from Tbl_CandidateBGCDetails where candidate_id="+candidate_Id+" order by bgc_id desc";
			top1Id= (Integer) session.createSQLQuery(hql).uniqueResult();
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		finally {
			session.close();}  
		return top1Id;
	}
	@Override
	public List<DocumentTypeEntity> getDocumentTypeList() {
		Session session = null;  
		List<DocumentTypeEntity> doctypeList=null;
		try {
			session = sessfact.openSession();  
			String hql="from DocumentTypeEntity ORDER BY document_type ASC";
			doctypeList= session.createQuery(hql).list();
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		finally {
			session.close();}  
		return doctypeList;
	}
	@Override
	public List<DocEmpBean> candidateDocumentsByType(Integer candidate_Id, Integer document_Id) {
		Session session = null;  
		List<DocEmpBean> doctypeList=null;
		try {
			session = sessfact.openSession();  
			String sql="select f.file_id as document_id, f.file_name as file_name,\r\n" + 
					"dbo.fnGetBgcCandidateNameByCandidateId(f.candidate_id) as empName, \r\n" + 
					"dbo.fnGetBgcDocumentNameById(dm.documenttype_id) as filetype,\r\n" + 
					"convert(varchar(15),f.submitted_date,101) as submitted_on ,f.candidate_id  as candidate_id\r\n" + 
					"from  Tbl_SubCategoryMaster s join Tbl_CandidateBGCCheckList c on \r\n" + 
					"s.subcategory_id=c.subcategory_id join Tbl_BGCCheckListFileHistory f on \r\n" + 
					"c.bgc_checklist_id=f.bgc_checklist_id join DocumentTypeMaster dm on\r\n" + 
					"s.documenttype_id=dm.documenttype_id\r\n" + 
					"and s.documenttype_id="+document_Id+" and f.candidate_id="+candidate_Id+" order by f.file_id desc";
			doctypeList=(List<DocEmpBean>) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(DocEmpBean.class)).list();
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		finally {
			session.close();}  
		return doctypeList;
	}
	@Override
	public Integer savedocumentType(DocumentTypeEntity doctypeObj) {
		Session session = null;  
		Transaction tx = null;
		Integer id=0;
		try {
			session = sessfact.openSession();  
			tx = session.beginTransaction();
			id=(Integer)session.save(doctypeObj);
		} catch (Exception e) {
			tx.rollback(); 
			//logger.error("Error in saveCategory Method "+e.getStackTrace());
			logger.info(e.getMessage(),e);
		}
		finally {
			tx.commit();
			session.close();}
		return id;
	}
	@Override
	public DocumentTypeEntity getDocumentTypeById(Integer doc_id) {
		Session session = null;
		DocumentTypeEntity documentObj = null;
		try {
			session = sessfact.openSession();
			String hql = "from DocumentTypeEntity where documenttype_id=" + doc_id + "";
			documentObj = (DocumentTypeEntity) session.createQuery(hql).uniqueResult();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return documentObj;
	}
	@Override
	public void updateDocumentType(DocumentTypeEntity docObj) {
		Session session = null;
		try {
			session = sessfact.openSession();
			Transaction tx = session.beginTransaction();
			session.update(docObj);
			tx.commit();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
	}
	@Override
	public String checkDocumentType(String docname) {
		String doc_name=null;
		Session session = null;  
		try { 
		session = sessfact.openSession();
		String sql="Select distinct document_type from DocumentTypeMaster  where document_type='"+docname+"'";
		doc_name=(String) session.createSQLQuery(sql).uniqueResult();
		}catch (Exception e) {
			logger.info(e.getMessage(),e);
		}finally {
			session.close();
			} 
		return doc_name;
	}
	
	@Override
	public BGCCandidateFormsStatusEntity getBGCFormsStatusByCandidateId(Integer candidate_id) {
		Session session = null;  
		BGCCandidateFormsStatusEntity candformsStatusObj=null;
		try {
			session = sessfact.openSession();  
			String hql="from BGCCandidateFormsStatusEntity where candidate_id="+candidate_id+"";
			candformsStatusObj= (BGCCandidateFormsStatusEntity) session.createQuery(hql).uniqueResult();
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		finally {
			session.close();}  
		return candformsStatusObj;
	}
	
	@Override
	public void saveCandidateFormsStatusDetails(BGCCandidateFormsStatusEntity candformsStatusObj) {
		Session session = null;
		try {
			session = sessfact.openSession();
			Transaction tx = session.beginTransaction();
			session.save(candformsStatusObj);
			tx.commit();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
	}
	@Override
	public void updateCandidateFormsStatusDetails(BGCCandidateFormsStatusEntity candformsStatusDBObj) {
		Session session = null;
		try {
			session = sessfact.openSession();
			Transaction tx = session.beginTransaction();
			session.update(candformsStatusDBObj);
			tx.commit();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
	}
	
	
	@Override
	public CandidateBgvEmploymentDto getCandidateEmploymentDetailsByEmploymentId(Integer employment_id) {
		CandidateBgvEmploymentDto  employmentDetailsObj = null;
		Session session = null;
		try {
			session = sessfact.openSession();
			String sql ="select e.candidate_id as candidate_id, e.employment_id as employment_id, e.company_name as company_name,"
					+ "e.startedYear as startedYear, e.startedMonth as startedMonth, e.workedTillYear as workedTillYear, "
					+ "e.workedTillMonth as workedTillMonth , e.company_phone as company_phone, \r\n" + 
					"	e.positionheld as positionheld,e.reported_to_name as reported_to_name,e.reported_to_position as reported_to_position,\r\n" + 
					"	e.hr_name as hrmgr_name,e.employmentType as employmentType,e.contact_person_name as cpname,e.contact_person_email as cpemail,\r\n" + 
					"	e.contact_person_number as cpnumber,e.additional_contact_person_name as acpname,\r\n" + 
					"	e.additional_contact_person_pnumber as acpnumber,e.candidate_status as candidate_status,\r\n" + 
					"	a.contact_id as contact_id, a.line1 as line1, a.line2 as line2, a.city as city, a.state as state , a.zipcode as zipcode \r\n" + 
					"	from Tbl_BgvCandidateEmployment e,Tbl_bgv_CandidateAddressDetails a where e.employment_id=a.employment_id and e.employment_id="+employment_id+"";
			employmentDetailsObj =  (CandidateBgvEmploymentDto) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(CandidateBgvEmploymentDto.class)).uniqueResult();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return employmentDetailsObj;
	}
	@Override
	public void saveSubCategoryDocument(SubCategoryDocumentsEntity subCatDocObj) {
		Session session = null;
		try {
			session = sessfact.openSession();
			Transaction tx = session.beginTransaction();
			session.save(subCatDocObj);
			tx.commit();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
	}
	@Override
	public List<SubCategoryDocumentsEntity> viewSubCatDocListBySubCatId(Integer subCat_Id) {
		Session session = null;  
		List<SubCategoryDocumentsEntity> subCatDocList=null;
		try {
			session = sessfact.openSession();  
			String hql="from SubCategoryDocumentsEntity where subcat_id="+subCat_Id+"";
			subCatDocList= session.createQuery(hql).list();
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		finally {
			session.close();}  
		return subCatDocList;
	}
	@Override
	public SubCategoryDocumentsEntity getSubCatDocumentBySubCatId(Integer doc_id) {
		Session session = null;
		SubCategoryDocumentsEntity documentObj = null;
		try {
			session = sessfact.openSession();
			String hql = "from SubCategoryDocumentsEntity where doc_id=" + doc_id + "";
			documentObj = (SubCategoryDocumentsEntity) session.createQuery(hql).uniqueResult();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return documentObj;
	}
	@Override
	public void updateSubCatDocument(SubCategoryDocumentsEntity docObj) {
		Session session = null;
		try {
			session = sessfact.openSession();
			Transaction tx = session.beginTransaction();
			session.update(docObj);
			tx.commit();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
	}
	
	@Override
	public List<String> getSubcategoryDocuments(Integer subcatid) {
		Session session = null;  
		List<String> doclist=null;
		try {
			session = sessfact.openSession();  
			String hql="select distinct file_name from Tbl_SubCategoryDocuments where subcat_id="+subcatid+" and document_status='Active'";
			doclist= (List<String>) session.createSQLQuery(hql).list();
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		finally {
			session.close();}  
		return doclist;
	}
	@Override
	public CandidateBGCDetails getBGCDetailsByIds(Integer candidate_Id, Integer profile_Id) {
		Session session = null;  
		CandidateBGCDetails candiObj=null;
		try {
			session = sessfact.openSession();  
			String hql="from CandidateBGCDetails where candidate_id="+candidate_Id+" and profile_id="+profile_Id+" and status='Active'";
			candiObj= (CandidateBGCDetails) session.createQuery(hql).uniqueResult();
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
	//	and status='Active'
		finally {
			session.close();}  
		return candiObj;
	}
	@Override
	public List<Integer> getBGCIdsByCandidateIdProfileID(Integer candidate_Id, Integer profile_Id) {
		List<Integer> bgcidlist = null;
		Session session = null;
		try {
			session = sessfact.openSession();
			String sql = "select distinct bgc_id from Tbl_CandidateBGCDetails where profile_id=" + profile_Id
					+ " and candidate_id=" + candidate_Id + " and status='InActive'";
			bgcidlist = (List<Integer>) session.createSQLQuery(sql).list();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return bgcidlist;
	}
	
	@Override
	public Integer bgccheckDocumentTypeIssame(Integer docType_id) {
		Integer issame=null;
		Session session = null;  
		try { 
		session = sessfact.openSession();
		String sql="select distinct is_same from Tbl_SubCategoryMaster where category_id="+docType_id+"";
		issame=(Integer) session.createSQLQuery(sql).uniqueResult();
		}catch (Exception e) {
			logger.info(e.getMessage(),e);
		}finally {
			session.close();
			} 
		return issame;
	}
	@Override
	public Integer bgccheckDocumentTypeSubocTypeCount(Integer docType_id) {
		Integer docCount=null;
		Session session = null;  
		try { 
		session = sessfact.openSession();
		String sql="select count(*) as docCount from Tbl_SubCategoryMaster where category_id="+docType_id+"";
		docCount=(Integer) session.createSQLQuery(sql).uniqueResult();
		}catch (Exception e) {
			logger.info(e.getMessage(),e);
		}finally {
			session.close();
			} 
		return docCount;
	}
	
	@Override
	public List<DocumentTypeDto> viewSubCatDocListBySubCategories(Integer subCat_Id) {
		Session session = null;  
		List<DocumentTypeDto> subCatDocList=null;
		try {
			
			session = sessfact.openSession();  
			//String hql="from SubCategoryDocumentsEntity where subcat_id="+subCat_Id+"";
			String hql="select file_name,document_status as docStatus,document_id as doc_id,subcat_id,CONVERT(VARCHAR(10), submitted_date, 25) as submitted_date, [dbo].[fnGetNameByEmpno](posted_by) as posted_by from Tbl_SubCategoryDocuments where subcat_id="+subCat_Id+"";
			subCatDocList=(List<DocumentTypeDto>) session.createSQLQuery(hql).setResultTransformer(new AliasToBeanResultTransformer(DocumentTypeDto.class)).list();
			//subCatDocList= session.createQuery(hql).list();
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		finally {
			session.close();}  
		return subCatDocList;
	}
	@Override
	public String checkSubCategoryDocument(String originalFilename, Integer subcategoryId) {
		String filename=null;
		Session session = null;  
		try { 
		session = sessfact.openSession();
		String sql="select distinct file_name from Tbl_SubCategoryDocuments where file_name='"+originalFilename+"' and subcat_id="+subcategoryId+"";
		filename=(String) session.createSQLQuery(sql).uniqueResult();
		}catch (Exception e) {
			logger.info(e.getMessage(),e);
		}finally {
			session.close();
			} 
		return filename;
	}
}