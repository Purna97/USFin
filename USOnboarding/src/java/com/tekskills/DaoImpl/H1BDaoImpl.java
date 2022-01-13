package com.tekskills.DaoImpl;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.transform.AliasToBeanResultTransformer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.tekskills.Dao.H1BDao;
import com.tekskills.Dto.BasicDetailsDto;
import com.tekskills.Dto.ContractsPanelDetails_DTO;
import com.tekskills.Dto.DocumentHistoryDto;
import com.tekskills.Dto.DocumentTypeDto;
import com.tekskills.Dto.DocumentsDTO;
import com.tekskills.Dto.FormsRejectionDetailsDto;
import com.tekskills.Dto.H1BDetailsDto;
import com.tekskills.Dto.ImmicommentsDTO;
import com.tekskills.Dto.LCADetailsDto;
import com.tekskills.Dto.ProfileMasterDTO;
import com.tekskills.Dto.PublicBenefitsChecklistDTO;
import com.tekskills.Dto.commentHistoryDto;
import com.tekskills.Entity.CandidateH1BCheckList;
import com.tekskills.Entity.CandidateH1BInitiateDetailsEntity;
import com.tekskills.Entity.CandidateScannedDocumentsEntity;
import com.tekskills.Entity.ClientVendorQuestionnarieAddressEntity;
import com.tekskills.Entity.ClientVendorQuestionnarieEntity;
import com.tekskills.Entity.EmpDocumentsEntity;
import com.tekskills.Entity.EntryandExitDatesEntity;
import com.tekskills.Entity.FormsRejectionDetailsEntity;
import com.tekskills.Entity.H1BDetailsEntity;
import com.tekskills.Entity.H1BQuestionnariesEntity;
import com.tekskills.Entity.ImmiCandidateFormsStatusEntity;
import com.tekskills.Entity.ImmiCheckListCommentsHistory;
import com.tekskills.Entity.ImmiDocumentSubTypeEntity;
import com.tekskills.Entity.ImmiDocumentTypeEntity;
import com.tekskills.Entity.ImmiFormsCommentsHistoryEntity;
import com.tekskills.Entity.ImmiProfileLableMaster;
import com.tekskills.Entity.ImmiProfileMasterCheckList;
import com.tekskills.Entity.LCADetailsEntity;
import com.tekskills.Entity.PAFModifiedDocumentsEntity;
import com.tekskills.Entity.PublicBenefitsChecklistEntity;
import com.tekskills.Entity.SOCcodeMasterEntity;
import com.tekskills.Entity.TaskDetailsEntity;
import com.tekskills.Entity.TempClientVendorQuestionnarieAddressEntity;
import com.tekskills.Entity.TempClientVendorQuestionnarieEntity;
import com.tekskills.Entity.TempEntryandExitDatesEntity;
import com.tekskills.Entity.TempH1BQuestionnariesEntity;

