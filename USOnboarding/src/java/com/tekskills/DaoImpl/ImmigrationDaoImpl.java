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

import com.tekskills.Dao.ImmigrationDao;
import com.tekskills.Dto.BasicDetailsDto;
import com.tekskills.Dto.ClientVendorMaster_DTO;
import com.tekskills.Dto.DocEmpBean;
import com.tekskills.Dto.DocumentTypeDto;
import com.tekskills.Dto.LCADetailsDto;
import com.tekskills.Dto.TaskDetailsDto;
import com.tekskills.Dto.TempCandidateDetailsDTO;
import com.tekskills.Entity.ClientDetailsEntity;
import com.tekskills.Entity.CompanyAdressEntity;
import com.tekskills.Entity.ImmiDocumentSubTypeEntity;
import com.tekskills.Entity.ImmiDocumentTypeEntity;
import com.tekskills.Entity.LCADetailsEntity;
import com.tekskills.Entity.TaskDetailsEntity;

@Repository
public class ImmigrationDaoImpl implements ImmigrationDao {
	private static final Logger logger = Logger.getLogger(ImmigrationDaoImpl.class);
	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory sessfact;
	@Override
	public List<BasicDetailsDto> getW2CandidateList() {
		List<BasicDetailsDto> candidateList = null;
		Session session = null;
		try {String sql =null;
			session = sessfact.openSession();
				//sql = "select candidate_id as candidate_id,dbo.fnGetNameByCandidateId(candidate_id) as fullname from Tbl_CandidateDetailedInfo where emp_type='W2' and status='Active' and work_authorization='H-1B' order by dbo.fnGetNameByCandidateId(candidate_id) asc";
			sql = "select candidate_id as candidate_id,dbo.fnGetNameByCandidateId(candidate_id) as fullname, \r\n" + 
					"emp_type as emp_type, work_authorization as workAuth\r\n" + 
					"from Tbl_CandidateDetailedInfo where (emp_type in ('W2','W2 Admin') or emp_type is null) and status='Active' \r\n" + 
					"and work_authorization not in ('Green Card','US Citizen') order by dbo.fnGetNameByCandidateId(candidate_id) asc";
				candidateList =  (List<BasicDetailsDto>) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(BasicDetailsDto.class)).list();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return candidateList;
	}
	@Override
	public List<BasicDetailsDto> getW2CandidateListrepo() {
		List<BasicDetailsDto> candidateList = null;
		Session session = null;
		try {
			String sql =null;
			session = sessfact.openSession();
			sql = "SELECT user_name as username,candidate_id FROM  Tbl_EmpBasicDetails WHERE status=1 and candidate_id<>1";
			
				candidateList =  (List<BasicDetailsDto>) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(BasicDetailsDto.class)).list();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return candidateList;
	}
	@Override
	public List<ClientVendorMaster_DTO> getEndclientListByCandidateId(Integer candidateId) {
		List<ClientVendorMaster_DTO> clientList = null;
		Session session = null;
		try {String sql =null;
			session = sessfact.openSession();
				sql = "select p.payrate_id as payrate_id,c.customer_id as custid ,c.customer_name as custname, \r\n" + 
						"p.candidate_id as candidate_id,ec.client_id as clientid,ec.client_name as clientName \r\n" + 
						"from Tbl_CustomerMaster c join Tbl_VendorPayRateDetails p on c.customer_id=p.customer_id \r\n" + 
						"join Tbl_ClientDetails ec on p.payrate_id=ec.payrate_id where p.candidate_id="+candidateId+" \r\n" + 
						" and p.status='Active' and ec.status=1 order by ec.client_name asc" ;
				//and p.status='Active' and ec.status=1
				clientList =  (List<ClientVendorMaster_DTO>) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(ClientVendorMaster_DTO.class)).list();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return clientList;
	}
	@Override
	public ClientDetailsEntity getEndClientDetailsById(Integer candidate_Id, Integer client_id) {
		ClientDetailsEntity clientObj = null;
		Session session = null;
		try {String sql =null;
			session = sessfact.openSession();
			if(candidate_Id!=0 && client_id!=0) {
				sql = "from ClientDetailsEntity where client_id="+client_id+" and candidate_id="+candidate_Id+"";
			}else {
				sql = "from ClientDetailsEntity where client_id="+client_id+"";
			}
				
				clientObj = (ClientDetailsEntity) session.createQuery(sql).uniqueResult();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return clientObj;
	}
	@Override
	public CompanyAdressEntity getEndclientAddressByclientId(Integer client_id) {
		CompanyAdressEntity addressObj = null;
		Session session = null;
		try {String sql =null;
			session = sessfact.openSession();
				sql = "from CompanyAdressEntity where company_id="+client_id+" and company_type='EndClient' and status='Active'";
				addressObj = (CompanyAdressEntity) session.createQuery(sql).uniqueResult();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return addressObj;
	}
	@Override
	public CompanyAdressEntity getRemoteAddressByclientId(Integer client_id) {
		CompanyAdressEntity addressObj = null;
		Session session = null;
		try {String sql =null;
			session = sessfact.openSession();
			sql = "from CompanyAdressEntity where company_id="+client_id+" and company_type='Remote/Home' and status='Active'";
			addressObj = (CompanyAdressEntity) session.createQuery(sql).uniqueResult();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return addressObj;
	}
	@Override
	public List<TaskDetailsDto> gettaskdetailsbyids(Integer candidate_Id, Integer client_id,String type) {
		List<TaskDetailsDto> candidateTaskList = null;
		Session session = null;
		try {String sql =null;
			session = sessfact.openSession();
				//if(client_id!=0) {
					sql = "exec getAllTasksByCandidateId @candidateId="+candidate_Id+",@tasktype='"+type+"'";
				/* ,@clientId="+client_id+"}else {
					sql = "exec getAllTasksByCandidateId @candidateId="+candidate_Id+",@clientId=""";
				}*/
				candidateTaskList =(List<TaskDetailsDto>) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(TaskDetailsDto.class)).list();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return candidateTaskList;
	}
	@Override
	public TaskDetailsEntity getTaskdetailsById(Integer task_Id) {
		TaskDetailsEntity taskObj = null;
		Session session = null;
		try {String sql =null;
			session = sessfact.openSession();
				sql = "from TaskDetailsEntity where task_id="+task_Id+"";
				taskObj = (TaskDetailsEntity) session.createQuery(sql).uniqueResult();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return taskObj;
	}
	@Override
	public void updatetask(TaskDetailsEntity taskObj) {
		Session session = null;
		try {
			session = sessfact.openSession();
			Transaction tx = session.beginTransaction();
			session.update(taskObj);
			tx.commit();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
	   }
	}
	@Override
	public Integer addtask(TaskDetailsEntity taskObj) {
		Session session = null;
		Integer taskid=null;
		try {
			session = sessfact.openSession();
			Transaction tx = session.beginTransaction();
			taskid=(Integer) session.save(taskObj);
			tx.commit();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
	}
		return taskid;

	}
	@Override
	public List<DocEmpBean> getLCAHistory(Integer candidate_Id, Integer client_id) {
		List<DocEmpBean> candidateList = null;
		Session session = null;
		try {String sql =null;
			session = sessfact.openSession();
				/*sql = "select l.lca_id as lca_id,l.lca_number as lca_number,l.case_type as case_type,l.lca_submitted_date as lca_submitted_date,\r\n" + 
						"l.lca_begin_date as lca_begin_date,l.lca_end_date as lca_end_date,l.lca_certified_date as lca_certified_date\r\n" + 
						",l.job_title as job_title,l.soc as soc,l.wage_rate as wage_rate,l.previling_wage as previling_wage,\r\n" + 
						"l.wage_level as wage_level,l.payrate_id as payrate_id,l.candidate_id as candidate_id\r\n" + 
						",c.client_name as client_name,e.file_name as file_name,\r\n" + 
						"dbo.[fnGetNameByCandidateId](l.candidate_id) as candidatename,(select (line1+','+line2+','+city+','+state+','+zipcode)"
						+ " from Tbl_CompanyAddress where company_id="+client_id+" and company_type='EndClient') as endclientaddress\r\n" + 
						"from Tbl_LCADetails l  join Tbl_EmpDocuments e on l.lca_id=e.lca_id  join \r\n" + 
						"Tbl_ClientDetails c on c.client_id=l.lca_id and e.status='Active' and l.candidate_id="+candidate_Id+"";*/
			sql="select e.document_id as document_id,e.candidate_id as candidate_id,\r\n" + 
					"dbo.[fnGetLCANumberById](e.lca_id) as lca_number,e.lca_id as lca_id,from_date as startdate,\r\n" + 
					"expiry_date as expirydate,dbo.[fnGetEndClientNameByClientId](e.client_id) as client_name,\r\n" + 
					"e.file_name as file_name,dbo.[fnGetNameByCandidateId](candidate_id) as empName\r\n" + 
					"from Tbl_EmpDocuments e where e.file_type='LCA' and e.candidate_id="+candidate_Id+"";	
			candidateList =(List<DocEmpBean>) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(DocEmpBean.class)).list();
						
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return candidateList;
	}
	@Override
	public ClientDetailsEntity getEndclientByClientId(Integer client_id) {
		ClientDetailsEntity clientObj = null;
		Session session = null;
		try {String sql =null;
			session = sessfact.openSession();
				sql = "from ClientDetailsEntity where client_id="+client_id+"";
				clientObj = (ClientDetailsEntity) session.createQuery(sql).uniqueResult();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return clientObj;
	}
	
	@Override
	public void saveTaskDetails(TaskDetailsEntity taskObj) {
		Session session = null;
		try {
			session = sessfact.openSession();
			Transaction tx = session.beginTransaction();
			session.save(taskObj);
			tx.commit();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
	}
		return ;
	}
	
	@Override
	public Integer saveLCADetails(LCADetailsEntity lcaObj) {
		Session session = null;
		Integer lcaId = null;
		try {
			session = sessfact.openSession();
			Transaction tx = session.beginTransaction();
			lcaId = (Integer) session.save(lcaObj);
			tx.commit();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return lcaId;
	}
	@Override
	public String checkLCANumber(String lcaNumber) {
		String lca=null;
		Session session = null;  
		try { 
		session = sessfact.openSession();
		String sql="select distinct lca_number from tbl_LCADetails where lca_number='"+lcaNumber+"'";
		lca=(String) session.createSQLQuery(sql).uniqueResult();
		}catch (Exception e) {
			logger.info(e.getMessage(),e);
		}finally {
			session.close();
			} 
		return lca;
	}
	@Override
	public LCADetailsDto getLcaTopRecord(Integer canddateid) {
		LCADetailsDto lcaObj = null;
		Session session = null;
		try {String sql =null;
			session = sessfact.openSession();
			if(canddateid!=0) {
				sql = "select top 1 lca_id,lca_reference,lca_begin_date,job_title,lca_end_date from Tbl_LCADetails where candidate_id="+canddateid+" order by lca_id desc";
			}else {
				sql = "select top 1 lca_id,lca_reference,lca_begin_date,job_title,lca_end_date from Tbl_LCADetails order by lca_id desc";
			}
			lcaObj =(LCADetailsDto) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(LCADetailsDto.class)).uniqueResult();
				
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return lcaObj;
	}
	@Override
	public List<LCADetailsDto> getAllLCAList(Integer candidate_Id,Integer clientid) {
		List<LCADetailsDto> lcaList = null;
		Session session = null;
		try {String sql =null;
			session = sessfact.openSession();
				/*sql = "select lca_id,lca_number,lca_reference,dbo.[fnGetEndClientNameByClientId](client_id) as client_name,[dbo].[fnGetDocCountByLCAId](lca_id) as lcadoc_count  "
						+ "from Tbl_LCADetails where candidate_id="+candidate_Id+" and client_id=COALESCE(NULLIF("+clientid+", ''),client_id) order by lca_id desc";*/
			sql="select  l.lca_id,l.lca_number,l.lca_reference,dbo.[fnGetEndClientNameByClientId](l.client_id) as client_name,[dbo].[fnGetDocCountByLCAId](l.lca_id) as lcadoc_count,CASE  WHEN c.status=1 THEN 'Active' WHEN c.status=0 THEN 'InActive'  END as enclientsatus from Tbl_LCADetails l, Tbl_ClientDetails c where l.candidate_id="+candidate_Id+" and l.client_id=COALESCE(NULLIF("+clientid+", ''),l.client_id)	 and c.client_id=l.client_id and l.status='Active' order by l.lca_id desc";
				lcaList =(List<LCADetailsDto>) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(LCADetailsDto.class)).list();
		
							
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return lcaList;
	}
	@Override
	public List<DocumentTypeDto> getsubdocsbydoclcaid(Integer lca_id) {
		List<DocumentTypeDto> subdocTypeList = null;
		Session session = null;
		try {String sql =null;
			session = sessfact.openSession();
				sql = "select lca_id,lca_number,lca_reference from Tbl_LCADetails  order by lca_id desc";
				subdocTypeList =(List<DocumentTypeDto>) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(DocumentTypeDto.class)).list();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return subdocTypeList;
	}
	@Override
	public Integer getDocumentCountByLcaId(Integer lca_id) {
		Integer docCount=null;
		Session session = null;  
		try { 
		session = sessfact.openSession();
		String sql="select count(*) as docCount from Tbl_EmpDocuments where lca_id="+lca_id+" and file_type='LCA' and status='Active'";
		docCount=(Integer) session.createSQLQuery(sql).uniqueResult();
		}catch (Exception e) {
			logger.info(e.getMessage(),e);
		}finally {
			session.close();
			} 
		return docCount;
	}
	@Override
	public List<DocumentTypeDto> getsubdoctypesbydocid(Integer doc_id, Integer docCount) {
		List<DocumentTypeDto> subdocTypeList = null;
		Session session = null;
		try {String sql =null;
			session = sessfact.openSession();
			if(docCount==0) {
				sql = "select subdocumenttype_id as subdoctypeid,document_type as subdoctypename  from ImmiDocumentSubTypeMaster where documenttype_id="+doc_id+"";
			}else {
				sql = "select subdocumenttype_id as subdoctypeid,document_type as subdoctypename  from ImmiDocumentSubTypeMaster where documenttype_id="+doc_id+"";
			  }
			subdocTypeList =(List<DocumentTypeDto>) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(DocumentTypeDto.class)).list();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return subdocTypeList;
	}
	@Override
	public LCADetailsEntity getLcaDetailsById(Integer lca_Id) {
		LCADetailsEntity lcaObj = null;
		Session session = null;
		try {String sql =null;
			session = sessfact.openSession();
				sql = "from LCADetailsEntity where lca_id="+lca_Id+"";
				lcaObj = (LCADetailsEntity) session.createQuery(sql).uniqueResult();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return lcaObj;
	}
	@Override
	public void updateLCADetails(LCADetailsEntity lcaObj) {
		Session session = null;
		try {
			session = sessfact.openSession();
			Transaction tx = session.beginTransaction();
			session.update(lcaObj);
			tx.commit();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
	   }
	}
	@Override
	public List<LCADetailsDto> getAllLCAListByClientId(Integer client_id) {
		List<LCADetailsDto> lcaList = null;
		Session session = null;
		try {String sql =null;
			session = sessfact.openSession();
				sql = "select lca_id,lca_number,lca_reference from Tbl_LCADetails where client_id="+client_id+" order by lca_id desc";
				lcaList =(List<LCADetailsDto>) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(LCADetailsDto.class)).list();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return lcaList;
	}
	@Override
	public List<DocEmpBean> lcaDetailsByLcaId(Integer lca_id) {
		List<DocEmpBean> lcaList = null;
		Session session = null;
		try {String sql =null;
			session = sessfact.openSession();
				/*sql = "select e.document_id as document_id,e.candidate_id as candidate_id,\r\n" + 
						"dbo.[fnGetLCANumberById](e.lca_id) as lca_number,e.lca_id as lca_id,from_date as startdate, \r\n" + 
						"expiry_date as expirydate,dbo.[fnGetEndClientNameByClientId](e.client_id) as client_name,\r\n" + 
						"e.file_name as file_name,dbo.[fnGetNameByCandidateId](candidate_id) as empName,\r\n" + 
						"dbo.[fnGetImmiSubDocTypeNameById](e.documentsubtype_id) as subdocname,dbo.[fnGetJobTitleClientId](e.client_id) as jobtitle\r\n" + 
						"from Tbl_EmpDocuments e where e.file_type='LCA' and e.lca_id="+lca_id+"";*/
				sql="select e.document_id as document_id,e.candidate_id as candidate_id,\r\n" + 
					"dbo.[fnGetLCANumberById](e.lca_id) as lca_number,e.lca_id as lca_id,e.from_date as startdate,e.input_value as inputval, \r\n" + 
					"e.expiry_date as expirydate,dbo.[fnGetEndClientNameByClientId](e.client_id) as client_name,\r\n" + 
					"e.file_name as file_name,dbo.[fnGetNameByCandidateId](candidate_id) as empName,\r\n" + 
					"dbo.[fnGetImmiSubDocTypeNameById](e.documentsubtype_id) as subdocname,dbo.[fnGetJobTitleClientId](e.client_id) as jobtitle,e.documentsubtype_id as documentsubtype_id\r\n" + 
					"from Tbl_EmpDocuments e where e.file_type='LCA' and e.lca_id="+lca_id+" and e.status='Active'";
				lcaList =(List<DocEmpBean>) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(DocEmpBean.class)).list();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return lcaList;
	}
	
	@Override
	public Integer checksubdocsbydoclcaid(Integer lca_id, Integer doctype_id, Integer subdoctype_id) {
		Integer docCount=null;
		Session session = null;  
		try { 
		session = sessfact.openSession();
		String sql="select count(*) as docCount from Tbl_EmpDocuments where lca_id="+lca_id+" and documenttype_id="+doctype_id+" and documentsubtype_id="+subdoctype_id+" and file_type='LCA' and status='Active'";
		docCount=(Integer) session.createSQLQuery(sql).uniqueResult();
		}catch (Exception e) {
			logger.info(e.getMessage(),e);
		}finally {
			session.close();
			} 
		return docCount;
	}
	
	@Override
	public Integer checkDocsExitsorNot(Integer candidate_id) {
		Integer docCount = null;
		Session session = null;
		try {String sql =null;
			session = sessfact.openSession();
				sql = "select distinct candidate_id from Tbl_DocumentCheckListMaster" ;
				docCount=(Integer) session.createSQLQuery(sql).uniqueResult();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return docCount;
	}
	
	@Override
	public List<DocEmpBean> getdochistorybyId(Integer lca_id, Integer docsub_Id) {
		List<DocEmpBean> lcaList = null;
		Session session = null;
		try {String sql =null;
			session = sessfact.openSession();
				sql = 	"select e.document_id as document_id,e.candidate_id as candidate_id,\r\n" + 
						"dbo.[fnGetLCANumberById](e.lca_id) as lca_number,e.lca_id as lca_id,from_date as startdate, \r\n" + 
						"expiry_date as expirydate,dbo.[fnGetEndClientNameByClientId](e.client_id) as client_name,\r\n" + 
						"e.file_name as file_name,dbo.[fnGetNameByCandidateId](candidate_id) as empName,\r\n" + 
						"dbo.[fnGetImmiSubDocTypeNameById](e.documentsubtype_id) as subdocname,dbo.[fnGetJobTitleClientId](e.client_id) as jobtitle,e.documentsubtype_id as documentsubtype_id\r\n" + 
						"from Tbl_EmpDocuments e where e.file_type='LCA' and e.lca_id="+lca_id+" and e.documentsubtype_id="+docsub_Id+"";
				lcaList =(List<DocEmpBean>) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(DocEmpBean.class)).list();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return lcaList;
	}
	@Override
	public Integer getlcaIdByCandidateClientId(Integer candidate_Id, Integer client_id) {
		Integer docCount=null;
		Session session = null;  
		try { 
		session = sessfact.openSession();
		String sql="select top 1 lca_id from Tbl_LCADetails where candidate_id="+candidate_Id+" and client_id="+client_id+" and status='Active'";
		docCount=(Integer) session.createSQLQuery(sql).uniqueResult();
		}catch (Exception e) {
			logger.info(e.getMessage(),e);
		}finally {
			session.close();
			} 
		return docCount;
	}
	
	@Override
	public ClientDetailsEntity getClientDetailsByClientId(Integer endclientId) {
		ClientDetailsEntity clientObj = null;
		Session session = null;
		try {
			session = sessfact.openSession();
				String sql = "from ClientDetailsEntity  where client_id="+endclientId+" and status=1";
				clientObj = (ClientDetailsEntity) session.createQuery(sql).uniqueResult();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return clientObj;
	}
	@Override
	public CompanyAdressEntity getCompanyAdressDetailsByAddressId(Integer endaddressId) {
		CompanyAdressEntity addrdetailObj = null;
		Session session = null;
		
		try {
			session = sessfact.openSession();
			String sql = "from CompanyAdressEntity  where address_id="+endaddressId+"";
			addrdetailObj = (CompanyAdressEntity) session.createQuery(sql).uniqueResult();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return addrdetailObj;
	}
	
	@Override
	public List<DocumentTypeDto> getsubdoctypesbylcaid(Integer lca_id) {
		List<DocumentTypeDto> subdocTypeList = null;
		Session session = null;
		try {
			session = sessfact.openSession();
			String	sql = "select documentsubtype_id as subdoctypeid,dbo.fnGetImmiSubDocTypeNameById(documentsubtype_id) as subdoctypename from Tbl_EmpDocuments where lca_id="+lca_id+" and status='Active'";
			subdocTypeList =(List<DocumentTypeDto>) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(DocumentTypeDto.class)).list();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return subdocTypeList;
	}
	@Override
	public void inactiveRefNo(LCADetailsEntity lcaObj) {
		Session session = null;
		try {
			session = sessfact.openSession();
			Transaction tx = session.beginTransaction();
			session.update(lcaObj);
			tx.commit();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}

	}
	@Override
	public void deleteRefNo(Integer lca_id) {
		Session session = null;
		try {
			session = sessfact.openSession();
			Transaction tx = session.beginTransaction();
			String stringQuery = "DELETE FROM LCADetailsEntity WHERE lca_id = " + lca_id;
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
	public List<TempCandidateDetailsDTO> getImmiCandidateList() {
		
		List<TempCandidateDetailsDTO> searchList = null;
		Session session = null;
		try {
			session = sessfact.openSession();
			String sql = "select  distinct  u.candidate_id as candidate_id,u.user_name as username,u.full_name as fullname,u.first_name as firstname,\r\n" + 
					"u.family_name as lastname,u.email_id as email,u.contact_no1 as phone,c.emp_type as emp_type from Tbl_EmpBasicDetails u,Tbl_CandidateDetailedInfo c\r\n" + 
					"where u.candidate_id=c.candidate_id and c.status='Active' and c.emp_type is null order by u.candidate_id ASC";
			searchList = session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(TempCandidateDetailsDTO.class)).list();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return searchList;
	}
	
	@Override
	public List<ImmiDocumentTypeEntity> getDocumentTypeList() {
		Session session = null;  
		List<ImmiDocumentTypeEntity> doctypeList=null;
		try {
			session = sessfact.openSession();  
			String hql="from ImmiDocumentTypeEntity ORDER BY document_type ASC";
			doctypeList= session.createQuery(hql).list();
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		finally {
			session.close();}  
		return doctypeList;
	}
	
	@Override
	public Integer savedocumentType(ImmiDocumentTypeEntity doctypeObj) {
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
	public ImmiDocumentTypeEntity getDocumentTypeById(Integer doc_id) {
		Session session = null;
		ImmiDocumentTypeEntity documentObj = null;
		try {
			session = sessfact.openSession();
			String hql = "from ImmiDocumentTypeEntity where documenttype_id=" + doc_id + "";
			documentObj = (ImmiDocumentTypeEntity) session.createQuery(hql).uniqueResult();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return documentObj;
	}
	@Override
	public void updateDocumentType(ImmiDocumentTypeEntity docObj) {
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
		String sql="Select distinct document_type from ImmiDocumentTypeMaster  where document_type='"+docname+"'";
		doc_name=(String) session.createSQLQuery(sql).uniqueResult();
		}catch (Exception e) {
			logger.info(e.getMessage(),e);
		}finally {
			session.close();
			} 
		return doc_name;
	}
	
	@Override
	public List<DocumentTypeDto> getDocumentsList() {
		Session session = null;  
		List<DocumentTypeDto> doctypeList=null;
		try {
			session = sessfact.openSession();  
			String hql="select d.documenttype_id as doctypeid,d.document_type as doctypename,s.subdocumenttype_id as subdoctypeid,s.document_type as subdoctypename,s.issubycand as issubycand,s.is_same as isameas_doctype\r\n" + 
					"				from ImmiDocumentTypeMaster d left join ImmiDocumentSubTypeMaster s\r\n" + 
					"				on d.documenttype_id=s.documenttype_id";
			doctypeList= (List<DocumentTypeDto>) session.createSQLQuery(hql).setResultTransformer(new AliasToBeanResultTransformer(DocumentTypeDto.class)).list();
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}
		finally {
			session.close();}  
		return doctypeList;
	}
	
	
	@Override
	public Integer savedocumentSubType(ImmiDocumentSubTypeEntity docObj) {
		Session session = null;  
		Transaction tx = null;
		Integer id=0;
		try {
			session = sessfact.openSession();  
			tx = session.beginTransaction();
			id=(Integer)session.save(docObj);
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
	public String checkDocumentSubType(String docname) {
		String doc_name=null;
		Session session = null;  
		try { 
		session = sessfact.openSession();
		String sql="Select distinct document_type from ImmiDocumentSubTypeMaster  where document_type='"+docname+"'";
		doc_name=(String) session.createSQLQuery(sql).uniqueResult();
		}catch (Exception e) {
			logger.info(e.getMessage(),e);
		}finally {
			session.close();
			} 
		return doc_name;
	}
	@Override
	public ImmiDocumentSubTypeEntity getDocumentSubTypeById(Integer subdocTpyeId) {
		Session session = null;
		ImmiDocumentSubTypeEntity documentObj = null;
		try {
			session = sessfact.openSession();
			String hql = "from ImmiDocumentSubTypeEntity where subdocumenttype_id=" + subdocTpyeId + "";
			documentObj = (ImmiDocumentSubTypeEntity) session.createQuery(hql).uniqueResult();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return documentObj;
	}
	@Override
	public void updateSubDocumentType(ImmiDocumentSubTypeEntity docObj) {
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
	public Integer getSubDocIdByName(String string) {
		Integer subdocid=null;
		Session session = null;  
		try { 
		session = sessfact.openSession();
		String sql="select subdocumenttype_id from ImmiDocumentSubTypeMaster where document_type='"+string+"'";
		subdocid=(Integer) session.createSQLQuery(sql).uniqueResult();
		}catch (Exception e) {
			logger.info(e.getMessage(),e);
		}finally {
			session.close();
			} 
		return subdocid;
	}
	@Override
	public String getcertifiedfileByIds(Integer lca_Id, int candidateid, Integer subdocid) {
		String filename=null;
		Session session = null;  
		try { 
		session = sessfact.openSession();
		String sql="select file_name from Tbl_EmpDocuments where lca_Id="+lca_Id+" and candidate_id="+candidateid+" and documentsubtype_id="+subdocid+"";
		filename=(String) session.createSQLQuery(sql).uniqueResult();
		}catch (Exception e) {
			logger.info(e.getMessage(),e);
		}finally {
			session.close();
			} 
		return filename;
	}
	@Override
	public Integer immicheckDocumentTypeIssame(Integer docType_id) {
		Integer issame=null;
		Session session = null;  
		try { 
		session = sessfact.openSession();
		String sql="select distinct is_same from ImmiDocumentSubTypeMaster where documenttype_id="+docType_id+"";
		issame=(Integer) session.createSQLQuery(sql).uniqueResult();
		}catch (Exception e) {
			logger.info(e.getMessage(),e);
		}finally {
			session.close();
			} 
		return issame;
	}
	@Override
	public Integer immicheckDocumentTypeSubocTypeCount(Integer docType_id) {
		Integer docCount=null;
		Session session = null;  
		try { 
		session = sessfact.openSession();
		String sql="select count(*) as docCount from ImmiDocumentSubTypeMaster where documenttype_id="+docType_id+"";
		docCount=(Integer) session.createSQLQuery(sql).uniqueResult();
		}catch (Exception e) {
			logger.info(e.getMessage(),e);
		}finally {
			session.close();
			} 
		return docCount;
	}
	@Override
	public List<LCADetailsDto> getActiveInactiveLCAList(Integer candidate_Id, Integer clientidId) {
		List<LCADetailsDto> lcaList = null;
		Session session = null;
		try {String sql =null;
			session = sessfact.openSession();
				/*sql = "select lca_id,lca_number,lca_reference,dbo.[fnGetEndClientNameByClientId](client_id) as client_name,[dbo].[fnGetDocCountByLCAId](lca_id) as lcadoc_count  "
						+ "from Tbl_LCADetails where candidate_id="+candidate_Id+" and client_id=COALESCE(NULLIF("+clientid+", ''),client_id) order by lca_id desc";*/
			sql="select  l.status as lcastatus,l.lca_id,l.lca_number,l.lca_reference,dbo.[fnGetEndClientNameByClientId](l.client_id) as client_name,[dbo].[fnGetDocCountByLCAId](l.lca_id) as lcadoc_count,CASE  WHEN c.status=1 THEN 'Active' WHEN c.status=0 THEN 'InActive'  END as enclientsatus from Tbl_LCADetails l, Tbl_ClientDetails c where l.candidate_id="+candidate_Id+" and l.client_id=COALESCE(NULLIF("+clientidId+", ''),l.client_id)	 and c.client_id=l.client_id  order by l.lca_id desc";
				lcaList =(List<LCADetailsDto>) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(LCADetailsDto.class)).list();
		
							
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return lcaList;
	}
	@Override
	public List<CompanyAdressEntity> getlcaLocationListByclientId(int client_id) {
		List<CompanyAdressEntity> lcaLocationList = null;
		Session session = null;
		try {String sql =null;
			session = sessfact.openSession();
				sql = "from CompanyAdressEntity where company_id="+client_id+" and company_type='LCALocation' and status='Active'";
				lcaLocationList = (List<CompanyAdressEntity>) session.createQuery(sql).list();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return lcaLocationList;
	}
}
