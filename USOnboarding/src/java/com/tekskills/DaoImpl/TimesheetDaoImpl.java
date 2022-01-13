package com.tekskills.DaoImpl;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.transform.AliasToBeanResultTransformer;
import org.hibernate.type.TimestampType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.tekskills.Dao.TimesheetDao;
import com.tekskills.Dto.BasicDetailsDto;
import com.tekskills.Dto.ClientVendorMaster_DTO;
import com.tekskills.Dto.DocumentHistoryDto;
import com.tekskills.Dto.InvoiceDto;
import com.tekskills.Dto.ManagerDto;
import com.tekskills.Dto.TimesheetDto;
import com.tekskills.Entity.BiWeeklyTemplateEntity1;
import com.tekskills.Entity.BiWeeklyTemplateEntity2;
import com.tekskills.Entity.EmpPayRateDetails;
import com.tekskills.Entity.LeaveAttachmentsEntity;
import com.tekskills.Entity.MailReminderCountEntity;
import com.tekskills.Entity.MonthlyTemplateEntity;
import com.tekskills.Entity.SemiMonthlyTemplateEntity;
import com.tekskills.Entity.StatusReportTemplateEntity;
import com.tekskills.Entity.TimesheetDetailsEntity;
import com.tekskills.Entity.TimesheetEntity;
import com.tekskills.Entity.WeeklyTemplateEntity;

