package com.tekskills.DaoImpl;

import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.transform.AliasToBeanResultTransformer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.tekskills.Dao.StatusReportDao;
import com.tekskills.Dto.StatusReportDto;
import com.tekskills.Entity.StatusReportEntity;
import com.tekskills.Entity.StatusReportTemplateEntity;

@Repository
public class StatusReportDaoImpl implements StatusReportDao {
	private static final Logger logger = Logger.getLogger(StatusReportDaoImpl.class);
	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory sessfact;

	@Override
	public List<StatusReportTemplateEntity> getTemplateList() {
		List<StatusReportTemplateEntity> templateList = null;
		Session session = null;
		try {
			session = sessfact.openSession();
			String sql = "from StatusReportTemplateEntity";
			templateList = (List<StatusReportTemplateEntity>) session.createQuery(sql).list();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return templateList;
	}

	@Override
	public Integer saveStatusTemplate(StatusReportTemplateEntity reportObj) {
		Session session = null;
		Integer statusid = null;
		try {
			session = sessfact.openSession();
			statusid = (Integer) session.save(reportObj);
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return statusid;
	}

	@Override
	public StatusReportDto checkTemplateByMonth(int yearid, String month) {
		StatusReportDto basicObj = null;
		Session session = null;
		try {
			session = sessfact.openSession();
			//select distinct year,month from Tbl_StatusReportTemplate where year='2020' and month='February'
			String sql = "select distinct year,month from Tbl_StatusReportTemplate where year=" + yearid + " and month='" + month + "'";
			basicObj = (StatusReportDto) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(StatusReportDto.class)).uniqueResult();

		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return basicObj;
	}

	@Override
	public List<StatusReportDto> getPeningReportsByCandidateId(int candidateid,Integer payrateId,String emptype) {
		List<StatusReportDto> reportList = null;
		Session session = null;
		try {String sql =null;
			session = sessfact.openSession();
			if(payrateId!=null) {
				 sql = "SELECT FIRST_VALUE(t.template_id) OVER (ORDER BY t.template_id ASC) AS toprecord,t.template_id,t.month,t.year,t.period,t.period_name from Tbl_StatusReportTemplate t where from_date<getdate() and NOT EXISTS (SELECT * FROM Tbl_EmpStatusReports r WHERE r.month = t.month and r.period_name = t.period_name and r.candidate_id="+candidateid+") and (t.from_date between (select project_start_date from Tbl_VendorPayRateDetails where candidate_id="+candidateid+" and status='Active' and payrate_id="+payrateId+") and (select project_end_date from Tbl_VendorPayRateDetails where candidate_id="+candidateid+" and status='Active' and payrate_id="+payrateId+") or  t.to_date between (select project_start_date from Tbl_VendorPayRateDetails where candidate_id="+candidateid+" and status='Active' and payrate_id="+payrateId+") and (select project_end_date from Tbl_VendorPayRateDetails where candidate_id="+candidateid+" and status='Active' and payrate_id="+payrateId+"))";
			}else {
				 sql = "SELECT FIRST_VALUE(t.template_id) OVER (ORDER BY t.template_id ASC) AS toprecord,t.template_id,t.month,t.year,t.period,t.period_name from Tbl_StatusReportTemplate t where from_date<getdate() and NOT EXISTS (SELECT * FROM Tbl_EmpStatusReports r WHERE r.month = t.month and r.period_name = t.period_name and r.candidate_id="+candidateid+") and (t.from_date between (select joining_date from Tbl_CandidateDetailedInfo d where candidate_id="+candidateid+" and status='Active') and getDate() or  t.to_date between (select joining_date from Tbl_CandidateDetailedInfo d where candidate_id="+candidateid+" and status='Active') and getDate())";
				
			}
			reportList = (List<StatusReportDto>) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(StatusReportDto.class)).list();

		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return reportList;
	}

	@Override
	public List<StatusReportDto> checkTemplateByMonthYear(int year, String month,String periodname) {
		List<StatusReportDto> statusList = null;
		Session session = null;
		try {String sql =null;
			session = sessfact.openSession();
			if(periodname!=null) {
				 sql = "select * from Tbl_StatusReportTemplate where year=" + year + " and month='" + month + "' and period_name='"+periodname+"'";
			}else {
				 sql = "select * from Tbl_StatusReportTemplate where year=" + year + " and month='" + month + "'";
			}
			statusList = (List<StatusReportDto>) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(StatusReportDto.class)).uniqueResult();

		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return statusList;
	}

	@Override
	public List<String> getPeriodListByMMYY(int yearid, String month) {
		List<String> periodList = null;
		Session session = null;
		try {String sql =null;
			session = sessfact.openSession();
				 sql = "select period from Tbl_StatusReportTemplate where year=" + yearid + " and month='" + month + "'";
				 periodList = session.createSQLQuery(sql).list();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return periodList;
	}

	@Override
	public List<StatusReportDto> getReports(int yearid, String month, String period, String status, Integer role, Integer candidateId,String lgemptype, int custType) {
		List<StatusReportDto> periodList = null;
		Session session = null;
		try {String sql =null;
			session = sessfact.openSession();
			/*if(lgemptype.equalsIgnoreCase("Admin")) {
				Integer canid=0;
				sql = "Exec getStatusReports @year="+yearid+",@month='"+month+"',@period='"+period+"',@status='"+status+"',@candidate_id="+canid+"";
			}else {*/
				
				sql = "Exec getStatusReports @year="+yearid+",@month='"+month+"',@period='"+period+"',@status='"+status+"',@candidate_id="+candidateId+",@payrateid="+custType+"";
			//}
				 
				 periodList = (List<StatusReportDto>) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(StatusReportDto.class)).list();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return periodList;
	}

	@Override
	public StatusReportDto getCanProjectDetailsById(int candidateId,int payrateId) {
		StatusReportDto candiObj = null;
		Session session = null;
		try {String sql =null;
			session = sessfact.openSession();
				sql="select b.full_name as fullname,dbo.[fnGetClientNameById](c.payrate_id) as clientName,dbo.[fnGetClientAddressById](b.candidate_id) as clientAddress,c.project_name as projectName from Tbl_VendorPayRateDetails v join Tbl_ClientDetails c on v.payrate_id=c.payrate_id join Tbl_EmpBasicDetails b on b.candidate_id=v.candidate_id and v.status='Active' and v.payrate_id="+payrateId+" and c.status=1 and c.client_type='EndClient'";
				 //sql = "Exec getCanProjectDetailsById @candidateid="+candidateId+"";
				 candiObj = (StatusReportDto) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(StatusReportDto.class)).uniqueResult();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return candiObj;
	}

	@Override
	public Integer savereport(StatusReportEntity reportObj) {
		Session session = null;
		Integer statusid = null;
		try {
			session = sessfact.openSession();
			statusid = (Integer) session.save(reportObj);
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return statusid;
	}

	@Override
	public StatusReportDto getCanStusDetailsById(int candidateId,int statusreportid ) {
		StatusReportDto candiObj = null;
		Session session = null;
		try {String sql =null;
			session = sessfact.openSession();
				 sql = "Exec getCanStatusDetailsByCanId @candidateid="+candidateId+",@statusreportid="+statusreportid+"";
				 candiObj = (StatusReportDto) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(StatusReportDto.class)).uniqueResult();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return candiObj;
	}

	@Override
	public StatusReportEntity getStatusDeailsByStatusId(int statureportId) {
		StatusReportEntity statusObj = null;
		Session session = null;
		try {
			session = sessfact.openSession();
			//select distinct year,month from Tbl_StatusReportTemplate where year='2020' and month='February'
			String sql = "from StatusReportEntity where status_report_id=" + statureportId + "";
			statusObj = (StatusReportEntity) session.createQuery(sql).uniqueResult();

		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return statusObj;
	}

	@Override
	public void updateStatus(StatusReportEntity reportObj) {
		Session session = null;
		try {
			session = sessfact.openSession();
			Transaction tx = session.beginTransaction();
			 session.update(reportObj);
			 tx.commit();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return ;
	}

	@Override
	public List<StatusReportTemplateEntity> getTemplateListByYear(Integer yr) {
		List<StatusReportTemplateEntity> templateList = null;
		Session session = null;
		try {
			session = sessfact.openSession();
			String sql = "from StatusReportTemplateEntity where year="+yr+"";
			templateList = (List<StatusReportTemplateEntity>) session.createQuery(sql).list();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return templateList;
	}

	@Override
	public List<StatusReportDto> getAllStatusReports(int yearid, String month, String period, String status,
			Integer role, Integer candidateId, String lgemptype,int custType) {
		List<StatusReportDto> periodList = null;
		Session session = null;
		try {String sql =null;
			session = sessfact.openSession();
				Integer canid=0;
				sql = "Exec getStatusReports @year="+yearid+",@month='"+month+"',@period='"+period+"',@status='"+status+"',@candidate_id="+canid+",@payrateid="+custType+"";
				 periodList = (List<StatusReportDto>) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(StatusReportDto.class)).list();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return periodList;
	}

	

}