@Repository
public class H1BDaoImpl implements H1BDao {
	private static final Logger logger = Logger.getLogger(H1BDaoImpl.class);
	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory sessfact;
	@Override
	public List<ImmiProfileLableMaster> getInitiateTemplateList() {
		Session session = null;  
		List<ImmiProfileLableMaster> profileList=null;
		try {
			session = sessfact.openSession();  
			String hql="from ImmiProfileLableMaster where profile_name not in('H4','H4 EAD') and status='Active' ORDER BY profile_name ASC";
			profileList= session.createQuery(hql).list();
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		finally {
			session.close();}  
		return profileList;
	}
	@Override
	public List<ImmiDocumentTypeEntity> getAllDocuments() {
		Session session = null;  
		List<ImmiDocumentTypeEntity> docList=null;
		try {
			session = sessfact.openSession();  
			String hql="from ImmiDocumentTypeEntity ORDER BY document_type ASC";
			docList= session.createQuery(hql).list();
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		finally {
			session.close();}  
		return docList;
	}
	@Override
	public List<DocumentsDTO> getSubDocumentList() {
		Session session = null;  
		List<DocumentsDTO> subcatList=null;
		try {
			session = sessfact.openSession();  
			String sql="select c.documenttype_id as document_id,s.subdocumenttype_id as subdocument_id,c.document_type as document_name,\r\n" + 
					"s.document_type as subdocument_name,s.issubycand as issubycand from ImmiDocumentTypeMaster c join ImmiDocumentSubTypeMaster s \r\n" + 
					"on c.documenttype_id=s.documenttype_id ORDER BY c.document_type ASC";
			subcatList=(List<DocumentsDTO>) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(DocumentsDTO.class)).list();
		} catch (Exception e) {
			//logger.error("Error in UserDaoImpl Class getAllUserGroups Method"+e.getStackTrace());
			logger.info(e.getMessage(),e);
		}
		finally {
			session.close();}  
		return subcatList;
	}
	@Override
	public String checkimmiprofilemaster(String profilename) {
		String profileid=null;
		Session session = null;  
		try { 
		session = sessfact.openSession();
		String sql="Select distinct profile_name from Tbl_ImmiProfileLableMaster  where profile_name='"+profilename+"'";
		profileid=(String) session.createSQLQuery(sql).uniqueResult();
		}catch (Exception e) {
			logger.info(e.getMessage(),e);
		}finally {
			session.close();
			} 
		return profileid;
	}
	@Override
	public List<ImmiDocumentSubTypeEntity> getSubDocumentsByDocidSubmittedByAdmin(Integer doc_id) {
		Session session = null;  
		List<ImmiDocumentSubTypeEntity> subcatList=null;
		try {
			session = sessfact.openSession();  
			String hql="from ImmiDocumentSubTypeEntity where documenttype_id="+doc_id+" and issubycand=0";
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
	public List<ImmiDocumentSubTypeEntity> getSubDocumentsByDocid(Integer doc_id) {
		Session session = null;  
		List<ImmiDocumentSubTypeEntity> subcatList=null;
		try {
			session = sessfact.openSession();  
			String hql="from ImmiDocumentSubTypeEntity where documenttype_id="+doc_id+"";
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
	public void saveImmiTemplateMaster(ImmiProfileMasterCheckList profileMasterObj) {
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
	public List<DocumentsDTO> getInitiatedTemplates() {
		Session session = null;  
		List<DocumentsDTO> profileList=null;
		try {
			session = sessfact.openSession();  
			String sql="Select distinct l.profile_name as profile_name,l.profile_id as profile_id,l.status as status from Tbl_ImmiProfileMasterCheckList c join Tbl_ImmiProfileLableMaster l on c.profile_id=l.profile_id";
			profileList=(List<DocumentsDTO>) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(DocumentsDTO.class)).list();
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
		String sql="Select profile_name from Tbl_ImmiProfileLableMaster  where profile_id="+profile_Id+"";
		profile_name=(String) session.createSQLQuery(sql).uniqueResult();
		}catch (Exception e) {
			logger.info(e.getMessage(),e);
		}finally {
			session.close();
			} 
		return profile_name;
	}
	@Override
	public List<ImmiProfileMasterCheckList> getProfileMasterListById(Integer profile_Id) {
		Session session = null;  
		List<ImmiProfileMasterCheckList> masterList=null;
		try {
			session = sessfact.openSession();  
			String hql="from ImmiProfileMasterCheckList where profile_id="+profile_Id+"";
			masterList=session.createQuery(hql).list();
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		finally {
			session.close();}  
		return masterList;
	}
	@Override
	public List<ProfileMasterDTO> getProfileListByProfileId(Integer profile_Id) {
		Session session = null;  
		List<ProfileMasterDTO> profileList=null;
		try {
			session = sessfact.openSession();  
			String sql="select cm.documenttype_id as categoryid,cm.document_type as category,sm.subdocumenttype_id as subcategoryid,\r\n" + 
					"sm.document_type as subcategory,pm.profile_id as profileid\r\n" + 
					"from Tbl_ImmiProfileMasterCheckList pm join ImmiDocumentSubTypeMaster sm  \r\n" + 
					"on pm.subcategory_id=sm.subdocumenttype_id join ImmiDocumentTypeMaster cm on\r\n" + 
					"cm.documenttype_id=sm.documenttype_id where pm.profile_id="+profile_Id+"";
			profileList=(List<ProfileMasterDTO>) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(ProfileMasterDTO.class)).list();
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		finally {
			session.close();}  
		return profileList;
	}
	@Override
	public List<ImmiProfileMasterCheckList> getProfileListByProfileSubcatId(Integer profileid, Integer subcatid) {
		Session session = null;  
		List<ImmiProfileMasterCheckList> candiObj=null;
		try {
			session = sessfact.openSession();  
			String hql="from ImmiProfileMasterCheckList where profile_id="+profileid+" and subcategory_id="+subcatid+"";
			candiObj= (List<ImmiProfileMasterCheckList>) session.createQuery(hql).list();
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		finally {
			session.close();}  
		return candiObj;
	}
	@Override
	public List<Integer> getSubCategoiesByProfileId(Integer profileid) {
		Session session = null; List<Integer> catList=null;
		try {
			session = sessfact.openSession();  
			String hql="select subcategory_id from Tbl_ImmiProfileMasterCheckList  where profile_id="+profileid+"";
			catList= session.createSQLQuery(hql).list();
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}finally {
			session.close();}  
		return catList;
	}
	@Override
	public void deleteMasterListById(Integer profileid, Integer scatid) {
		Session session = null;String msg="";
		try {
			session = sessfact.openSession();String stringQuery =null;
			Transaction tx = session.beginTransaction();
			if(scatid!=0 || scatid!=null) {
				 stringQuery = "DELETE FROM ImmiProfileMasterCheckList WHERE  subcategory_id="+scatid+" and profile_id = " + profileid;
			}else {
			 stringQuery = "DELETE FROM ImmiProfileMasterCheckList WHERE profile_id = " + profileid;
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
	public Integer getProfileTemplateIdByName(String profile_name) {
		Integer profile_id=null;
		Session session = null;  
		try { 
		session = sessfact.openSession(); 
		String sql="Select profile_id from Tbl_ImmiProfileLableMaster  where profile_name='"+profile_name+"'";
		profile_id=(Integer) session.createSQLQuery(sql).uniqueResult();
		}catch (Exception e) {
			logger.info(e.getMessage(),e);
		}finally {
			session.close();
			} 
		return profile_id;
	}
	@Override
	public Integer saveInitiateDetails(CandidateH1BInitiateDetailsEntity initiateObj) {
		Session session = null;	Transaction tx = null;Integer initiateid=0;	
		try {
			session = sessfact.openSession();  
			tx = session.beginTransaction();
			 initiateid=(Integer) session.save(initiateObj);
			 tx.commit();
		} catch (Exception e) {
			tx.rollback(); 
			logger.info(e.getMessage(),e);
		}
		finally {
			session.close();}
		return initiateid;
	}

	@Override
	public Integer saveCandidateH1BCheckList(CandidateH1BCheckList candchecklistObj) {
		Session session = null;	Transaction tx = null;Integer initiateid=0;	
		try {
			session = sessfact.openSession();  
			tx = session.beginTransaction();
			initiateid=(Integer) session.save(candchecklistObj);
		} catch (Exception e) {
			tx.rollback(); 
			logger.info(e.getMessage(),e);
		}
		finally {
			tx.commit();
			session.close();}
		return initiateid;
	}
	@Override
	public List<String> getDocumentNameByProfileId(Integer profileid) {
		
			Session session = null;  
			List<String> docNameList=null;
			try {
				session = sessfact.openSession();  
				String sql="select sm.document_type from Tbl_ImmiProfileMasterCheckList pm join ImmiDocumentSubTypeMaster sm  \r\n" + 
						"on pm.subcategory_id=sm.subdocumenttype_id join ImmiDocumentTypeMaster cm on\r\n" + 
						"cm.documenttype_id=sm.documenttype_id where pm.profile_id="+profileid+"";
				docNameList=session.createSQLQuery(sql).list();
			} catch (Exception e) {
				logger.info(e.getMessage(),e);
			}
			finally {
				session.close();}  
			return docNameList;
		}
	
	@Override
	public Integer getInitiateDetailsTopRow(Integer candidate_id) {
		Integer initiate_id=null;Session session = null;  
		try { 
		session = sessfact.openSession();
		String sql="Select top 1 initiate_id from Tbl_CandidateH1BInitiateDetails  where candidate_id="+candidate_id+" and status='Active'";
		initiate_id=(Integer) session.createSQLQuery(sql).uniqueResult();
		}catch (Exception e) {
			logger.info(e.getMessage(),e);
		}finally {
			session.close();
			} 
		return initiate_id;
	}
	@Override
	public CandidateH1BInitiateDetailsEntity getInitiateDetailsByInitiateId(Integer initiateId) {
		CandidateH1BInitiateDetailsEntity initiate_id=null;Session session = null;  
		try { 
		session = sessfact.openSession();
		String sql=" from CandidateH1BInitiateDetailsEntity where initiate_id="+initiateId+"";
		initiate_id=(CandidateH1BInitiateDetailsEntity) session.createQuery(sql).uniqueResult();
		}catch (Exception e) {
			logger.info(e.getMessage(),e);
		}finally {
			session.close();
			} 
		return initiate_id;
	}
	@Override
	public List<ContractsPanelDetails_DTO> getimmiDocsAdminList(Integer initiateId, int profile_id, Integer candidate_id) {
			List<ContractsPanelDetails_DTO> candidateList = null;
			Session session = null;
			try {
				session = sessfact.openSession();
			/*	String sql = "select b.h1b_checklist_id as h1b_checklist_id,d.document_type as catName,s.document_type as subcatName,s.documenttype_id as document_id,b.initiate_id as initiate_id,\r\n" + 
						"dbo.fnGetNameByCandidateId(b.candidate_id) as candidateName, pm.profile_name as profileName, b.candidate_id as candidateId,s.is_same as is_same\r\n" + 
						"from Tbl_CandidateH1BCheckList b join ImmiDocumentSubTypeMaster s on \r\n" + 
						"s.subdocumenttype_id=b.subdoctype_id join ImmiDocumentTypeMaster d on d.documenttype_id=s.documenttype_id\r\n" + 
						"join Tbl_ImmiProfileLableMaster pm on pm.profile_id=b.profile_id where s.issubycand=0 and b.candidate_id="+candidate_id+"";			*/
				String sql="select distinct b.documenttype_id as document_id,(select distinct is_same from ImmiDocumentSubTypeMaster where documenttype_id=b.documenttype_id) as is_same,"
						+ "d.document_type as catName,b.initiate_id as initiate_id,b.profile_type as profile_type,b.profile_id as profile_id,\r\n" + 
						"dbo.fnGetNameByCandidateId(b.candidate_id) as candidateName, pm.profile_name as profileName, b.candidate_id as candidateId,b.verifier_status as approved_status,b.printed_status as printed_status\r\n" + 
						"from Tbl_CandidateH1BCheckList b  join ImmiDocumentTypeMaster d on d.documenttype_id=b.documenttype_id\r\n" + 
						"join ImmiDocumentSubTypeMaster s on s.documenttype_id=d.documenttype_id\r\n" + 
						"join Tbl_ImmiProfileLableMaster pm on pm.profile_id=b.profile_id where b.candidate_id="+candidate_id+" and b.initiate_id="+initiateId+" and s.issubycand=0";
				candidateList = (List<ContractsPanelDetails_DTO>) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(ContractsPanelDetails_DTO.class)).list();
				System.out.println("getimmiDocsAdminList/////////"+sql);
			} catch (Exception e) {
				logger.info(e.getMessage(), e);
			} finally {
				session.close();
			}
			return candidateList;
		}
	
	@Override
	public List<ContractsPanelDetails_DTO> getimmiDocsCandidateList(Integer initiateId, int profile_id, Integer candidate_id) {
		List<ContractsPanelDetails_DTO> candidateList = null;
		Session session = null;
		try {
			session = sessfact.openSession();
		/*	String sql = "select b.h1b_checklist_id as h1b_checklist_id,d.document_type as catName,s.document_type as subcatName,s.documenttype_id as document_id,b.initiate_id as initiate_id,\r\n" + 
					"dbo.fnGetNameByCandidateId(b.candidate_id) as candidateName, pm.profile_name as profileName, b.candidate_id as candidateId,s.is_same as is_same\r\n" + 
					"from Tbl_CandidateH1BCheckList b join ImmiDocumentSubTypeMaster s on \r\n" + 
					"s.subdocumenttype_id=b.subdoctype_id join ImmiDocumentTypeMaster d on d.documenttype_id=s.documenttype_id\r\n" + 
					"join Tbl_ImmiProfileLableMaster pm on pm.profile_id=b.profile_id where s.issubycand=1 and b.candidate_id="+candidate_id+"";		*/
			String sql="select distinct b.documenttype_id as document_id,(select distinct is_same from ImmiDocumentSubTypeMaster where documenttype_id=b.documenttype_id) as is_same,"
					+ "d.document_type as catName,b.initiate_id as initiate_id,b.candidate_status as candidate_status,b.profile_type as profile_type,b.profile_id as profile_id,\r\n" + 
					"dbo.fnGetNameByCandidateId(b.candidate_id) as candidateName, pm.profile_name as profileName, b.candidate_id as candidateId,b.verifier_status as approved_status,b.printed_status as printed_status\r\n" + 
					"from Tbl_CandidateH1BCheckList b  join ImmiDocumentTypeMaster d on d.documenttype_id=b.documenttype_id\r\n" + 
					"join ImmiDocumentSubTypeMaster s on s.documenttype_id=d.documenttype_id\r\n" + 
					"join Tbl_ImmiProfileLableMaster pm on pm.profile_id=b.profile_id where b.candidate_id="+candidate_id+" and b.initiate_id="+initiateId+" and b.profile_type!='Kids' and s.issubycand=1";
			candidateList = (List<ContractsPanelDetails_DTO>) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(ContractsPanelDetails_DTO.class)).list();
		System.out.println("getimmiDocsCandidateList******"+sql);
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return candidateList;
	}
	@Override
	public ImmiCandidateFormsStatusEntity getFormStatusByType(Integer candidate_id, String formtype,Integer initiateId) {
		ImmiCandidateFormsStatusEntity formstatusObj=null;
		Session session = null;  
		try { 
		session = sessfact.openSession(); 
		String sql="from ImmiCandidateFormsStatusEntity  where candidate_id="+candidate_id+" and form_type='"+formtype+"' and initiate_id="+initiateId+"";
		formstatusObj=(ImmiCandidateFormsStatusEntity) session.createQuery(sql).uniqueResult();
		}catch (Exception e) {
			logger.info(e.getMessage(),e);
		}finally {
			session.close();
			} 
		return formstatusObj;
	}
	
	@Override
	public String getinitiateTopName(Integer candidate_id) {
		String initiate_name=null;Session session = null;  
		try { 
		session = sessfact.openSession();
		String sql="select top 1 l.profile_name from Tbl_CandidateH1BInitiateDetails i join Tbl_ImmiProfileLableMaster l on i.profile_id=l.profile_id and i.candidate_id="+candidate_id+" order by initiate_id desc ";
		initiate_name=(String) session.createSQLQuery(sql).uniqueResult();
		}catch (Exception e) {
			logger.info(e.getMessage(),e);
		}finally {
			session.close();
			} 
		return initiate_name;
	}
	//By Purna
	@Override
	public List<PublicBenefitsChecklistEntity> getPublicBenefitsSizeByCanId(Integer candidateid) {
		Session session = null;  
		List<PublicBenefitsChecklistEntity> pbclist=null;
		try {
			session = sessfact.openSession();  
			String hql="from PublicBenefitsChecklistEntity where candidate_id="+candidateid+"";
			pbclist= session.createQuery(hql).list();
		} catch (Exception e) {
			//logger.error("Error in UserDaoImpl Class getAllUserGroups Method"+e.getStackTrace());
			logger.info(e.getMessage(),e);
		}
		finally {
			session.close();}  
		return pbclist;
	}
	@Override
	public PublicBenefitsChecklistEntity getPublicBenefitsApplicantTypeCanId(Integer candidateid, String beneficiary_type, int initiateId) {
		Session session = null;  
		PublicBenefitsChecklistEntity pbcObj=null;
		try {
			session = sessfact.openSession();  
			String hql="from PublicBenefitsChecklistEntity where candidate_id="+candidateid+" and beneficiary_type='"+beneficiary_type+"'and initiate_id="+initiateId+"";
			pbcObj= (PublicBenefitsChecklistEntity) session.createQuery(hql).uniqueResult();
		} catch (Exception e) {
			//logger.error("Error in UserDaoImpl Class getAllUserGroups Method"+e.getStackTrace());
			logger.info(e.getMessage(),e);
		}
		finally {
			session.close();}  
		return pbcObj;
	}
	@Override
	public Integer savepublicbenefits(PublicBenefitsChecklistEntity benefits) {
		
		Session session = null;
		Integer savebenefits = null;
		try {
			session = sessfact.openSession();
			Transaction tx = session.beginTransaction();
			savebenefits = (Integer) session.save(benefits);
			tx.commit();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
	
		return savebenefits;
	}
	@Override
	public void updatepublicbenefits(PublicBenefitsChecklistEntity benefits) {
		Session session = null;
		try {
			session = sessfact.openSession();
			Transaction tx = session.beginTransaction();
			session.update(benefits);
			 tx.commit();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}

	}
	@Override
	public Integer saveImmiFormsStatus(ImmiCandidateFormsStatusEntity formsobj) {

		Session session = null;
		Integer formstauts = null;
		try {
			session = sessfact.openSession();
			Transaction tx = session.beginTransaction();
			formstauts = (Integer) session.save(formsobj);
			tx.commit();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
	
		return formstauts;
	
	}
	

	@Override
	public ImmiCandidateFormsStatusEntity getFormsSatusByCandidateId(Integer candidateId, String form_type, int initiateId) {
		ImmiCandidateFormsStatusEntity formsObj=null;
		Session session = null;  
		try { 
		session = sessfact.openSession();
		String sql="from ImmiCandidateFormsStatusEntity  where candidate_id="+candidateId+" and form_type='"+form_type+"' and initiate_id="+initiateId+"";
		formsObj=(ImmiCandidateFormsStatusEntity) session.createQuery(sql).uniqueResult();
		}catch (Exception e) {
			logger.info(e.getMessage(),e);
		}finally {
			session.close();
			} 
		return formsObj;
	}
	@Override
	public void updateFormsStatus(ImmiCandidateFormsStatusEntity formstatus) {
		Session session = null;
		try {
			session = sessfact.openSession();
			Transaction tx = session.beginTransaction();
             session.update(formstatus);
			tx.commit();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		
	}
	@Override
	public List<ImmicommentsDTO> viewCommentHistoryBycandId(Integer cand_Id, String form_type) {
		Session session = null;
		List<ImmicommentsDTO> commentHistoryList = null;
		try {
			session = sessfact.openSession();
			
			String sql="select c.status_id as statusid,c.candidate_id as candidate_id,c.status as status,c.comments as comments, c.submitted_by as submitted_by,\r\n" + 
					"dbo.fnGetNameByCandidateId(c.submitted_by) as submittedby_name, convert(varchar,c.submitted_date,25) as submitted_date \r\n" + 
					"from Tbl_ImmiFormsCommentsHistory c join Immi_CandidateFormsStatus s on c.status_id=s.status_id\r\n" + 
					" where c.candidate_id="+cand_Id+" and s.form_type='"+form_type+"'";
			commentHistoryList = (List<ImmicommentsDTO>) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(ImmicommentsDTO.class)).list();
			}catch (Exception e) {
				logger.info(e.getMessage(),e);
			}finally {
				session.close();
				} 
			return commentHistoryList;
	}
	
	@Override
	public void saveImmiComments(ImmiFormsCommentsHistoryEntity cmntHistory) {
		Session session = null;
		try {
			session = sessfact.openSession();
			Transaction tx = session.beginTransaction();
			session.save(cmntHistory);
			 tx.commit();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		
	}
	@Override
	public H1BDetailsDto getLcaTopRecord() {
		H1BDetailsDto lcaObj = null;
			Session session = null;
			try {String sql =null;
				session = sessfact.openSession();
					sql = "select top 1 h1b_id,h1b_reference from Tbl_H1BDetails order by h1b_id desc";
					lcaObj =(H1BDetailsDto) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(H1BDetailsDto.class)).uniqueResult();
					
			} catch (Exception e) {
				logger.info(e.getMessage(), e);
			} finally {
				session.close();
			}
			return lcaObj;
		}
	@Override
	public Integer saveH1BDetails(H1BDetailsEntity h1oBj) {
		Session session = null;
		Integer h1bId = null;
		try {
			session = sessfact.openSession();
			Transaction tx = session.beginTransaction();
			h1bId = (Integer) session.save(h1oBj);
			tx.commit();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return h1bId;
	}
	
	
	@Override
	public Integer saveH1bQuestionnaries(H1BQuestionnariesEntity h1bqueApplObj) {
		Session session = null;  
		Transaction tx = null;
		Integer id=0;
		try {
			session = sessfact.openSession();  
			tx = session.beginTransaction();
			id=(Integer)session.save(h1bqueApplObj);
		} catch (Exception e) {
			tx.rollback(); 
			logger.info(e.getMessage(),e);
		}
		finally {
			tx.commit();
			session.close();}
		return id;
	}
	@Override
	public void saveH1bEntryExitDetails(EntryandExitDatesEntity h1bObj) {
		Session session = null;  
		Transaction tx = null;
		try {
			session = sessfact.openSession();  
			tx = session.beginTransaction();
			session.save(h1bObj);
		} catch (Exception e) {
			tx.rollback(); 
			logger.info(e.getMessage(),e);
		}
		finally {
			tx.commit();
			session.close();}
	}
	@Override
	public Integer saveClientVendorLetterQuestionnaire(ClientVendorQuestionnarieEntity cvlqueObj) {
		Session session = null;  
		Transaction tx = null;
		Integer id=0;
		try {
			session = sessfact.openSession();  
			tx = session.beginTransaction();
			id=(Integer)session.save(cvlqueObj);
		} catch (Exception e) {
			tx.rollback(); 
			logger.info(e.getMessage(),e);
		}
		finally {
			tx.commit();
			session.close();}
		return id;
	}
	@Override
	public void saveClientVendorLetterQuestionnaireAddress(ClientVendorQuestionnarieAddressEntity cvlAddressObj) {
		Session session = null;  
		Transaction tx = null;
		try {
			session = sessfact.openSession();  
			tx = session.beginTransaction();
			session.save(cvlAddressObj);
		} catch (Exception e) {
			tx.rollback(); 
			logger.info(e.getMessage(),e);
		}
		finally {
			tx.commit();
			session.close();}
	}
	@Override
	public void saveFormsStatus(ImmiCandidateFormsStatusEntity formStatusObj) {
		Session session = null;  
		Transaction tx = null;
		try {
			session = sessfact.openSession();  
			tx = session.beginTransaction();
			session.save(formStatusObj);
		} catch (Exception e) {
			tx.rollback(); 
			logger.info(e.getMessage(),e);
		}
		finally {
			tx.commit();
			session.close();}
	}
	@Override
	public ClientVendorQuestionnarieEntity getClientVendorLetterQuestionarieById(Integer candidateid, int initiateId) {
		ClientVendorQuestionnarieEntity cvlqObj = null;
		Session session = null;
		try {
			session = sessfact.openSession();
			String sql = "from ClientVendorQuestionnarieEntity where candidate_id="+candidateid+" and initiate_id="+initiateId+"";
			cvlqObj = (ClientVendorQuestionnarieEntity) session.createQuery(sql).uniqueResult();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return cvlqObj;
	}
	@Override
	public List<ClientVendorQuestionnarieAddressEntity> getClientVendorLetterQuestionarieAddressesById(Integer candidateid, Integer clientid) {
		Session session = null;  
		List<ClientVendorQuestionnarieAddressEntity> cvladdrList=null;
		try {
			session = sessfact.openSession();  
			String hql=null;
            if(candidateid!=0) {
				hql="from ClientVendorQuestionnarieAddressEntity where candidate_id="+candidateid+" and client_id="+clientid+" and company_type!='End Client'";
			}else {
				hql="from ClientVendorQuestionnarieAddressEntity where client_id="+clientid+" and company_type!='End Client'";
			}cvladdrList= session.createQuery(hql).list();
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		finally {
			session.close();}  
		return cvladdrList;
	}
	@Override
	public ClientVendorQuestionnarieAddressEntity getClientVendorQuestionnarieAddressById(Integer otheraddress_id) {
		ClientVendorQuestionnarieAddressEntity cvlqObj = null;
		Session session = null;
		try {
			session = sessfact.openSession();
			String sql = "from ClientVendorQuestionnarieAddressEntity where address_id="+otheraddress_id+"";
			cvlqObj = (ClientVendorQuestionnarieAddressEntity) session.createQuery(sql).uniqueResult();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return cvlqObj;
	}
	@Override
	public void updateClientVendorLetterQuestionnaireAddress(ClientVendorQuestionnarieAddressEntity cvlAddressObj) {
		Session session = null;
		try {
			session = sessfact.openSession();
			Transaction tx = session.beginTransaction();
			session.update(cvlAddressObj);
			tx.commit();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
	}
	@Override
	public ClientVendorQuestionnarieEntity getClientVendorQuestionnarieById(Integer clientid) {
		ClientVendorQuestionnarieEntity cvlqObj = null;
		Session session = null;
		try {
			session = sessfact.openSession();
			String sql = "from ClientVendorQuestionnarieEntity where client_id="+clientid+"";
			cvlqObj = (ClientVendorQuestionnarieEntity) session.createQuery(sql).uniqueResult();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return cvlqObj;
	}
	@Override
	public ClientVendorQuestionnarieAddressEntity getClientVendorQuestionnarieByClientIdType(int clientid, String clientType) {
		ClientVendorQuestionnarieAddressEntity cvlqObj = null;
		Session session = null;
		try {
			session = sessfact.openSession();
			String sql = "from ClientVendorQuestionnarieAddressEntity where client_id="+clientid+" and company_type='"+clientType+"'";
			cvlqObj = (ClientVendorQuestionnarieAddressEntity) session.createQuery(sql).uniqueResult();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return cvlqObj;
	}
	@Override
	public void updateClientVendorLetterQuestionnaire(ClientVendorQuestionnarieEntity cvlqueObj) {
		Session session = null;
		try {
			session = sessfact.openSession();
			Transaction tx = session.beginTransaction();
			session.update(cvlqueObj);
			tx.commit();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
	}
	@Override
	public H1BQuestionnariesEntity getH1BQuestionnariesByType(Integer candidateid, String beneficiaryType, int initiateId) {
		H1BQuestionnariesEntity cvlqObj = null;
		Session session = null;
		try {
			session = sessfact.openSession();
			String sql = "from H1BQuestionnariesEntity where candidate_id="+candidateid+" and applicant_type='"+beneficiaryType+"'and initiate_id="+initiateId+"";
			cvlqObj = (H1BQuestionnariesEntity) session.createQuery(sql).uniqueResult();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return cvlqObj;
	}
	@Override
	public List<H1BQuestionnariesEntity> getH1BQuestionnariesByChild(Integer candidateid, String beneficiaryType, int initiateId) {
		List<H1BQuestionnariesEntity> cvlqObj = null;
		Session session = null;
		try {
			session = sessfact.openSession();
			String sql = "from H1BQuestionnariesEntity where candidate_id="+candidateid+" and applicant_type='"+beneficiaryType+"' and initiate_id="+initiateId+"";
			cvlqObj = (List<H1BQuestionnariesEntity>) session.createQuery(sql).list();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return cvlqObj;
	}
	@Override
	public List<EntryandExitDatesEntity> getentryexitList(Integer candidateid, String beneficiaryType, int h1queid) {
		List<EntryandExitDatesEntity> cvlqObj = null;
		Session session = null;
		try {
			session = sessfact.openSession();
			//String sql = "from EntryandExitDatesEntity where candidate_id="+candidateid+" and beneficiary_type='"+beneficiaryType+"' and h1questionnrie_id="+h1queid+"";
			String sql = "from EntryandExitDatesEntity where  h1questionnrie_id="+h1queid+"";
			cvlqObj = (List<EntryandExitDatesEntity>) session.createQuery(sql).list();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return cvlqObj;
	}
	@Override
	public H1BQuestionnariesEntity getH1BQuestionnarieDetailsById(Integer applh1queid) {
		H1BQuestionnariesEntity h1bObj = null;
		Session session = null;
		try {
			session = sessfact.openSession();
			String sql = "from H1BQuestionnariesEntity where h1questionnrie_id="+applh1queid+"";
			h1bObj = (H1BQuestionnariesEntity) session.createQuery(sql).uniqueResult();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return h1bObj;
	}
	@Override
	public void updateH1bQuestionnaries(H1BQuestionnariesEntity h1bqueApplObj) {
		Session session = null;
		try {
			session = sessfact.openSession();
			Transaction tx = session.beginTransaction();
			session.update(h1bqueApplObj);
			tx.commit();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
	}
	@Override
	public EntryandExitDatesEntity getEntryandExitDatesDetailsById(Integer applEntryid) {
		EntryandExitDatesEntity entryexitObj = null;
		Session session = null;
		try {
			session = sessfact.openSession();
			String sql = "from EntryandExitDatesEntity where dates_id="+applEntryid+"";
			entryexitObj = (EntryandExitDatesEntity) session.createQuery(sql).uniqueResult();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return entryexitObj;
	}
	@Override
	public void updateH1bEntryExitDetails(EntryandExitDatesEntity h1bObj) {
		Session session = null;
		try {
			session = sessfact.openSession();
			Transaction tx = session.beginTransaction();
			session.update(h1bObj);
			tx.commit();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
	}
	@Override
	public List<EntryandExitDatesEntity> getentryexitListById(Integer h1queid) {
		List<EntryandExitDatesEntity> cvlqObj = null;
		Session session = null;
		try {
			session = sessfact.openSession();
			String sql = "from EntryandExitDatesEntity where h1questionnrie_id="+h1queid+"";
			cvlqObj = (List<EntryandExitDatesEntity>) session.createQuery(sql).list();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return cvlqObj;
	}
	@Override
	public H1BDetailsEntity getH1BDetailsById(Integer h1b_id) {
		H1BDetailsEntity h1bObj = null;
		Session session = null;
		try {
			session = sessfact.openSession();
			String sql = "from H1BDetailsEntity where h1b_id="+h1b_id+"";
			h1bObj = (H1BDetailsEntity) session.createQuery(sql).uniqueResult();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return h1bObj;
	}
	
	@Override
	public List<DocumentTypeDto> getimmiSubDocumentByDocTypeId(Integer candidate_id, Integer doctypeid,
			Integer intiate_id) {
		List<DocumentTypeDto> subDocTypeList = null;
		Session session = null;
		try {
			session = sessfact.openSession();
		/*	String sql = "select b.h1b_checklist_id as h1b_checklist_id,d.document_type as catName,s.document_type as subcatName,s.documenttype_id as document_id,b.initiate_id as initiate_id\r\n" + 
					",dbo.fnGetNameByCandidateId(b.candidate_id) as candidateName, pm.profile_name as profileName, b.candidate_id as candidateId ,s.is_same as is_same,b.subdoctype_id as subcategory_id\r\n" + 
					"from Tbl_CandidateH1BCheckList b join ImmiDocumentSubTypeMaster s on s.subdocumenttype_id=b.subdoctype_id join\r\n" + 
					"ImmiDocumentTypeMaster d on d.documenttype_id=s.documenttype_id join Tbl_ImmiProfileLableMaster pm on pm.profile_id=b.profile_id \r\n" + 
					"where s.issubycand=0 and b.candidate_id="+candidate_id+" and b.initiate_id="+intiate_id+" and b.documenttype_id="+doctypeid+"";		*/
			String sql="select b.subdoctype_id as subdoctypeid,s.document_type as subdoctypename\r\n" + 
					"from Tbl_CandidateH1BCheckList b join ImmiDocumentSubTypeMaster s on s.subdocumenttype_id=b.subdoctype_id join\r\n" + 
					"ImmiDocumentTypeMaster d on d.documenttype_id=s.documenttype_id where s.issubycand=0 and"
					+ " b.candidate_id="+candidate_id+" and b.initiate_id="+intiate_id+" and b.documenttype_id="+doctypeid+"";
			subDocTypeList = (List<DocumentTypeDto>) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(DocumentTypeDto.class)).list();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return subDocTypeList;
	}
	@Override
	public Integer getCheckListIdByids(Integer candidate_id, Integer doctypeid, Integer intiate_id,
			Integer subdoctypeid, Integer profile_id, String bentype, Integer questionnarieId) {
		Integer chklistid=null;Session session = null;  
		try { 
			String sql = null; 
		session = sessfact.openSession();
		if(questionnarieId>0) {
			sql="select h1b_checklist_id from Tbl_CandidateH1BCheckList where candidate_id="+candidate_id+" "
					+ "and initiate_id="+intiate_id+" and documenttype_id="+doctypeid+" and subdoctype_id="+subdoctypeid+" and profile_id="+profile_id+" and profile_type='"+bentype+"' and questionnarie_childid="+questionnarieId+"";
		}else {
		sql="select h1b_checklist_id from Tbl_CandidateH1BCheckList where candidate_id="+candidate_id+" "
				+ "and initiate_id="+intiate_id+" and documenttype_id="+doctypeid+" and subdoctype_id="+subdoctypeid+" and profile_id="+profile_id+" and profile_type='"+bentype+"'";
		
		}
		System.out.println("chklistid*********"+sql);
		chklistid=(Integer) session.createSQLQuery(sql).uniqueResult();
		}catch (Exception e) {
			
			
			logger.info(e.getMessage(),e);
		}finally {
			session.close();
			} 
		return chklistid;
	}
	@Override
	public CandidateH1BInitiateDetailsEntity getInitiateDetailsByCandidateId(Integer candidateid) {
		CandidateH1BInitiateDetailsEntity initiateObj=null;Session session = null;  
		try { 
		session = sessfact.openSession();
		String sql=" from CandidateH1BInitiateDetailsEntity where candidate_id="+candidateid+" and status='Active'";
		initiateObj=(CandidateH1BInitiateDetailsEntity) session.createQuery(sql).uniqueResult();
		}catch (Exception e) {
			logger.info(e.getMessage(),e);
		}finally {
			session.close();
			} 
		return initiateObj;
	}
	@Override
	public List<PublicBenefitsChecklistEntity> getPublicBenefitsKidsApplicantTypeCanId(Integer candidateid,String beneficiaryType, int initiateId) {
		List<PublicBenefitsChecklistEntity> cvlqObj = null;
		Session session = null;
		try {
			session = sessfact.openSession();
			String sql = "from PublicBenefitsChecklistEntity where candidate_id="+candidateid+" and beneficiary_type='"+beneficiaryType+"' and initiate_id="+initiateId+"";
			cvlqObj = (List<PublicBenefitsChecklistEntity>) session.createQuery(sql).list();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return cvlqObj;
	}
	@Override
	public PublicBenefitsChecklistEntity getPublicBenefitsApplicantTypeBenifitId(Integer benfitid) {
		Session session = null;  
		PublicBenefitsChecklistEntity pbcObj=null;
		try {
			session = sessfact.openSession();  
			String hql="from PublicBenefitsChecklistEntity where benefits_id="+benfitid+"";
			pbcObj= (PublicBenefitsChecklistEntity) session.createQuery(hql).uniqueResult();
		} catch (Exception e) {
			//logger.error("Error in UserDaoImpl Class getAllUserGroups Method"+e.getStackTrace());
			logger.info(e.getMessage(),e);
		}
		finally {
			session.close();}  
		return pbcObj;
	}
	@Override
	public List<PublicBenefitsChecklistDTO> getPublicBenefitByCanId(Integer candidateid, int intiate_id) {
		Session session = null;  
		List<PublicBenefitsChecklistDTO> allpbcList=null;
		try {
			session = sessfact.openSession();  
			String sql="select p.benefits_id as benefits_id,p.beneficiary_type as beneficiary_type,h.first_name as beneficiary_Name,\r\n" + 
					"p.income_maintenance as income_maintenance,p.ssi as ssi, p.tanf as tanf,p.ga as ga,p.snap as snap,\r\n" + 
					"p.housing_assistance as housing_assistance,p.project_rental_assistance as project_rental_assistance,p.public_housing_act as public_housing_act,\r\n" + 
					"p.ffm_medicalemergency as ffm_medicalemergency,p.ffm_ideact as ffm_ideact,p.ffm_schoolbenefits as ffm_schoolbenefits,p.ffm_uderage21 as ffm_uderage21,\r\n" + 
					"p.ffm_pregnant_period60 as ffm_pregnant_period60,p.status as pbcstatus\r\n" + 
					"from Tbl_PublicBenefitsChecklist p join Tbl_H1BQuestionnaries h on h.h1questionnrie_id=p.h1questionnrie_id"
					+ " where  p.candidate_id="+candidateid+" and p.initiate_id="+intiate_id+"";
			allpbcList=(List<PublicBenefitsChecklistDTO>) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(PublicBenefitsChecklistDTO.class)).list();
		} catch (Exception e) {
			//logger.error("Error in UserDaoImpl Class getAllUserGroups Method"+e.getStackTrace());
			logger.info(e.getMessage(),e);
		}
		finally {
			session.close();}  
		return allpbcList;
	}
	@Override
	public CandidateH1BInitiateDetailsEntity getCandidateH1BInitiateDetailsById(Integer candidate_id) {
		Session session = null;  
		CandidateH1BInitiateDetailsEntity initateDto=null;
		try {
			/*session = sessfact.openSession();  
			String sql="select pm.profile_name as profile_name,i.marital_status as marital_status,i.kids_status as kids_status\r\n" + 
					" from Tbl_CandidateH1BInitiateDetails i join Tbl_ImmiProfileLableMaster \r\n" + 
					" pm on pm.profile_id=i.profile_id where candidate_id="+candidate_id+"";
			initateDto=(CandidateH1BInitiateDetailsDto) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(CandidateH1BInitiateDetailsDto.class)).uniqueResult();*/
			session = sessfact.openSession();  
			String hql="from CandidateH1BInitiateDetailsEntity where candidate_id="+candidate_id+" and status='Active'";
			initateDto= (CandidateH1BInitiateDetailsEntity) session.createQuery(hql).uniqueResult();
		} catch (Exception e) {
			//logger.error("Error in UserDaoImpl Class getAllUserGroups Method"+e.getStackTrace());
			logger.info(e.getMessage(),e);
		}
		finally {
			session.close();}  
		return initateDto;
	}
	@Override
	public Integer saveImmiGroupingProfileName(ImmiProfileLableMaster lableObj) {
		Session session = null;  
		Transaction tx = null;
		Integer id=0;
		try {
			session = sessfact.openSession();  
			tx = session.beginTransaction();
			id=(Integer)session.save(lableObj);
		} catch (Exception e) {
			tx.rollback(); 
			logger.info(e.getMessage(),e);
		}
		finally {
			tx.commit();
			session.close();}
		return id;
		
	}
	@Override
	public ImmiProfileLableMaster getImmiProfileLableMasterById(Integer profileId) {
		ImmiProfileLableMaster lableObj=null;
		Session session = null;  
		try { 
		session = sessfact.openSession();
		String sql=" from ImmiProfileLableMaster  where profile_id="+profileId+"";
		lableObj=(ImmiProfileLableMaster) session.createQuery(sql).uniqueResult();
		}catch (Exception e) {
			logger.info(e.getMessage(),e);
		}finally {
			session.close();
			} 
		return lableObj;
	}
	@Override
	public void updateImmiprofileName(ImmiProfileLableMaster lableObj) {
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
	
	/**********************************By PurnaChandar*********************************************1 start*/
	@Override
	public List<EmpDocumentsEntity> getallinputvals(Integer intiate_id, Integer candidate_id,
			Integer document_id, Integer h1bchecklistid) {
		
		List<EmpDocumentsEntity> inputvallist=null;
		Session session = null;  
		try { 
		session = sessfact.openSession();
		String sql="from EmpDocumentsEntity where file_type='H-1B' and initiate_id="+intiate_id+" and"
				+ " candidate_id="+candidate_id+" and documenttype_id="+document_id+" and h1b_checklist_id="+h1bchecklistid+" and input_value is not null";
		inputvallist=session.createQuery(sql).list();
		}catch (Exception e) {
			logger.info(e.getMessage(),e);
		}finally {
			session.close();
			} 
		return inputvallist;
	}
	@Override
	public List<EmpDocumentsEntity> viewfilehistory(Integer candidate_id, Integer document_id, Integer subdocument_id,Integer initiate_id, Integer checklist_id) {
	
		Session session = null;
		List<EmpDocumentsEntity> filehistory=null;
		try {
			session = sessfact.openSession();
			//String hql="from EmpDocumentsEntity  where  candidate_id="+candidate_id+" and documenttype_id="+document_id+" and h1b_checklist_id="+checklist_id+" and initiate_id="+initiate_id+" and status='InActive' ";
			String hql="from EmpDocumentsHistoryEntity  where  document_id="+document_id+"";
			filehistory = session.createQuery(hql).list();
			}catch (Exception e) {
				logger.info(e.getMessage(),e);
			}finally {
				session.close();
				} 
			return filehistory;
		
	}
	@Override
	public List<ContractsPanelDetails_DTO> getSubmittedSubdocsbyIds(Integer candidate_id, Integer documentid,
			Integer intiate_id, String benficiary_type, Integer profileid, Integer questionnarieId) {
		List<ContractsPanelDetails_DTO> candidateList = null;
		Session session = null;
		try {
		//	session = sessfact.openSession();
			//String sql = "select e.document_id as document_id,s.document_type as subcatName,e.file_name as fileName from ImmiDocumentSubTypeMaster s  join Tbl_EmpDocuments e on s.subdocumenttype_id=e.documentsubtype_id where s.issubycand=1 and e.candidate_id="+candidate_id+" and e.initiate_id="+intiate_id+" and e.documenttype_id="+documentid+" and e.status='Active' ";
			String sql = null; 
			session = sessfact.openSession();
			if(questionnarieId>0) {
				 sql =" select e.document_id as document_id,s.document_type as subcatName,e.file_name as fileName\r\n" + 
					" from Tbl_EmpDocuments e join Tbl_CandidateH1BCheckList c on e.h1b_checklist_id=c.h1b_checklist_id \r\n" + 
					" join ImmiDocumentSubTypeMaster s on s.subdocumenttype_id=e.documentsubtype_id\r\n" + 
					"  where s.issubycand=1 and e.candidate_id="+candidate_id+" and e.initiate_id="+intiate_id+" and e.documenttype_id="+documentid+" and e.status='Active' \r\n" + 
					"  and c.profile_id="+profileid+" and c.questionnarie_childid="+questionnarieId+" and c.profile_type='"+benficiary_type+"' and c.questionnarie_childid="+questionnarieId+"";
			}else {
				 sql =" select e.document_id as document_id,s.document_type as subcatName,e.file_name as fileName\r\n" + 
							" from Tbl_EmpDocuments e join Tbl_CandidateH1BCheckList c on e.h1b_checklist_id=c.h1b_checklist_id \r\n" + 
							" join ImmiDocumentSubTypeMaster s on s.subdocumenttype_id=e.documentsubtype_id\r\n" + 
							"  where s.issubycand=1 and e.candidate_id="+candidate_id+" and e.initiate_id="+intiate_id+" and e.documenttype_id="+documentid+" and e.status='Active' \r\n" + 
							"  and c.profile_id="+profileid+" and c.profile_type='"+benficiary_type+"'";
			}
			candidateList = (List<ContractsPanelDetails_DTO>) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(ContractsPanelDetails_DTO.class)).list();
		System.out.println("getSubmittedSubdocsbyIds**"+sql);
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return candidateList;
	}


	@Override
	public List<DocumentsDTO> getdocumentshistory(Integer docid) {
		Session session = null;  
		List<DocumentsDTO> profileList=null;
		try {
			session = sessfact.openSession();  
			String sql="select e.documenthistory_id as document_id,s.document_type as subdocument_name,e.file_name as fileName,CONVERT(varchar(10),e.submitted_date,101) as submitted_date from ImmiDocumentSubTypeMaster s join Tbl_EmpDocumentshistory e on s.subdocumenttype_id=e.documentsubtype_id where e.document_id="+docid+" order by documenthistory_id desc";
			profileList = (List<DocumentsDTO>) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(DocumentsDTO.class)).list();
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		finally {
			session.close();}  
		return profileList;
	}
	
	@Override
	public List<ContractsPanelDetails_DTO> getCandidateDocumentTypeList(Integer initiateId, int profile_id,
			Integer candidate_id, String profiletype) {
		List<ContractsPanelDetails_DTO> candidateList = null;
		Session session = null;String sql;
		try {
			session = sessfact.openSession();// s.is_same as is_same, 
			if(profiletype.equalsIgnoreCase("Kids")) {
				sql="select  distinct b.documenttype_id as document_id,(select distinct is_same from ImmiDocumentSubTypeMaster where documenttype_id=b.documenttype_id) as is_same, \r\n" + 
						" d.document_type as catName,b.candidate_status as candidate_status,hq.first_name as beneficiary_Name,b.profile_id as profile_id,b.profile_type as profile_type,"
						+ "b.initiate_id as initiate_id, dbo.fnGetNameByCandidateId(b.candidate_id) as candidateName,b.verifier_status as approved_status, "
						+ "pm.profile_name as profileName, b.candidate_id as candidateId, b.questionnarie_childid as questionnarie_id from Tbl_CandidateH1BCheckList b  join"
						+ " ImmiDocumentTypeMaster d on d.documenttype_id=b.documenttype_id join ImmiDocumentSubTypeMaster s"
						+ " on s.documenttype_id=d.documenttype_id  join Tbl_ImmiProfileLableMaster pm on pm.profile_id=b.profile_id join Tbl_H1BQuestionnaries hq on hq.h1questionnrie_id=b.questionnarie_childid "
						+ "where b.candidate_id="+candidate_id+" and s.issubycand=1 and b.initiate_id="+initiateId+" and b.profile_id="+profile_id+" and b.profile_type='"+profiletype+"'";
			}
			else if(profiletype.equalsIgnoreCase("Spouse")) {
				sql="select  distinct b.documenttype_id as document_id,(select distinct is_same from ImmiDocumentSubTypeMaster where documenttype_id=b.documenttype_id) as is_same, \r\n" + 
						" d.document_type as catName,b.candidate_status as candidate_status,b.profile_id as profile_id,"
						+ "b.initiate_id as initiate_id, dbo.fnGetNameByCandidateId(b.candidate_id) as candidateName,b.verifier_status as approved_status, "
						+ "pm.profile_name as profileName, b.candidate_id as candidateId from Tbl_CandidateH1BCheckList b  join"
						+ " ImmiDocumentTypeMaster d on d.documenttype_id=b.documenttype_id join ImmiDocumentSubTypeMaster s"
						+ " on s.documenttype_id=d.documenttype_id  join Tbl_ImmiProfileLableMaster pm on pm.profile_id=b.profile_id "
						+ "where b.candidate_id="+candidate_id+" and s.issubycand=1 and b.initiate_id="+initiateId+"  and b.profile_type='"+profiletype+"'";
			System.out.println("sql******"+sql);
			}
			else {
			  sql="select  distinct b.documenttype_id as document_id,(select distinct is_same from ImmiDocumentSubTypeMaster where documenttype_id=b.documenttype_id) as is_same, \r\n" + 
					" d.document_type as catName,b.candidate_status as candidate_status,b.profile_id as profile_id,"
					+ "b.initiate_id as initiate_id, dbo.fnGetNameByCandidateId(b.candidate_id) as candidateName,b.verifier_status as approved_status, "
					+ "pm.profile_name as profileName, b.candidate_id as candidateId from Tbl_CandidateH1BCheckList b  join"
					+ " ImmiDocumentTypeMaster d on d.documenttype_id=b.documenttype_id join ImmiDocumentSubTypeMaster s"
					+ " on s.documenttype_id=d.documenttype_id  join Tbl_ImmiProfileLableMaster pm on pm.profile_id=b.profile_id "
					+ "where b.candidate_id="+candidate_id+" and s.issubycand=1 and b.initiate_id="+initiateId+" and b.profile_id="+profile_id+" and b.profile_type='"+profiletype+"'";
			}			/*String sql = "select distinct b.h1b_checklist_id as h1b_checklist_id,d.document_type as catName,s.document_type as subcatName,s.documenttype_id as document_id,b.initiate_id as initiate_id,\r\n" + 
					"dbo.fnGetNameByCandidateId(b.candidate_id) as candidateName, pm.profile_name as profileName, b.candidate_id as candidateId ,s.is_same as is_same\r\n" + 
					"from Tbl_CandidateH1BCheckList b join ImmiDocumentSubTypeMaster s on \r\n" + 
					"s.subdocumenttype_id=b.subdoctype_id join ImmiDocumentTypeMaster d on d.documenttype_id=s.documenttype_id\r\n" + 
					"join Tbl_ImmiProfileLableMaster pm on pm.profile_id=b.profile_id where s.issubycand=1 and b.candidate_id="+candidate_id+"";*/		
			candidateList = (List<ContractsPanelDetails_DTO>) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(ContractsPanelDetails_DTO.class)).list();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return candidateList;
	}
	
	@Override
	public List<ContractsPanelDetails_DTO> getAdminDocumentTypeList(Integer initiateId, int profile_id,
			Integer candidate_id) {
		List<ContractsPanelDetails_DTO> candidateList = null;
		Session session = null;
		try {
			session = sessfact.openSession();
			String sql="select distinct b.documenttype_id as document_id,d.document_type as catName,b.initiate_id as initiate_id, "
					+ "dbo.fnGetNameByCandidateId(b.candidate_id) as candidateName, pm.profile_name as profileName, "
					+ "b.candidate_id as candidateId from Tbl_CandidateH1BCheckList b  join ImmiDocumentTypeMaster d"
					+ " on d.documenttype_id=b.documenttype_id join ImmiDocumentSubTypeMaster s on s.documenttype_id=d.documenttype_id"
					+ "  join Tbl_ImmiProfileLableMaster pm on pm.profile_id=b.profile_id where b.candidate_id="+candidate_id+" "
					+ "and s.issubycand=0 and b.initiate_id="+initiateId+"";
			
			/*String sql = "select distinct b.h1b_checklist_id as h1b_checklist_id,d.document_type as catName,s.document_type as subcatName,s.documenttype_id as document_id,b.initiate_id as initiate_id,\r\n" + 
					"dbo.fnGetNameByCandidateId(b.candidate_id) as candidateName, pm.profile_name as profileName, b.candidate_id as candidateId ,s.is_same as is_same\r\n" + 
					"from Tbl_CandidateH1BCheckList b join ImmiDocumentSubTypeMaster s on \r\n" + 
					"s.subdocumenttype_id=b.subdoctype_id join ImmiDocumentTypeMaster d on d.documenttype_id=s.documenttype_id\r\n" + 
					"join Tbl_ImmiProfileLableMaster pm on pm.profile_id=b.profile_id where s.issubycand=1 and b.candidate_id="+candidate_id+"";*/		
			candidateList = (List<ContractsPanelDetails_DTO>) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(ContractsPanelDetails_DTO.class)).list();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return candidateList;
	}
	
	
	
	/*******************************************************************************1 close*/
	@Override 
	public List<ContractsPanelDetails_DTO> getimmisubdocumentBydocid(Integer candidate_id, Integer documentid,
			Integer intiate_id, String benficiary_type,Integer profile_id, Integer questionnarieId) {
		List<ContractsPanelDetails_DTO> candidateList = null;
		Session session = null;
		try {
			String sql = null; 
			session = sessfact.openSession();
			if(questionnarieId>0) {
				 sql = "select b.h1b_checklist_id as h1b_checklist_id,d.document_type as catName,s.document_type as subcatName,s.documenttype_id as document_id,b.initiate_id as initiate_id\r\n" + 
						",dbo.fnGetNameByCandidateId(b.candidate_id) as candidateName, pm.profile_name as profileName, b.candidate_id as candidateId ,s.is_same as is_same,b.subdoctype_id as subcategory_id\r\n" + 
						"from Tbl_CandidateH1BCheckList b join ImmiDocumentSubTypeMaster s on s.subdocumenttype_id=b.subdoctype_id join\r\n" + 
						"ImmiDocumentTypeMaster d on d.documenttype_id=s.documenttype_id join Tbl_ImmiProfileLableMaster pm on pm.profile_id=b.profile_id \r\n" + 
						"where s.issubycand=1 and b.candidate_id="+candidate_id+" and b.initiate_id="+intiate_id+" and b.documenttype_id="+documentid+" and b.profile_type='"+benficiary_type+"' and b.profile_id="+profile_id+" and b.questionnarie_childid="+questionnarieId+" ";
			}else {
			 sql = "select b.h1b_checklist_id as h1b_checklist_id,d.document_type as catName,s.document_type as subcatName,s.documenttype_id as document_id,b.initiate_id as initiate_id\r\n" + 
					",dbo.fnGetNameByCandidateId(b.candidate_id) as candidateName, pm.profile_name as profileName, b.candidate_id as candidateId ,s.is_same as is_same,b.subdoctype_id as subcategory_id\r\n" + 
					"from Tbl_CandidateH1BCheckList b join ImmiDocumentSubTypeMaster s on s.subdocumenttype_id=b.subdoctype_id join\r\n" + 
					"ImmiDocumentTypeMaster d on d.documenttype_id=s.documenttype_id join Tbl_ImmiProfileLableMaster pm on pm.profile_id=b.profile_id \r\n" + 
					"where s.issubycand=1 and b.candidate_id="+candidate_id+" and b.initiate_id="+intiate_id+" and b.documenttype_id="+documentid+" and b.profile_type='"+benficiary_type+"' and b.profile_id="+profile_id+"";		
			}
			System.out.println("getimmisubdocumentBydocid********"+sql);
			candidateList = (List<ContractsPanelDetails_DTO>) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(ContractsPanelDetails_DTO.class)).list();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return candidateList;
	}
	
	
	@Override
	public List<DocumentHistoryDto> getCandidateDocumentsByIds(Integer docTypeId, Integer candidate_Id,
			Integer initiateid, Integer profile_id, String profile_type, Integer questionnarieId, String view_type) {
		List<DocumentHistoryDto>  customerDocList = null;
		Session session = null;
		try {
			String sql=null;
			session = sessfact.openSession();
			if(questionnarieId>0) {
				sql="select e.document_id as document_id,dbo.[fnGetBeneficiaryNameByHQueId](c.questionnarie_childid) as beneficiary_Name,"
						+ "e.file_name as file_name,e.file_type as filetype,ISNULL(e.from_date,'') as startdate,\r\n" + 
						"ISNULL(e.expiry_date,'') as expirydate,CONVERT(VARCHAR(10), e.submitted_date, 103) + ' '  + convert(VARCHAR(8), e.submitted_date, 14) as submit_date,\r\n" + 
						"e.input_value as inputval,e.status as docStatus,dbo.fnGetNameByCandidateId(e.posted_by) as posted_by,e.h1b_id as h1bId,\r\n" + 
						"dbo.[fnGetImmiSubDocTypeNameById](e.documentsubtype_id) as subdoctypename from Tbl_EmpDocuments e,Tbl_CandidateH1BCheckList c\r\n" + 
						"where e.h1b_checklist_id=c.h1b_checklist_id and e.documenttype_id="+docTypeId+" and e.candidate_id="+candidate_Id+" and"
								+ " e.initiate_id="+initiateid+" and c.profile_type='"+profile_type+"' and c.profile_id="+profile_id+" and c.questionnarie_childid="+questionnarieId+"";
			}else {
				if(!view_type.isEmpty()) {
					if(view_type.equalsIgnoreCase("Candidate")) {
							sql="select e.document_id as document_id,dbo.[fnGetBeneficiaryNameByHQueId](c.questionnarie_childid) as beneficiary_Name,"
									+ "e.file_name as file_name,e.file_type as filetype,ISNULL(e.from_date,'') as startdate,\r\n" + 
									"ISNULL(e.expiry_date,'') as expirydate,CONVERT(VARCHAR(10), e.submitted_date, 103) + ' '  + convert(VARCHAR(8), e.submitted_date, 14) as submit_date,\r\n" + 
									"e.input_value as inputval,e.status as docStatus,dbo.fnGetNameByCandidateId(e.posted_by) as posted_by,e.h1b_id as h1bId,\r\n" + 
									"dbo.[fnGetImmiSubDocTypeNameById](e.documentsubtype_id) as subdoctypename from Tbl_EmpDocuments e,Tbl_CandidateH1BCheckList c\r\n" + 
									"where e.h1b_checklist_id=c.h1b_checklist_id and e.documenttype_id="+docTypeId+" and e.candidate_id="+candidate_Id+" and e.initiate_id="+initiateid+" and c.profile_type='"+profile_type+"' and c.profile_id="+profile_id+" and c.isdocshowntocand='Yes' ";
					}else {
						sql="select e.document_id as document_id,dbo.[fnGetBeneficiaryNameByHQueId](c.questionnarie_childid) as beneficiary_Name,"
								+ "e.file_name as file_name,e.file_type as filetype,ISNULL(e.from_date,'') as startdate,\r\n" + 
								"ISNULL(e.expiry_date,'') as expirydate,CONVERT(VARCHAR(10), e.submitted_date, 103) + ' '  + convert(VARCHAR(8), e.submitted_date, 14) as submit_date,\r\n" + 
								"e.input_value as inputval,e.status as docStatus,dbo.fnGetNameByCandidateId(e.posted_by) as posted_by,c.isdocshowntocand as isdocshowntocand,e.h1b_id as h1bId,\r\n" + 
								"dbo.[fnGetImmiSubDocTypeNameById](e.documentsubtype_id) as subdoctypename from Tbl_EmpDocuments e,Tbl_CandidateH1BCheckList c\r\n" + 
								"where e.h1b_checklist_id=c.h1b_checklist_id and e.documenttype_id="+docTypeId+" and e.candidate_id="+candidate_Id+" and e.initiate_id="+initiateid+" and c.profile_type='"+profile_type+"' and c.profile_id="+profile_id+" ";
							}
				}else {
				sql="select e.document_id as document_id,dbo.[fnGetBeneficiaryNameByHQueId](c.questionnarie_childid) as beneficiary_Name,"
						+ "e.file_name as file_name,e.file_type as filetype,ISNULL(e.from_date,'') as startdate,\r\n" + 
						"ISNULL(e.expiry_date,'') as expirydate,CONVERT(VARCHAR(10), e.submitted_date, 103) + ' '  + convert(VARCHAR(8), e.submitted_date, 14) as submit_date,\r\n" + 
						"e.input_value as inputval,e.status as docStatus,dbo.fnGetNameByCandidateId(e.posted_by) as posted_by,e.h1b_id as h1bId,\r\n" + 
						"dbo.[fnGetImmiSubDocTypeNameById](e.documentsubtype_id) as subdoctypename from Tbl_EmpDocuments e,Tbl_CandidateH1BCheckList c\r\n" + 
						"where e.h1b_checklist_id=c.h1b_checklist_id and e.documenttype_id="+docTypeId+" and e.candidate_id="+candidate_Id+" and e.initiate_id="+initiateid+" and c.profile_type='"+profile_type+"' and c.profile_id="+profile_id+" ";
					}
				}
			
			//if(profile_type.equalsIgnoreCase("Kids")) {
				/*}else {
			sql="select document_id as document_id,file_name as file_name,file_type as filetype,"
						+ "ISNULL(from_date,'') as startdate,ISNULL(expiry_date,'') as expirydate,"
						+ "CONVERT(VARCHAR(10), submitted_date, 103) + ' '  + convert(VARCHAR(8), submitted_date, 14) as submit_date,"
						+ "input_value as inputval,status as docStatus,dbo.fnGetNameByEmpno(posted_by) as posted_by,"
						+ "dbo.[fnGetImmiSubDocTypeNameById](documentsubtype_id) as subdoctypename "
						+ "from Tbl_EmpDocuments  where documenttype_id="+docTypeId+" and candidate_id="+candidate_Id+" and initiate_id='"+initiateid+"'";
		     }*/
			customerDocList= (List<DocumentHistoryDto>) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(DocumentHistoryDto.class)).list();
		System.out.println("getCandidateDocumentsByIds********"+sql);
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return customerDocList;
	}
	@Override
	public List<CandidateH1BCheckList> getCandidateH1BCheckListByIds(Integer docType_Id, Integer candidate_Id,
			Integer initiate_id, Integer profile_id, String profile_type, Integer questionnarieId) {
		List<CandidateH1BCheckList> docchkList = null;
		Session session = null;
		try {
			session = sessfact.openSession();
			String sql =null;
			if(questionnarieId>0) {
				 sql = "from CandidateH1BCheckList where candidate_id="+candidate_Id+"  and documenttype_id="+docType_Id+" and initiate_id="+initiate_id+" and profile_id="+profile_id+" and profile_type='"+profile_type+"' and questionnarie_childid="+questionnarieId+"";
			}else {
				 sql = "from CandidateH1BCheckList where candidate_id="+candidate_Id+"  and documenttype_id="+docType_Id+" and initiate_id="+initiate_id+" and profile_id="+profile_id+" and profile_type='"+profile_type+"'";
			}
			docchkList = (List<CandidateH1BCheckList>) session.createQuery(sql).list();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return docchkList;
	}
	@Override
	public CandidateH1BCheckList getCandidateH1BCheckListById(Integer chklistid) {
		Session session = null;  
		CandidateH1BCheckList chklistObj=null;
		try {
			session = sessfact.openSession();  
			String hql="from CandidateH1BCheckList where h1b_checklist_id="+chklistid+"";
			chklistObj= (CandidateH1BCheckList) session.createQuery(hql).uniqueResult();
		} catch (Exception e) {
			//logger.error("Error in UserDaoImpl Class getAllUserGroups Method"+e.getStackTrace());
			logger.info(e.getMessage(),e);
		}
		finally {
			session.close();}  
		return chklistObj;
	}
	@Override
	public Integer saveImmiCheckListComments(ImmiCheckListCommentsHistory commentObj) {
		Session session = null;	Transaction tx = null;Integer initiateid=0;	
		try {
			session = sessfact.openSession();  
			tx = session.beginTransaction();
			 initiateid=(Integer) session.save(commentObj);
			 tx.commit();
		} catch (Exception e) {
			tx.rollback(); 
			logger.info(e.getMessage(),e);
		}
		finally {
			session.close();}
		return initiateid;
	}
	@Override
	public void updateCandidateH1BCheckList(CandidateH1BCheckList h1bChkObj) {
		Session session = null;
		try {
			session = sessfact.openSession();
			Transaction tx = session.beginTransaction();
			session.update(h1bChkObj);
			tx.commit();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
	}
	@Override
	public List<commentHistoryDto> getImmiCandidateDocumentsByIds(Integer docType_id, Integer candidate_id,
			Integer initiate_id, Integer profile_id, String profile_type) {
		Session session = null;
		List<commentHistoryDto> commentHistoryList = null;
		try {
			session = sessfact.openSession();
			String sql = "SELECT comments as comments,comments_id as commentid, status as status,\r\n" + 
					"CONVERT(VARCHAR(10), submitted_date, 103) + ' '  + convert(VARCHAR(8), submitted_date, 14) as subdate,\r\n" + 
					"dbo.fnGetNameByEmpno(verified_by) as posted_by\r\n" + 
					"FROM Tbl_H1BCheckListCommentsHistory where candidate_id="+candidate_id+" and doctype_id="+docType_id+""
							+ "and initiate_id="+initiate_id+" and profile_id="+profile_id+" and profile_type='"+profile_type+"'";
			commentHistoryList = (List<commentHistoryDto>) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(commentHistoryDto.class)).list();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return commentHistoryList;
	}
	/*@Override
	public List<ContractsPanelDetails_DTO> getCandidateSpouseDocumentTypeList(Integer initiateId,
			Integer dependent_profile_id, Integer candidate_id) {
		List<ContractsPanelDetails_DTO> candidateList = null;
		Session session = null;
		try {
			session = sessfact.openSession();// s.is_same as is_same, 
			String sql="select distinct b.documenttype_id as document_id,(select count(*) from ImmiDocumentSubTypeMaster where documenttype_id=b.documenttype_id) as is_same, \r\n" + 
					" d.document_type as catName,b.candidate_status as candidate_status,"
					+ "b.initiate_id as initiate_id, dbo.fnGetNameByCandidateId(b.candidate_id) as candidateName,b.verifier_status as approved_status, "
					+ "pm.profile_name as profileName, b.candidate_id as candidateId from Tbl_CandidateH1BCheckList b  join"
					+ " ImmiDocumentTypeMaster d on d.documenttype_id=b.documenttype_id join ImmiDocumentSubTypeMaster s"
					+ " on s.documenttype_id=d.documenttype_id  join Tbl_ImmiProfileLableMaster pm on pm.profile_id=b.profile_id "
					+ "where b.candidate_id="+candidate_id+" and s.issubycand=1 and b.initiate_id="+initiateId+"  and b.profile_id="+dependent_profile_id+" ";
			
			String sql = "select distinct b.h1b_checklist_id as h1b_checklist_id,d.document_type as catName,s.document_type as subcatName,s.documenttype_id as document_id,b.initiate_id as initiate_id,\r\n" + 
					"dbo.fnGetNameByCandidateId(b.candidate_id) as candidateName, pm.profile_name as profileName, b.candidate_id as candidateId ,s.is_same as is_same\r\n" + 
					"from Tbl_CandidateH1BCheckList b join ImmiDocumentSubTypeMaster s on \r\n" + 
					"s.subdocumenttype_id=b.subdoctype_id join ImmiDocumentTypeMaster d on d.documenttype_id=s.documenttype_id\r\n" + 
					"join Tbl_ImmiProfileLableMaster pm on pm.profile_id=b.profile_id where s.issubycand=1 and b.candidate_id="+candidate_id+"";		
			candidateList = (List<ContractsPanelDetails_DTO>) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(ContractsPanelDetails_DTO.class)).list();
		System.out.println("sql************"+sql);
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return candidateList;
	}*/
	@Override
	public List<ProfileMasterDTO> getProfileListByDependentProfileId(Integer profile_Id) {
		Session session = null;  
		List<ProfileMasterDTO> profileList=null;
		try {
			session = sessfact.openSession();  
			String sql="select cm.documenttype_id as categoryid,cm.document_type as category,sm.subdocumenttype_id as subcategoryid,\r\n" + 
					"sm.document_type as subcategory,pm.profile_id as profileid\r\n" + 
					"from Tbl_ImmiProfileMasterCheckList pm join ImmiDocumentSubTypeMaster sm  \r\n" + 
					"on pm.subcategory_id=sm.subdocumenttype_id join ImmiDocumentTypeMaster cm on\r\n" + 
					"cm.documenttype_id=sm.documenttype_id where profile_id="+profile_Id+"";
			profileList=(List<ProfileMasterDTO>) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(ProfileMasterDTO.class)).list();
			System.out.println("getProfileListByDependentProfileId************"+sql);
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		finally {
			session.close();}  
		return profileList;
	}
	
	@Override
	public List<ImmiProfileLableMaster> getDependentInitiateTemplateList() {
		Session session = null;  
		List<ImmiProfileLableMaster> profileList=null;
		try {
			session = sessfact.openSession();  
			String hql="from ImmiProfileLableMaster where isdependent='Yes' and status='Active' ORDER BY profile_name ASC";
			profileList= session.createQuery(hql).list();
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		finally {
			session.close();}  
		return profileList;
	}
	
	@Override
	public String getProfileIsDependentById(Integer profile_Id) {
		String profile_name=null;
		Session session = null;  
		try { 
		session = sessfact.openSession();
		String sql="Select isdependent from Tbl_ImmiProfileLableMaster  where profile_id="+profile_Id+"";
		profile_name=(String) session.createSQLQuery(sql).uniqueResult();
		}catch (Exception e) {
			logger.info(e.getMessage(),e);
		}finally {
			session.close();
			} 
		return profile_name;
	}
	@Override
	public List<Integer> getCanSubDocumentIdCheckList(Integer candidate_id, Integer documentid,
			Integer intiate_id, String benficiary_type) {
		List<Integer> candidateList = null;
		Session session = null;
		try {
			session = sessfact.openSession();
			String sql = "select s.subdocumenttype_id \r\n" + 
					"from Tbl_CandidateH1BCheckList b join ImmiDocumentSubTypeMaster s on s.subdocumenttype_id=b.subdoctype_id join\r\n" + 
					"ImmiDocumentTypeMaster d on d.documenttype_id=s.documenttype_id join Tbl_ImmiProfileLableMaster pm on pm.profile_id=b.profile_id \r\n" + 
					"where s.issubycand=1 and b.candidate_id="+candidate_id+" and b.initiate_id="+intiate_id+" and b.documenttype_id="+documentid+"";		
			
			candidateList = (List<Integer>) session.createSQLQuery(sql).list();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return candidateList;
	}
	@Override
	public List<Integer> getSubDocumentIds(Integer documentid) {
		Session session = null;  
		List<Integer> subcatList=null;
		try {
			session = sessfact.openSession();  
			String hql="select subdocumenttype_id from ImmiDocumentSubTypeMaster where documenttype_id="+documentid+"";
			subcatList=session.createSQLQuery(hql).list();
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		finally {
			session.close();}  
		return subcatList;
	}
	
	@Override
	public ImmiDocumentSubTypeEntity getSubDocumentNameBysubdoctypeId(Integer clientid) {
		ImmiDocumentSubTypeEntity cvlqObj = null;
		Session session = null;
		try {
			session = sessfact.openSession();
			String sql = "from ImmiDocumentSubTypeEntity where subdocumenttype_id="+clientid+"";
			cvlqObj = (ImmiDocumentSubTypeEntity) session.createQuery(sql).uniqueResult();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return cvlqObj;
	}
	@Override
	public void updateInitiateDetails(CandidateH1BInitiateDetailsEntity initiateDetObj) {
		Session session = null;
		try {
			session = sessfact.openSession();
			Transaction tx = session.beginTransaction();
			session.update(initiateDetObj);
			 tx.commit();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
	}
	@Override
	public Integer getSubDocumentTypeId(Integer doc_Id) {
		Integer subdocumenttype_id=null;
		Session session = null;  
		try { 
		session = sessfact.openSession();
		String sql="select subdocumenttype_id from ImmiDocumentSubTypeMaster where documenttype_id="+doc_Id+" and is_same=1";
		subdocumenttype_id=(Integer) session.createSQLQuery(sql).uniqueResult();
		}catch (Exception e) {
			logger.info(e.getMessage(),e);
		}finally {
			session.close();
			} 
		return subdocumenttype_id;
	}
	@Override
	public List<CandidateH1BCheckList> getCandidateH1BCheckList(Integer initiateid, Integer spouse_profile_id,
			int candidate_id, String ptype) {
		Session session = null;  
		List<CandidateH1BCheckList> spouseCheckList=null;
		try {
			session = sessfact.openSession();  
			String hql="from CandidateH1BCheckList where initiate_id="+initiateid+" and candidate_id="+candidate_id+" and profile_id="+spouse_profile_id+" and profile_type='"+ptype+"'";
			spouseCheckList= session.createQuery(hql).list();
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		finally {
			session.close();}  
		return spouseCheckList;
	}
	
	@Override
	public SOCcodeMasterEntity getSocCodeDetailsBySocid(String soc) {
		SOCcodeMasterEntity socObj = null;
		Session session = null;
		try {
			session = sessfact.openSession();
			String sql = "from SOCcodeMasterEntity where soc_code='"+soc+"'";
			socObj = (SOCcodeMasterEntity) session.createQuery(sql).uniqueResult();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return socObj;
	}
	@Override
	public List<BasicDetailsDto> getActiveEmployeeList() {
		Session session = null;  
		List<BasicDetailsDto> activeList=null;
		try {
			session = sessfact.openSession();  
			String sql="select e.full_name as fullname,d.designation as designation,d.work_authorization as workAuth,CONVERT(VARCHAR(10), d.joining_date, 101) as doj,e.candidate_id as candidate_id from Tbl_EmpBasicDetails e join Tbl_CandidateDetailedInfo d on e.candidate_id=d.candidate_id and d.status='Active' and emp_type in ('W2','W2 Admin') and d.work_authorization='H-1B' order by CONVERT(VARCHAR(10), d.joining_date, 101) desc";
			activeList=(List<BasicDetailsDto>) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(BasicDetailsDto.class)).list();
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		finally {
			session.close();}  
		return activeList;
	}
	@Override
	public List<SOCcodeMasterEntity> getSocCodeMasterList() {
		List<SOCcodeMasterEntity> socList = null;
		Session session = null;
		try {
			session = sessfact.openSession();
			String sql = "from SOCcodeMasterEntity order by soccode_title desc";
			socList=session.createQuery(sql).list();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return socList;
	}
	@Override
	public Integer saveSocCodeMaster(SOCcodeMasterEntity socObj) {
		Session session = null;
		Integer venid = null;
		try {
			session = sessfact.openSession();
			Transaction tx = session.beginTransaction();
			venid = (Integer) session.save(socObj);
			tx.commit();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return venid;
	}
	@Override
	public SOCcodeMasterEntity getSOCDetailsById(Integer soc_id) {
		SOCcodeMasterEntity socObj = null;
		Session session = null;
		try {
			session = sessfact.openSession();
			String sql = "from SOCcodeMasterEntity  where soc_id=" + soc_id + "";
			socObj = (SOCcodeMasterEntity) session.createQuery(sql).uniqueResult();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return socObj;
	}
	@Override
	public String checkSocCode(String soc_code) {
		String ssn = null;
		Session session = null;
		try {
			session = sessfact.openSession();
			String sql = "select soc_code from SOCcodeMasterEntity  where soc_code='" + soc_code + "'";
			ssn = (String) session.createSQLQuery(sql).uniqueResult();

		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return ssn;
	}
	@Override
	public void updateSocCodeMaster(SOCcodeMasterEntity socObj) {
		Session session = null;
		try {
			session = sessfact.openSession();
			Transaction tx = session.beginTransaction();
			session.update(socObj);
			tx.commit();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return;
	}
	@Override
	public List<ContractsPanelDetails_DTO> h1initiationhistory(Integer candidate_id) {
		Session session = null;  
		List<ContractsPanelDetails_DTO> subcatList=null;
		try {
			session = sessfact.openSession();  
			
			String sql="select  b.initiate_id as initiate_id,b.initiaion_status as initiaion_status,b.comments as comments,b.status as status,b.candidate_id as candidateId,CONVERT(VARCHAR(10), b.submitted_date, 101) as subdate,\r\n" + 
					"b.profile_id as profile_id,p.profile_name as profileName,(select count(*) from CandidateScannedDocuments where initiate_id=b.initiate_id and candidate_id=b.candidate_id) as scanedDocCount\r\n" + 
					"from Tbl_CandidateH1BInitiateDetails b join Tbl_ImmiProfileLableMaster p on b.profile_id=p.profile_id\r\n" + 
					"where b.candidate_id="+candidate_id+" order by b.initiate_id desc";
			/*String sql="select  b.initiate_id as initiate_id,b.initiaion_status as initiaion_status,b.status as status,b.candidate_id as candidateId,CONVERT(VARCHAR(10), b.submitted_date, 101) as subdate,\r\n" + 
					"b.profile_id as profile_id,p.profile_name as profileName,(select count(*) from CandidateScannedDocuments where initiate_id=b.initiate_id and candidate_id=b.candidate_id) as scanedDocCount\r\n" + 
					"from Tbl_CandidateH1BInitiateDetails b join Tbl_ImmiProfileLableMaster p on b.profile_id=p.profile_id\r\n" + 
					"where b.candidate_id="+candidate_id+" order by b.initiate_id desc";*/
			subcatList=(List<ContractsPanelDetails_DTO>) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(ContractsPanelDetails_DTO.class)).list();
		System.out.println("h1initiationhistory*****"+sql);
		} catch (Exception e) {
			//logger.error("Error in UserDaoImpl Class getAllUserGroups Method"+e.getStackTrace());
			logger.info(e.getMessage(),e);
		}
		finally {
			session.close();}  
		return subcatList;
	}
	@Override
	public List<String> checkpetitionPacket(Integer initiateid, Integer candidate_id) {
		
		List<String> ssn = null;
			Session session = null;
			try {
				session = sessfact.openSession();
				String sql = "select verifier_status from Tbl_CandidateH1BCheckList where candidate_id="+candidate_id+" and initiate_id="+initiateid+" and profile_type='Applicant'";
				ssn = (List<String>) session.createSQLQuery(sql).list();

			} catch (Exception e) {
				logger.info(e.getMessage(), e);
			} finally {
				session.close();
			}
			return ssn;
	}
	@Override
	public List<CandidateH1BCheckList> getpetitionPacketDocuments(Integer initiate_id, Integer candidate_id) {
		Session session = null;  
		List<CandidateH1BCheckList> docList=null;
		try {
			session = sessfact.openSession();  
			String hql="from CandidateH1BCheckList where initiate_id="+initiate_id+" and candidate_id="+candidate_id+"";
			docList= session.createQuery(hql).list();
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		finally {
			session.close();}  
		return docList;
	}
	@Override
	public List<String> getDocumentByChecklistId(Integer checklistid) {
		//List<EmpDocumentsEntity> Doclist = null;
		List<String> filename = null;
		Session session = null;
		try {
			session = sessfact.openSession();
			/*String sql = "from EmpDocumentsEntity  where h1b_checklist_id=" + checklistid + "";
			Doclist = (List<EmpDocumentsEntity>) session.createQuery(sql).list();*/
		String sql = "select distinct file_name from Tbl_EmpDocuments where h1b_checklist_id="+checklistid+"";
		filename = (List<String>) session.createSQLQuery(sql).list();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return filename;
	}
	
	@Override
	public List<TaskDetailsEntity> getalltaskdetailsbycandidateid(Integer candidate_Id) {
		List<TaskDetailsEntity> candidateTaskList = null;
		Session session = null;
		try {
			String sql =null;
			session = sessfact.openSession();
			sql = "from TaskDetailsEntity where candidate_id="+candidate_Id+"";
				candidateTaskList =(List<TaskDetailsEntity>) session.createQuery(sql).list();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return candidateTaskList;
	}
	/*@Override
	public List<String> getDocumentByChecklistId(Integer checklistid) {
		List<String> DocObj = null;
		Session session = null;
		try {
			session = sessfact.openSession();
			String sql = "select distinct file_name from EmpDocumentsEntity  where h1b_checklist_id=" + checklistid + "";
			DocObj = (List<String>) session.createQuery(sql).list();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return DocObj;
	}*/
	@Override
	public List<CandidateH1BCheckList> getdocumentsByCategoryId(Integer initiate_id, Integer candidate_id,Integer documenttype_id) {
		Session session = null;  
		List<CandidateH1BCheckList> docList=null;
		try {
			session = sessfact.openSession();  
			String hql="from CandidateH1BCheckList where initiate_id="+initiate_id+" and candidate_id="+candidate_id+" and documenttype_id="+documenttype_id+" ";
			docList= session.createQuery(hql).list();
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		finally {
			session.close();}  
		return docList;
	}
	@Override
	public String getdocumentTypeByDocId(Integer documenttype_id) {
		Session session = null;  
		String docuName=null;
		try {
			session = sessfact.openSession();  
			String hql="select document_type from ImmiDocumentTypeEntity where documenttype_id="+documenttype_id+"";
			docuName=(String) session.createQuery(hql).uniqueResult();
		} catch (Exception e) {
			//logger.error("Error in UserDaoImpl Class getAllUserGroups Method"+e.getStackTrace());
			logger.info(e.getMessage(),e);
		}
		finally {
			session.close();}  
		return docuName;
	}
	
	
	
	@Override
	public void saveScanneddoc(CandidateScannedDocumentsEntity scdoc) {
		Session session = null;	Transaction tx = null;	
		try {
			session = sessfact.openSession();  
			tx = session.beginTransaction();
			session.save(scdoc);
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
	public List<DocumentHistoryDto> getsclist(Integer candId, Integer initiate_id) {
		
		Session session = null;  
		List<DocumentHistoryDto> docList=null;
		try {
			session = sessfact.openSession();  
			
			String sql="select  document_id as document_id, initiate_id as initiate_id,dbo.fnGetNameByCandidateId(candidate_id) as beneficiary_Name,\r\n" + 
					"dbo.fnGetNameByCandidateId(posted_by) as posted_by,\r\n" + 
					"CONVERT(VARCHAR(10), submitted_date, 101) as startdate,file_name as file_name,input_value as inputval \r\n" + 
					"from CandidateScannedDocuments where initiate_id="+initiate_id+"  and candidate_id="+candId+"";
			docList=(List<DocumentHistoryDto>) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(DocumentHistoryDto.class)).list();
			
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		finally {
			session.close();}  
		return docList;
	}
	@Override
	public List<String> getScannedDocuments(Integer initiate_id, Integer candidate_id) {
		Session session = null;  
		List<String> docList=null;
		try {
			session = sessfact.openSession();  
			String hql="select file_name from CandidateScannedDocuments where initiate_id="+initiate_id+" and candidate_id="+candidate_id+" ";
			docList= session.createSQLQuery(hql).list();
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		finally {
			session.close();}  
		return docList;
	}
	@Override
	public List<Integer> getCheckListIdsByIds(Integer candidate_id, Integer doctypeid, Integer intiate_id,
			Integer profile_id, String bentype, Integer questionnarieId) {
			List<Integer> chklistidList=null;
			Session session = null;  
			try { 
			session = sessfact.openSession();
			String sql=null;
			if(questionnarieId>0) {
				sql="select h1b_checklist_id from Tbl_CandidateH1BCheckList where candidate_id="+candidate_id+" "
						+ "and initiate_id="+intiate_id+" and documenttype_id="+doctypeid+" and profile_id="+profile_id+" and profile_type='"+bentype+"' and questionnarie_childid="+questionnarieId+"";
			}else {
				sql="select h1b_checklist_id from Tbl_CandidateH1BCheckList where candidate_id="+candidate_id+" "
						+ "and initiate_id="+intiate_id+" and documenttype_id="+doctypeid+" and profile_id="+profile_id+" and profile_type='"+bentype+"'";
			}
			/*sql="select h1b_checklist_id from Tbl_CandidateH1BCheckList where candidate_id="+candidate_id+" "
					+ "and initiate_id="+intiate_id+" and documenttype_id="+doctypeid+" and profile_id="+profile_id+" and profile_type='"+bentype+"'";*/
			System.out.println("chklistid*********"+sql);
			chklistidList=session.createSQLQuery(sql).list();
			}catch (Exception e) {
				logger.info(e.getMessage(),e);
			}finally {
				session.close();
				} 
			return chklistidList;
		}
	@Override
	public void updateH1BDetails(H1BDetailsEntity h1bObj) {
		Session session = null;
		try {
			session = sessfact.openSession();
			Transaction tx = session.beginTransaction();
			session.update(h1bObj);
			tx.commit();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return;
	}
	@Override
	public Integer getDocCountByH1bChkId(Integer chklistid) {
		Integer docCount=null;
		Session session = null;  
		try { 
		session = sessfact.openSession();
		String sql="select count(*) as docCount from Tbl_EmpDocuments where h1b_checklist_id="+chklistid+" and status='Active'";
		docCount=(Integer) session.createSQLQuery(sql).uniqueResult();
		}catch (Exception e) {
			logger.info(e.getMessage(),e);
		}finally {
			session.close();
			} 
		return docCount;
	}
	@Override
	public String checkSelectedFileNameById(String profiletype,String filename, Integer candidate_id,String profile_name,Integer profile_id, String checked,Integer initiateid) {
		Session session = null;
		String fname = null;
		try {
			session = sessfact.openSession();
			//String sql = "select distinct file_name FROM Tbl_EmpDocuments  where file_name='" + filename + "' and candidate_id="+candidate_id+"";
			String sql=null;
			if(checked == "") {
			 sql = "select distinct e.file_name from Tbl_EmpDocuments e,Tbl_CandidateH1BCheckList c,Tbl_ImmiProfileLableMaster"
					+ " m  where e.h1b_checklist_id=c.h1b_checklist_id and  m.profile_id=c.profile_id  and "
					+ "e.candidate_Id="+candidate_id+" and m.profile_id=" + profile_id + " and e.status='Active'  and "
							+ "c.profile_type='" + profiletype + "' and e.file_name='" + filename + "' and c.initiate_id="+initiateid+" ";
	
		}else {
			 sql = "select distinct e.file_name from Tbl_EmpDocuments e,Tbl_CandidateH1BCheckList c,Tbl_ImmiProfileLableMaster"
					+ " m  where e.h1b_checklist_id=c.h1b_checklist_id and  m.profile_id=c.profile_id  and "
					+ "e.candidate_Id="+candidate_id+" and m.profile_id=" + profile_id + " and e.status='Active'  and "
							+ "c.profile_type='" + profiletype + "'  and e.file_name='" + filename + "' and c.initiate_id="+initiateid+" ";
	
		}
				
			System.out.println("checkSelectedFileNameById --"+sql);
			fname = (String) session.createSQLQuery(sql).uniqueResult();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return fname;
	}
	@Override
	public List<Integer> getSubDocumentbyIds(Integer docType_Id, Integer candidate_Id, Integer initiate_id, String profile_type, Integer questionnarieId) {
		Session session = null;
		List<Integer> subcatList = null;
		try {
			session = sessfact.openSession();
			String hql =null;
			/*String hql = "select documentsubtype_id from Tbl_EmpDocuments where documenttype_id=" + docType_Id
					+ "   and candidate_id=" + candidate_Id + "";*/
			if(questionnarieId>0) {
				hql = "select subdoctype_id from Tbl_CandidateH1BCheckList where documenttype_id=" + docType_Id
						+ " and initiate_id=" + initiate_id + " and candidate_id=" + candidate_Id + " and profile_type='"+profile_type+"' and questionnarie_childid="+questionnarieId+"";
			}else {
				hql = "select subdoctype_id from Tbl_CandidateH1BCheckList where documenttype_id=" + docType_Id
						+ " and initiate_id=" + initiate_id + " and candidate_id=" + candidate_Id + " and profile_type='"+profile_type+"'";
			}
			System.out.println("getSubDocumentbyIds --"+hql);
			subcatList = session.createSQLQuery(hql).list();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return subcatList;
	}
	@Override
	public List<DocumentHistoryDto> getCandidateDocumentsrepoitoryByIds(Integer docType_Id, Integer candidate_Id,
			Integer initiate_id, Integer subdocid, String profile_id, String profile_type, Integer questionnarieId) {
		List<DocumentHistoryDto> customerDocList = null;
		Session session = null;
		try {
			String sql = null;
			session = sessfact.openSession();
			/*
			 * sql="select e.document_id as document_id,dbo.[fnGetBeneficiaryNameByHQueId](c.questionnarie_childid) as beneficiary_Name,"
			 * +
			 * "e.file_name as file_name,e.file_type as filetype,ISNULL(e.from_date,'') as startdate,\r\n"
			 * +
			 * "ISNULL(e.expiry_date,'') as expirydate,CONVERT(VARCHAR(10), e.submitted_date, 103) + ' '  + convert(VARCHAR(8), e.submitted_date, 14) as submit_date,\r\n"
			 * +
			 * "e.input_value as inputval,e.status as docStatus,dbo.fnGetNameByCandidateId(e.posted_by) as posted_by,\r\n"
			 * +
			 * "dbo.[fnGetImmiSubDocTypeNameById](e.documentsubtype_id) as subdoctypename from Tbl_EmpDocuments e,Tbl_CandidateH1BCheckList c\r\n"
			 * + "where e.h1b_checklist_id=c.h1b_checklist_id and e.documenttype_id="
			 * +docType_Id+" and e.candidate_id="+candidate_Id+" and e.initiate_id="
			 * +initiate_id+"  ";
			 */
	
			/*sql="select c.profile_type,m.profile_name,m.profile_id,e.initiate_id,e.file_name,e.candidate_id,e.input_value as inputval,e.documentsubtype_id,e.h1b_checklist_id,"
					+ "dbo.[fnGetImmiSubDocTypeNameById](documentsubtype_id) as subdoctypename from Tbl_EmpDocuments e,"
					+ "Tbl_CandidateH1BCheckList c,Tbl_ImmiProfileLableMaster m  where e.h1b_checklist_id=c.h1b_checklist_id and  "
					+ "m.profile_id=c.profile_id and e.documenttype_id="+docType_Id+" and e.candidate_Id="+candidate_Id+" and "
					+ "e.documentsubtype_id="+subdocid+"  and e.status='Active'  and c.profile_type='"+profile_type+"' and c.verifier_status='Approved' and e.initiate_id not in("+ initiate_id+") ";
		and e.questionnarie_childid="+questionnarieId+"  */
			if(questionnarieId>0) {
				sql="select distinct e.h1b_checklist_id from Tbl_EmpDocuments e,"
						+ "Tbl_CandidateH1BCheckList c where e.h1b_checklist_id=c.h1b_checklist_id   "
						+ " and e.documenttype_id="+docType_Id+" and e.candidate_Id="+candidate_Id+" and "
						+ "e.documentsubtype_id="+subdocid+"  and e.status='Active'  and c.profile_type='"+profile_type+"' and c.verifier_status='Approved' and e.initiate_id not in("+ initiate_id+") ";
			}else {
			sql="select distinct e.h1b_checklist_id from Tbl_EmpDocuments e,"
					+ "Tbl_CandidateH1BCheckList c where e.h1b_checklist_id=c.h1b_checklist_id   "
					+ " and e.documenttype_id="+docType_Id+" and e.candidate_Id="+candidate_Id+" and "
					+ "e.documentsubtype_id="+subdocid+"  and e.status='Active'  and c.profile_type='"+profile_type+"' and c.verifier_status='Approved' and e.initiate_id not in("+ initiate_id+") ";
			}

	
			System.out.println("repo sql ++++++++++++++++++++++++++" + sql);
			customerDocList = (List<DocumentHistoryDto>) session.createSQLQuery(sql)
					.setResultTransformer(new AliasToBeanResultTransformer(DocumentHistoryDto.class)).list();
			
			
			
			
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return customerDocList;
	}
	
	@Override
	public List<DocumentHistoryDto> getmodifiedpaflist(Integer lca_id, Integer candidateid, String paf_type) {
		Session session = null;  
		List<DocumentHistoryDto> docList=null;
		try {
			session = sessfact.openSession();  
			String sql="select  document_id as document_id, initiate_id as initiate_id,dbo.fnGetNameByCandidateId(candidate_id) as beneficiary_Name,\r\n" + 
					"dbo.fnGetNameByCandidateId(posted_by) as posted_by,\r\n" + 
					"CONVERT(VARCHAR(10), submitted_date, 101) as startdate,paf_type as doctypename,status as docStatus,file_name as file_name,input_value as inputval \r\n" + 
					"from PAFModifiedDocuments where lca_id="+lca_id+"  and candidate_id="+candidateid+" and paf_type='"+paf_type+"'  order by document_id desc ";
			docList=(List<DocumentHistoryDto>) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(DocumentHistoryDto.class)).list();
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		finally {
			session.close();}  
		return docList;
	}
	@Override
	public void savemodifiedpafform(PAFModifiedDocumentsEntity scdoc) {
		Session session = null;	Transaction tx = null;	
		try {
			session = sessfact.openSession();  
			tx = session.beginTransaction();
			session.save(scdoc);
		} catch (Exception e) {
			tx.rollback(); 
			logger.info(e.getMessage(),e);
		}
		finally {
			tx.commit();
			session.close();}
	}
	@Override
	public String checkpafdocexistornot(String filename,Integer candidate_id, Integer lca_id, String paf_type) {
		Session session = null;
		String fname = null;
		try {
			session = sessfact.openSession();
			String sql = "select distinct file_name FROM PAFModifiedDocuments  where file_name='" + filename + "' and candidate_id="+candidate_id+" and paf_type='"+paf_type+"' and lca_id="+lca_id+"";
			fname = (String) session.createSQLQuery(sql).uniqueResult();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return fname;
	}
	
	@Override
	public Integer getemployeesCountByJobTitle(String job_title) {
		Integer empCount=null;
		Session session = null;  
		try { 
		session = sessfact.openSession();
		String sql="select count(*) as empcount from Tbl_CandidateDetailedInfo where designation='"+job_title+"' and status='Active' and emp_type in ('W2','W2 Admin') and work_authorization='H-1B' ";
		empCount=(Integer) session.createSQLQuery(sql).uniqueResult();
		}catch (Exception e) {
			logger.info(e.getMessage(),e);
		}finally {
			session.close();
			} 
		return empCount;
	}
	@Override
	public H1BQuestionnariesEntity getH1BQuetionnaireById(int h1questionnrie_id) {
		Session session = null;
		H1BQuestionnariesEntity qunobj=new H1BQuestionnariesEntity();
		try {
			String sql =null;
			session = sessfact.openSession();
			sql = "from H1BQuestionnariesEntity where h1questionnrie_id="+h1questionnrie_id+"";
			qunobj =(H1BQuestionnariesEntity) session.createQuery(sql).uniqueResult();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return qunobj;
	}
	
	
	@Override
	public void deleteInitiateDetails(Integer initiate_id) {
		Session session = null;
		try {
			session = sessfact.openSession();
			Transaction tx = session.beginTransaction();
			String stringQuery = "DELETE FROM CandidateH1BInitiateDetailsEntity WHERE initiate_id = " + initiate_id;
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
	public void deleteCandidateH1BCheckListDetails(Integer initiate_id, int candidate_id) {
		Session session = null;
		try {
			session = sessfact.openSession();
			Transaction tx = session.beginTransaction();
			String stringQuery = "DELETE FROM CandidateH1BCheckList WHERE candidate_id="+candidate_id+" and initiate_id = " + initiate_id;
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
	public ImmiDocumentSubTypeEntity getSubDocumentIdByName(String docType) {
		ImmiDocumentSubTypeEntity subDocObj=null;
		Session session = null;  
		try {
				String sql =null;
				session = sessfact.openSession();
				sql = "from ImmiDocumentSubTypeEntity where document_type='"+docType+"'";
				subDocObj =(ImmiDocumentSubTypeEntity) session.createQuery(sql).uniqueResult();
			} catch (Exception e) {
				logger.info(e.getMessage(), e);
			} finally {
				session.close();
			}
		return subDocObj;
	}
	
	@Override
	public Integer getCheckListIdsByIds(Integer candidate_id, Integer doctypeid, int subdocumenttype_id,
			Integer intiate_id, Integer profile_id, String bentype) {
		Integer chklistid=null;
		Session session = null;  
		try { 
		session = sessfact.openSession();
		String sql="select h1b_checklist_id from CandidateH1BCheckList where candidate_id="+candidate_id+" "
				+ "and initiate_id="+intiate_id+" and documenttype_id="+doctypeid+" and subdoctype_id="+subdocumenttype_id+" and profile_id="+profile_id+" and profile_type='"+bentype+"'";
		System.out.println("chklistid*********"+sql);
		chklistid =(Integer) session.createQuery(sql).uniqueResult();
		}catch (Exception e) {
			logger.info(e.getMessage(),e);
		}finally {
			session.close();
			} 
		return chklistid;
	}
	@Override
	public List<String> getimmiDocsCandidateListSatus(int initiate_id, int candidate_id) {
			List<String> candidateList = null;
			Session session = null;
			try {
				session = sessfact.openSession();
			/*	String sql = "select b.h1b_checklist_id as h1b_checklist_id,d.document_type as catName,s.document_type as subcatName,s.documenttype_id as document_id,b.initiate_id as initiate_id,\r\n" + 
						"dbo.fnGetNameByCandidateId(b.candidate_id) as candidateName, pm.profile_name as profileName, b.candidate_id as candidateId,s.is_same as is_same\r\n" + 
						"from Tbl_CandidateH1BCheckList b join ImmiDocumentSubTypeMaster s on \r\n" + 
						"s.subdocumenttype_id=b.subdoctype_id join ImmiDocumentTypeMaster d on d.documenttype_id=s.documenttype_id\r\n" + 
						"join Tbl_ImmiProfileLableMaster pm on pm.profile_id=b.profile_id where s.issubycand=1 and b.candidate_id="+candidate_id+"";		*/
				String sql="select distinct b.verifier_status as approved_status \r\n" + 
						"from Tbl_CandidateH1BCheckList b  join ImmiDocumentTypeMaster d on d.documenttype_id=b.documenttype_id\r\n" + 
						"join ImmiDocumentSubTypeMaster s on s.documenttype_id=d.documenttype_id\r\n" + 
						"join Tbl_ImmiProfileLableMaster pm on pm.profile_id=b.profile_id where b.candidate_id="+candidate_id+" and b.initiate_id="+initiate_id+" and s.issubycand in (1)";
				candidateList = (List<String>) session.createSQLQuery(sql).list();
			System.out.println("getimmiDocsCandidateListSatus******"+sql);
			} catch (Exception e) {
				logger.info(e.getMessage(), e);
			} finally {
				session.close();
			}
			return candidateList;
		}
	@Override
	public List<String> getimmiQuestionnariesSatusById(int initiate_id, int i, int candidate_id) {
			List<String> queapprstatus = null;
			Session session = null;  
			try { 
			session = sessfact.openSession();
			String sql="select distinct verifier_status from Immi_CandidateFormsStatus \r\n" + 
					"where candidate_id="+candidate_id+" and initiate_id="+initiate_id+"";
			queapprstatus = (List<String>) session.createSQLQuery(sql).list();
			}catch (Exception e) {
				logger.info(e.getMessage(),e);
			}finally {
				session.close();
				} 
			return queapprstatus;
	}
	@Override
	public void deleteCandidateH1BCheckListDetails(Integer initiate_id, Integer candidate_Id) {
			Session session = null;
			try {
				session = sessfact.openSession();
				Transaction tx = session.beginTransaction();
				String stringQuery = "DELETE FROM CandidateH1BCheckList WHERE candidate_id="+candidate_Id+" and initiate_id = " + initiate_id;
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
	public List<DocumentHistoryDto> getCandidatependingdocs(Integer docType_Id, Integer candidate_Id,
			Integer initiate_id, Integer profile_id, String profile_type, Integer questionnarieId) {
		
		List<DocumentHistoryDto> pendingdocs=null;
		Session session = null;  
		try { 
		session = sessfact.openSession();
		String sql=null;
		if(questionnarieId>0) {
			sql="select dbo.[fnGetImmiSubDocTypeNameById](subdoctype_id) as subdoctypename,subdoctype_id as subdocid,h1b_checklist_id,initiate_id,candidate_id as candidateId from Tbl_CandidateH1BCheckList c where documenttype_id="+docType_Id+" and candidate_id="+candidate_Id+" and \r\n" + 
					"				initiate_id="+initiate_id+" and profile_type='"+profile_type+"' and profile_id="+profile_id+" and questionnarie_childid="+questionnarieId+" and\r\n" + 
							" not exists (select * from Tbl_EmpDocuments d where c.h1b_checklist_id=d.h1b_checklist_id) ";
		}else {
			sql="select dbo.[fnGetImmiSubDocTypeNameById](subdoctype_id) as subdoctypename,subdoctype_id as subdocid,h1b_checklist_id,initiate_id,candidate_id as candidateId from Tbl_CandidateH1BCheckList c where documenttype_id="+docType_Id+" and candidate_id="+candidate_Id+" and \r\n" + 
					"				initiate_id="+initiate_id+" and profile_type='"+profile_type+"' and profile_id="+profile_id+"  and\r\n" + 
							" not exists (select * from Tbl_EmpDocuments d where c.h1b_checklist_id=d.h1b_checklist_id) ";
		}
		/*String sql="select dbo.[fnGetImmiSubDocTypeNameById](subdoctype_id) as subdoctypename,subdoctype_id as subdocid,h1b_checklist_id,initiate_id,candidate_id as candidateId from Tbl_CandidateH1BCheckList c where documenttype_id="+docType_Id+" and candidate_id="+candidate_Id+" and \r\n" + 
				"				initiate_id="+initiate_id+" and profile_type='"+profile_type+"' and profile_id="+profile_id+"  and\r\n" + 
						" not exists (select * from Tbl_EmpDocuments d where c.h1b_checklist_id=d.h1b_checklist_id) ";*/
		System.out.println("pendingdocs*********"+sql);
		pendingdocs= (List<DocumentHistoryDto>) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(DocumentHistoryDto.class)).list();
		
		//pendingdocs =(Integer) session.createQuery(sql).uniqueResult();
		}catch (Exception e) {
			logger.info(e.getMessage(),e);
		}finally {
			session.close();
			} 
		
		return pendingdocs;

	}
	@Override
	public String checkFileByCheckListId(Integer chkid) {
		String chkfile=null;
		Session session = null;  
		try { 
		session = sessfact.openSession();
		String sql="select file_name from Tbl_EmpDocuments where h1b_checklist_id="+chkid+" ";
		System.out.println(sql+"**chkfile");
		chkfile=(String) session.createSQLQuery(sql).uniqueResult();
		}catch (Exception e) {
			logger.info(e.getMessage(),e);
		}finally {
			session.close();
			} 
		return chkfile;
	}
	@Override
	public List<DocumentHistoryDto> getRepoFilesBychklistid(List<Integer> list) {
		List<DocumentHistoryDto> chkfile=null;
		Session session = null;  
		try { 
		session = sessfact.openSession();
		String sql="select distinct file_name,dbo.[fnGetImmiSubDocTypeNameById](documentsubtype_id)  as subdoctypename,input_value as \r\n" + 
				"				inputval,documentsubtype_id from Tbl_EmpDocuments where h1b_checklist_id in("+StringUtils.join(list, ',')+") ";
		System.out.println(sql+"**chkfile");
		chkfile=(List<DocumentHistoryDto>) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(DocumentHistoryDto.class)).list();
			}catch (Exception e) {
			logger.info(e.getMessage(),e);
		}finally {
			session.close();
			} 
		return chkfile;
	}
	@Override
	public List<Integer> getEmpidByids(Integer docType_id, Integer candidate_id, Integer initiate_id,
			Integer profile_id) {

		List<Integer>  empIds=null;
		Session session = null;  
		try { 
		session = sessfact.openSession();
		String sql="select distinct posted_by from Tbl_EmpDocuments where candidate_id="+candidate_id+" and documenttype_id="+docType_id+" and initiate_id="+initiate_id+"";
		empIds=(List<Integer>) session.createSQLQuery(sql).list();
		}catch (Exception e) {
			logger.info(e.getMessage(),e);
		}finally {
			session.close();
			} 
		return empIds;
	
	}

	@Override
	public TempH1BQuestionnariesEntity getTempH1BQuestionnariesByType(Integer candidateid, String beneficiaryType, int initiateId) {
		TempH1BQuestionnariesEntity cvlqObj = null;
		Session session = null;
		try {
			session = sessfact.openSession();
			String sql = "from TempH1BQuestionnariesEntity where candidate_id="+candidateid+" and applicant_type='"+beneficiaryType+"'and initiate_id="+initiateId+"";
			cvlqObj = (TempH1BQuestionnariesEntity) session.createQuery(sql).uniqueResult();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return cvlqObj;
	}
	@Override
	public List<TempH1BQuestionnariesEntity> getTempH1BQuestionnariesByChild(Integer candidateid, String beneficiaryType, int initiateId) {
		List<TempH1BQuestionnariesEntity> cvlqObj = null;
		Session session = null;
		try {
			session = sessfact.openSession();
			String sql = "from TempH1BQuestionnariesEntity where candidate_id="+candidateid+" and applicant_type='"+beneficiaryType+"' and initiate_id="+initiateId+"";
			cvlqObj = (List<TempH1BQuestionnariesEntity>) session.createQuery(sql).list();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return cvlqObj;
	}
	@Override
	public List<TempEntryandExitDatesEntity> getTempentryexitList(int h1queid) {
		List<TempEntryandExitDatesEntity> cvlqObj = null;
		Session session = null;
		try {
			session = sessfact.openSession();
			//String sql = "from EntryandExitDatesEntity where candidate_id="+candidateid+" and beneficiary_type='"+beneficiaryType+"' and h1questionnrie_id="+h1queid+"";
			String sql = "from TempEntryandExitDatesEntity where  h1questionnrie_id="+h1queid+"";
			cvlqObj = (List<TempEntryandExitDatesEntity>) session.createQuery(sql).list();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return cvlqObj;
	}
	@Override
	public Integer saveTempH1bQuestionnaries(TempH1BQuestionnariesEntity h1bqueApplObj) {
		Session session = null;  
		Transaction tx = null;
		Integer id=0;
		try {
			session = sessfact.openSession();  
			tx = session.beginTransaction();
			id=(Integer)session.save(h1bqueApplObj);
		} catch (Exception e) {
			tx.rollback(); 
			logger.info(e.getMessage(),e);
		}
		finally {
			tx.commit();
			session.close();}
		return id;
	}
	@Override
	public void saveTempH1bEntryExitDetails(TempEntryandExitDatesEntity h1bObj) {
		Session session = null;  
		Transaction tx = null;
		try {
			session = sessfact.openSession();  
			tx = session.beginTransaction();
			session.save(h1bObj);
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
	public TempH1BQuestionnariesEntity getTempH1BQuestionnarieDetailsById(Integer applh1que_id) {
		TempH1BQuestionnariesEntity h1bObj = null;
		Session session = null;
		try {
			session = sessfact.openSession();
			String sql = "from TempH1BQuestionnariesEntity where h1questionnrie_id="+applh1que_id+"";
			h1bObj = (TempH1BQuestionnariesEntity) session.createQuery(sql).uniqueResult();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return h1bObj;
	}
	@Override
	public void updateTempH1bQuestionnaries(TempH1BQuestionnariesEntity h1bqueApplObjDb) {
		Session session = null;
		try {
			session = sessfact.openSession();
			Transaction tx = session.beginTransaction();
			session.update(h1bqueApplObjDb);
			tx.commit();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
	}
	@Override
	public TempEntryandExitDatesEntity getTempEntryandExitDatesDetailsById(Integer applEntryid) {
		TempEntryandExitDatesEntity h1bObj = null;
		Session session = null;
		try {
			session = sessfact.openSession();
			String sql = "from TempEntryandExitDatesEntity where dates_id="+applEntryid+"";
			h1bObj = (TempEntryandExitDatesEntity) session.createQuery(sql).uniqueResult();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return h1bObj;
	}
	@Override
	public void updateTempH1bEntryExitDetails(TempEntryandExitDatesEntity h1bObj) {
		Session session = null;
		try {
			session = sessfact.openSession();
			Transaction tx = session.beginTransaction();
			session.update(h1bObj);
			tx.commit();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}		
	}
	@Override
	public List<ProfileMasterDTO> gettemplatedocsbyprofileid(Integer profile_id) {
		Session session = null;  
		List<ProfileMasterDTO> doclist=null;
		try {
			session = sessfact.openSession();  
			String sql="select distinct d.document_type as category,s.document_type as subcategory, s.issubycand as issubmitby,[dbo].[fnGetNameByEmpno](s.posted_by) as name \r\n" + 
					"from ImmiDocumentSubTypeMaster s join ImmiDocumentTypeMaster d on d.documenttype_id=s.documenttype_id\r\n" + 
					"join Tbl_ImmiProfileMasterCheckList p on p.subcategory_id=s.subdocumenttype_id and p.profile_id="+profile_id+"\r\n" + 
					"order by d.document_type";
			doclist=(List<ProfileMasterDTO>) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(ProfileMasterDTO.class)).list();
		} catch (Exception e) {
			//logger.error("Error in UserDaoImpl Class getAllUserGroups Method"+e.getStackTrace());
			logger.info(e.getMessage(),e);
		}
		finally {
			session.close();}  
		return doclist;
	}
	@Override
	public List<CandidateH1BInitiateDetailsEntity> getCandidatebyInitiaton() {
		List<CandidateH1BInitiateDetailsEntity> chkfile=null;
		Session session = null;  
		try { 
		session = sessfact.openSession();
		//String sql="select candidate_id from Tbl_CandidateH1BInitiateDetails where status='Active' and initiaion_status <> 'Completed'";
		String sql="from CandidateH1BInitiateDetailsEntity where status='Active' and initiaion_status <> 'Completed'";
		System.out.println(sql+"**chkcandi");
		
		chkfile=(List<CandidateH1BInitiateDetailsEntity>) session.createQuery(sql).list();
		//chkfile=(List<Integer>) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(DocumentHistoryDto.class)).list();
			}catch (Exception e) {
			logger.info(e.getMessage(),e);
		}finally {
			session.close();
			} 
		return chkfile;
	}
	@Override
	public List<DocumentHistoryDto> getPendingDocsbycandid(int candId,int initiateid) {
		 
		List<DocumentHistoryDto> chkfile=null;
		Session session = null;  
		try { 
		session = sessfact.openSession();
		/*String sql="select dbo.[fnGetImmiSubDocTypeNameById](subdoctype_id) as subdoctypename,dbo.fnGetNameByCandidateId("+candId+") as beneficiary_Name,subdoctype_id as subdocid,dbo.[fnGetH1bProfileNameById](profile_id) as profile_name,profile_type,h1b_checklist_id,initiate_id,candidate_id from Tbl_CandidateH1BCheckList c where candidate_id ="+candId+" and initiate_id="+initiateid+"  and subdoctype_id not in(2,6,16) and	 \r\n" + 
				"		not exists (select * from Tbl_EmpDocuments d where c.h1b_checklist_id=d.h1b_checklist_id) ";
	*/	
		/*String sql="select dbo.[fnGetImmiSubDocTypeNameById](subdoctype_id) as subdoctypename, dbo.fnGetNameByCandidateId("+candId+") as beneficiary_Name,subdoctype_id as subdocid,\r\n" + 
				"dbo.[fnGetH1bProfileNameById](profile_id) as profile_name,profile_type,h1b_checklist_id,initiate_id,candidate_id from Tbl_CandidateH1BCheckList where  candidate_id="+candId+" and ( candidate_status is null or candidate_status='Pending') and initiate_id="+initiateid+" and subdoctype_id not in(2,6,16)";*/
		String sql="select distinct dbo.[fnGetImmiSubDocTypeNameById](b.subdoctype_id) as subdoctypename, dbo.fnGetNameByCandidateId(b.candidate_id) as beneficiary_Name,b.subdoctype_id as subdocid, dbo.[fnGetH1bProfileNameById](b.profile_id) as profile_name,b.profile_type,b.h1b_checklist_id,b.initiate_id,b.candidate_id from Tbl_CandidateH1BCheckList b  join ImmiDocumentTypeMaster d on d.documenttype_id=b.documenttype_id join ImmiDocumentSubTypeMaster s on s.documenttype_id=d.documenttype_id where b.candidate_id="+candId+" and (b.candidate_status is null or b.candidate_status='Pending') and b.initiate_id="+initiateid+" and s.issubycand in (1)";
		System.out.println(sql+"**pending");
		//chkfile= session.createSQLQuery(sql).list();
		chkfile=(List<DocumentHistoryDto>) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(DocumentHistoryDto.class)).list();
			}catch (Exception e) {
			logger.info(e.getMessage(),e);
		}finally {
			session.close();
			} 
		return chkfile;
	}
	@Override
	public List<DocumentHistoryDto> getadminPendingDocsbycandid(int candId,int initiateid) {
		 
		List<DocumentHistoryDto> chkfile=null;
		Session session = null;  
		try { 
		session = sessfact.openSession();
		/*String sql="select dbo.[fnGetImmiSubDocTypeNameById](subdoctype_id) as subdoctypename,dbo.fnGetNameByCandidateId("+candId+") as beneficiary_Name,subdoctype_id as subdocid,dbo.[fnGetH1bProfileNameById](profile_id) as profile_name,profile_type,h1b_checklist_id,initiate_id,candidate_id from Tbl_CandidateH1BCheckList c where candidate_id ="+candId+" and initiate_id="+initiateid+"  and    subdoctype_id in(2,6,16) and 	 \r\n" + 
				"		not exists (select * from Tbl_EmpDocuments d where c.h1b_checklist_id=d.h1b_checklist_id) ";*/
		String sql="select distinct dbo.[fnGetImmiSubDocTypeNameById](b.subdoctype_id) as subdoctypename, dbo.fnGetNameByCandidateId(b.candidate_id) as beneficiary_Name,b.subdoctype_id as subdocid, dbo.[fnGetH1bProfileNameById](b.profile_id) as profile_name,b.profile_type,b.h1b_checklist_id,b.initiate_id,b.candidate_id from Tbl_CandidateH1BCheckList b  join ImmiDocumentTypeMaster d on d.documenttype_id=b.documenttype_id join ImmiDocumentSubTypeMaster s on s.documenttype_id=d.documenttype_id where b.candidate_id="+candId+" and (b.candidate_status is null or b.candidate_status='Pending') and b.initiate_id="+initiateid+" and s.issubycand in (0)";
		System.out.println(sql+"**pending");
		//chkfile= session.createSQLQuery(sql).list();
		chkfile=(List<DocumentHistoryDto>) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(DocumentHistoryDto.class)).list();
			}catch (Exception e) {
			logger.info(e.getMessage(),e);
		}finally {
			session.close();
			} 
		return chkfile;
	}
	
	@Override
	public List<DocumentHistoryDto> getadminaprPendingDocsbycandid(int candId,int initiateid) {
		 
		List<DocumentHistoryDto> chkfile=null;
		Session session = null;  
		try { 
		session = sessfact.openSession();
		
		/*String sql="select distinct dbo.[fnGetH1BDocumentNameByDocTypeId](documenttype_id) as doctypename,dbo.fnGetNameByCandidateId("+candId+") as beneficiary_Name,dbo.[fnGetH1bProfileNameById](profile_id) as profile_name,candidate_id from Tbl_CandidateH1BCheckList c where candidate_id ="+candId+" and initiate_id="+initiateid+"  and    subdoctype_id not in(2,6,16) and 	 \r\n" + 
				"	  candidate_status='Submitted' and verifier_status is null 	 ";*/
		String sql="select distinct dbo.[fnGetImmiSubDocTypeNameById](b.subdoctype_id) as doctypename, dbo.fnGetNameByCandidateId(b.candidate_id) as beneficiary_Name,b.subdoctype_id as subdocid, dbo.[fnGetH1bProfileNameById](b.profile_id) as profile_name,b.profile_type,b.h1b_checklist_id,b.initiate_id,b.candidate_id from Tbl_CandidateH1BCheckList b  join ImmiDocumentTypeMaster d on d.documenttype_id=b.documenttype_id join ImmiDocumentSubTypeMaster s on s.documenttype_id=d.documenttype_id where b.candidate_id="+candId+" and b.candidate_status='Submitted' and  (b.verifier_status is null or b.verifier_status ='Pending')  and b.initiate_id="+initiateid+" and s.issubycand in (1)";
		System.out.println(sql+"**adminaprpending");
		//chkfile= session.createSQLQuery(sql).list();
		chkfile=(List<DocumentHistoryDto>) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(DocumentHistoryDto.class)).list();
			}catch (Exception e) {
			logger.info(e.getMessage(),e);
		}finally {
			session.close();
			} 
		return chkfile;
	}
	@Override
	public List<DocumentHistoryDto> getPendingquestionariesBycandid(int candId,int initiateid) {
		 
		List<DocumentHistoryDto> chkfile=null;
		Session session = null;  
		try { 
		session = sessfact.openSession();
		
		String sql="select dbo.fnGetNameByCandidateId("+candId+") as beneficiary_Name,verifier_status,candidate_id,form_type from Immi_CandidateFormsStatus where candidate_id="+candId+" AND initiate_id="+initiateid+" and candidate_status='Submitted' and verifier_status='Pending'   \r\n" + 
				"";
		System.out.println(sql+"**questionaries");
		//chkfile= session.createSQLQuery(sql).list();
		chkfile=(List<DocumentHistoryDto>) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(DocumentHistoryDto.class)).list();
			}catch (Exception e) {
			logger.info(e.getMessage(),e);
		}finally {
			session.close();
			} 
		return chkfile;
	}
	@Override
	public List<LCADetailsEntity> getlcaid() {
		List<LCADetailsEntity> chkfile=null;
		Session session = null;  
		try { 
		session = sessfact.openSession();
		//String sql="select candidate_id from Tbl_CandidateH1BInitiateDetails where status='Active' and initiaion_status <> 'Completed'";
		String sql="from LCADetailsEntity where status='Active' ";
		System.out.println(sql+"**lcaid");
		
		chkfile=(List<LCADetailsEntity>) session.createQuery(sql).list();
			}catch (Exception e) {
			logger.info(e.getMessage(),e);
		}finally {
			session.close();
			} 
		return chkfile;
	}
	@Override
	public List<LCADetailsDto> getPendingcandidBylcaid(int lcaid) {
		List<LCADetailsDto> chkfile=null;
		Session session = null;  
		try { 
		session = sessfact.openSession();
		String sql="select [dbo].[fnGetDocCountByLCAId]("+lcaid+") as lcadoc_count ,candidate_id,dbo.fnGetNameByCandidateId(candidate_id) as candidatename,"
                + "[dbo].[fnGetLCANumberById]("+lcaid+") as lca_number ,[dbo].[fnGetLCARefNoById]("+lcaid+") as lca_reference  "
                + "from Tbl_LCADetails where lca_id="+lcaid+" group by candidate_id  order by candidatename";
	/*	String sql="select count(*) as lcadoc_count ,candidate_id,dbo.fnGetNameByCandidateId(candidate_id) as candidatename,"
				+ "[dbo].[fnGetLCANumberById]("+lcaid+") as lca_number ,[dbo].[fnGetLCARefNoById]("+lcaid+") as lca_reference  "
				+ "from Tbl_EmpDocuments where lca_id="+lcaid+" group by candidate_id  order by candidatename";*/
		System.out.println(sql+"**lcacount");
		//chkfile= session.createSQLQuery(sql).list();
		chkfile=(List<LCADetailsDto>) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(LCADetailsDto.class)).list();
			}catch (Exception e) {
			logger.info(e.getMessage(),e);
		}finally {
			session.close();
			} 
		return chkfile;
	}
	@Override
	public TempClientVendorQuestionnarieEntity getTempClientVendorLetterQuestionarieById(Integer candidateid,
			int initiate_id) {
		TempClientVendorQuestionnarieEntity cvlqObj = null;
		Session session = null;
		try {
			session = sessfact.openSession();
			String sql = "from TempClientVendorQuestionnarieEntity where candidate_id="+candidateid+" and initiate_id="+initiate_id+"";
			cvlqObj = (TempClientVendorQuestionnarieEntity) session.createQuery(sql).uniqueResult();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return cvlqObj;
	}
	@Override
	public TempClientVendorQuestionnarieAddressEntity getTempClientVendorQuestionnarieByClientIdType(int client_id,
			String clientType) {
		TempClientVendorQuestionnarieAddressEntity cvlqObj = null;
		Session session = null;
		try {
			session = sessfact.openSession();
			String sql = "from TempClientVendorQuestionnarieAddressEntity where client_id="+client_id+" and company_type='"+clientType+"'";
			cvlqObj = (TempClientVendorQuestionnarieAddressEntity) session.createQuery(sql).uniqueResult();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return cvlqObj;
	}
	@Override
	public List<TempClientVendorQuestionnarieAddressEntity> getTempClientVendorLetterQuestionarieAddressesById(
			Integer candidateid, int client_id) {
		Session session = null;  
		List<TempClientVendorQuestionnarieAddressEntity> cvladdrList=null;
		try {
			session = sessfact.openSession();  
			String hql="from TempClientVendorQuestionnarieAddressEntity where candidate_id="+candidateid+" and client_id="+client_id+" and company_type!='End Client'";
			cvladdrList= session.createQuery(hql).list();
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		finally {
			session.close();}  
		return cvladdrList;
	}
	@Override
	public TempClientVendorQuestionnarieEntity getTempClientVendorQuestionnarieByClientId(Integer cvlclientid) {
		TempClientVendorQuestionnarieEntity cvlqObj = null;
		Session session = null;
		try {
			session = sessfact.openSession();
			String sql = "from TempClientVendorQuestionnarieEntity where client_id="+cvlclientid+"";
			cvlqObj = (TempClientVendorQuestionnarieEntity) session.createQuery(sql).uniqueResult();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return cvlqObj;
	}
	@Override
	public Integer saveTempClientVendorLetterQuestionnaire(TempClientVendorQuestionnarieEntity cvlqueObj) {
		Session session = null;  
		Transaction tx = null;
		Integer id=0;
		try {
			session = sessfact.openSession();  
			tx = session.beginTransaction();
			id=(Integer)session.save(cvlqueObj);
		} catch (Exception e) {
			tx.rollback(); 
			logger.info(e.getMessage(),e);
		}
		finally {
			tx.commit();
			session.close();}
		return id;
	}
	@Override
	public TempClientVendorQuestionnarieAddressEntity getTempClientVendorQuestionnarieAddressById(
			Integer address_id) {
		TempClientVendorQuestionnarieAddressEntity cvlqObj = null;
		Session session = null;
		try {
			session = sessfact.openSession();
			String sql = "from TempClientVendorQuestionnarieAddressEntity where address_id="+address_id+"";
			cvlqObj = (TempClientVendorQuestionnarieAddressEntity) session.createQuery(sql).uniqueResult();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return cvlqObj;
	}
	@Override
	public void updateTempClientVendorLetterQuestionnaireAddress(
			TempClientVendorQuestionnarieAddressEntity cvlAddressObj) {
		Session session = null;
		try {
			session = sessfact.openSession();
			Transaction tx = session.beginTransaction();
			session.update(cvlAddressObj);
			tx.commit();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}		
	}
	@Override
	public void saveTempClientVendorLetterQuestionnaireAddress(
			TempClientVendorQuestionnarieAddressEntity cvlAddressObj) {
		Session session = null;  
		Transaction tx = null;
		try {
			session = sessfact.openSession();  
			tx = session.beginTransaction();
			session.save(cvlAddressObj);
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
	public void updateTempClientVendorLetterQuestionnaire(TempClientVendorQuestionnarieEntity cvlqueObjDb) {
		Session session = null;
		try {
			session = sessfact.openSession();
			Transaction tx = session.beginTransaction();
			session.update(cvlqueObjDb);
			tx.commit();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}		
	}
	
	@Override
	public List<ContractsPanelDetails_DTO> getimmiCandidateDocsAdminList(Integer initiateId, int profile_id, Integer candidate_id) {
			List<ContractsPanelDetails_DTO> candidateList = null;
			Session session = null;
			try {
				session = sessfact.openSession();
			/*	String sql = "select b.h1b_checklist_id as h1b_checklist_id,d.document_type as catName,s.document_type as subcatName,s.documenttype_id as document_id,b.initiate_id as initiate_id,\r\n" + 
						"dbo.fnGetNameByCandidateId(b.candidate_id) as candidateName, pm.profile_name as profileName, b.candidate_id as candidateId,s.is_same as is_same\r\n" + 
						"from Tbl_CandidateH1BCheckList b join ImmiDocumentSubTypeMaster s on \r\n" + 
						"s.subdocumenttype_id=b.subdoctype_id join ImmiDocumentTypeMaster d on d.documenttype_id=s.documenttype_id\r\n" + 
						"join Tbl_ImmiProfileLableMaster pm on pm.profile_id=b.profile_id where s.issubycand=0 and b.candidate_id="+candidate_id+"";			*/
				String sql="select distinct b.documenttype_id as document_id,(select distinct is_same from ImmiDocumentSubTypeMaster where documenttype_id=b.documenttype_id) as is_same,"
						+ "d.document_type as catName,b.initiate_id as initiate_id,b.profile_type as profile_type,b.profile_id as profile_id,\r\n" + 
						"dbo.fnGetNameByCandidateId(b.candidate_id) as candidateName, pm.profile_name as profileName, b.candidate_id as candidateId,b.verifier_status as approved_status,b.printed_status as printed_status\r\n" + 
						"from Tbl_CandidateH1BCheckList b  join ImmiDocumentTypeMaster d on d.documenttype_id=b.documenttype_id\r\n" + 
						"join ImmiDocumentSubTypeMaster s on s.documenttype_id=d.documenttype_id\r\n" + 
						"join Tbl_ImmiProfileLableMaster pm on pm.profile_id=b.profile_id where b.candidate_id="+candidate_id+" and b.initiate_id="+initiateId+" and s.issubycand=0 and b.isdocshowntocand='Yes'";
				candidateList = (List<ContractsPanelDetails_DTO>) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(ContractsPanelDetails_DTO.class)).list();
				System.out.println("getimmiCandidateDocsAdminList/////////"+sql);
			} catch (Exception e) {
				logger.info(e.getMessage(), e);
			} finally {
				session.close();
			}
			return candidateList;
		}
	
	@Override
	public FormsRejectionDetailsEntity getFormsRejectionDetailsById(Integer h1queid, String benf_type,
			String form_type) {
		FormsRejectionDetailsEntity cvlqObj = null;
		Session session = null;
		try {
			session = sessfact.openSession();
			String sql = "from FormsRejectionDetailsEntity where form_id="+h1queid+" and form_type='"+form_type+"' and benf_type='"+benf_type+"' and status='Active'";
			cvlqObj = (FormsRejectionDetailsEntity) session.createQuery(sql).uniqueResult();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return cvlqObj;
	}
	@Override
	public void saveFormsRejectionDetails(FormsRejectionDetailsEntity historyObj) {
		Session session = null;  
		Transaction tx = null;
		try {
			session = sessfact.openSession();  
			tx = session.beginTransaction();
			session.save(historyObj);
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
	public void updateFormsRejectionDetails(FormsRejectionDetailsEntity historyObjDb) {
		Session session = null;
		try {
			session = sessfact.openSession();
			Transaction tx = session.beginTransaction();
			session.update(historyObjDb);
			tx.commit();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}	
	}
	@Override
	public List<FormsRejectionDetailsEntity> getFormsRejectionDetailsListById(Integer h1queid, String benf_type,
			String form_type) {
		Session session = null;  
		List<FormsRejectionDetailsEntity> rejhistoryList=null;
		try {
			session = sessfact.openSession();  
			String hql = "from FormsRejectionDetailsEntity where form_id="+h1queid+" and form_type='"+form_type+"' and benf_type='"+benf_type+"'";
			rejhistoryList= session.createQuery(hql).list();
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		finally {
			session.close();}  
		return rejhistoryList;
	}
	@Override
	public List<FormsRejectionDetailsDto> viewrejectedfieldshistorybyid(Integer h1queid, String benf_type,
			String form_type) {
		Session session = null;
		List<FormsRejectionDetailsDto> commentHistoryList = null;
		try {
			session = sessfact.openSession();
			
			String sql="select c.id as history_id,c.rejectedfields as rejectedfields,c.form_status as form_status,c.benf_type as benf_type,c.status as status,c.rejectioncoments as rejectioncoments, c.form_type as form_type,\r\n" + 
					"dbo.fnGetNameByCandidateId(c.varifier_by) as varifier_by, convert(varchar,c.verifier_submitted_on,25) as submitted_on \r\n" + 
					"from Tbl_Immi_Forms_Rejection_Details c where c.form_id="+h1queid+" and c.form_type='"+form_type+"' and c.benf_type='"+benf_type+"'";
			commentHistoryList = (List<FormsRejectionDetailsDto>) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(FormsRejectionDetailsDto.class)).list();
			}catch (Exception e) {
				logger.info(e.getMessage(),e);
			}finally {
				session.close();
				} 
			return commentHistoryList;
	}
}