@Repository
public class TimesheetDaoImpl implements TimesheetDao {
	private static final Logger logger = Logger.getLogger(TimesheetDaoImpl.class);
	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory sessfact;
	@Override
	public Integer saveBiWeeklyTimesheet(SemiMonthlyTemplateEntity biweeklyObj) {
		Session session = null;
		Integer biweeklyId = null;
		try {
			session = sessfact.openSession();
			biweeklyId = (Integer) session.save(biweeklyObj);
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return biweeklyId;
	}
	@Override
	public Integer saveWeeklyTimesheet(WeeklyTemplateEntity weeklyObj) {
		Session session = null;
		Integer weeklyId = null;
		try {
			session = sessfact.openSession();
			weeklyId = (Integer) session.save(weeklyObj);
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return weeklyId;
	}
	@Override
	public TimesheetDto checkBiweeklyTemplateByMonthYear(int yearid, String month) {
		TimesheetDto basicObj = null;
		Session session = null;
		try {
			session = sessfact.openSession();
			String sql = "select distinct year,month from Tbl_SemiMonthlyTemplate where year=" + yearid + " and month='" + month + "'";
			basicObj = (TimesheetDto) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(TimesheetDto.class)).uniqueResult();

		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return basicObj;
	}
	@Override
	public TimesheetDto checkweeklyTemplateByMonthYear(int yearid, String month) {
		TimesheetDto basicObj = null;
		Session session = null;
		try {
			session = sessfact.openSession();
			String sql = "select distinct year,month from Tbl_WeeklyTemplate where year=" + yearid + " and month='" + month + "'";
			basicObj = (TimesheetDto) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(TimesheetDto.class)).uniqueResult();

		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return basicObj;
	}
	@Override
	public Integer checktstemplate(int yearid) {
		Integer yr = null;
		Session session = null;
		try {
			session = sessfact.openSession();
			String sql = "select distinct year from Tbl_WeeklyTemplate where year=" + yearid + "";
			yr = (Integer) session.createSQLQuery(sql).uniqueResult();

		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return yr;
	}
	@Override
	public List<TimesheetDto> getPeningTimesheetByCandidateId(Integer candidateId,String payrollType, String emptype, int payrateid) {
		List<TimesheetDto> timesheetList = null;
		Session session = null;
		try {
			String sql =null;
			session = sessfact.openSession();
			if(emptype.equalsIgnoreCase("W2 Admin") && payrollType!=null) {
				if(payrollType.equalsIgnoreCase("Weekly")) {
					sql = " Exec getWeeklyPendingTimesheetByCanId @candidateid="+candidateId+",@payrateid=0,@emptype='"+emptype+"'";
				}
				else if(payrollType.equalsIgnoreCase("Semi-Monthly")) {
					sql = " Exec getSemimonthPendingTSByCanId @candidateid="+candidateId+",@payrateid=0,@emptype='"+emptype+"'";
				}
				else if(payrollType.equalsIgnoreCase("Monthly")) {
					sql = " Exec getMonthlyPendingTSByCanId @candidateid="+candidateId+",@payrateid=0,@emptype='"+emptype+"'";
				}
				else if(payrollType.equalsIgnoreCase("Bi-Weekly1")) {
					sql = " Exec getBiweekly_1PendingTSByCanId @candidateid="+candidateId+",@payrateid=0,@emptype='"+emptype+"'";
				}
				else if(payrollType.equalsIgnoreCase("Bi-Weekly2")) {
					sql = " Exec getBiweekly_2PendingTSByCanId @candidateid="+candidateId+",@payrateid=0,@emptype='"+emptype+"'";
				}
				
			}else {
				System.out.println("-------payrateid---------"+payrateid+"......"+payrollType+"========="+emptype);
				if(payrollType!=null) {
				if(payrollType.equalsIgnoreCase("Weekly")) {
					sql = " Exec getWeeklyPendingTimesheetByCanId @candidateid="+candidateId+",@payrateid="+payrateid+",@emptype='"+emptype+"'";
				}
				else if(payrollType.equalsIgnoreCase("Semi-Monthly")) {
					sql = " Exec getSemimonthPendingTSByCanId @candidateid="+candidateId+",@payrateid="+payrateid+",@emptype='"+emptype+"'";
				}
				else if(payrollType.equalsIgnoreCase("Monthly")) {
					sql = " Exec getMonthlyPendingTSByCanId @candidateid="+candidateId+",@payrateid="+payrateid+",@emptype='"+emptype+"'";
				}
				else if(payrollType.equalsIgnoreCase("Bi-Weekly1")) {
					sql = " Exec getBiweekly_1PendingTSByCanId @candidateid="+candidateId+",@payrateid="+payrateid+",@emptype='"+emptype+"'";
				}
				else if(payrollType.equalsIgnoreCase("Bi-Weekly2")) {
					sql = " Exec getBiweekly_2PendingTSByCanId @candidateid="+candidateId+",@payrateid="+payrateid+",@emptype='"+emptype+"'";
				}
			  }else {
				  
			  }
			}
			timesheetList = (List<TimesheetDto>) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(TimesheetDto.class)).list();

		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return timesheetList;
	}
	@Override
	public TimesheetDto getDetailsByweekId(int week_id, String payrollType) {
		TimesheetDto weekObj = null;
		Session session = null;
		try {
			String sql =null;
			session = sessfact.openSession();
		/*select week_id,year,month,weeks,week_fromdate,week_todate from Tbl_WeeklyTemplate  where week_id=
		select template_id,year,month,from_date,to_date from Tbl_StatusReportTemplate  where template_id=1
		select month_id,year,month,month_no,payroll_fromdate,payroll_todate from Tbl_MonthlyTemplate  where month_id=1
		select biweek_id,year,month,weeks,week_fromdate,week_todate from Tbl_BiWeeklyTemplate1  where biweek_id=1
		select biweek_id,year,month,weeks,week_fromdate,week_todate from Tbl_BiWeeklyTemplate2  where biweek_id=1*/
			if(payrollType.equalsIgnoreCase("Weekly")) {
				
			 sql = "select week_id,year,month,weeks,week_fromdate as week_fromdate,week_todate as week_todate from Tbl_WeeklyTemplate  where week_id=" + week_id + "";
			}
			else if(payrollType.equalsIgnoreCase("Semi-Monthly")) {
				
				sql = "select template_id,year,month,period_name,convert(varchar(15),from_date,101) as week_fromdate,convert(varchar(15),to_date,101) as week_todate from Tbl_StatusReportTemplate  where template_id=" + week_id + "";
			}
			else if(payrollType.equalsIgnoreCase("Monthly")) {
				
				sql = "select month_id,year,month,month_no,payroll_fromdate as week_fromdate,payroll_todate as week_todate from Tbl_MonthlyTemplate  where month_id=" + week_id + "";
			}
			else if(payrollType.equalsIgnoreCase("Bi-Weekly1")) {
				
				sql = "select biweek_id,year,month,weeks,week_fromdate as week_fromdate ,week_todate as week_todate from Tbl_BiWeeklyTemplate1  where biweek_id=" + week_id + "";
			}
			else if(payrollType.equalsIgnoreCase("Bi-Weekly2")) {
				
				sql = "select biweek_id,year,month,weeks,week_fromdate as week_fromdate,week_todate as week_todate from Tbl_BiWeeklyTemplate2  where biweek_id=" + week_id + "";
			}
			
			weekObj=(TimesheetDto) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(TimesheetDto.class)).uniqueResult();

		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return weekObj;
	}
	@Override
	public Integer savetimesheet(TimesheetEntity timesheetObj) {
		Session session = null;
		Integer timesheetId = null;
		try {
			session = sessfact.openSession();
			timesheetId = (Integer) session.save(timesheetObj);
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return timesheetId;
		
	}
	@Override
	public void saveDetailedTimeheet(TimesheetDetailsEntity tsDetailsObj) {
		Session session = null;
		try {
			session = sessfact.openSession();
			session.save(tsDetailsObj);
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		
	}
	@Override
	public void saveLeaveAttachements(LeaveAttachmentsEntity leaveObj) {
		Session session = null;
		try {
			session = sessfact.openSession();
			session.save(leaveObj);
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
	}
	@Override
	public List<TimesheetDto> getViewTimesheet(int yearid, String status, Integer role, Integer candidateId,
			String lgemptype,String month,int customerid) {
		List<TimesheetDto> periodList = null;
		Session session = null;
		try {String sql =null;
			session = sessfact.openSession();
			//if(role == 2 || role == 4 || role == 5) {
				Integer canid=0;
				sql = "Exec getTimesheetDetails @year="+yearid+",@status='"+status+"',@candidate_id="+canid+",@empType='W2 Admin',@role="+role+",@month='"+month+"',@customerid="+customerid+" ";
			/*}else {
				sql = "Exec getTimesheetDetails @year="+yearid+",@status='"+status+"',@candidate_id="+candidateId+"";
			}*/
				 
				 periodList = (List<TimesheetDto>) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(TimesheetDto.class)).list();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return periodList;
	}
	
	@Override
	public List<TimesheetDto> getPendingViewTimesheet(int yearid, String status, Integer role, Integer candidateId,
			String lgemptype,String month,int customerid) {
		List<TimesheetDto> periodList = null;
		Session session = null;
		try {String sql =null;
			session = sessfact.openSession();
			//if(role == 2 || role == 4 || role == 5) {
				//sql = "Exec getPendingTimesheetDetails @year="+yearid+",@status='"+status+"',@candidate_id="+canid+",@empType='"+lgemptype+"',@role="+role+",@month='"+month+"',@customerid="+customerid+" ";
			/*}else {
				sql = "Exec getTimesheetDetails @year="+yearid+",@status='"+status+"',@candidate_id="+candidateId+"";
			}*/
				if(lgemptype.equalsIgnoreCase("W2 Admin") || lgemptype.equalsIgnoreCase("Admin")) {
					if(role == 2 || role == 1 || role == 5) {
						sql = "Exec getPendingTimesheetDetails @year="+yearid+",@status='"+status+"',@candidate_id="+candidateId+",@empType='W2 Admin',@role="+role+",@month='"+month+"',@customerid="+customerid+" ";
					}else {
						Integer canid=0;
						sql = "Exec getPendingTimesheetDetails @year="+yearid+",@status='"+status+"',@candidate_id="+canid+",@empType='W2 Admin',@role="+role+",@month='"+month+"',@customerid="+customerid+" ";
					
					}
					}else {
					sql = "Exec getPendingTimesheetDetails @year="+yearid+",@status='"+status+"',@candidate_id="+candidateId+",@empType='"+lgemptype+"',@role="+role+",@month='"+month+"',@customerid="+customerid+" ";
				  }
				 periodList = (List<TimesheetDto>) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(TimesheetDto.class)).list();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return periodList;
	}
	
	@Override
	public TimesheetEntity getTimesheetDetailsById(int candidateId, int timesheetId) {
		TimesheetEntity tsObj = null;
		Session session = null;
		try {
			session = sessfact.openSession();
			String sql = "from TimesheetEntity  where timesheet_id=" + timesheetId + " and candidate_id="+candidateId+"";
			tsObj=(TimesheetEntity) session.createQuery(sql).uniqueResult();

		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return tsObj;
	}
	@Override
	public List<TimesheetDetailsEntity> getDetailedTimesheetListById(int candidateId, int timesheetId) {
		List<TimesheetDetailsEntity> tsDtailedList = null;
		Session session = null;
		try {
			session = sessfact.openSession();
			String sql = "from TimesheetDetailsEntity  where timesheet_id=" + timesheetId + " and candidate_id="+candidateId+"";
			tsDtailedList=(List<TimesheetDetailsEntity>) session.createQuery(sql).list();

		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return tsDtailedList;
	}
	@Override
	public List<LeaveAttachmentsEntity> getLeaveAttachmentsById(int candidateId, int timesheetId) {
		List<LeaveAttachmentsEntity> leaveList = null;
		Session session = null;
		try {
			session = sessfact.openSession();
			String sql = "from LeaveAttachmentsEntity  where timesheet_id=" + timesheetId + " and candidate_id="+candidateId+"";
			leaveList=(List<LeaveAttachmentsEntity>) session.createQuery(sql).list();

		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return leaveList;
	}
	@Override
	public String deleteDocumentByDocId(Integer id) {
		String msg = null;
		Session session = null;
		try {
			session = sessfact.openSession();
			Transaction tx = session.beginTransaction();
			LeaveAttachmentsEntity docidObj = (LeaveAttachmentsEntity) session.get(LeaveAttachmentsEntity.class, id);
			if (docidObj != null) {
				docidObj.setLeaves_id(id);
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
	public void updateTimesheet(TimesheetEntity timesheetObj) {
		Session session = null;
		try {
			session = sessfact.openSession();
			Transaction tx = session.beginTransaction();
			 session.update(timesheetObj);
			 tx.commit();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return ;
	}
	@Override
	public void updateDetailedTimesheet(TimesheetDetailsEntity tsDetailsObj) {
		Session session = null;
		try {
			session = sessfact.openSession();
			Transaction tx = session.beginTransaction();
			 session.update(tsDetailsObj);
			 tx.commit();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return ;
		
	}
	@Override
	public List<TimesheetDto> getWeeklyTimesheetByYear(Integer yr) {
		List<TimesheetDto> timesheetList = null;
		Session session = null;
		try {
			session = sessfact.openSession();
			String sql = "SELECT year as year,month as month,week_fromdate as fromdate,week_todate as todate from Tbl_WeeklyTemplate where year="+yr+"";
			timesheetList = (List<TimesheetDto>) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(TimesheetDto.class)).list();

		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return timesheetList;
	}
	@Override
	public List<TimesheetDto> getMyTimesheet(int yearid, String status, Integer role, Integer candidateId,
			String lgemptype,String month,int customerid) {
		List<TimesheetDto> periodList = null;
		Session session = null;
		try {
			session = sessfact.openSession();
			String sql = "Exec getMyTimesheetDetails @year="+yearid+",@status='"+status+"',@candidate_id="+candidateId+",@month='"+month+"',@payrateid="+customerid+"";
				 periodList = (List<TimesheetDto>) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(TimesheetDto.class)).list();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return periodList;
	}
	@Override
	public Integer saveMonthlyTemplate(MonthlyTemplateEntity monthObj) {
		Session session = null;
		Integer weeklyId = null;
		try {
			session = sessfact.openSession();
			weeklyId = (Integer) session.save(monthObj);
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return weeklyId;
	}
	@Override
	public Integer saveBiWeeklyTimesheet1(BiWeeklyTemplateEntity1 biweeklyObj) {
		Session session = null;
		Integer weeklyId = null;
		try {
			session = sessfact.openSession();
			weeklyId = (Integer) session.save(biweeklyObj);
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return weeklyId;
	}
	@Override
	public Integer saveBiWeeklyTimesheet2(BiWeeklyTemplateEntity2 biweeklyObj) {
		Session session = null;
		Integer weeklyId = null;
		try {
			session = sessfact.openSession();
			weeklyId = (Integer) session.save(biweeklyObj);
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return weeklyId;
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
	public List<TimesheetDto> getMonthlyTemplate(Integer yr) {
		List<TimesheetDto> monthList = null;
		Session session = null;
		try {
			session = sessfact.openSession();
			String sql = "select year as year,month as month,payroll_fromdate as fromdate,payroll_todate as todate  from Tbl_MonthlyTemplate where year="+yr+"";
			monthList = session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(TimesheetDto.class)).list();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return monthList;
	}
	@Override
	public List<TimesheetDto> getBiweeklyTemplate_1(Integer yr) {
		List<TimesheetDto> monthList = null;
		Session session = null;
		try {
			session = sessfact.openSession();
			String sql = "select year as year,month as month,week_fromdate as fromdate,week_todate as todate from Tbl_BiWeeklyTemplate1 where year="+yr+"";
			monthList = session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(TimesheetDto.class)).list();
		
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return monthList;
	}
	@Override
	public List<TimesheetDto> getBiweeklyTemplate_2(Integer yr) {
		List<TimesheetDto> monthList = null;
		Session session = null;
		try {
			session = sessfact.openSession();
			String sql = "select year as year,month as month,week_fromdate as fromdate,week_todate as todate from Tbl_BiWeeklyTemplate2 where year="+yr+"";
			monthList = session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(TimesheetDto.class)).list();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return monthList;
	}
	@Override
	public EmpPayRateDetails getEmpPayrateDetailsByCandidateId(Integer candidateId,String emptype,Integer payrateId) {
		Session session = null;EmpPayRateDetails payrateObj = null;
		try {
			session = sessfact.openSession();
			String sql =null;
			if(payrateId!=null) {
				 sql = "from EmpPayRateDetails  where payrate_id=" + payrateId + " and Status='Active'";	
			}else {
				 sql = "from EmpPayRateDetails  where candidate_id=" + candidateId + " and Status='Active'";
			}
			payrateObj = (EmpPayRateDetails) session.createQuery(sql).uniqueResult();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {session.close();
		}return payrateObj;
	}
	@Override
	public List<ClientVendorMaster_DTO> getEmpPayrateListByCandidateId(Integer candidateId, String emptype) {
		Session session = null;List<ClientVendorMaster_DTO> payrateList = null;
		try {
			session = sessfact.openSession();
			/*String sql="select p.payrate_id as payrate_id,c.customer_id as custid ,c.customer_name as custname, p.candidate_id as candidate_id,p.payroll_type as payroll_type from Tbl_CustomerMaster c join "
					+ "Tbl_VendorPayRateDetails p on c.customer_id=p.customer_id where  p.status='Active' "
					+ "and p.candidate_id="+candidateId+"";*/
	   String sql = "select p.payrate_id as payrate_id,p.customer_id as custid ,dbo.fnGetCustomeNameById(p.customer_id) as custname, p.candidate_id as candidate_id,p.payroll_type as payroll_type from  Tbl_VendorPayRateDetails p where  p.status='Active' and p.candidate_id=" + candidateId + "";
			//payrateList = (List<EmpPayRateDetails>) session.createSQLQuery(sql).list();
			payrateList =session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(ClientVendorMaster_DTO.class)).list();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {session.close();
		}return payrateList;
	}
	@Override
	public String getCustomerNameByPayrateId(Integer payrate_id) {
		Session session = null;String payrateObj = null;
		try {
			session = sessfact.openSession();
			
			String sql="select c.customer_name from Tbl_VendorPayRateDetails v join Tbl_CustomerMaster c on v.customer_id=c.customer_id where v.payrate_id="+payrate_id+" and v.status='Active'";
			payrateObj = (String) session.createSQLQuery(sql).uniqueResult();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {session.close();
		}return payrateObj;
	}
	
	@Override
	public Integer saveTSmailreminder(MailReminderCountEntity mailObj) {
		Session session = null;
		Integer reminderid = null;
		try {
			session = sessfact.openSession();
			reminderid = (Integer) session.save(mailObj);
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return reminderid;
	}
	/*@Override
	public Integer gettimsheetIdByDetails(Integer candidate_id, String fdate, String tdate) {
		Integer timesheet_id = null;
		Session session = null;
		try {
			session = sessfact.openSession();
			String sql = "select timesheet_id from Tbl_Timesheet where candidate_id=" + candidate_id + " and from_date='"+fdate+"' and to_date='"+tdate+"'";
			timesheet_id = (Integer) session.createSQLQuery(sql).uniqueResult();

		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return timesheet_id;
	}*/
	@Override
	public List<TimesheetDto> getmailhistory(Integer candidate_id, String fdate, String tdate) {
		List<TimesheetDto> reminderList = null;
		Session session = null;
		try {String sql =null;
			session = sessfact.openSession();
				sql = "select from_date as week_fromdate, to_date as week_todate,convert(varchar, submitted_on, 9) as dates from Tbl_TimeSheetMailReminderCount where candidate_id="+candidate_id+" and from_date='"+fdate+"' and to_date='"+tdate+"'";
				reminderList =session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(TimesheetDto.class)).list(); 
						
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return reminderList;
	}
	@Override
	public List<BasicDetailsDto> getCandidateList() {
		List<BasicDetailsDto> candidateList = null;
		Session session = null;
		try {String sql =null;
			session = sessfact.openSession();
				//sql = "select candidate_id as candidate_id,dbo.fnGetNameByCandidateId(candidate_id) as fullname from Tbl_CandidateDetailedInfo where emp_type='W2' and status='Active' and work_authorization='H-1B' order by dbo.fnGetNameByCandidateId(candidate_id) asc";
			sql = "select candidate_id as candidate_id,dbo.fnGetNameByCandidateId(candidate_id) as fullname, \r\n" + 
					"emp_type as emp_type, work_authorization as workAuth\r\n" + 
					"from Tbl_CandidateDetailedInfo where emp_type in ('W2') and status='Active' \r\n" + 
					"order by dbo.fnGetNameByCandidateId(candidate_id) asc";
				candidateList =  (List<BasicDetailsDto>) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(BasicDetailsDto.class)).list();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return candidateList;
	}
	
	@Override
	public List<ClientVendorMaster_DTO> getCustomertListByCandidateId(Integer candidateId) {
		Session session = null;List<ClientVendorMaster_DTO> payrateList = null;
		try {
			session = sessfact.openSession();
			/*String sql="select p.payrate_id as payrate_id,c.customer_id as custid ,c.customer_name as custname, p.candidate_id as candidate_id,p.payroll_type as payroll_type from Tbl_CustomerMaster c join "
					+ "Tbl_VendorPayRateDetails p on c.customer_id=p.customer_id where  p.status='Active' "
					+ "and p.candidate_id="+candidateId+"";*/
	   String sql = "select p.payrate_id as payrate_id,p.customer_id as custid ,dbo.fnGetCustomeNameById(p.customer_id) as custname, p.candidate_id as candidate_id,p.payroll_type as payroll_type from  Tbl_VendorPayRateDetails p where  p.status='Active' and p.candidate_id=" + candidateId + " and p.customer_id!=0";
			//payrateList = (List<EmpPayRateDetails>) session.createSQLQuery(sql).list();
			payrateList =session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(ClientVendorMaster_DTO.class)).list();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {session.close();
		}return payrateList;
	}
	@Override
	public List<TimesheetDto> getApprovedTimesheetByCandidateId(Integer candidateId,String payrollType, String emptype, int payrateid) {
		List<TimesheetDto> timesheetList = null;
		Session session = null;
		try {
			String sql =null;
			session = sessfact.openSession();
			if(emptype.equalsIgnoreCase("W2 Admin") && payrollType!=null) {
				if(payrollType.equalsIgnoreCase("Weekly")) {
					sql = " Exec getWeeklyPendingTimesheetByCanId @candidateid="+candidateId+",@payrateid=0,@emptype='"+emptype+"'";
				}
				else if(payrollType.equalsIgnoreCase("Semi-Monthly")) {
					sql = " Exec getSemimonthPendingTSByCanId @candidateid="+candidateId+",@payrateid=0,@emptype='"+emptype+"'";
				}
				else if(payrollType.equalsIgnoreCase("Monthly")) {
					sql = " Exec getMonthlyPendingTSByCanId @candidateid="+candidateId+",@payrateid=0,@emptype='"+emptype+"'";
				}
				else if(payrollType.equalsIgnoreCase("Bi-Weekly1")) {
					sql = " Exec getBiweekly_1PendingTSByCanId @candidateid="+candidateId+",@payrateid=0,@emptype='"+emptype+"'";
				}
				else if(payrollType.equalsIgnoreCase("Bi-Weekly2")) {
					sql = " Exec getBiweekly_2PendingTSByCanId @candidateid="+candidateId+",@payrateid=0,@emptype='"+emptype+"'";
				}
				
			}else {
				System.out.println("-------payrateid---------"+payrateid+"......"+payrollType+"========="+emptype);
				if(payrollType!=null) {
				if(payrollType.equalsIgnoreCase("Weekly")) {
					sql = " Exec getWeeklyApprovedTimesheetByCanId @candidateid="+candidateId+",@payrateid="+payrateid+",@emptype='"+emptype+"'";
				}
				else if(payrollType.equalsIgnoreCase("Semi-Monthly")) {
					sql = " Exec getSemimonthPendingTSByCanId @candidateid="+candidateId+",@payrateid="+payrateid+",@emptype='"+emptype+"'";
				}
				else if(payrollType.equalsIgnoreCase("Monthly")) {
					sql = " Exec getMonthlyPendingTSByCanId @candidateid="+candidateId+",@payrateid="+payrateid+",@emptype='"+emptype+"'";
				}
				else if(payrollType.equalsIgnoreCase("Bi-Weekly1")) {
					sql = " Exec getBiweekly_1PendingTSByCanId @candidateid="+candidateId+",@payrateid="+payrateid+",@emptype='"+emptype+"'";
				}
				else if(payrollType.equalsIgnoreCase("Bi-Weekly2")) {
					sql = " Exec getBiweekly_2PendingTSByCanId @candidateid="+candidateId+",@payrateid="+payrateid+",@emptype='"+emptype+"'";
				}
			  }else {
				  
			  }
			}
			timesheetList = (List<TimesheetDto>) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(TimesheetDto.class)).list();

		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return timesheetList;
	}
	
	@Override
	public List<TimesheetDto> getViewTimesheetByCandiateId(int yearid, String month, Integer candidateid, String status, Integer payrate_id) {
		List<TimesheetDto> periodList = null;
		Session session = null;
		try {String sql =null;
			session = sessfact.openSession();
			//if(role == 2 || role == 4 || role == 5) {
				
				sql = "Exec getTimesheetDetailsById @year="+yearid+",@month='"+month+"',@candidate_id="+candidateid+",@status='"+status+"',@payrate_id="+payrate_id+"";
			/*}else {
				sql = "Exec getTimesheetDetails @year="+yearid+",@status='"+status+"',@candidate_id="+candidateId+"" ,@status='"+status+"' ,@customerid="+customerid+";
			}*/
			periodList = (List<TimesheetDto>) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(TimesheetDto.class)).list();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return periodList;
	}
	@Override
	public List<TimesheetDto> getAllCandidateApprovedTimesheet(int currentYear, List<String> month) {
		List<TimesheetDto> periodList = null;
		Session session = null;
		try {String sql =null;
			session = sessfact.openSession();
				//sql = "Exec getAllApprovedTimesheetDetails @year="+currentYear+",@month='"+month+"'";
			sql="select  distinct  u.candidate_id as candidate_id,u.full_name as fullname,t.year as year,t.month as month,t.payrate_id as payrateid,\r\n" + 
					"dbo.fnGetCustomeNameById(t.customer_id) as customer_name,dbo.fnGetInvoiceTermsByPayRateId(t.payrate_id) as invoice_terms\r\n" + 
					"from Tbl_EmpBasicDetails u,Tbl_Timesheet t where u.candidate_id=t.candidate_id and u.status=1 and dbo.fnGetEmpTypeById(u.candidate_id)='W2'\r\n" + 
					"and t.year= COALESCE(NULLIF("+currentYear+", ''),t.year) and t.month in('"+String.join("','",month)+"') and t.timesheet_status='Approved' and customer_id!=0 order by u.candidate_id ASC ";
			
			periodList = (List<TimesheetDto>) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(TimesheetDto.class)).list();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return periodList;
	}
	@Override
	public List<Integer> getTimesheetIdByCandiateId(String from_date, String to_date, Integer candidateid,
			Integer customerid) {
		Session session = null; 
		List<Integer> timesheetIds=null;
		try {
			session = sessfact.openSession();  
			String hql="select timesheet_id from Tbl_Timesheet where candidate_id="+candidateid+" and from_date>='"+from_date+"' and to_date<='"+to_date+"' and timesheet_status='Approved'";
			timesheetIds= session.createSQLQuery(hql).list();
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}finally {
			session.close();}  
		return timesheetIds;
	}
	@Override
	public String getBillableHoursByTimesheetIds(List<Integer> timesheetIds, Integer candidateid) {
		String billableHours=null;
		Session session = null;  
		try { 
		session = sessfact.openSession();
		String sql="select RTRIM(SUM(DATEDIFF(MINUTE, '0:00:00', billable_hours)) /60 )+':'+ RIGHT(RTRIM( SUM(DATEDIFF(MINUTE, '0:00:00', billable_hours)) % 60) ,2) as summedTime "
				+ "from Tbl_TimesheetDetails where candidate_id="+candidateid+" and timesheet_id in("+StringUtils.join(timesheetIds, ',')+") ";
		System.out.println("getBillableHoursByTimesheetIds**"+sql);
		billableHours = (String) session.createSQLQuery(sql).uniqueResult();
			}catch (Exception e) {
			logger.info(e.getMessage(),e);
		}finally {
			session.close();
			} 
		return billableHours;
	}
	@Override
	public String getBillableHoursByTimesheetIds(int timesheet_id, Integer candidateid) {
		String billableHours=null;
		Session session = null;  
		try { 
		session = sessfact.openSession();
		String sql="select RTRIM(SUM(DATEDIFF(MINUTE, '0:00:00', billable_hours)) /60 )+':'+ RIGHT(RTRIM( SUM(DATEDIFF(MINUTE, '0:00:00', billable_hours)) % 60) ,2) as summedTime "
				+ "from Tbl_TimesheetDetails where candidate_id="+candidateid+" and timesheet_id="+timesheet_id+"";
		System.out.println("getBillableHoursByTimesheetIds**"+sql);
		billableHours = (String) session.createSQLQuery(sql).uniqueResult();
			}catch (Exception e) {
			logger.info(e.getMessage(),e);
		}finally {
			session.close();
			} 
		return billableHours;
	}
	@Override
	public InvoiceDto getViewTimesheetByTimesheetId(String candidateid, int timesheet_id) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public List<Integer> getTimesheetIdByCandiateIdDates(String fromdate, String todate, Integer candidate_id,
			Integer customerid) {
		Session session = null; 
		List<Integer> timesheetIds=null;
		try {
			session = sessfact.openSession();  
			String hql="select distinct timesheet_id from Tbl_TimesheetDetails where candidate_id="+candidate_id+" and date>='"+fromdate+"' and date<='"+todate+"'";
			timesheetIds= session.createSQLQuery(hql).list();
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}finally {
			session.close();}  
		return timesheetIds;
	}
	@Override
	public String getBillableHoursByCandiateIdDates(String fromdate, String todate, Integer candidate_id, List<Integer> timesheetIds) {
		String billableHours=null;
		Session session = null;  
		try { 
		session = sessfact.openSession();
		String sql="select RTRIM(SUM(DATEDIFF(MINUTE, '0:00:00', billable_hours)) /60 )+':'+ RIGHT(RTRIM( SUM(DATEDIFF(MINUTE, '0:00:00', billable_hours)) % 60) ,2) as summedTime "
				+ "from Tbl_TimesheetDetails where candidate_id="+candidate_id+" and date>='"+fromdate+"' and date<='"+todate+"' and timesheet_id in("+StringUtils.join(timesheetIds, ',')+")";
		System.out.println("getBillableHoursByCandiateIdDates**"+sql);
		billableHours = (String) session.createSQLQuery(sql).uniqueResult();
			}catch (Exception e) {
			logger.info(e.getMessage(),e);
		}finally {
			session.close();
			} 
		return billableHours;
	}
	
	@Override
	public TimesheetDto getMonthlyTemplate(Integer yr, String month) {
		TimesheetDto monthList = null;
		Session session = null;
		try {
			session = sessfact.openSession();
			String sql = "select year as year,month as month,payroll_fromdate as fromdate,payroll_todate as todate  from Tbl_MonthlyTemplate where year="+yr+" and month='"+month+"'";
			monthList = (TimesheetDto) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(TimesheetDto.class)).uniqueResult();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return monthList;
	}
	
	@Override
	public TimesheetDto getWeeklyTimesheetByYear(Integer yr, String month) {
		TimesheetDto monthList = null;
		Session session = null;
		try {
			session = sessfact.openSession();
			String sql = "select top 1 year as year,month as month,week_fromdate as fromdate,week_todate as todate  from Tbl_WeeklyTemplate where year="+yr+" and month='"+month+"' order by week_id asc";
			monthList = (TimesheetDto) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(TimesheetDto.class)).uniqueResult();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return monthList;
	}
	
	@Override
	public TimesheetDto getWeeklyTimesheetByYear1(Integer yr, String month) {
		TimesheetDto monthList = null;
		Session session = null;
		try {
			session = sessfact.openSession();
			String sql = "select top 1 year as year,month as month,week_fromdate as fromdate,week_todate as todate  from Tbl_WeeklyTemplate where year="+yr+" and month='"+month+"' order by week_id desc";
			monthList = (TimesheetDto) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(TimesheetDto.class)).uniqueResult();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return monthList;
	}
	@Override
	public List<TimesheetDto> getPendingTimesheetById(Integer candidateId,String payrollType, String emptype,
			Integer payrateid, Integer yr, String month) {
		List<TimesheetDto> timesheetList = null;
		Session session = null;
		try {
			String sql =null;
			session = sessfact.openSession();
		/*	if(emptype.equalsIgnoreCase("W2 Admin") && payrollType!=null) {
				if(payrollType.equalsIgnoreCase("Weekly")) {
					sql = "Exec getWeeklyPendingTimesheetByCanId @candidateid="+candidateId+",@payrateid=0,@emptype='"+emptype+"'";
				}
				else if(payrollType.equalsIgnoreCase("Semi-Monthly")) {
					sql = " Exec getSemimonthPendingTSByCanId @candidateid="+candidateId+",@payrateid=0,@emptype='"+emptype+"'";
				}
				else if(payrollType.equalsIgnoreCase("Monthly")) {
					sql = " Exec getMonthlyPendingTSByCanId @candidateid="+candidateId+",@payrateid=0,@emptype='"+emptype+"'";
				}
				else if(payrollType.equalsIgnoreCase("Bi-Weekly1")) {
					sql = " Exec getBiweekly_1PendingTSByCanId @candidateid="+candidateId+",@payrateid=0,@emptype='"+emptype+"'";
				}
				else if(payrollType.equalsIgnoreCase("Bi-Weekly2")) {
					sql = " Exec getBiweekly_2PendingTSByCanId @candidateid="+candidateId+",@payrateid=0,@emptype='"+emptype+"'";
				}
				
			}else {*/
				System.out.println("-------payrateid---------"+payrateid+"......"+payrollType+"========="+emptype);
				if(payrollType!=null) {
				if(payrollType.equalsIgnoreCase("Weekly")) {
					sql = "Exec getWeeklyPendingTimesheetByCanIdMonth @candidateid="+candidateId+",@payrateid="+payrateid+",@emptype='"+emptype+"',@year="+yr+",@month='"+month+"'";
					//sql = " Exec getWeeklyPendingTimesheetByCanId @candidateid="+candidateId+",@payrateid="+payrateid+",@emptype='"+emptype+"'";
				}
				else if(payrollType.equalsIgnoreCase("Semi-Monthly")) {
					sql = " Exec getSemimonthPendingTSByCanId @candidateid="+candidateId+",@payrateid="+payrateid+",@emptype='"+emptype+"'";
				}
				else if(payrollType.equalsIgnoreCase("Monthly")) {
					sql = " Exec getMonthlyPendingTSByCanId @candidateid="+candidateId+",@payrateid="+payrateid+",@emptype='"+emptype+"'";
				}
				else if(payrollType.equalsIgnoreCase("Bi-Weekly1")) {
					sql = " Exec getBiweekly_1PendingTSByCanId @candidateid="+candidateId+",@payrateid="+payrateid+",@emptype='"+emptype+"'";
				}
				else if(payrollType.equalsIgnoreCase("Bi-Weekly2")) {
					sql = " Exec getBiweekly_2PendingTSByCanId @candidateid="+candidateId+",@payrateid="+payrateid+",@emptype='"+emptype+"'";
				}
			  }else {
				  
			  }
			//}
			timesheetList = (List<TimesheetDto>) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(TimesheetDto.class)).list();

		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return timesheetList;
	}
	
	@Override
	public List<Integer> gettimesheetidsbydates(String from_date, String to_date, Integer candidateid,
			Integer customerid, Integer payrate_id) {
		Session session = null; 
		List<Integer> timesheetIds=null;
		try {
			session = sessfact.openSession();  
			String hql="select timesheet_id from Tbl_Timesheet where candidate_id="+candidateid+" and (from_date>='"+from_date+"' or to_date>='"+from_date+"') and (to_date<='"+to_date+"' or from_date<='"+to_date+"')  and payrate_id="+payrate_id+"";
			timesheetIds= session.createSQLQuery(hql).list();
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
		}finally {
			session.close();}  
		return timesheetIds;
	}
	
	@Override
	public List<TimesheetDetailsEntity> getDetailedTimesheetListById(Integer candidateId, Integer timesheetId, String from_date, String to_date) {
		List<TimesheetDetailsEntity> tsDtailedList = null;
		Session session = null;
		try {
			session = sessfact.openSession();
			String sql = "from TimesheetDetailsEntity  where timesheet_id=" + timesheetId + " and candidate_id="+candidateId+" and date>='"+from_date+"' and date<='"+to_date+"'";
			tsDtailedList=(List<TimesheetDetailsEntity>) session.createQuery(sql).list();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return tsDtailedList;
	}
	@Override
	public TimesheetDetailsEntity getTimesheetDetailsBydetailedId(Integer detailid) {
		TimesheetDetailsEntity detailedObj = null;
		Session session = null;
		try {
			session = sessfact.openSession();
			String sql = "from TimesheetDetailsEntity where timesheet_details_id="+detailid+"";
			detailedObj = (TimesheetDetailsEntity) session.createQuery(sql).uniqueResult();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return detailedObj;
	}
	
	@Override
	public String checkInvoiceGeneratedByCandiateIdDates(String fromdate, String todate, Integer candidate_id, List<Integer> timesheetIds) {
		String billableHours=null;
		Session session = null;  
		try { 
		session = sessfact.openSession();
		//String sql="select distinct invoice_status as invoice_status from Tbl_TimesheetDetails where candidate_id="+candidate_id+" and date>='"+fromdate+"' and date<='"+todate+"' and timesheet_id in("+StringUtils.join(timesheetIds, ',')+")";
		String sql="select distinct cast(STUFF((SELECT distinct ',' + invoice_status FROM  Tbl_Timesheet where timesheet_id in("+StringUtils.join(timesheetIds, ',')+")  FOR XML PATH('')), 1, 1, '') as varchar) as invoice_status from Tbl_TimesheetDetails where invoice_status is not null and candidate_id="+candidate_id+" and date>='"+fromdate+"' and date<='"+todate+"' and timesheet_id in("+StringUtils.join(timesheetIds, ',')+")";
		
		System.out.println("invoice status**"+sql);
		billableHours = (String) session.createSQLQuery(sql).uniqueResult();
			}catch (Exception e) {
			logger.info(e.getMessage(),e);
		}finally {
			session.close();
			} 
		return billableHours;
	}
	@Override
	public String getBillableHoursDates(String fromdate, String todate, Integer candidate_id,
			List<Integer> timesheetIds) {
		String billableHours=null;
		Session session = null;  
		try { 
		session = sessfact.openSession();
		/*billableHours = session.createSQLQuery("select RTRIM(SUM(DATEDIFF(MINUTE, '0:00:00', billable_hours)) /60 )+':'+ RIGHT(RTRIM( SUM(DATEDIFF(MINUTE, '0:00:00', billable_hours)) % 60) ,2) as totalbillablehours,"
				+ "STUFF((SELECT distinct ',' + timesheet_status FROM  Tbl_Timesheet where (from_date>='"+fromdate+"' or to_date<='"+todate+"') and (to_date<='"+todate+"' or from_date>='"+fromdate+"') FOR XML PATH('')), 1, 1, '') as timesheetstatus"
				+ " from Tbl_TimesheetDetails where candidate_id="+candidate_id+" and date>='"+fromdate+"' and date<='"+todate+"' and timesheet_id in (select timesheet_id from Tbl_Timesheet where  timesheet_id in("+StringUtils.join(timesheetIds, ',')+")"
				+ "and timesheet_status='Approved' and (from_date>='"+fromdate+"' or to_date<='"+todate+"') and (to_date<='"+todate+"' or from_date>='"+fromdate+"'))").addScalar("totalbillablehours", TimestampType.INSTANCE).uniqueResult();*/
		/*String sql = "select RTRIM(SUM(DATEDIFF(MINUTE, '0:00:00', billable_hours)) /60 )+':'+ RIGHT(RTRIM( SUM(DATEDIFF(MINUTE, '0:00:00', billable_hours)) % 60) ,2) as totalbillablehours,"
				+ "STUFF((SELECT distinct ',' + timesheet_status FROM  Tbl_Timesheet where (from_date>='"+fromdate+"' or to_date<='"+todate+"') and (to_date<='"+todate+"' or from_date>='"+fromdate+"') FOR XML PATH('')), 1, 1, '') as timesheetstatus"
				+ " from Tbl_TimesheetDetails where candidate_id="+candidate_id+" and date>='"+fromdate+"' and date<='"+todate+"' and timesheet_id in (select timesheet_id from Tbl_Timesheet where  timesheet_id in("+StringUtils.join(timesheetIds, ',')+")"
				+ "and timesheet_status='Approved' and (from_date>='"+fromdate+"' or to_date<='"+todate+"') and (to_date<='"+todate+"' or from_date>='"+fromdate+"'))";*/
		String sql = "select RTRIM(SUM(DATEDIFF(MINUTE, '0:00:00', billable_hours)) /60 )+':'+ RIGHT(RTRIM( SUM(DATEDIFF(MINUTE, '0:00:00', billable_hours)) % 60) ,2) as totalbillablehours from Tbl_TimesheetDetails where candidate_id="+candidate_id+" and date>='"+fromdate+"' and date<='"+todate+"' and timesheet_id in (select timesheet_id from Tbl_Timesheet where  timesheet_id in("+StringUtils.join(timesheetIds, ',')+")"
				+ " and (from_date>='"+fromdate+"' or to_date<='"+todate+"') and (to_date<='"+todate+"' or from_date>='"+fromdate+"'))";
		billableHours =  (String) session.createSQLQuery(sql).uniqueResult();
			}catch (Exception e) {
			logger.info(e.getMessage(),e);
		}finally {
			session.close();
			} 
		return billableHours;
	}
	
	@Override
	public String getTimesheetDatesStatus(String fromdate, String todate, Integer candidate_id,
			List<Integer> timesheetIds) {
		String billableHours=null;
		Session session = null;  
		try { 
		session = sessfact.openSession();		
		String sql = "select distinct cast(STUFF((SELECT distinct ',' + timesheet_status FROM  Tbl_Timesheet where timesheet_id in("+StringUtils.join(timesheetIds, ',')+") and (from_date>='"+fromdate+"' or to_date<='"+todate+"') and (to_date<='"+todate+"' or from_date>='"+fromdate+"') FOR XML PATH('')), 1, 1, '') as varchar) as timesheetstatus"
				+ " from Tbl_TimesheetDetails where candidate_id="+candidate_id+" and date>='"+fromdate+"' and date<='"+todate+"' and timesheet_id in (select timesheet_id from Tbl_Timesheet where  timesheet_id in("+StringUtils.join(timesheetIds, ',')+")"
				+ " and (from_date>='"+fromdate+"' or to_date<='"+todate+"') and (to_date<='"+todate+"' or from_date>='"+fromdate+"'))";
		billableHours = (String) session.createSQLQuery(sql).uniqueResult();
			}catch (Exception e) {
				e.printStackTrace();
			logger.info(e.getMessage(),e);
		}finally {
			session.close();
			} 
		return billableHours;
	}
	
	@Override
	public List<Integer> getInvoiceIds(int yearid, List<String> month, Integer candidateid,
			Integer payrate_id) {
		List<Integer> inoviceList = null;
		Session session = null;
		try {String sql =null;
			session = sessfact.openSession();
				sql = "select distinct td.qbinvoice_id as  invoice_id from  Tbl_Timesheet t join Tbl_TimesheetDetails td on t.timesheet_id=td.timesheet_id where\r\n" + 
					  "t.year="+yearid+" and t.month in('"+String.join("','",month)+"') and t.candidate_id="+candidateid+" and t.payrate_id="+payrate_id+" and td.invoice_status='IG'";
				inoviceList = (List<Integer>) session.createSQLQuery(sql).list();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return inoviceList;
	}
	@Override
	public TimesheetDto getGeneratedinvoiceList(int yearid, String month, Integer candidateid,
			Integer payrate_id,Integer invoiceid) {
		TimesheetDto inoviceObj = null;
		Session session = null;
		try {String sql =null;
			session = sessfact.openSession();
				sql = "select distinct \r\n" + 
						"(select top 1 date from Tbl_TimesheetDetails where qbinvoice_id="+invoiceid+" order by timesheet_details_id asc) as fromdate, \r\n" + 
						"(select top 1 date from Tbl_TimesheetDetails where qbinvoice_id="+invoiceid+" order by timesheet_details_id desc) as todate,\r\n" + 
						"t.year as year,t.month as month,dbo.fnGetCustomeNameById(t.customer_id) as customer_name\r\n" + 
						"from  Tbl_Timesheet t join Tbl_TimesheetDetails td on t.timesheet_id=td.timesheet_id where\r\n" + 
						"t.year="+yearid+" and t.month='"+month+"' and t.candidate_id="+candidateid+" and t.payrate_id="+payrate_id+" and td.invoice_status='IG'";
				inoviceObj = (TimesheetDto) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(TimesheetDto.class)).uniqueResult();
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		} finally {
			session.close();
		}
		return inoviceObj;
	}
	@Override
	public String getMonthTimesheetDetailsByInvoiceId(Integer invid) {
		String billableHours=null;
		Session session = null;  
		try { 
		session = sessfact.openSession();
		//String sql="select distinct invoice_status as invoice_status from Tbl_TimesheetDetails where candidate_id="+candidate_id+" and date>='"+fromdate+"' and date<='"+todate+"' and timesheet_id in("+StringUtils.join(timesheetIds, ',')+")";
		String sql="select top 1 CONVERT(varchar,DATENAME(month, date)) from Tbl_TimesheetDetails where qbinvoice_id="+invid+"";
		System.out.println("invoice status**"+sql);
		billableHours = (String) session.createSQLQuery(sql).uniqueResult();
			}catch (Exception e) {
			logger.info(e.getMessage(),e);
		}finally {
			session.close();
			} 
		return billableHours;
	}
	@Override
	public Integer getCountDaysByDates(String fromdate, String todate, Integer candidate_id,
			List<Integer> timesheetIds) {
		Integer countdays=null;
		Session session = null;  
		try { 
		session = sessfact.openSession();
		String sql = "select count(*) from Tbl_TimesheetDetails where candidate_id="+candidate_id+" and date>='"+fromdate+"' and date<='"+todate+"' and timesheet_id in (select timesheet_id from Tbl_Timesheet where  timesheet_id in("+StringUtils.join(timesheetIds, ',')+")"
				+ " and (from_date>='"+fromdate+"' or to_date<='"+todate+"') and (to_date<='"+todate+"' or from_date>='"+fromdate+"'))";
		countdays =  (Integer) session.createSQLQuery(sql).uniqueResult();
			}catch (Exception e) {
			logger.info(e.getMessage(),e);
		}finally {
			session.close();
			} 
		return countdays;
	
	}
}
