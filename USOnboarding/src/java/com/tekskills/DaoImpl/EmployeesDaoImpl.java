package com.tekskills.DaoImpl;

import java.util.ArrayList;
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

import com.sun.org.apache.xerces.internal.impl.dv.util.Base64;
import com.tekskills.Dao.EmployeesDao;
import com.tekskills.Dto.BasicDetailsDto;
import com.tekskills.Dto.CandidateDocDto;
import com.tekskills.Dto.ClientVendorMaster_DTO;
import com.tekskills.Dto.CompanyDetails_DTO;
import com.tekskills.Dto.CustomerDetails_DTO;
import com.tekskills.Dto.CustomerDto;
import com.tekskills.Dto.DocEmpBean;
import com.tekskills.Dto.DocumentHistoryDto;
import com.tekskills.Dto.EmployeeDto;
import com.tekskills.Dto.ManagerDto;
import com.tekskills.Dto.MyDashboardDto;
import com.tekskills.Dto.ProjectDetailsHistoryDto;
import com.tekskills.Dto.SearchBean;
import com.tekskills.Dto.VendorDto;
import com.tekskills.Entity.BankDetailsEntity;
import com.tekskills.Entity.BankPaymentDetailsEntity;
import com.tekskills.Entity.CandidateAddress;
import com.tekskills.Entity.CandidateDetailedInfo;
import com.tekskills.Entity.ClientDetailsEntity;
import com.tekskills.Entity.ClientDetailsHistoryEntity;
import com.tekskills.Entity.CompanyAdressEntity;
import com.tekskills.Entity.CustomerMasterEntity;
import com.tekskills.Entity.DepartmentsEntity;
import com.tekskills.Entity.EmpBasicDetailsEntity;
import com.tekskills.Entity.EmpDocumentsEntity;
import com.tekskills.Entity.EmpDocumentsHistoryEntity;
import com.tekskills.Entity.EmpExitDetailsEntity;
import com.tekskills.Entity.EmpJoinHistorty;
import com.tekskills.Entity.EmpPayRateDetails;
import com.tekskills.Entity.EmpPayRateDetailsHistory;
import com.tekskills.Entity.EmpRoles;
import com.tekskills.Entity.EmpTypeMaster;
import com.tekskills.Entity.PageStatusEntity;
import com.tekskills.Entity.ProductsEntity;
import com.tekskills.Entity.ProjectDetailsHistory;
import com.tekskills.Entity.VendorMasterEntity;
import com.tekskills.Entity.WorkAuthorization;

@Repository
public class EmployeesDaoImpl implements EmployeesDao {
	private static final Logger logger = Logger.getLogger(EmployeesDaoImpl.class);
	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory sessfact;

	@Override
	public EmpBasicDetailsEntity checkLogin(String userName, String password) {
		EmpBasicDetailsEntity basicObj = null;
		Session session = null;
		try {
			session = sessfact.openSession();
			String bytesEncoded = Base64.encode(password.getBytes());
			String sql = "from EmpBasicDetailsEntity  where userName='" + userName + "' and pwd='" + bytesEncoded
					+ "'  and status=1";
			basicObj = (EmpBasicDetailsEntity) session.createQuery(sql).uniqueResult();

		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return basicObj;
	}

	@Override
	public Integer saveBasicDetails(EmpBasicDetailsEntity basicObj) {
		Session session = null;
		Integer candidateId = null;
		try {
			session = sessfact.openSession();
			Transaction tx = session.beginTransaction();
			candidateId = (Integer) session.save(basicObj);
			tx.commit();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return candidateId;
	}

	@Override
	public Integer getEmployeeNo() {
		Session session = null;
		Integer empNo=null;
		try {
			session = sessfact.openSession();
			//String sql = "SELECT TOP 1 emp_number FROM Tbl_EmpBasicDetails  where emp_type in ('W2 Admin','W2') ORDER BY candidate_id DESC";
			String sql = "select TOP 1 a.emp_number from Tbl_EmpBasicDetails a,Tbl_CandidateDetailedInfo c where a.candidate_id=c.candidate_id and c.emp_type in ('W2 Admin','W2','Admin') and c.status='Active' and a.status=1 ORDER BY a.candidate_id DESC";
			empNo = (Integer) session.createSQLQuery(sql).uniqueResult();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return empNo;
	}

	@Override
	public boolean checkEmpExists(int emp_number) {
		Session session = null;
		try {
			session = sessfact.openSession();
			String sql = "select emp_number from Tbl_EmpBasicDetails where emp_number=" + emp_number + "";
			Integer empNo = (Integer) session.createSQLQuery(sql).uniqueResult();
			return true;
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return false;
	}

	@Override
	public EmpBasicDetailsEntity checkUserName(String uname) {
		EmpBasicDetailsEntity empObj = null;
		Session session = null;
		try {
			session = sessfact.openSession();
			// String sql = "select * from Tbl_EmpBasicDetails where username='"+uname+"'";
			// empObj = (EmpBasicDetailsEntity) session.createSQLQuery(sql).uniqueResult();
			String sql = "from EmpBasicDetailsEntity  where userName='" + uname + "'";
			empObj = (EmpBasicDetailsEntity) session.createQuery(sql).uniqueResult();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return empObj;
	}
	
	@Override
	public void updateFlag(EmpBasicDetailsEntity basicObj) {
		Session session = null;
		try {
			session = sessfact.openSession();
			session.update(basicObj);
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}

	}

	@Override
	public EmpBasicDetailsEntity getEmployeeDetailsByCandidateId(Integer candidate_id) {
		EmpBasicDetailsEntity basicObj = null;
		Session session = null;
		try {
			session = sessfact.openSession();
			String sql = "from EmpBasicDetailsEntity  where candidate_id=" + candidate_id + " and status=1";
			basicObj = (EmpBasicDetailsEntity) session.createQuery(sql).uniqueResult();

		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return basicObj;
	}

	@Override
	public List<WorkAuthorization> getWorkAuthnList() {
		List<WorkAuthorization> waList = null;
		Session session = null;
		try {
			session = sessfact.openSession();
			String sql = "from WorkAuthorization";
			waList = (List<WorkAuthorization>) session.createQuery(sql).list();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return waList;
	}

	@Override
	public List<EmpTypeMaster> getEmployeeTypeList() {
		List<EmpTypeMaster> emptypeList = null;
		Session session = null;
		try {
			session = sessfact.openSession();
			String sql = "from EmpTypeMaster";
			emptypeList = (List<EmpTypeMaster>) session.createQuery(sql).list();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return emptypeList;
	}

	@Override
	public List<DepartmentsEntity> getdepartmentList() {
		List<DepartmentsEntity> deptList = null;
		Session session = null;
		try {
			session = sessfact.openSession();
			String sql = "from DepartmentsEntity";
			deptList = (List<DepartmentsEntity>) session.createQuery(sql).list();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return deptList;
	}

	@Override
	public List<EmpRoles> getroleList() {
		List<EmpRoles> roleList = null;
		Session session = null;
		try {
			session = sessfact.openSession();
			String sql = "from EmpRoles";
			roleList = (List<EmpRoles>) session.createQuery(sql).list();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return roleList;
	}

	@Override
	public List<ManagerDto> getHRList() {
		List<ManagerDto> hrList = null;
		Session session = null;
		try {
			session = sessfact.openSession();
			//String sql = "select a.full_name as hrName from Tbl_EmpBasicDetails a,Tbl_CandidateDetailedInfo c where a.candidate_id=c.candidate_id and c.emp_type='W2 Admin' and c.department_id=2 and c.status='Active' and a.status=1";
			String sql = "select a.full_name as hrName,a.email_id as emailId from Tbl_EmpBasicDetails a,Tbl_CandidateDetailedInfo c where a.candidate_id=c.candidate_id and c.emp_type='W2 Admin' and c.department_id=2 and c.status='Active' and a.status=1";
			hrList = session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(ManagerDto.class)).list();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return hrList;
	}

	@Override
	public List<ManagerDto> getrepMagrList() {
		List<ManagerDto> repMagrList = null;
		Session session = null;
		try {
			session = sessfact.openSession();
		//	String sql = "from  EmpBasicDetailsEntity where employee_role not in (1) and status=1";
			//String sql = "select c.reporting_head as mgrEmpNo,a.full_name as mgrEmpName from Tbl_EmpBasicDetails a,Tbl_CandidateDetailedInfo c where a.candidate_id=c.candidate_id and c.role_id not in (1) and c.status='Active' and a.status=1";
			String sql = "select a.emp_number as mgrEmpNo,a.full_name as mgrEmpName from Tbl_EmpBasicDetails a,Tbl_CandidateDetailedInfo c where a.candidate_id=c.candidate_id and c.role_id not in (1) and c.status='Active' and a.status=1 and a.emp_number<>0";
			repMagrList = session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(ManagerDto.class)).list();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return repMagrList;
	}

	@Override
	public EmpBasicDetailsEntity SSNExistOrNot(String ssn_emp) {
		EmpBasicDetailsEntity ssn = null;
		Session session = null;
		try {
			session = sessfact.openSession();
			String bytesEncoded = Base64.encode(ssn_emp.getBytes());
			System.out.println(bytesEncoded);
			String sql = "from EmpBasicDetailsEntity  where ssn_no='" + bytesEncoded + "'";
			ssn = (EmpBasicDetailsEntity) session.createQuery(sql).uniqueResult();

		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return ssn;
	}

	@Override
	public List<SearchBean> empsearchbySSN(String ssn_emp) {
		List<SearchBean> ssnSearchList = null;
		Session session = null;
		try {
			session = sessfact.openSession();
			String bytesEncoded = Base64.encode(ssn_emp.getBytes());
			String sql = "exec getEmployeeDetailsBySSN @ssn_no='" + bytesEncoded + "'";
			ssnSearchList = session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(SearchBean.class)).list();

		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return ssnSearchList;
	}

	@Override
	public List<ManagerDto> getContractTeamList() {
		List<ManagerDto> contList = null;
		Session session = null;
		try {
			session = sessfact.openSession();
		//	String sql = "from EmpBasicDetailsEntity where emp_type in ('W2 Admin') and dept_id=5 and status=1";
			String sql = "select a.full_name as ctName from Tbl_EmpBasicDetails a,Tbl_CandidateDetailedInfo c where a.candidate_id=c.candidate_id and c.emp_type='W2 Admin' and c.department_id=5 and c.status='Active' and a.status=1";
			contList = session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(ManagerDto.class)).list();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return contList;
	}

	@Override
	public Integer saveVendorMaster(VendorMasterEntity venObj) {
		Session session = null;
		Integer venid = null;
		try {
			session = sessfact.openSession();
			Transaction tx = session.beginTransaction();
			venid = (Integer) session.save(venObj);
			tx.commit();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return venid;
	}

	@Override
	public String checkSelectedFileName(String filename) {
		Session session = null;
		String fname = null;
		try {
			session = sessfact.openSession();
			String sql = "select distinct file_name FROM Tbl_EmpDocuments  where file_name='" + filename + "'";
			fname = (String) session.createSQLQuery(sql).uniqueResult();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return fname;
	}

	@Override
	public void saveDocuments(EmpDocumentsEntity vendocobj) {
		Session session = null;
		try {
			session = sessfact.openSession();
			Transaction tx = session.beginTransaction();
			session.save(vendocobj);
			tx.commit();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
	}

	@Override
	public Integer saveCustomerMaster(CustomerMasterEntity custObj) {
		Session session = null;
		Integer venid = null;
		try {
			session = sessfact.openSession();
			Transaction tx = session.beginTransaction();
			venid = (Integer) session.save(custObj);
			tx.commit();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return venid;
	}

	@Override
	public List<CompanyDetails_DTO> getCustomerMasterList() {
		List<CompanyDetails_DTO> customerList = null;
		Session session = null;
		try {
			session = sessfact.openSession();
			String sql = "select c.customer_id as companyId,c.customer_name as companyName,c.customer_contact_no as company_contactperson,\r\n" + 
					"c.customer_mgr_email as company_mgr_email,c.fed_id as companyfedId,c.status as companystaus,\r\n" + 
					"ad.line1 as line1,ad.line2 as line2,ad.city as city,ad.state as state,ad.country as country,c.payment_terms as payment_terms,\r\n" + 
					"ad.ZipCode as zipcode from Tbl_CustomerMaster c,Tbl_CompanyAddress ad\r\n" + 
					"where c.customer_id=ad.company_id and ad.company_type='Customer' and c.status='Active' and ad.status='Active' order by companyName";
			customerList = session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(CompanyDetails_DTO.class)).list();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return customerList;
	}

	@Override
	public List<CompanyDetails_DTO> getVendorMasterList() {
		List<CompanyDetails_DTO> vendorList = null;
		Session session = null;
		try {
			session = sessfact.openSession();
			String sql = "select v.vendor_id as companyId, v.vendor_name as companyName,v.vendor_contact_no as company_contactperson,\r\n" + 
					"v.vendor_mgr_email as company_mgr_email,v.fed_id as companyfedId,v.status as companystaus,\r\n" + 
					"ad.line1 as line1,ad.line2 as line2,ad.city as city,ad.state as state,\r\n" + 
					"ad.ZipCode as zipcode,v.vendor_type as vendor_type from Tbl_VendorMaster v,Tbl_CompanyAddress ad\r\n" + 
					"where v.vendor_id=ad.company_id and ad.company_type='Vendor' and v.status='Active' and ad.status='Active'";
			vendorList = session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(CompanyDetails_DTO.class)).list();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return vendorList;
	}

	@Override
	public CustomerMasterEntity getCustomerDetailsById(Integer customerId) {
		CustomerMasterEntity custObj = null;
		Session session = null;
		try {
			session = sessfact.openSession();
			String sql = "from CustomerMasterEntity  where customer_id=" + customerId + "";
			custObj = (CustomerMasterEntity) session.createQuery(sql).uniqueResult();

		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return custObj;
	}

	@Override
	public CustomerDetails_DTO getCustomerDocsById(Integer customerId) {
		Session session = null;
		CustomerDetails_DTO custDocObj = null;
		try {
			session = sessfact.openSession();
			/*String sql = "select distinct d.file_name as fileName,d.file_type as fileType from Tbl_CustomerMaster c, Tbl_EmpDocuments d where c.customer_id=d.customer_id and c.customer_id="
					+ customerId
					+ " and c.status='Active' and d.file_type in ('Customer_MSA','Manager_Approved_Email_CMSA')";*/
			String sql = "select distinct d.file_name as fileName,d.file_type as fileType,d.document_id as fileId,d.from_date as startdate,d.expiry_date as expirydate from Tbl_CustomerMaster c, Tbl_EmpDocuments d where c.customer_id=d.customer_id and c.customer_id="
					+ customerId
					+ " and c.status='Active' and d.status='Active' and d.file_type in ('Customer_MSA','Manager_Approved_Email_CMSA')";
			custDocObj = (CustomerDetails_DTO) session.createSQLQuery(sql)
					.setResultTransformer(new AliasToBeanResultTransformer(CustomerDetails_DTO.class)).uniqueResult();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return custDocObj;
	}

	@Override
	public VendorMasterEntity getVendorDetailsById(Integer vendorId) {
		VendorMasterEntity venObj = null;
		Session session = null;
		try {
			session = sessfact.openSession();
			String sql = "from VendorMasterEntity  where vendorid=" + vendorId + "";
			venObj = (VendorMasterEntity) session.createQuery(sql).uniqueResult();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return venObj;
	}

	@Override
	public List<DocEmpBean> getVendorDocsById(Integer vendorId) {
		List<DocEmpBean> vendorDocList = null;
		Session session = null;
		try {
			session = sessfact.openSession();
			String sql = "select distinct d.file_name as file_name,d.file_type as filetype,d.input_value as inputval,d.document_id as document_id,d.from_date as startdate,d.expiry_date as expirydate  from  Tbl_VendorMaster v, Tbl_EmpDocuments d where v.vendor_id=d.vendor_id and d.vendor_id="
					+vendorId+ " and v.status='Active' and d.status='Active' and d.file_type in('Vendor_MSA','Business Compliance','Manager_Approved_Email_VMSA')";
			/*String sql="select distinct d.file_name as fileName,d.file_type as fileType,d.document_id as fileId,d.input_value as inputval,d.from_date as startdate,d.expiry_date as expirydate \r\n" + 
					"from Tbl_VendorMaster v, Tbl_EmpDocuments d where v.vendor_id=d.vendor_id and v.vendor_id="+vendorId+" and v.status='Active' and d.status='Active' and\r\n" + 
					"d.file_type in ('Vendor_MSA','Business Compliance','Manager_Approved_Email_VMSA')";*/
			vendorDocList = (List<DocEmpBean>) session.createSQLQuery(sql)
					.setResultTransformer(new AliasToBeanResultTransformer(DocEmpBean.class)).list();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return vendorDocList;
	}

	@Override
	public Integer saveClientDetails(ClientDetailsEntity clientObj) {
		Session session = null;
		Integer clientId = null;
		try {
			session = sessfact.openSession();
			Transaction tx = session.beginTransaction();
			clientId = (Integer) session.save(clientObj);
			tx.commit();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return clientId;
	}

	@Override
	public Integer savePayRateBillRateDetails(EmpPayRateDetails payrateObj) {
		Session session = null;
		Integer pId = null;
		try {
			session = sessfact.openSession();
			Transaction tx = session.beginTransaction();
			pId = (Integer) session.save(payrateObj);
			tx.commit();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return pId;
	}


	@Override
	public List<DocEmpBean> viewEmpcustdocumentsByCandidateId(Integer candidate_id, String emptype, String payrate_id) {
		List<DocEmpBean>  vendorDocList = null;
		Session session = null;
		try {
			session = sessfact.openSession();
			if(!emptype.equalsIgnoreCase("W2")) {
			String sql="select d.document_id as document_id,d.file_name as file_name,d.file_type as filetype,d.candidate_id as candidate_id,d.from_date as startdate,d.expiry_date as expirydate from Tbl_VendorPayRateDetails p,Tbl_EmpDocuments d where d.customer_id=p.customer_id and d.candidate_id=p.candidate_id and d.candidate_id="+candidate_id+" and d.Status='Active'";
			vendorDocList= (List<DocEmpBean>) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(DocEmpBean.class)).list();
			}else {
				
				if(payrate_id!=null) {
					Integer payrateid=null;
				if (payrate_id!="") {
					payrateid = Integer.parseInt(payrate_id);
				}
				String sql="select d.document_id as document_id,d.file_name as file_name,d.file_type as filetype,d.candidate_id as candidate_id,d.from_date as startdate,d.expiry_date as expirydate from Tbl_VendorPayRateDetails p,Tbl_EmpDocuments d where d.customer_id=p.customer_id and d.candidate_id=p.candidate_id and d.candidate_id="+candidate_id+" and p.payrate_id="+payrateid+"";
				vendorDocList= (List<DocEmpBean>) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(DocEmpBean.class)).list();
			}}
		}
			catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return vendorDocList;
	}

	@Override
	public List<DocEmpBean> viewEmpvendocumentsByCandidateId(Integer candidate_id, String emptype, String payrate_id) {
		List<DocEmpBean>  vendorDocList = null;
		Session session = null;
		try {
			session = sessfact.openSession();
			if(!emptype.equalsIgnoreCase("W2")) {
				if(payrate_id!=null) {
					Integer payrateid=null;
				if (payrate_id!="") {
					payrateid = Integer.parseInt(payrate_id);
				}
				
			String sql="select d.document_id as document_id,d.file_name as file_name,d.file_type as filetype,d.candidate_id as candidate_id,d.from_date as startdate,d.expiry_date as expirydate from Tbl_VendorPayRateDetails p ,Tbl_EmpDocuments d where d.vendor_id=p.vendor_id  and d.candidate_id=p.candidate_id and d.candidate_id="+candidate_id+" and p.payrate_id="+payrateid+" and d.Status='Active'";
			vendorDocList= (List<DocEmpBean>) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(DocEmpBean.class)).list();
				}
				}else {
			if(payrate_id!=null) {
				Integer payrateid=null;
			if (payrate_id!="") {
				payrateid = Integer.parseInt(payrate_id);
			}
			String sql="select d.document_id as document_id,d.file_name as file_name,d.file_type as filetype,d.candidate_id as candidate_id,d.from_date as startdate,d.expiry_date as expirydate from Tbl_VendorPayRateDetails p ,Tbl_EmpDocuments d where d.vendor_id=p.vendor_id  and d.candidate_id=p.candidate_id and d.candidate_id="+candidate_id+" and p.payrate_id="+payrateid+"";
			vendorDocList= (List<DocEmpBean>) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(DocEmpBean.class)).list();
		}}
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return vendorDocList;
	}

	@Override
	public List<DocEmpBean> viewEmpvdocumentsByCandidateId(Integer candidate_id, String emptype, String payrate_id,Integer VendorId) {
		List<DocEmpBean>  vendorDocList = null;
		Session session = null;
		try {
			session = sessfact.openSession();
			String sql=" select distinct v.vendor_name as vendorname,d.document_id as document_id,d.file_name as file_name,d.file_type as filetype,d.input_value as inputval,d.from_date as startdate,d.expiry_date as expirydate from Tbl_EmpDocuments d,Tbl_VendorMaster v where v.vendor_id=d.vendor_id and v.status='Active' and d.status='Active' and v.vendor_id="+VendorId+" and d.file_type in('Vendor_MSA','Business Compliance','Manager_Approved_Email_VMSA')";
			//String sql="select distinct v.vendor_name as vendorname,d.document_id as document_id,d.file_name as file_name,d.file_type as filetype,d.input_value as inputval,d.candidate_id as candidate_id,d.from_date as startdate,d.expiry_date as expirydate from  Tbl_VendorPayRateDetails p, Tbl_EmpDocuments d,Tbl_VendorMaster v where p.vendor_id=d.vendor_id and p.vendor_id=v.vendor_id and v.status='Active' and p.candidate_id="+candidate_id+" and p.payrate_id="+payrateid+" and d.file_type in('Vendor_MSA','Business Compliance','Manager_Approved_Email_VMSA')";
			vendorDocList= (List<DocEmpBean>) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(DocEmpBean.class)).list();
			/*	if(!emptype.equalsIgnoreCase("W2")) {
				if(payrate_id!=null) {
					Integer payrateid=null;
				if (payrate_id!="") {
					payrateid = Integer.parseInt(payrate_id);
				}
			
			String sql="select distinct v.vendor_name as vendorname,d.document_id as document_id,d.file_name as file_name,d.file_type as filetype,d.input_value as inputval,d.candidate_id as candidate_id,d.from_date as startdate,d.expiry_date as expirydate from  Tbl_VendorPayRateDetails p, Tbl_EmpDocuments d,Tbl_VendorMaster v where p.vendor_id=d.vendor_id and p.vendor_id=v.vendor_id and v.status='Active' and p.candidate_id="+candidate_id+" and p.payrate_id="+payrateid+" and d.file_type in('Vendor_MSA','Business Compliance','Manager_Approved_Email_VMSA')";
			vendorDocList= (List<DocEmpBean>) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(DocEmpBean.class)).list();
				}
				}else {
			if(payrate_id!=null) {
				Integer payrateid=null;
			if (payrate_id!="") {
				payrateid = Integer.parseInt(payrate_id);
			}
			String sql="select distinct v.vendor_name as vendorname,d.document_id as document_id,d.file_name as file_name,d.file_type as filetype,d.input_value as inputval,d.candidate_id as candidate_id,d.from_date as startdate,d.expiry_date as expirydate from  Tbl_VendorPayRateDetails p, Tbl_EmpDocuments d,Tbl_VendorMaster v where p.vendor_id=d.vendor_id and p.vendor_id=v.vendor_id and v.status='Active' and p.payrate_id="+payrateid+" and p.candidate_id="+candidate_id+" and d.file_type in('Vendor_MSA','Business Compliance','Manager_Approved_Email_VMSA')";
			vendorDocList= (List<DocEmpBean>) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(DocEmpBean.class)).list();
		}}*/
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return vendorDocList;
	}

	@Override
	public List<DocEmpBean> viewEmpcdocumentsByCandidateId(Integer candidate_id, String emptype, String payrate_id) {
		List<DocEmpBean>  vendorDocList = null;
		Session session = null;
		try {
			session = sessfact.openSession();
			if(!emptype.equalsIgnoreCase("W2")) {
			String sql="select distinct c.customer_name as custname,d.document_id as document_id,d.file_name as file_name,d.file_type as filetype,d.candidate_id as candidate_id,d.from_date as startdate,d.expiry_date as expirydate from  Tbl_VendorPayRateDetails v, Tbl_EmpDocuments d,Tbl_CustomerMaster c where v.customer_id=d.customer_id and c.customer_id=v.customer_id and c.status='Active' and v.candidate_id="+candidate_id+" and d.file_type in ('Customer_MSA','Manager_Approved_Email_CMSA')";
			vendorDocList= (List<DocEmpBean>) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(DocEmpBean.class)).list();
		}else {
			if(payrate_id!=null) {
				Integer payrateid=null;
			if (payrate_id!="") {
				payrateid = Integer.parseInt(payrate_id);
			}
			String sql="select distinct c.customer_name as custname,d.document_id as document_id,d.file_name as file_name,d.file_type as filetype,d.candidate_id as candidate_id,d.from_date as startdate,d.expiry_date as expirydate from  Tbl_VendorPayRateDetails v, Tbl_EmpDocuments d,Tbl_CustomerMaster c where v.customer_id=d.customer_id and c.customer_id=v.customer_id and v.payrate_id="+payrateid+" and v.candidate_id="+candidate_id+" and d.file_type in ('Customer_MSA','Manager_Approved_Email_CMSA')";
			vendorDocList= (List<DocEmpBean>) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(DocEmpBean.class)).list();
		}}
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return vendorDocList;
	}

	@Override
	public List<ClientVendorMaster_DTO> viewClientDetailsByCandidateId(Integer candidate_id, Integer payrateId, String emptype) {
		List<ClientVendorMaster_DTO>  clientlist = null;
		Session session = null;
		try {
			session = sessfact.openSession();
			/*
			if(!emptype.equalsIgnoreCase("W2")) {
			String sql="select client_id as clientid,client_name as clientName,client_address as client_addr,client_mgr_name as client_mgr,client_mgr_extn as client_mgr_extn,client_mgr_email as client_mgr_email,emp_mailat_client as emp_email_clent,emp_extnat_client as emp_extn_clent from Tbl_ClientDetails where candidate_id="+candidate_id+" and status=1";
			String sql="select cl.client_id as clientid,cl.fed_id as fed_id,cl.client_name as clientName,cl.client_mgr_name as client_mgr,\r\n" + 
					"cl.client_mgr_extn as client_mgr_extn,cl.client_mgr_email as client_mgr_email,cl.emp_mailat_client as emp_email_clent,\r\n" + 
					"cl.emp_extnat_client as emp_extn_clent,cd.line1 as line1,cd.line2 as line2,cd.city as city,cd.state as state,\r\n" + 
					"cd.ZipCode as zipcode from Tbl_ClientDetails cl,Tbl_CompanyAddress cd where cl.client_id=cd.company_id \r\n" + 
					"and cl.candidate_id="+candidate_id+" and cl.status=1 and cl.client_type='OtherClient' and cd.status='Active' and cd.company_type='OtherClient'";
			clientlist= (List<ClientVendorMaster_DTO>) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(ClientVendorMaster_DTO.class)).list();
			System.out.println("-===========================sql==="+sql);
			
			}else {
				Integer payrateid=null;
				if(payrateId!=null) {
				if (payrateId!="") {
					payrateid = Integer.parseInt(payrateId);
				}*/
			/*	String sql="select cl.client_id as clientid,cl.fed_id as fed_id,cl.client_name as clientName,cl.client_mgr_name as client_mgr,\r\n" + 
						"cl.client_mgr_extn as client_mgr_extn,cl.client_mgr_email as client_mgr_email,cl.emp_mailat_client as emp_email_clent,\r\n" + 
						"cl.emp_extnat_client as emp_extn_clent,cd.line1 as line1,cd.line2 as line2,cd.city as city,cd.state as state,\r\n" + 
						"cd.ZipCode as zipcode from Tbl_ClientDetails cl,Tbl_CompanyAddress cd where cl.client_id=cd.company_id \r\n" + 
						"and cl.candidate_id="+candidate_id+" and cl.status=1 and cl.client_type='OtherClient' and cd.status='Active' and cd.company_type='OtherClient'  and cl.payrate_id="+payrateId+"";
						*/
			String sql="select cl.client_type as clientType,cl.client_id as clientid,cl.fed_id as fed_id,cl.client_name as clientName,cl.client_mgr_name as client_mgr,\r\n" + 
					"cl.client_mgr_extn as client_mgr_extn,cl.client_mgr_email as client_mgr_email,cl.emp_mailat_client as emp_email_clent,\r\n" + 
					"cl.emp_extnat_client as emp_extn_clent,cd.line1 as line1,cd.line2 as line2,cd.city as city,cd.state as state,\r\n" + 
					"cd.ZipCode as zipcode from Tbl_ClientDetails cl,Tbl_CompanyAddress cd where cl.client_id=cd.company_id \r\n" + 
					"and cl.candidate_id="+candidate_id+" and cl.status=1 and cl.client_type in (select client_type from Tbl_ClientDetails where client_type!='EndClient' and status=1)"
							+ " and cd.status='Active' and cl.payrate_id="+payrateId+"";
				clientlist= (List<ClientVendorMaster_DTO>) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(ClientVendorMaster_DTO.class)).list();
				System.out.println("--bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb-----------"+sql);
				/*}
				}*/
			} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return clientlist;
	}

	@Override
	public List<ClientVendorMaster_DTO> viewCustomerDetailsByCandidateId(Integer candidate_id,String payrateId, String emptype) {
		List<ClientVendorMaster_DTO>  custlist = null;
		Session session = null;
		try {
			session = sessfact.openSession();
			/*if(!emptype.equalsIgnoreCase("W2")) {
			String sql="select pt.payrate_id as payrate_id,cm.customer_id as custid,cm.customer_name as custname,cm.customer_address as custAddress,cm.customer_contact_no as cust_contactperson,cm.customer_mgr_email as cust_mgr_email,pt.bill_rate as billrate,pt.project_start_date as proj_startDate,pt.project_end_date as proj_endDate,pt.invoice_terms as invoiceterms,pt.payroll_type as payroll_type,pt.project_status as project_status from Tbl_VendorPayRateDetails pt,Tbl_CustomerMaster cm where cm.customer_id=pt.customer_id and pt.candidate_id="+candidate_id+" and pt.Status='Active'";
			custlist= (List<ClientVendorMaster_DTO>) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(ClientVendorMaster_DTO.class)).list();
			}else {*/
				Integer payrateid=null;
				if(payrateId!=null) {
				if (payrateId!="") {
					payrateid = Integer.parseInt(payrateId);
				}
				String sql="select pt.payrate_id as payrate_id,cm.customer_id as custid,cm.customer_name as custname,cm.customer_address as custAddress,cm.customer_contact_no as cust_contactperson,cm.customer_mgr_email as cust_mgr_email,pt.bill_rate as billrate,pt.project_start_date as proj_startDate,pt.project_end_date as proj_endDate,pt.invoice_terms as invoiceterms,pt.payroll_type as payroll_type,pt.project_status as project_status,pt.invoice_period as invoice_period from Tbl_VendorPayRateDetails pt,Tbl_CustomerMaster cm where cm.customer_id=pt.customer_id and pt.candidate_id="+candidate_id+" and pt.payrate_id="+payrateid+"";
				custlist= (List<ClientVendorMaster_DTO>) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(ClientVendorMaster_DTO.class)).list();	
			//}
				}
			} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return custlist;
	}

	@Override
	public List<ClientVendorMaster_DTO> viewVendorDetailsByCandidateId(Integer candidate_id,Integer payrateid) {
		List<ClientVendorMaster_DTO>  vendorlist = null;
		Session session = null;
		try {
			session = sessfact.openSession();
			String sql="select  cv.vendor_id as vendid,cv.vendor_name as vendorname,cv.vendor_contact_no as v_contactperson,cv.vendor_mgr_email as v_mgr_email,cv.status as vstatus,pt.pay_rate as payrate,pt.payment_terms as payterms from Tbl_VendorPayRateDetails pt,Tbl_VendorMaster cv where cv.vendor_id=pt.vendor_id and pt.candidate_id="+candidate_id+" and pt.payrate_id="+payrateid+"";
			vendorlist= (List<ClientVendorMaster_DTO>) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(ClientVendorMaster_DTO.class)).list();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return vendorlist;
	}

	@Override
	public List<ClientVendorMaster_DTO> viewEndclientByCandidateId(Integer candidate_id, String emptyp) {
		List<ClientVendorMaster_DTO>  ccvlist = null;
		Session session = null;
		try {
			session = sessfact.openSession();String sql=null;
			if(emptyp.equalsIgnoreCase("W2")) {
				 sql="Exec [getW2EndClientDetailsById] @candidateId="+candidate_id+"";
			}else {
				 sql="Exec [getEndClientDetailsById] @candidateId="+candidate_id+"";
			}
			
			ccvlist= (List<ClientVendorMaster_DTO>) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(ClientVendorMaster_DTO.class)).list();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return ccvlist;
	}
	
	@Override
	public PageStatusEntity getRedirectPageStatus(Integer candidate_id) {
		PageStatusEntity pagestsObj = null;
		Session session = null;
		try {
			session = sessfact.openSession();
			String sql = "from PageStatusEntity  where candidate_id=" + candidate_id + "";
			pagestsObj = (PageStatusEntity) session.createQuery(sql).uniqueResult();

		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return pagestsObj;
	}

	@Override
	public void savePageStatus(PageStatusEntity pagestsObj) {
		Session session = null;
		try {
			session = sessfact.openSession();
			Transaction tx = session.beginTransaction();
			session.save(pagestsObj);
			tx.commit();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {

			session.close();
		}

	}

	@Override
	public Integer saveEmpbankDetails(BankDetailsEntity bankDtlObj) {
		Session session = null;
		Integer bankpkid = null;
		try {
			session = sessfact.openSession();
			Transaction tx = session.beginTransaction();
			bankpkid = (Integer) session.save(bankDtlObj);
			tx.commit();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {

			session.close();
		}
		return bankpkid;
	}

	@Override
	public Integer saveExitDetails(EmpExitDetailsEntity exitObj) {
		Session session = null;
		Integer bankpkid = null;
		try {
			session = sessfact.openSession();
			Transaction tx = session.beginTransaction();
			bankpkid = (Integer) session.save(exitObj);
			tx.commit();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {

			session.close();
		}
		return bankpkid;
	}

	@Override
	public List<ManagerDto> getEmpInfoByEmpType(String sEmp_type) {
		List<ManagerDto> basicList = null;
		Session session = null;
		try {
			session = sessfact.openSession();
			String sql = null;
			if (sEmp_type.equalsIgnoreCase("Employees")) { 
			//	sql = "from EmpBasicDetailsEntity u where u.emp_type in ('W2 Admin','W2') and status=1";
				sql = "select a.full_name as fullName,a.user_name as userName from Tbl_EmpBasicDetails a,Tbl_CandidateDetailedInfo c where a.candidate_id=c.candidate_id and c.emp_type in ('W2 Admin','W2') and c.status='Active' and a.status=1";
			} else if (sEmp_type.equalsIgnoreCase("Contractors")) {
			//	sql = " from EmpBasicDetailsEntity u where u.emp_type in ('C2C','1099') and status=1";
				sql = "select a.full_name as fullName,a.user_name as userName from Tbl_EmpBasicDetails a,Tbl_CandidateDetailedInfo c where a.candidate_id=c.candidate_id and c.emp_type in ('C2C','1099') and c.status='Active' and a.status=1";
			}
			    basicList = session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(ManagerDto.class)).list();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return basicList;
	}

	@Override
	public List<SearchBean> getemplistBySearch(String username, String fullname, String emptype, String pendingdocs, String sEmp_type,String sempstatus) {
		List<SearchBean> searchList = null;Integer status=null;
		Session session = null;
		
		try {
			System.out.println("sempstatus******"+sempstatus);
			if(sempstatus.equalsIgnoreCase("Active")) {
				status=1;
			}else if(sempstatus.equalsIgnoreCase("InActive")) {
				status=0;
			}
			session = sessfact.openSession();
			String sql = "exec SP_USOBT_AdminSearch @username='" + username + "',@fullname='" + fullname
					+ "',@emp_type='" + emptype + "',@pending_pages='" + pendingdocs + "',@type='" + sEmp_type + "' ,@status="+status+" ";
			
			System.out.println("******hh********"+sql);
			searchList = session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(SearchBean.class)).list();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return searchList;
	}

	@Override
	public BasicDetailsDto viewEmployeeInfo(Integer candidateId) {
		BasicDetailsDto basicObj = null;
		Session session = null;
		try {
			session = sessfact.openSession();
			String sql = "Exec getBaiscDetails @candidateId=" + candidateId + "";
			basicObj = (BasicDetailsDto) session.createSQLQuery(sql)
					.setResultTransformer(new AliasToBeanResultTransformer(BasicDetailsDto.class)).uniqueResult();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return basicObj;
	}

	@Override
	public void updateBasicDetails(EmpBasicDetailsEntity basicObj) {
		Session session = null;
		try {
			session = sessfact.openSession();
			Transaction tx = session.beginTransaction();
			session.update(basicObj);
			tx.commit();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
	}

	@Override
	public EmpExitDetailsEntity ViewExitDetails(Integer candidate_id) {
		EmpExitDetailsEntity exitObj = null;
		Session session = null;
		try {
			session = sessfact.openSession();
			String sql = "from EmpExitDetailsEntity where candidate_id=" + candidate_id + " and Status='Active'";
			exitObj = (EmpExitDetailsEntity) session.createQuery(sql).uniqueResult();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return exitObj;
	}

	@Override
	public EmpExitDetailsEntity getExitEmployeeByCandidateId(Integer candidate_id) {
		EmpExitDetailsEntity exitObj = null;
		Session session = null;
		try {
			session = sessfact.openSession();
			String sql = "from EmpExitDetailsEntity where candidate_id=" + candidate_id + " and Status='Active'";
			exitObj = (EmpExitDetailsEntity) session.createQuery(sql).uniqueResult();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return exitObj;
	}

	@Override
	public void updateExitDetails(EmpExitDetailsEntity exitObj) {
		Session session = null;
		try {
			session = sessfact.openSession();
			Transaction tx = session.beginTransaction();
			session.update(exitObj);
			tx.commit();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}

	}

	@Override
	public List<BankDetailsEntity> viewEmpBankDetails(Integer candidate_id) {
		List<BankDetailsEntity> viewbankList = null;
		Session session = null;
		try {
			session = sessfact.openSession();
			String sql = "from BankDetailsEntity where candidate_id=" + candidate_id + "";
			viewbankList = session.createQuery(sql).list();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return viewbankList;
	}

	@Override
	public void updateEmpBankDetails(BankDetailsEntity updateBankObj) {
		Session session = null;
		try {
			session = sessfact.openSession();
			Transaction tx = session.beginTransaction();
			session.update(updateBankObj);
			tx.commit();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
	}

	@Override
	public List<EmpDocumentsEntity> getEmpDocDetailsByCandidateId(Integer candidate_id) {
		List<EmpDocumentsEntity> empDocList = null;
		Session session = null;
		try {
			session = sessfact.openSession();
			String sql = "from EmpDocumentsEntity where candidate_id=" + candidate_id + " and status='Active'";
			empDocList = (List<EmpDocumentsEntity>) session.createQuery(sql).list();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return empDocList;
	}

	@Override
	public EmpDocumentsEntity getEmpDocsByCandidateIdFileType(String filetype, Integer candidate_id) {
		EmpDocumentsEntity empDocObj = null;
		Session session = null;
		try {
			session = sessfact.openSession();
			String sql = "from EmpDocumentsEntity where candidate_id=" + candidate_id + " and filetype=" + filetype + " ";
			empDocObj = (EmpDocumentsEntity) session.createQuery(sql).uniqueResult();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return empDocObj;
	}

	@Override
	public void updatePageStatus(PageStatusEntity pagestsObj) {
		Session session = null;
		try {
			session = sessfact.openSession();
			Transaction tx = session.beginTransaction();
			session.update(pagestsObj);
			tx.commit();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}

	}

	@Override
	public BankDetailsEntity getEmpBankDetailsByBankId(Integer bank_id) {
		BankDetailsEntity viewbankObj = null;
		Session session = null;
		try {
			session = sessfact.openSession();
			String sql = "from BankDetailsEntity where bank_id=" + bank_id + "";
			viewbankObj = (BankDetailsEntity) session.createQuery(sql).uniqueResult();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return viewbankObj;
	}

	@Override
	public List<EmpDocumentsEntity> getEmpDocumentsListByCandidateId(Integer candidate_id) {
		List<EmpDocumentsEntity> empDocList = null;
		Session session = null;
		try {
			session = sessfact.openSession();
			String sql = "from EmpDocumentsEntity where candidate_id=" + candidate_id + " and status='Active'";
			empDocList = (List<EmpDocumentsEntity>) session.createQuery(sql).list();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return empDocList;
	}

	@Override
	public List<DocEmpBean> viewDocumentsByCandidateId(Integer candidate_id) {
		List<DocEmpBean> DocList = null;
		Session session = null;
		try {
			session = sessfact.openSession();
			String sql = "select distinct document_id as document_id,file_name as file_name,file_type as filetype,input_value as inputval,candidate_id as candidate_id,from_date as startdate,expiry_date as expirydate from Tbl_EmpDocuments where candidate_id="+candidate_id+" and status='Active'";
			DocList = (List<DocEmpBean>) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(DocEmpBean.class)).list();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return DocList;
	}

	@Override
	public void updateDocument(EmpDocumentsEntity docobj) {
		Session session = null;
		try {
			session = sessfact.openSession();
			Transaction tx = session.beginTransaction();
			session.update(docobj);
			tx.commit();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
	}

	@Override
	public EmpDocumentsEntity getDocumentByDocId(Integer document_id) {
		EmpDocumentsEntity DocObj = null;
		Session session = null;
		try {
			session = sessfact.openSession();
			String sql = "from EmpDocumentsEntity  where document_id=" + document_id + " and status='Active'";
			DocObj = (EmpDocumentsEntity) session.createQuery(sql).uniqueResult();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return DocObj;
	}

	@Override
	public String deleteDocumentByDocId(Integer docId) {
		String msg = null;
		Session session = null;
		try {
			int docid=docId;
			session = sessfact.openSession();
			Transaction tx = session.beginTransaction();
			EmpDocumentsEntity docidObj = (EmpDocumentsEntity) session.get(EmpDocumentsEntity.class, docid);
			if (docidObj != null) {
				docidObj.setDocument_id(docId);
				session.delete(docidObj);
				tx.commit();
				msg = "Success";
			} else {
				msg = "Fail";
			}
		
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return msg;
	}

	
	@Override
	public ClientDetailsEntity getClientDetailsById(Integer client_id,String emptype) {
		ClientDetailsEntity clientObj = null;
		Session session = null;
		try {
			session = sessfact.openSession();
			if(emptype.equalsIgnoreCase("W2")) {
				String sql = "from ClientDetailsEntity  where client_id="+client_id+" and status=1";
				clientObj = (ClientDetailsEntity) session.createQuery(sql).uniqueResult();
			}else {
				String sql = "from ClientDetailsEntity  where client_id="+client_id+"";
				clientObj = (ClientDetailsEntity) session.createQuery(sql).uniqueResult();
			}
			
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return clientObj;
	}

	@Override
	public void updateClientDetails(ClientDetailsEntity clientObj) {
		Session session = null;
		try {
		     session = sessfact.openSession();
		     Transaction tx=session.beginTransaction();
			 session.update(clientObj);
			 tx.commit();
		  } catch (Exception e) {
			logger.info(e.getMessage(), e);
		 } finally {
			session.close();
		}
	}

	@Override
	public EmpPayRateDetails getPayRateDetailsById(Integer payRateId,String emptype) {
		EmpPayRateDetails payrateObj = null;
		Session session = null;
		try {
			session = sessfact.openSession();
			//if(emptype.equalsIgnoreCase("W2")) {
				String sql = "from EmpPayRateDetails  where payrate_id="+payRateId+"";
				System.out.println("--------------"+sql);
				payrateObj = (EmpPayRateDetails) session.createQuery(sql).uniqueResult();
			/*}
			else {
				String sql = "from EmpPayRateDetails  where payrate_id="+payRateId+" and status='Active'";
				payrateObj = (EmpPayRateDetails) session.createQuery(sql).uniqueResult();
			}
			*/
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return payrateObj;
	}

	@Override
	public void updatePayRateDetails(EmpPayRateDetails payrateObj) {
		Session session = null;
		try {
		     session = sessfact.openSession();
		     Transaction tx=session.beginTransaction();
			 session.update(payrateObj);
			 tx.commit();
		  } catch (Exception e) {
			logger.info(e.getMessage(), e);
		 } finally {
			session.close();
		}
	}

	@Override
	public BasicDetailsDto viewConsultantInfo(Integer candidateId) {
		BasicDetailsDto  consultantObj = null;
		Session session = null;
		try {
			session = sessfact.openSession();
			String sql ="Exec getConsultantBaiscDetails @candidateId="+candidateId+"";
			consultantObj =  (BasicDetailsDto) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(BasicDetailsDto.class)).uniqueResult();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return consultantObj;
	}

	@Override
	public Integer saveConsultantDocs(EmpDocumentsEntity docobj) {
		Session session = null;
		Integer docId = null;
		try {
			session = sessfact.openSession();
			Transaction tx=session.beginTransaction();
			docId = (Integer) session.save(docobj);
			tx.commit();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return docId;
	}

	@Override
	public List<EmpJoinHistorty> getEmployeeHistoryByCandidateId(Integer candidate_id) {
		List<EmpJoinHistorty> historyList = null;
		Session session = null;
		try {
			session = sessfact.openSession();
			String sql = "from EmpJoinHistorty where candidate_id="+candidate_id+"";
			historyList = (List<EmpJoinHistorty>) session.createQuery(sql).list();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return historyList;
	}

	@Override
	public void saveRejoinDetails(EmpJoinHistorty addhistory) {
		Session session = null;
		try {
			session = sessfact.openSession();
			Transaction tx=session.beginTransaction();
			session.save(addhistory);
			tx.commit();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
	}

	@Override
	public List<ClientDetailsEntity> getClientDetailsByCandidateId(Integer candidate_id) {
		List<ClientDetailsEntity> empDocList = null;
		Session session = null;
		try {
			session = sessfact.openSession();
			String sql = "from ClientDetailsEntity where candidate_id=" + candidate_id + "";
			empDocList = (List<ClientDetailsEntity>) session.createQuery(sql).list();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return empDocList;
	}
	
	@Override
    public Integer saveConsultantBankDetails(BankPaymentDetailsEntity bankPDtlObj) {
           Session session = null;
           Integer bankpkid = null;
           try {
                  session = sessfact.openSession();
                  Transaction tx = session.beginTransaction();
                  bankpkid = (Integer) session.save(bankPDtlObj);
                  tx.commit();
           } catch (Exception e) {
                  logger.info(e.getMessage(), e);
           } finally {

                  session.close();
           }
           return bankpkid;
    }

    @Override
    public List<BankPaymentDetailsEntity> viewConsultantBankDetails(Integer candidate_id) {
           List<BankPaymentDetailsEntity> viewbankList = null;
           Session session = null;
           try {
                  session = sessfact.openSession();
                  String sql = "from BankPaymentDetailsEntity where candidate_id=" + candidate_id + "";
                  viewbankList = session.createQuery(sql).list();
           } catch (Exception e) {
                  logger.info(e.getMessage(), e);
           } finally {
                  session.close();
           }
           return viewbankList;
    }
/*
    @Override
    public BankDetails_DTO viewConsultantBankDetailsByCandidateId(Integer candidate_id) {
           BankDetails_DTO bankObj = null;
           Session session = null;
           try {
                  session = sessfact.openSession();
                  String sql = "select b.tblpk as tblpk,b.vendorid as vendorid,b.payment_mode as payment_mode,v.vendorname as ven_name from Tbl_BankPaymentDetails b,Tbl_VendorMaster v where v.vendorid=b.vendorid and b.candidate_id="+candidate_id+" and b.status='Active'";
                  bankObj = (BankDetails_DTO) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(BankDetails_DTO.class)).uniqueResult();
           } catch (Exception e) {
                  logger.info(e.getMessage(), e);
           } finally {
                  session.close();
           }
           return bankObj;
    }*/

    @Override
    public BankPaymentDetailsEntity getConsultantBankDetailsById(int payment_id) {
           BankPaymentDetailsEntity bankObj = null;
           Session session = null;
           try {
                  session = sessfact.openSession();
                  String sql = "from BankPaymentDetailsEntity where payment_id=" + payment_id + "";
                  bankObj = (BankPaymentDetailsEntity) session.createQuery(sql).uniqueResult();
           } catch (Exception e) {
                  logger.info(e.getMessage(), e);
           } finally {
                  session.close();
           }
           return bankObj;
    }

    @Override
    public void updateConsultantBankDetails(BankPaymentDetailsEntity updateBankObjC) {
           Session session = null;
           try {
                  session = sessfact.openSession();
                  Transaction tx = session.beginTransaction();
                  session.update(updateBankObjC);
                  tx.commit();
           } catch (Exception e) {
                  logger.info(e.getMessage(), e);
           } finally {
                  session.close();
           }
           
    }

	@Override
	public CandidateDetailedInfo getCandidateDetailedInfoById(int candidate_id) {
		CandidateDetailedInfo detailObj = null;
		Session session = null;
		try {
			session = sessfact.openSession();
			String sql = "from CandidateDetailedInfo  where candidate_id="+candidate_id+" and status='Active'";
			detailObj = (CandidateDetailedInfo) session.createQuery(sql).uniqueResult();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return detailObj;
	}

	@Override
	public void saveCandidateAddressDetails(CandidateAddress candAddressObj) {
		Session session = null;
		try {
			session = sessfact.openSession();
			Transaction tx = session.beginTransaction();
			session.save(candAddressObj);
			tx.commit();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
	}

	@Override
	public void saveCandidateDetailedInfo(CandidateDetailedInfo candDetailObj) {
		Session session = null;
		try {
			session = sessfact.openSession();
			Transaction tx = session.beginTransaction();
			session.save(candDetailObj);
			tx.commit();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
	}

	@Override
	public CandidateAddress getCandidateAddressByCandidateId(Integer candidateId) {
		CandidateAddress addrdetailObj = null;
		Session session = null;
		try {
			session = sessfact.openSession();
			String sql = "from CandidateAddress  where candidate_id="+candidateId+" and status='Active'";
			addrdetailObj = (CandidateAddress) session.createQuery(sql).uniqueResult();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return addrdetailObj;
	}

	@Override
	public void updateCandidateDetailedInfo(CandidateDetailedInfo candidateInfoDBObj) {
		Session session = null;
		try {
			session = sessfact.openSession();
			Transaction tx = session.beginTransaction();
			session.update(candidateInfoDBObj);
			tx.commit();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
	}

	@Override
	public void updateCandidateAddressInfo(CandidateAddress candidateAddrDBObj) {
		Session session = null;
		try {
			session = sessfact.openSession();
			Transaction tx = session.beginTransaction();
			session.update(candidateAddrDBObj);
			tx.commit();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
	}

	@Override
	public List<WorkAuthorization> getWorkAuthnListForContractors() {
		List<WorkAuthorization> cwaList = null;
		Session session = null;
		try {
			session = sessfact.openSession();
			String sql = "from WorkAuthorization where work_auth_name in('US Citizen','Green Card')";
			cwaList = (List<WorkAuthorization>) session.createQuery(sql).list();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return cwaList;
	}

	@Override
	public void saveCompanyAddressDetails(CompanyAdressEntity companyAddressObj) {
		Session session = null;
		try {
			session = sessfact.openSession();
			Transaction tx = session.beginTransaction();
			session.save(companyAddressObj);
			tx.commit();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
	}
	@Override
    public EmployeeDto getCanidateDetailsByCanId(Integer candidateId) {
           EmployeeDto basicObj = null;
           Session session = null;
           try {
        	   //,convert(DATE,c.joining_date,101) as joining_date 
                  session = sessfact.openSession();
                  String sql = "select a.full_name as full_name,c.emp_type as emp_type,a.user_name as username,a.email_id as emailid,"
                  		+ "convert(varchar,c.joining_date,101) as joiningdate,c.work_authorization as work_authorization,c.emp_billing as billing from Tbl_EmpBasicDetails a,Tbl_CandidateDetailedInfo c"
                  		+ " where a.candidate_id=c.candidate_id and c.status='Active' and a.status=1 and a.candidate_id="+candidateId+" ";
               //   basicObj = (EmployeeDto) session.createQuery(sql).uniqueResult();
                  basicObj = (EmployeeDto) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(EmployeeDto.class)).uniqueResult();
           } catch (Exception e) {
                  logger.info(e.getMessage(), e);
           } finally {
                  session.close();
           }
           return basicObj;
    }

	@Override
	public CompanyAdressEntity getCompanyAdressDetailsById(Integer companyId, String companyType) {
		CompanyAdressEntity addrdetailObj = null;
		Session session = null;
		try {
			session = sessfact.openSession();
			String sql = "from CompanyAdressEntity  where company_id="+companyId+" and company_type='"+companyType+"' and status='Active'";
			addrdetailObj = (CompanyAdressEntity) session.createQuery(sql).uniqueResult();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return addrdetailObj;
	}

	@Override
	public void updateCompanyAddressInfo(CompanyAdressEntity companyAddressObjDB) {
		Session session = null;
		try {
			session = sessfact.openSession();
			Transaction tx = session.beginTransaction();
			session.update(companyAddressObjDB);
			tx.commit();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
	}

	@Override
	public void saveJoinHistory(EmpJoinHistorty joinHistoryObj) {
		Session session = null;
		try {
			session = sessfact.openSession();
			Transaction tx = session.beginTransaction();
			session.save(joinHistoryObj);
			tx.commit();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
	}

	@Override
	public EmpJoinHistorty getJoinHistoryByCandidateId(Integer history_id) {
		EmpJoinHistorty joinHistoryObj = null;
		Session session = null;
		try {
			session = sessfact.openSession();
			String sql = "from EmpJoinHistorty  where history_id="+history_id+"";
			joinHistoryObj = (EmpJoinHistorty) session.createQuery(sql).uniqueResult();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return joinHistoryObj;
	}

	@Override
	public void updateJoinHistory(EmpJoinHistorty joinHistoryObj) {
		Session session = null;
		try {
			session = sessfact.openSession();
			Transaction tx = session.beginTransaction();
			session.update(joinHistoryObj);
			tx.commit();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
	}

	@Override
	public Integer getJoinHistoryId(Integer candidateId) {
		Session session = null;
		Integer history_id=null;
		try {
			session = sessfact.openSession();
			//String sql = "SELECT TOP 1 emp_number FROM Tbl_EmpBasicDetails  where emp_type in ('W2 Admin','W2') ORDER BY candidate_id DESC";
			String sql = "SELECT TOP 1 history_id FROM Tbl_EmpJoinHistorty  where candidate_id="+candidateId+" ORDER BY history_id DESC";
			history_id = (Integer) session.createSQLQuery(sql).uniqueResult();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return history_id;
	}
	@Override
	public String checkPassword(String userName, String curentpwd) {
		String message=null;
		Session session = null;  
		Transaction tx = null; 
		String   bytesCurrepwd = Base64.encode(curentpwd.getBytes());
	      
		try {
			session = sessfact.openSession();  
			tx = session.beginTransaction();
			String sql="select userName from EmpBasicDetailsEntity  where userName='"+userName +"' and pwd='"+bytesCurrepwd+"' and status=1";
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
	public String changePassword(String userName, String confirmPassword) {
		String message=null;
		Session session = null;  
		Transaction tx = null; 
		String   bytesEncodepwd = Base64.encode(confirmPassword.getBytes());
		try {
			session = sessfact.openSession();  
			tx = session.beginTransaction();
			Query rs1=session.createQuery("Update EmpBasicDetailsEntity set pwd='" +bytesEncodepwd+"'  where userName='" + userName + "'");
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
	public ClientVendorMaster_DTO viewEndClientDetailsByCandidateId(Integer candidate_Id, String emptype, Integer payrateId) {
			ClientVendorMaster_DTO  endClient = null;
			Session session = null;
			try {
				session = sessfact.openSession();
			//	String sql="select client_id as clientid,client_name as clientName,client_address as client_addr,client_mgr_name as client_mgr,client_mgr_extn as client_mgr_extn,client_mgr_email as client_mgr_email,emp_mailat_client as emp_email_clent,emp_extnat_client as emp_extn_clent from Tbl_ClientDetails where candidate_id="+candidate_id+" and status=1";
				String sql=null;
				/*if(!emptype.equalsIgnoreCase("W2")) {
					System.out.println("-------------payrateId"+payrateId);
					 sql="select cl.client_id as clientid,cl.fed_id as fed_id,cl.client_name as clientName,cl.project_name as projectName,cl.client_mgr_name as client_mgr,\r\n" + 
							"cl.client_mgr_extn as client_mgr_extn,cl.client_mgr_email as client_mgr_email,cl.emp_mailat_client as emp_email_clent,\r\n" + 
							"cl.emp_extnat_client as emp_extn_clent,cd.line1 as line1,cd.line2 as line2,cd.city as city,cd.state as state,\r\n" + 
							"cd.ZipCode as zipcode from Tbl_ClientDetails cl,Tbl_CompanyAddress cd where cl.client_id=cd.company_id \r\n" + 
							"and cl.candidate_id="+candidate_Id+" and cl.status=1 and cl.client_type='EndClient' and cd.status='Active' and cd.company_type='EndClient' and cl.payrate_id="+payrateId+"";
						endClient= (ClientVendorMaster_DTO) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(ClientVendorMaster_DTO.class)).uniqueResult();
				}else {*/
						
				sql="select cl.reason_lca as reason_lca,cl.client_id as clientid,cl.fed_id as fed_id,cl.client_name as clientName,cl.project_name as projectName,cl.client_mgr_name as client_mgr,\r\n" + 
						"cl.client_mgr_extn as client_mgr_extn,cl.client_mgr_email as client_mgr_email,cl.emp_mailat_client as emp_email_clent,\r\n" + 
						"cl.emp_extnat_client as emp_extn_clent,cd.line1 as line1,cd.line2 as line2,cd.city as city,cd.state as state,\r\n" + 
						"cd.ZipCode as zipcode,cl.job_title as job_title,cl.organization_name as organization_name,cl.education as education," + 
						"cl.working_from as workinglocation,cl.county as county,cl.soc_code as soc_code,cl.metro_politan_area as metro_politan_area from Tbl_ClientDetails cl,Tbl_CompanyAddress cd where cl.client_id=cd.company_id \r\n" + 
						"and cl.candidate_id="+candidate_Id+" and cl.status=1 and cl.client_type='EndClient' and cd.status='Active' and cd.company_type='EndClient'"+
						" and cl.payrate_id="+payrateId+"";
					System.out.println("--aaaaaaaaaaaaaaaaa-----------"+sql);
						endClient= (ClientVendorMaster_DTO) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(ClientVendorMaster_DTO.class)).uniqueResult();
					
					

			} catch (Exception e) {
				logger.info(e.getMessage(), e);
			} finally {
				session.close();
			}
			return endClient;
	}

	@Override
	public EmpBasicDetailsEntity getEmployeeStatusDetailsByCandidateId(Integer candidate_Id) {
		EmpBasicDetailsEntity basicObj = null;
		Session session = null;
		try {
			session = sessfact.openSession();
			String sql = "from EmpBasicDetailsEntity  where candidate_id=" + candidate_Id + "";
			basicObj = (EmpBasicDetailsEntity) session.createQuery(sql).uniqueResult();

		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return basicObj;
	}

	
		@Override
		public String getempTypeByCanId(int id) {
			String emptype = null;
			Session session = null;
			try {
				session = sessfact.openSession();
				String sql = "select emp_type from CandidateDetailedInfo   where candidateInfo.candidate_id=" + id + " and status='Active'";
				emptype = (String) session.createQuery(sql).uniqueResult();

			} catch (Exception e) {
				logger.info(e.getMessage(), e);
			} finally {
				session.close();
			}
			return emptype;
		}

		@Override
		public BasicDetailsDto checkPhoneNo(String phoneno) {
			Session session = null;BasicDetailsDto pno = null;
			try {
				session = sessfact.openSession();
				String sql = " select distinct contact_no1 as contactno1,contact_no2 as contactno2,contact_no3 as contactno3 FROM Tbl_EmpBasicDetails  where '" + phoneno + "' in (contact_no1,contact_no2,contact_no3)";	
				pno= (BasicDetailsDto) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(BasicDetailsDto.class)).uniqueResult();
				
				//pno = (EmpBasicDetailsEntity) session.createQuery(sql).uniqueResult();
			} catch (Exception e) {
				logger.info(e.getMessage(), e);
			} finally {session.close();
			}return pno;
		}
		
		

		@Override
		public String checkEmail(String email) {
			Session session = null;String emailid = null;
			try {
				session = sessfact.openSession();
				String sql = "select distinct email FROM EmpBasicDetailsEntity  where email='" + email + "'";
				emailid = (String) session.createQuery(sql).uniqueResult();
			} catch (Exception e) {
				logger.info(e.getMessage(), e);
			} finally {session.close();
			}return emailid;
		}

		@Override
		public void updateClientHistoryDetails(ClientDetailsHistoryEntity clientHistoyObj) {
			Session session = null;
			try {
			     session = sessfact.openSession();
			     Transaction tx=session.beginTransaction();
				 session.save(clientHistoyObj);
				 tx.commit();
			  } catch (Exception e) {
				logger.info(e.getMessage(), e);
			 } finally {
				session.close();
			}
		}

		@Override
		public void savePayRateHistoryDetails(EmpPayRateDetailsHistory payratehistoryObj) {
			Session session = null;
			try {
				session = sessfact.openSession();
				Transaction tx = session.beginTransaction();
				session.save(payratehistoryObj);
				tx.commit();
			} catch (Exception e) {
				logger.info(e.getMessage(), e);
			} finally {
				session.close();
			}
		}

		@Override
		public EmpPayRateDetails getPayrateDetailsByPayrateId(Integer payrateid) {
			Session session = null;EmpPayRateDetails payrateObj = null;
			try {
				session = sessfact.openSession();String sql =null;
				/*if(payrateid==0) {
					 sql = "from EmpPayRateDetails  where Status='Active'";
				}else {*/
					 sql = "from EmpPayRateDetails  where payrate_id=" + payrateid + "";
				//}
				
				payrateObj = (EmpPayRateDetails) session.createQuery(sql).uniqueResult();
			} catch (Exception e) {
				logger.info(e.getMessage(), e);
			} finally {session.close();
			}return payrateObj;
		}
		
		@Override
		public EmpPayRateDetails getActivePayrateDetailsByPayrateId(Integer payrateid) {
			Session session = null;EmpPayRateDetails payrateObj = null;
			try {
				session = sessfact.openSession();String sql =null;
				/*if(payrateid==0) {
					 sql = "from EmpPayRateDetails  where Status='Active'";
				}else {*/
					 sql = "from EmpPayRateDetails  where payrate_id=" + payrateid + " and Status='Active'";
				//}
				
				payrateObj = (EmpPayRateDetails) session.createQuery(sql).uniqueResult();
			} catch (Exception e) {
				logger.info(e.getMessage(), e);
			} finally {session.close();
			}return payrateObj;
		}
		
		@Override
		public void updateCustomerMaster(CustomerMasterEntity custObj) {
			Session session = null;
			try {
				session = sessfact.openSession();
				Transaction tx = session.beginTransaction();
				session.update(custObj);
				tx.commit();
			} catch (Exception e) {
				logger.info(e.getMessage(), e);
			} finally {
				session.close();
			}
		}

		@Override
		public void updateVendorMaster(VendorMasterEntity vendDBObj) {
			Session session = null;
			try {
				session = sessfact.openSession();
				Transaction tx = session.beginTransaction();
				session.update(vendDBObj);
				tx.commit();
			} catch (Exception e) {
				logger.info(e.getMessage(), e);
			} finally {
				session.close();
			}
		}

		@Override
		public List<DocumentHistoryDto> getCustomerDocumentHistiryByCustomerId(Integer cust_Id) {
			List<DocumentHistoryDto>  customerDocList = null;
			Session session = null;
			try {
				session = sessfact.openSession();
				String sql="select document_id as document_id,file_name as file_name,file_type as filetype,ISNULL(from_date,'') as startdate,ISNULL(expiry_date,'') as expirydate,CONVERT(VARCHAR(10), submitted_date, 103) + ' '  + convert(VARCHAR(8), submitted_date, 14) as submit_date,input_value as inputval,status as docStatus,dbo.fnGetNameByEmpno(posted_by) as posted_by from Tbl_EmpDocuments  where customer_id="+cust_Id+" and candidate_id=0 and file_type in ('Customer_MSA','Manager_Approved_Email_CMSA') order by document_id desc";
				customerDocList= (List<DocumentHistoryDto>) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(DocumentHistoryDto.class)).list();
			} catch (Exception e) {
				logger.info(e.getMessage(), e);
			} finally {
				session.close();
			}
			return customerDocList;
	  }

		@Override
		public List<DocumentHistoryDto> getVendorDocumentHistiryById(Integer venId, String fileType, String inputVal) {
			List<DocumentHistoryDto>  customerDocList = null;
			Session session = null;
			try {
				String sql=null;
				session = sessfact.openSession();
				if(!inputVal.isEmpty()) {
					sql="select document_id as document_id,file_name as file_name,file_type as filetype,ISNULL(from_date,'') as startdate,ISNULL(expiry_date,'') as expirydate,CONVERT(VARCHAR(10), submitted_date, 103) + ' '  + convert(VARCHAR(8), submitted_date, 14) as submit_date,input_value as inputval,status as docStatus,dbo.fnGetNameByEmpno(posted_by) as posted_by from Tbl_EmpDocuments  where vendor_id="+venId+" and candidate_id=0 and file_type in ('Business Compliance') and input_value='"+inputVal+"'";
				}else {
					if(fileType.equalsIgnoreCase("Vendor_MSA")) {
						sql="select document_id as document_id,file_name as file_name,file_type as filetype,ISNULL(from_date,'') as startdate,ISNULL(expiry_date,'') as expirydate,CONVERT(VARCHAR(10), submitted_date, 103) + ' '  + convert(VARCHAR(8), submitted_date, 14) as submit_date,ISNULL(input_value,'')  as inputval,status as docStatus,dbo.fnGetNameByEmpno(posted_by) as posted_by from Tbl_EmpDocuments  where vendor_id="+venId+" and candidate_id=0 and file_type in ('Vendor_MSA')";
					}else {
						sql="select document_id as document_id,file_name as file_name,file_type as filetype,ISNULL(from_date,'') as startdate,ISNULL(expiry_date,'') as expirydate,CONVERT(VARCHAR(10), submitted_date, 103) + ' '  + convert(VARCHAR(8), submitted_date, 14) as submit_date,ISNULL(input_value,'')  as inputval,status as docStatus,dbo.fnGetNameByEmpno(posted_by) as posted_by from Tbl_EmpDocuments  where vendor_id="+venId+" and candidate_id=0 and file_type in ('Manager_Approved_Email_VMSA')";
					}
					//sql="select document_id as document_id,file_name as file_name,file_type as filetype,ISNULL(from_date,'') as startdate,ISNULL(expiry_date,'') as expirydate,CONVERT(VARCHAR(10), submitted_date, 103) + ' '  + convert(VARCHAR(8), submitted_date, 14) as submit_date,ISNULL(input_value,'')  as inputval,status as docStatus from Tbl_EmpDocuments  where vendor_id="+venId+" and candidate_id=0 and file_type in ('Vendor_MSA')";
				}
				customerDocList= (List<DocumentHistoryDto>) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(DocumentHistoryDto.class)).list();
			} catch (Exception e) {
				logger.info(e.getMessage(), e);
			} finally {
				session.close();
			}
			return customerDocList;
		}
		@Override
		public ClientVendorMaster_DTO getCustomerEndclientByPayrateId(Integer payrateId) {
			Session session = null;ClientVendorMaster_DTO clientObj= null;
			try {
				session = sessfact.openSession();
				String sql = "select customer_id as custid,(select client_id from Tbl_ClientDetails where client_type='EndClient' and payrate_id="+payrateId+" and status=1) as clientid from Tbl_VendorPayRateDetails where payrate_id="+payrateId+" and status='Active'";	
				clientObj= (ClientVendorMaster_DTO) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(ClientVendorMaster_DTO.class)).uniqueResult();
				
				//pno = (EmpBasicDetailsEntity) session.createQuery(sql).uniqueResult();
			} catch (Exception e) {
				logger.info(e.getMessage(), e);
			} finally {session.close();
			}return clientObj;
		}
		
		@Override
		public EmpPayRateDetails payrateDetailsByCandidateId(Integer candidateid) {
			EmpPayRateDetails payrateObj = null;
			Session session = null;
			try {
				session = sessfact.openSession();
				
					String sql = "from EmpPayRateDetails  where candidate_id="+candidateid+" and status='Active'";
					payrateObj = (EmpPayRateDetails) session.createQuery(sql).uniqueResult();
				
				
			} catch (Exception e) {
				logger.info(e.getMessage(), e);
			} finally {
				session.close();
			}
			return payrateObj;
		}

		@Override
		public List<ClientVendorMaster_DTO> getCustomerMasterListByCanidateId(Integer candidateid) {
			List<ClientVendorMaster_DTO>  customerDocList = null;
			Session session = null;
			try {
				session = sessfact.openSession();
				String sql="select distinct c.customer_name as companyName,c.customer_id as companyId from Tbl_VendorPayRateDetails v join Tbl_CustomerMaster c on c.customer_id=v.customer_id where candidate_id="+candidateid+"";
				customerDocList= (List<ClientVendorMaster_DTO>) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(ClientVendorMaster_DTO.class)).list();
			} catch (Exception e) {
				logger.info(e.getMessage(), e);
			} finally {
				session.close();
			}
			return customerDocList;
		}

		@Override
		public ClientVendorMaster_DTO getCustomerMasterByCanidateId(Integer candidateid) {
			ClientVendorMaster_DTO customerName = null;
			Session session = null;
			try {
				session = sessfact.openSession();
				String sql="select c.customer_name as companyName from Tbl_VendorPayRateDetails v join Tbl_CustomerMaster c on c.customer_id=v.customer_id where candidate_id="+candidateid+" and v.status='Active'";
				customerName= (ClientVendorMaster_DTO) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(ClientVendorMaster_DTO.class)).list();
			} catch (Exception e) {
				logger.info(e.getMessage(), e);
			} finally {
				session.close();
			}
			return customerName;
		}
		
		@Override
		public List<DocumentHistoryDto> getClientCustomerDocumentHistiryById(Integer cust_Id, Integer candidate_Id) {
			List<DocumentHistoryDto>  customerDocList = null;
			Session session = null;
			try {
				session = sessfact.openSession();
				//String sql="select document_id as document_id,file_name as file_name,file_type as filetype,ISNULL(from_date,'') as startdate,ISNULL(expiry_date,'') as expirydate,CONVERT(VARCHAR(10), submitted_date, 103) + ' '  + convert(VARCHAR(8), submitted_date, 14) as submit_date,input_value as inputval,status as docStatus,dbo.fnGetNameByEmpno(posted_by) as posted_by,dbo.fnGetCustomeNameById(customer_id) as custName from Tbl_EmpDocuments  where customer_id="+cust_Id+" and candidate_id=0 and file_type in ('Customer_MSA','Manager_Approved_Email_CMSA') order by document_id desc";
				String sql="select document_id as document_id,file_name as file_name,file_type as filetype,ISNULL(from_date,'') as startdate,ISNULL(expiry_date,'') as expirydate,CONVERT(VARCHAR(10), submitted_date, 103) + ' '  + convert(VARCHAR(8), submitted_date, 14) as submit_date,input_value as inputval,status as docStatus,dbo.fnGetNameByEmpno(posted_by) as posted_by,dbo.fnGetCustomeNameById(customer_id) as custName from Tbl_EmpDocuments  where customer_id="+cust_Id+" and candidate_id="+candidate_Id+" and file_type in ('cust_work_order','Manager_Approved_Email_CWO') order by document_id desc";
				customerDocList= (List<DocumentHistoryDto>) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(DocumentHistoryDto.class)).list();
			} catch (Exception e) {
				logger.info(e.getMessage(), e);
			} finally {
				session.close();
			}
			return customerDocList;
		}

		@Override
		public List<DocumentHistoryDto> getClientVendorDocumentHistiryById(Integer ven_Id, Integer candidate_Id,
				String fileType) {
			List<DocumentHistoryDto>  customerDocList = null;
			Session session = null;
			try {
				session = sessfact.openSession();
				//String sql="select document_id as document_id,file_name as file_name,file_type as filetype,ISNULL(from_date,'') as startdate,ISNULL(expiry_date,'') as expirydate,CONVERT(VARCHAR(10), submitted_date, 103) + ' '  + convert(VARCHAR(8), submitted_date, 14) as submit_date,input_value as inputval,status as docStatus,dbo.fnGetNameByEmpno(posted_by) as posted_by,dbo.fnGetCustomeNameById(customer_id) as custName from Tbl_EmpDocuments  where customer_id="+cust_Id+" and candidate_id=0 and file_type in ('Customer_MSA','Manager_Approved_Email_CMSA') order by document_id desc";
				String sql="select document_id as document_id,file_name as file_name,file_type as filetype,ISNULL(from_date,'') as startdate,ISNULL(expiry_date,'') as expirydate,CONVERT(VARCHAR(10), submitted_date, 103) + ' '  + convert(VARCHAR(8), submitted_date, 14) as submit_date,input_value as inputval,status as docStatus,dbo.fnGetNameByEmpno(posted_by) as posted_by,dbo.fnGetVendorNameById(vendor_id) as venName from Tbl_EmpDocuments  where vendor_id="+ven_Id+" and candidate_id="+candidate_Id+" and file_type='"+fileType+"' order by document_id desc";
				customerDocList= (List<DocumentHistoryDto>) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(DocumentHistoryDto.class)).list();
			} catch (Exception e) {
				logger.info(e.getMessage(), e);
			} finally {
				session.close();
			}
			return customerDocList;
		}

		@Override
		public List<DocumentHistoryDto> getConsultantDocumentHistiryById(Integer candidate_Id, String fileType, String InputVal) {
			List<DocumentHistoryDto>  consultantDocsList = null;
			Session session = null;
			String sql="";
			try {
				session = sessfact.openSession();
				//String sql="select document_id as document_id,file_name as file_name,file_type as filetype,ISNULL(from_date,'') as startdate,ISNULL(expiry_date,'') as expirydate,CONVERT(VARCHAR(10), submitted_date, 103) + ' '  + convert(VARCHAR(8), submitted_date, 14) as submit_date,input_value as inputval,status as docStatus,dbo.fnGetNameByEmpno(posted_by) as posted_by,dbo.fnGetCustomeNameById(customer_id) as custName from Tbl_EmpDocuments  where customer_id="+cust_Id+" and candidate_id=0 and file_type in ('Customer_MSA','Manager_Approved_Email_CMSA') order by document_id desc";
				if(!InputVal.isEmpty()) {
					//sql="select document_id as document_id,file_name as file_name,file_type as filetype,ISNULL(from_date,'') as startdate,ISNULL(expiry_date,'') as expirydate,CONVERT(VARCHAR(10), submitted_date, 103) + ' '  + convert(VARCHAR(8), submitted_date, 14) as submit_date,input_value as inputval,status as docStatus,dbo.fnGetNameByEmpno(posted_by) as posted_by from Tbl_EmpDocuments  where candidate_id="+candidate_Id+" and file_type='"+fileType+"' and input_value=REPLACE("+InputVal+", '', '''') and customer_id=0 and vendor_id=0 order by document_id desc";
					sql ="Exec getDocumentHistoryDetails @candidateId="+candidate_Id+",@filetype='"+fileType+"',@inputVal='"+InputVal+"'";
				}else {
					sql="select document_id as document_id,file_name as file_name,file_type as filetype,ISNULL(from_date,'') as startdate,ISNULL(expiry_date,'') as expirydate,CONVERT(VARCHAR(10), submitted_date, 103) + ' '  + convert(VARCHAR(8), submitted_date, 14) as submit_date,input_value as inputval,status as docStatus,dbo.fnGetNameByEmpno(posted_by) as posted_by from Tbl_EmpDocuments  where candidate_id="+candidate_Id+" and file_type='"+fileType+"' and customer_id=0 and vendor_id=0 order by document_id desc";
				}
				consultantDocsList= (List<DocumentHistoryDto>) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(DocumentHistoryDto.class)).list();
			} catch (Exception e) {
				logger.info(e.getMessage(), e);
			} finally {
				session.close();
			}
			return consultantDocsList;
		}

		@Override
		public Integer getVendorIdByPayrateId(Integer candidate_id, Integer payrate_id) {
			Session session = null;
			Integer empNo=null;
			try {
				session = sessfact.openSession();
				String sql = "select vendor_id from  Tbl_VendorPayRateDetails where candidate_id="+candidate_id+" and payrate_id="+payrate_id+"";
				empNo = (Integer) session.createSQLQuery(sql).uniqueResult();
			} catch (Exception e) {
				logger.info(e.getMessage(), e);
			} finally {
				session.close();
			}
			return empNo;
		}
		
		@Override
		public List<DocEmpBean> viewEmpcustdocumentsByCandidateId(Integer candidate_id, String emptype, Integer payrate_id) {
			List<DocEmpBean>  vendorDocList = null;
			Session session = null;
			try {
				session = sessfact.openSession();
				//if(!emptype.equalsIgnoreCase("W2")) {
				String sql="select d.document_id as document_id,d.file_name as file_name,d.file_type as filetype,d.candidate_id as candidate_id,d.from_date as startdate,d.expiry_date as expirydate from Tbl_VendorPayRateDetails p,Tbl_EmpDocuments d where d.customer_id=p.customer_id and d.candidate_id=p.candidate_id and d.candidate_id="+candidate_id+" and d.Status='Active'";
				vendorDocList= (List<DocEmpBean>) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(DocEmpBean.class)).list();
				/*}else {
					if(payrate_id!=null) {
						Integer payrateid=null;
					if (payrate_id!="") {
						payrateid = Integer.parseInt(payrate_id);
					}
					String sql="select d.document_id as document_id,d.file_name as file_name,d.file_type as filetype,d.candidate_id as candidate_id,d.from_date as startdate,d.expiry_date as expirydate from Tbl_VendorPayRateDetails p,Tbl_EmpDocuments d where d.customer_id=p.customer_id and d.candidate_id=p.candidate_id and d.candidate_id="+candidate_id+" and p.payrate_id="+payrateid+"";
					vendorDocList= (List<DocEmpBean>) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(DocEmpBean.class)).list();
				  }
			   }*/
			}
				catch (Exception e) {
				logger.info(e.getMessage(), e);
			} finally {
				session.close();
			}
			return vendorDocList;
		}

		@Override
		public List<DocEmpBean> viewEmpvendocumentsByCandidateId(Integer candidate_id, String emptype, Integer payrate_id) {
			List<DocEmpBean>  vendorDocList = null;
			Session session = null;
			try {
				session = sessfact.openSession();
				//if(!emptype.equalsIgnoreCase("W2")) {
				String sql="select d.document_id as document_id,d.file_name as file_name,d.file_type as filetype,d.candidate_id as candidate_id,d.from_date as startdate,d.expiry_date as expirydate from Tbl_VendorPayRateDetails p ,Tbl_EmpDocuments d where d.vendor_id=p.vendor_id  and d.candidate_id=p.candidate_id and d.candidate_id="+candidate_id+" and p.payrate_id="+payrate_id+" and d.Status='Active'";
				vendorDocList= (List<DocEmpBean>) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(DocEmpBean.class)).list();
		/*	}else {
				if(payrate_id!=null) {
					Integer payrateid=null;
				if (payrate_id!="") {
					payrateid = Integer.parseInt(payrate_id);
				}
				String sql="select d.document_id as document_id,d.file_name as file_name,d.file_type as filetype,d.candidate_id as candidate_id,d.from_date as startdate,d.expiry_date as expirydate from Tbl_VendorPayRateDetails p ,Tbl_EmpDocuments d where d.vendor_id=p.vendor_id  and d.candidate_id=p.candidate_id and d.candidate_id="+candidate_id+" and p.payrate_id="+payrateid+"";
				vendorDocList= (List<DocEmpBean>) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(DocEmpBean.class)).list();
			}}*/
			} catch (Exception e) {
				logger.info(e.getMessage(), e);
			} finally {
				session.close();
			}
			return vendorDocList;
		}

		@Override
		public List<String> geti9SupportDocumentsListByType(String i9sdType) {
			List<String> listA= new ArrayList<String>();	
			Session session = null;
			try {
				session = sessfact.openSession();
				String sql="select docName from Tbl_I9SupportingDocuments  where docType='"+i9sdType+"'";
				listA= (List<String>) session.createSQLQuery(sql).list();
			} catch (Exception e) {
				logger.info(e.getMessage(), e);
			} finally {
				session.close();
			}
			return listA;
		}

		@Override
		public List<String> geti9SupportDocumentsListByCandidateIdType(Integer candidate_Id, String i9sdType) {
			List<String> emplistA= new ArrayList<String>();	
			Session session = null;
			try {
				session = sessfact.openSession();
				String sql="select input_value from Tbl_EmpDocuments where candidate_id="+candidate_Id+" and file_type='"+i9sdType+"' and status='Active'";
				emplistA= (List<String>) session.createSQLQuery(sql).list();
			} catch (Exception e) {
				logger.info(e.getMessage(), e);
			} finally {
				session.close();
			}
			return emplistA;
		}

		@Override
		public List<MyDashboardDto> getmyDashboardDocList() {
			List<MyDashboardDto>  myDashboardList = null;
			Session session = null;
			try {
				session = sessfact.openSession();
				String sql="select d.document_id as document_id,d.file_name as file_name,d.file_type as filetype,input_value as fileInput,d.candidate_id as candidate_id,d.from_date as startdate,d.expiry_date as expirydate from Tbl_VendorPayRateDetails p ,Tbl_EmpDocuments d where d.vendor_id=p.vendor_id  and d.candidate_id=p.candidate_id and d.candidate_id= and p.payrate_id= and d.Status='Active'";
				myDashboardList= (List<MyDashboardDto>) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(MyDashboardDto.class)).list();
			} catch (Exception e) {
				logger.info(e.getMessage(), e);
			} finally {
				session.close();
			}
			return myDashboardList;
		}

		@Override
		public List<CustomerDto> getmyDashboardCustDocList() {
			List<CustomerDto>  myDashboardCustList = null;
			Session session = null;
			try {
				session = sessfact.openSession();
				String sql="select customer_id as customer_id,expiry_date as expirydate, \r\n" + 
						"dbo.fnGetCustomeNameById(customer_id) as custName,file_name as fileName,file_type as fileType\r\n" + 
						"from Tbl_EmpDocuments where  expiry_date>=CONVERT(varchar, getdate(), 101) and expiry_date <=CONVERT(varchar, DATEADD(MONTH, 1, GETDATE()), 101) and expiry_date <> '' and status='Active' \r\n" + 
						"and file_type in ('Customer_MSA')";
				myDashboardCustList= (List<CustomerDto>) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(CustomerDto.class)).list();
			} catch (Exception e) {
				logger.info(e.getMessage(), e);
			} finally {
				session.close();
			}
			return myDashboardCustList;
		}

		@Override
		public List<VendorDto> getmyDashboardVendDocList() {
			List<VendorDto>  myDashboardVenList = null;
			Session session = null;
			try {
				session = sessfact.openSession();
				String sql="select vendor_id as vendor_id, expiry_date as expirydate,dbo.fnGetVendorNameById(vendor_id) as venName,file_name as fileName,input_value as fileInput,file_type as fileType\r\n" + 
						"from Tbl_EmpDocuments where  expiry_date>=CONVERT(varchar, getdate(), 101) and expiry_date <=CONVERT(varchar, DATEADD(MONTH, 1, GETDATE()), 101) and expiry_date <> '' and status='Active' \r\n" + 
						"and file_type in ('Vendor_MSA','Business Compliance')";
				myDashboardVenList= (List<VendorDto>) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(VendorDto.class)).list();
			} catch (Exception e) {
				logger.info(e.getMessage(), e);
			} finally {
				session.close();
			}
			return myDashboardVenList;
		}

		@Override
		public List<CandidateDocDto> getmyDashboardCandidateEmployeeDocList() {
			List<CandidateDocDto>  myDashboardCandList = null;
			Session session = null;
			try {
				session = sessfact.openSession();
				String sql="select candidate_id as candidate_id,dbo.fnGetDocPageStatusById(candidate_id) as docStatus, dbo.fnGetEmpTypeById(candidate_id) as empType, dbo.fnGetNameByCandidateId(candidate_id) as candName, expiry_date as expirydate,file_name as fileName,input_value as fileInput,file_type as fileType\r\n" + 
						"from Tbl_EmpDocuments where  expiry_date>=CONVERT(varchar, getdate(), 101) and expiry_date <=CONVERT(varchar, DATEADD(MONTH, 1, GETDATE()), 101) and expiry_date <> '' and status='Active' \r\n" + 
						"and file_type in ('ListA','ListB','ListC')";
				myDashboardCandList= (List<CandidateDocDto>) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(CandidateDocDto.class)).list();
			} catch (Exception e) {
				logger.info(e.getMessage(), e);
			} finally {
				session.close();
			}
			return myDashboardCandList;
		}

		@Override
		public List<CandidateDocDto> getmyDashboardCandidateContractorDocList() {
			List<CandidateDocDto>  myDashboardCandList = null;
			Session session = null;
			try {
				session = sessfact.openSession();
				String sql="select candidate_id as candidate_id,dbo.fnGetCustomeNameById(customer_id) as custName,dbo.fnGetVendorNameById(vendor_id) as venName,dbo.fnGetDocPageStatusById(candidate_id) as docStatus, dbo.fnGetEmpTypeById(candidate_id) as empType, dbo.fnGetNameByCandidateId(candidate_id) as candName, expiry_date as expirydate,file_name as fileName,file_type as fileType\r\n" + 
						"from Tbl_EmpDocuments where  expiry_date>=CONVERT(varchar, getdate(), 101) and expiry_date <=CONVERT(varchar, DATEADD(MONTH, 1, GETDATE()), 101) and expiry_date <> '' and status='Active' \r\n" + 
						"and file_type in ('cust_work_order','ven_work_order','Consultant_Compliance','Work_Authorization_Copy')";
				myDashboardCandList= (List<CandidateDocDto>) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(CandidateDocDto.class)).list();
			} catch (Exception e) {
				logger.info(e.getMessage(), e);
			} finally {
				session.close();
			}
			return myDashboardCandList;
		}

		@Override
		public List<ProjectDetailsHistoryDto> getPayrateHistoryDetailsByPayrateId(Integer payrateId) {
			List<ProjectDetailsHistoryDto>  prhistoryList = null;
			Session session = null;
			try {
				session = sessfact.openSession();
				String sql="select projecthistory_id as  phistory_id,payrate_id as  payrate_id, project_start_date as proj_startDate,project_end_date as proj_endDate,\r\n" + 
						"dbo.fnGetCustomeNameById(customer_id) as custname, dbo.fnGetVendorNameById(vendor_id) as vendorname,\r\n" + 
						"dbo.fnGetNameByEmpno(posted_by) as submittedBy,\r\n" + 
						"CONVERT(VARCHAR(10), submitted_on, 103) + ' '  + convert(VARCHAR(8), submitted_on, 14) as submittedOn from Tbl_ProjectDetailsHistory where payrate_id="+payrateId+"";
				prhistoryList= (List<ProjectDetailsHistoryDto>) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(ProjectDetailsHistoryDto.class)).list();
			} catch (Exception e) {
				logger.info(e.getMessage(), e);
			} finally {
				session.close();
			}
			return prhistoryList;
		}

		@Override
		public void saveProjectDetailsHistory(ProjectDetailsHistory projectHistoryObj) {
			Session session = null;
			try {
				session = sessfact.openSession();
				Transaction tx = session.beginTransaction();
				session.save(projectHistoryObj);
				tx.commit();
			} catch (Exception e) {
				logger.info(e.getMessage(), e);
			} finally {
				session.close();
			}
		}
		
		@Override
		public List<CustomerDto> getmyDashboardPrevCustDocList() {
			List<CustomerDto>  myDashboardCustList = null;
			Session session = null;
			try {
				session = sessfact.openSession();
				String sql="select customer_id as customer_id,expiry_date as expirydate, \r\n" + 
						"dbo.fnGetCustomeNameById(customer_id) as custName,file_name as fileName,file_type as fileType\r\n" + 
						"from Tbl_EmpDocuments where  expiry_date<=CONVERT(varchar, getdate(), 101) and expiry_date <> '' and status='Active' \r\n" + 
						"and file_type in ('Customer_MSA')";
				myDashboardCustList= (List<CustomerDto>) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(CustomerDto.class)).list();
			} catch (Exception e) {
				logger.info(e.getMessage(), e);
			} finally {
				session.close();
			}
			return myDashboardCustList;
		}

		@Override
		public List<VendorDto> getmyDashboardPrevVendDocList() {
			List<VendorDto>  myDashboardVenList = null;
			Session session = null;
			try {
				session = sessfact.openSession();
				String sql="select vendor_id as vendor_id, expiry_date as expirydate,dbo.fnGetVendorNameById(vendor_id) as venName,file_name as fileName,input_value as fileInput,file_type as fileType\r\n" + 
						"from Tbl_EmpDocuments where  expiry_date<=CONVERT(varchar, getdate(), 101) and expiry_date <> '' and status='Active' \r\n" + 
						"and file_type in ('Vendor_MSA','Business Compliance')";
				myDashboardVenList= (List<VendorDto>) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(VendorDto.class)).list();
			} catch (Exception e) {
				logger.info(e.getMessage(), e);
			} finally {
				session.close();
			}
			return myDashboardVenList;
		}

		@Override
		public List<CandidateDocDto> getmyDashboardPrevCandidateEmployeeDocList() {
			List<CandidateDocDto>  myDashboardCandList = null;
			Session session = null;
			try {
				session = sessfact.openSession();
				String sql="select candidate_id as candidate_id,dbo.fnGetDocPageStatusById(candidate_id) as docStatus, dbo.fnGetEmpTypeById(candidate_id) as empType, dbo.fnGetNameByCandidateId(candidate_id) as candName, expiry_date as expirydate,file_name as fileName,input_value as fileInput,file_type as fileType\r\n" + 
						"from Tbl_EmpDocuments where  expiry_date<=CONVERT(varchar, getdate(), 101) and expiry_date <> '' and status='Active' \r\n" + 
						"and file_type in ('ListA','ListB','ListC')";
				myDashboardCandList= (List<CandidateDocDto>) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(CandidateDocDto.class)).list();
			} catch (Exception e) {
				logger.info(e.getMessage(), e);
			} finally {
				session.close();
			}
			return myDashboardCandList;
		}

		@Override
		public List<CandidateDocDto> getmyDashboardPrevCandidateContractorDocList() {
			List<CandidateDocDto>  myDashboardCandList = null;
			Session session = null;
			try {
				session = sessfact.openSession();
				String sql="select candidate_id as candidate_id,dbo.fnGetCustomeNameById(customer_id) as custName,dbo.fnGetVendorNameById(vendor_id) as venName,dbo.fnGetDocPageStatusById(candidate_id) as docStatus, dbo.fnGetEmpTypeById(candidate_id) as empType, dbo.fnGetNameByCandidateId(candidate_id) as candName, expiry_date as expirydate,file_name as fileName,file_type as fileType\r\n" + 
						"from Tbl_EmpDocuments where  expiry_date<=CONVERT(varchar, getdate(), 101) and expiry_date <> '' and status='Active' \r\n" + 
						"and file_type in ('cust_work_order','ven_work_order','Consultant_Compliance','Work_Authorization_Copy')";
				myDashboardCandList= (List<CandidateDocDto>) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(CandidateDocDto.class)).list();
			} catch (Exception e) {
				logger.info(e.getMessage(), e);
			} finally {
				session.close();
			}
			return myDashboardCandList;
		}
		
		@Override
		public String checkSelectedFileInput(String fileInput) {
			Session session = null;
			String fname = null;
			try {
				session = sessfact.openSession();
				String sql = "select distinct input_value FROM Tbl_EmpDocuments  where input_value='" + fileInput + "' and input_value is not null";
				fname = (String) session.createSQLQuery(sql).uniqueResult();
			} catch (Exception e) {
				logger.info(e.getMessage(), e);
			} finally {
				session.close();
			}
			return fname;
		}

		@Override
		public BasicDetailsDto viewEmployeeNotWithAddress(Integer candidateId) {
			BasicDetailsDto basicObj = null;
			Session session = null;
			try {
				session = sessfact.openSession();
				String sql = "Exec getBaiscDetailsNotWithAddress @candidateId=" + candidateId + "";
				basicObj = (BasicDetailsDto) session.createSQLQuery(sql)
						.setResultTransformer(new AliasToBeanResultTransformer(BasicDetailsDto.class)).uniqueResult();
			} catch (Exception e) {
				logger.info(e.getMessage(), e);
			} finally {
				session.close();
			}
			return basicObj;
		}

		@Override
		public void saveDocumentsHistory(EmpDocumentsHistoryEntity docObj) {
			Session session = null;
			try {
				session = sessfact.openSession();
				Transaction tx = session.beginTransaction();
				session.save(docObj);
				tx.commit();
			} catch (Exception e) {
				logger.info(e.getMessage(), e);
			} finally {
				session.close();
			}
		}

		@Override
		public List<ClientVendorMaster_DTO> viewOtherLocationDetailsByCandidateId(Integer candidate_Id,
				Integer payrate_id, String emptyp) {
				List<ClientVendorMaster_DTO>  clientlist = null;
				Session session = null;
				try {
					session = sessfact.openSession();
					String sql="select cd.address_id as address_id,cd.line1 as line1,cd.line2 as line2,cd.city as city,cd.state as state,\r\n" + 
							"cd.ZipCode as zipcode,cd.metro_politan_area as metrop_area from Tbl_ClientDetails cl,Tbl_CompanyAddress cd where cl.client_id=cd.company_id \r\n" + 
							"and cl.candidate_id="+candidate_Id+" and cl.status=1 and cd.company_type='LCALocation'"
									+ " and cd.status='Active' and cl.payrate_id="+payrate_id+"";
						clientlist= (List<ClientVendorMaster_DTO>) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(ClientVendorMaster_DTO.class)).list();
						System.out.println("--viewOtherLocationDetailsByCandidateId-----------"+sql);
						/*}
						}*/
					} catch (Exception e) {
					logger.info(e.getMessage(), e);
				} finally {
					session.close();
				}
				return clientlist;
		}
		
		@Override
		public List<DocumentHistoryDto> getuserNameBycandId(Integer candidate_Id) {
			List<DocumentHistoryDto> initlist=null;
			System.out.println("getInitTypesBycandId dao--");
			Session session = null;
			try {
				session = sessfact.openSession();
				String sql="select user_name as beneficiary_Name FROM  Tbl_EmpBasicDetails  where  candidate_id="+candidate_Id+" ";
				initlist= (List<DocumentHistoryDto>) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(DocumentHistoryDto.class)).list();
			System.out.println(sql+"*");
			} catch (Exception e) {
				logger.info(e.getMessage(), e);
			} finally {
				session.close();
			}
			
			return initlist;
		}

		@Override
		public List<DocumentHistoryDto> getDocTypesByCandId(Integer candidate_Id) {
			List<DocumentHistoryDto> docList=null;
			System.out.println("getDocTypesByCandId dao--");
			Session session = null;
			try {
				session = sessfact.openSession();
		
				String sql="select distinct dbo.[fnGetH1BDocumentNameByDocTypeId](documenttype_id) as doctypename,documenttype_id as document_id \r\n" + 
						" from Tbl_CandidateH1BCheckList where  candidate_id="+candidate_Id+" ";
				docList= (List<DocumentHistoryDto>) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(DocumentHistoryDto.class)).list();
			System.out.println(sql+"*");
			} catch (Exception e) {
				logger.info(e.getMessage(), e);
			} finally {
				session.close();
			}
			
			return docList;
		}

		@Override
		public List<DocumentHistoryDto> getsubDocTypesBydocId(Integer candidate_Id, Integer docId) {
			List<DocumentHistoryDto> subdocList=null;
			System.out.println("getsubDocTypesBydocId dao--");
			Session session = null;
			try {
				session = sessfact.openSession();
			
				String sql="select distinct dbo.[fnGetImmiSubDocTypeNameById](subdoctype_id) as subdoctypename,subdoctype_id as subdocid \r\n" + 
						" from Tbl_CandidateH1BCheckList where  candidate_id="+candidate_Id+" and documenttype_id="+docId+" ";
				subdocList= (List<DocumentHistoryDto>) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(DocumentHistoryDto.class)).list();
			System.out.println(sql+"*");
			} catch (Exception e) {
				logger.info(e.getMessage(), e);
			} finally {
				session.close();
			}
			
			return subdocList;
		}

		@Override
		public List<Integer> getchecklistIds(Integer candidate_Id, Integer subdocId, Integer docId, Integer initiateid) {
			List chklistid=null;
			Session session = null;  
			System.out.println("DAOOOO"+candidate_Id+"--"+subdocId+"-"+docId);
			
			try { 
				if (subdocId==0) {
					subdocId = null;
				}
			/*	if (profileid==0) {
					
				}*/
				if (docId==0) {
					docId =null;
				}
				Integer profileid =null;
				Integer initiateId =null;
			session = sessfact.openSession();
			String sql="exec getchecklistids @candidate_id="+candidate_Id+",@subdoctype_id="+subdocId+",@profile_id="+profileid+",@documenttype_id="+docId+",@initiate_id="+initiateId+"   ";
			System.out.println("chklistid*********"+sql);
			chklistid =session.createSQLQuery(sql).list();
			}catch (Exception e) {
				logger.info(e.getMessage(),e);
			}finally {
				session.close();
				} 
			return chklistid;
		}

		@Override
		public List<DocumentHistoryDto> getFilesBychklistid(List<Integer> list) {
			List<DocumentHistoryDto> chkfile=null;
			Session session = null;  
			try { 
			session = sessfact.openSession();
			String sql="select distinct dbo.[fnGetImmiSubDocTypeNameById](documentsubtype_id) as subdoctypename,documentsubtype_id as subdocid,e.documenttype_id as document_id, dbo.fnGetNameByCandidateId(e.candidate_id) as beneficiary_Name,e.candidate_id,\r\n" + 
					"dbo.[fnGetH1BDocumentNameByDocTypeId](e.documenttype_id) as doctypename  from Tbl_EmpDocuments  e inner join Tbl_CandidateH1BCheckList c on \r\n" + 
					"e.h1b_checklist_id=c.h1b_checklist_id where e.h1b_checklist_id in("+StringUtils.join(list, ',')+")  ORDER BY doctypename ";
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
		public ClientVendorMaster_DTO getInhouseprojectdetailsbyIds(String payrate_id, Integer candidate_Id) {
			ClientVendorMaster_DTO  inhouseObj = null;
			Session session = null;
			try {
				session = sessfact.openSession();
				String sql="select p.payroll_type as payroll_type,p.project_start_date as proj_startDate,p.project_end_date as proj_endDate,\r\n" + 
						"cl.project_name as projectName,cd.address_id as address_id,cd.line1 as line1,cd.line2 as line2,cd.city as city,\r\n" + 
						"cd.state as state,cd.ZipCode as zipcode from Tbl_VendorPayRateDetails p join Tbl_ClientDetails cl on \r\n" + 
						"p.payrate_id=cl.payrate_id join Tbl_CompanyAddress cd on cd.company_id=cl.client_id where cl.client_id=cd.company_id\r\n" + 
						"and cd.company_type='In-house'  and p.payrate_id="+payrate_id+" and p.candidate_id="+candidate_Id+"";
				inhouseObj= (ClientVendorMaster_DTO) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(ClientVendorMaster_DTO.class)).uniqueResult();
					
				} catch (Exception e) {
				logger.info(e.getMessage(), e);
			} finally {
				session.close();
			}
			return inhouseObj;
		}

		@Override
		public ClientDetailsEntity getclientDetailsBypayrateId(Integer payrate_id) {
			ClientDetailsEntity clientObj = null;
			Session session = null;
			try {
				session = sessfact.openSession();
					String sql = "from ClientDetailsEntity  where payrate_id="+payrate_id+"";
					clientObj = (ClientDetailsEntity) session.createQuery(sql).uniqueResult();
			} catch (Exception e) {
				logger.info(e.getMessage(), e);
			} finally {
				session.close();
			}
			return clientObj;
		}
		
		@Override
		public List<String> getFiles(Integer candidate_Id, Integer docId, Integer subdocId, Integer initiateid,List<Integer> list) {
			List<String> chkfile=null;
			Session session = null;  
			try { 
			session = sessfact.openSession();
			String sql=" select  distinct file_name from Tbl_EmpDocuments where candidate_id="+candidate_Id+"  \r\n" + 
					"and file_type='H-1B' and documenttype_id="+docId+" and documentsubtype_id="+subdocId+" and h1b_checklist_id in("+StringUtils.join(list, ',')+") ";
			System.out.println(sql+"**chkfile");
			chkfile=session.createSQLQuery(sql).list();   
				}catch (Exception e) {
				logger.info(e.getMessage(),e);
			}finally {
				session.close();
				} 
			return chkfile;
		}

		@Override
		public Integer getCurrinitiateidBycandId(Integer candidate_Id) {
			Integer currinitid = null;
			Session session = null;
			try {
				session = sessfact.openSession();
				String sql = "select max(initiate_id) as initiate_id from Tbl_CandidateH1BCheckList where candidate_id="+candidate_Id+" ";
				currinitid = (Integer) session.createSQLQuery(sql).uniqueResult();
			} catch (Exception e) {
				logger.info(e.getMessage(), e);
			} finally {
				session.close();
			}
			return currinitid;
		}
		
		@Override
		public Integer getactiveclientListByCandidate(Integer candidate_Id,String clienttype) {
			Integer count = null;
			Session session = null;
			try {
				session = sessfact.openSession();
				String sql =null;
				if(clienttype.equalsIgnoreCase("inhouse")) {
					sql = "select count(*) as count from Tbl_VendorPayRateDetails p join  Tbl_ClientDetails c on p.payrate_id=c.payrate_id\r\n" + 
							"where p.status='Active' and c.status=1 and c.client_name is null and p.candidate_id="+candidate_Id+"";
				}else {
					sql = "select count(*) as count from Tbl_VendorPayRateDetails p join  Tbl_ClientDetails c on p.payrate_id=c.payrate_id\r\n" + 
							"where p.status='Active' and c.status=1 and c.client_name is not null and p.candidate_id="+candidate_Id+"";
				}
			
				count = (Integer) session.createSQLQuery(sql).uniqueResult();
				
			} catch (Exception e) {
				logger.info(e.getMessage(), e);
			} finally {
				session.close();
			}
			return count;
		}

		@Override
		public List<DocumentHistoryDto> getDocumentHistiryById(Integer doc_Id) {
			List<DocumentHistoryDto>  docHistoryList = null;
			Session session = null;
			try {
				session = sessfact.openSession();
				String sql="select documenthistory_id as document_id,file_name as file_name,file_type as filetype,ISNULL(from_date,'') as startdate,ISNULL(expiry_date,'') as expirydate,CONVERT(VARCHAR(10), submitted_date, 103) + ' '  + convert(VARCHAR(8), submitted_date, 14) as submit_date,input_value as inputval,status as docStatus,dbo.fnGetNameByEmpno(posted_by) as posted_by from Tbl_EmpDocumentshistory  where document_id="+doc_Id+" order by document_id desc";
				docHistoryList= (List<DocumentHistoryDto>) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(DocumentHistoryDto.class)).list();
			} catch (Exception e) {
				logger.info(e.getMessage(), e);
			} finally {
				session.close();
			}
			return docHistoryList;
	  }

		@Override
		public ClientVendorMaster_DTO getPayRateDetailsByCandidateId(Integer candidate_id, Integer payrateid) {
			ClientVendorMaster_DTO  endClient = null;
			Session session = null;
			try {
				session = sessfact.openSession();
				String sql="select pt.payrate_id as payrate_id,cm.customer_id as custid,cm.customer_name as custname,"
						+ "cm.customer_address as custAddress,"
						+ "pt.bill_rate as billrate,pt.project_start_date as proj_startDate,pt.project_end_date as proj_endDate,"
						+ "pt.invoice_terms as invoiceterms,pt.payroll_type as payroll_type,pt.project_status as project_status"
						+ " from Tbl_VendorPayRateDetails pt,Tbl_CustomerMaster cm where cm.customer_id=pt.customer_id "
						+ "and pt.candidate_id="+candidate_id+" and pt.payrate_id="+payrateid+" and pt.Status='Active'";
			//	String sql="select * from Tbl_VendorPayRateDetails where candidate_id="+candidate_id+" and Status='Active' and p.customer_id="+customer_id+"";
						endClient= (ClientVendorMaster_DTO) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(ClientVendorMaster_DTO.class)).uniqueResult();
			} catch (Exception e) {
				logger.info(e.getMessage(), e);
			} finally {
				session.close();
			}
			return endClient;
		}

		@Override
		public CustomerMasterEntity getCustomerDetailsByName(String customer_name) {
			CustomerMasterEntity custObj = null;
			Session session = null;
			try {
				session = sessfact.openSession();
				String sql = "from CustomerMasterEntity  where customer_name='" + customer_name + "'";
				custObj = (CustomerMasterEntity) session.createQuery(sql).uniqueResult();

			} catch (Exception e) {
				logger.info(e.getMessage(), e);
			} finally {
				session.close();
			}
			return custObj;
		}

		@Override
		public Integer saveProductServices(ProductsEntity psObj) {
			Session session = null;
			Integer productId = null;
			try {
				session = sessfact.openSession();
				Transaction tx = session.beginTransaction();
				productId = (Integer) session.save(psObj);
				tx.commit();
			} catch (Exception e) {
				logger.info(e.getMessage(), e);
			} finally {
				session.close();
			}
			return productId;
		}

		@Override
		public ProductsEntity getProductServicesById(Integer product_Id) {
			ProductsEntity custObj = null;
			Session session = null;
			try {
				session = sessfact.openSession();
				String sql = "from ProductsEntity  where product_id=" + product_Id + "";
				custObj = (ProductsEntity) session.createQuery(sql).uniqueResult();
			} catch (Exception e) {
				logger.info(e.getMessage(), e);
			} finally {
				session.close();
			}
			return custObj;
		}

		@Override
		public void updateProductServices(ProductsEntity prodDBObj) {
			Session session = null;
			try {
				session = sessfact.openSession();
				Transaction tx = session.beginTransaction();
				session.update(prodDBObj);
				tx.commit();
			} catch (Exception e) {
				logger.info(e.getMessage(), e);
			} finally {
				session.close();
			}
		}
		
		@Override
		public ProductsEntity getProductServicesByPayRateId(Integer payrate_id) {
			ProductsEntity custObj = null;
			Session session = null;
			try {
				session = sessfact.openSession();
				String sql = "from ProductsEntity  where payrate_id=" + payrate_id + " and status='Active'";
				custObj = (ProductsEntity) session.createQuery(sql).uniqueResult();
			} catch (Exception e) {
				logger.info(e.getMessage(), e);
			} finally {
				session.close();
			}
			return custObj;
		}

		@Override
		public ProductsEntity getProductServicesByPayrateId(Integer payrateId) {
			ProductsEntity custObj = null;
			Session session = null;
			try {
				session = sessfact.openSession();
				String sql = "from ProductsEntity  where payrate_id=" + payrateId + " and status='Active'";
				custObj = (ProductsEntity) session.createQuery(sql).uniqueResult();
			} catch (Exception e) {
				logger.info(e.getMessage(), e);
			} finally {
				session.close();
			}
			return custObj;
		}
		
		@Override
		public ProductsEntity getProductServicesByQbId(Integer qbproduct_Id) {
			ProductsEntity custObj = null;
			Session session = null;
			try {
				session = sessfact.openSession();
				String sql = "from ProductsEntity  where qb_productid=" + qbproduct_Id + " and status='Active'";
				custObj = (ProductsEntity) session.createQuery(sql).uniqueResult();
			} catch (Exception e) {
				logger.info(e.getMessage(), e);
			} finally {
				session.close();
			}
			return custObj;
		}

		@Override
		public EmpBasicDetailsEntity getEmployeeDetailsByMailnDoB(String dobDate, String mail) {
			EmpBasicDetailsEntity basicObj = null;
			Session session = null;
			try {
				String sql =null;
				session = sessfact.openSession();
				if(dobDate!=null) {
					sql = "from EmpBasicDetailsEntity  where dob='"+dobDate+"' and email='"+mail+"'";
				}else {
					sql = "from EmpBasicDetailsEntity  where email='"+mail+"'";
				}
				basicObj = (EmpBasicDetailsEntity) session.createQuery(sql).uniqueResult();
			} catch (Exception e) {
				logger.info(e.getMessage(), e);
			} finally {
				session.close();
			}
			return basicObj;
		}
}
