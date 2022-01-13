package com.tekskills.Controller;

import java.time.LocalDate;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.tekskills.Dto.BasicDetailsDto;
import com.tekskills.Dto.CompanyDetails_DTO;
import com.tekskills.Dto.ContractsPanelDetails_DTO;
import com.tekskills.Dto.DocumentHistoryDto;
import com.tekskills.Dto.LCADetailsDto;
import com.tekskills.Dto.MyDashboardDto;
import com.tekskills.Dto.RestDTO;
import com.tekskills.Dto.TimesheetDto;
import com.tekskills.Entity.CandidateDetailedInfo;
import com.tekskills.Entity.CustomerMasterEntity;
import com.tekskills.Entity.EmpBasicDetailsEntity;
import com.tekskills.Service.ContractorsService;
import com.tekskills.Service.EmployeesService;
import com.tekskills.Service.H1BService;
import com.tekskills.Service.ImmigrationService;
import com.tekskills.Service.TimesheetService;

@RestController
public class USOBRestController {

	@Autowired
	private EmployeesService empService;
	@Autowired
	private TimesheetService tsServie;
	@Autowired
	private H1BService h1bService;
	@Autowired
	private ImmigrationService immiService;
	@Autowired
	private ContractorsService contService;

	@RequestMapping(value = "/Login/{name}/{pass}", method = RequestMethod.GET)
	public RestDTO showUser(@PathVariable("pass") String pass, @PathVariable("name") String name) {

		String UserName = name.trim();
		String Password = pass.trim();
		RestDTO rd = new RestDTO();

		EmpBasicDetailsEntity basicObj = empService.checkLogin(UserName, Password);
		if (basicObj != null) {
			MyDashboardDto myDashboard = null;
			CandidateDetailedInfo detailObj = empService.getCandidateDetailedInfoById(basicObj.getCandidate_id());
			myDashboard = empService.getmyDashboardDocList();
			List<TimesheetDto> timesheetList = null;
			if (detailObj.getRole_id() != 0) {
				if (detailObj.getRole_id() == 1 && detailObj.getEmp_type().equalsIgnoreCase("W2")) {
					String status = "Submitted";
					String month = "";
					String customertype = "";
					LocalDate currentDate = LocalDate.now();
					Integer curyear = currentDate.getYear();
					String year = String.valueOf(curyear);
					timesheetList = tsServie.getPendingViewTimesheet(year, status, detailObj.getRole_id(),
							basicObj.getCandidate_id(), detailObj.getEmp_type(), month, customertype);
				} else if (detailObj.getEmp_type().equalsIgnoreCase("W2 Admin")
						|| detailObj.getEmp_type().equalsIgnoreCase("Admin")) {
					if (detailObj.getRole_id() == 1 || detailObj.getRole_id() == 2) {
						String status = "Submitted";
						String month = "";
						String customertype = "";
						LocalDate currentDate = LocalDate.now();
						Integer curyear = currentDate.getYear();
						String year = String.valueOf(curyear);
						timesheetList = tsServie.getPendingViewTimesheet(year, status, detailObj.getRole_id(),
								basicObj.getCandidate_id(), detailObj.getEmp_type(), month, customertype);
					} else {
						String status = "Submitted";
						String month = "";
						String customertype = "";
						LocalDate currentDate = LocalDate.now();
						Integer curyear = currentDate.getYear();
						String year = String.valueOf(curyear);
						Integer candidateId = 0;
						timesheetList = tsServie.getPendingViewTimesheet(year, status, detailObj.getRole_id(),
								candidateId, detailObj.getEmp_type(), month, customertype);
					}
				}
			}
			List<DocumentHistoryDto> pendingdocs = null;
			pendingdocs = h1bService.getCandidateInitiaton();

			List<DocumentHistoryDto> adminpendingdocs = null;
			adminpendingdocs = h1bService.getadminCandidateInitiaton();

			List<DocumentHistoryDto> adminaprpendingdocs = null;
			adminaprpendingdocs = h1bService.getadminaprCandidateInitiaton();

			List<DocumentHistoryDto> questionaries = null;
			questionaries = h1bService.questionaries();

			List<LCADetailsDto> pendinglca = null;
			pendinglca = h1bService.getpendinglca();

			Integer dasboardcount = pendingdocs.size() + adminpendingdocs.size() + adminaprpendingdocs.size()
					+ questionaries.size() + pendinglca.size();
			Integer usercount = null;
			if (detailObj.getRole_id() == 1) {
				
				Integer count1 = null, count2 = null, count3 = null;
				List<DocumentHistoryDto> userpendingdocs = null;
				userpendingdocs = h1bService.getPendingdocsbyCandid(basicObj.getCandidate_id());
				ContractsPanelDetails_DTO docandimmiformDto1 = h1bService.getimmidocumentlist1(basicObj.getCandidate_id());
				if (docandimmiformDto1.getCandidatedocTypeList() != null) {
					if (docandimmiformDto1.getCandidatedocTypeList().size() > 0) {
						// System.out.println("docandimmiformDto1.getH1bObj()"+docandimmiformDto1.getH1bObj()+"Status"+docandimmiformDto1.getH1bObj().getCandidate_status());
						if (docandimmiformDto1.getH1bObj() == null) {
							count1 = 1;
						} else {
							if (docandimmiformDto1.getH1bObj().getCandidate_status().equalsIgnoreCase("Pending")) {
								count1 = 1;
							} else {
								count1 = 0;
							}
							// count1 = 0;
						}
						// System.out.println("docandimmiformDto1.getH1bObj()"+docandimmiformDto1.getClientObj()+"Status"+docandimmiformDto1.getClientObj().getCandidate_status());
						if (docandimmiformDto1.getClientObj() == null) {
							count2 = 1;
						} else {
							count2 = 0;
						}
						// System.out.println("docandimmiformDto1.getH1bObj()"+docandimmiformDto1.getPbcObj()+"Status"+docandimmiformDto1.getPbcObj().getCandidate_status());
						if (docandimmiformDto1.getPbcObj() == null) {
							count3 = 1;
						} else {
							if (docandimmiformDto1.getPbcObj().getCandidate_status().equalsIgnoreCase("Pending")) {
								count3 = 1;
							} else {
								count3 = 0;
							}
						}
						usercount = count1 + count2 + count3 + userpendingdocs.size();
					}
				}             
			}
			rd.setBasicObj(basicObj);
			rd.setDetailObj(detailObj);
			rd.setUsercount(usercount);
			rd.setTimesheetList(timesheetList);
		    ((RestDTO) rd).setMyDashboard(myDashboard);
			rd.setDasboardcount(dasboardcount);

		}
		return rd;
	}
	@RequestMapping(value = "/getemployees", method = RequestMethod.GET)
	public List<BasicDetailsDto> getemployees() {
		List<BasicDetailsDto> candidateList = immiService.getW2CandidateList();
		return candidateList;
	}
	
	@RequestMapping(value = "/getcustomers", method = RequestMethod.GET)
	public List<CompanyDetails_DTO> getcustomers() {
		List<CompanyDetails_DTO> customersList = contService.getCustomerMasterList();
		return customersList;
	}
	
	@RequestMapping(value = "/getbillablehours/{customerid}/{candidateid}/{fromdate}/{duedate}", method = RequestMethod.GET)
	public String getbillablehours(@PathVariable("customerid") String customerid, @PathVariable("candidateid") String candidateid, @PathVariable("fromdate") String fromdate, @PathVariable("duedate") String duedate) {
	
		String billablehours=null;
		List<Integer> timesheetIds= tsServie.getTimesheetIdByCandiateId(fromdate,duedate,candidateid,customerid);
		billablehours=tsServie.getBillableHoursByTimesheetIds(timesheetIds,candidateid);
		System.out.println("billablehours*******"+billablehours);
		return billablehours;
	}
	
	@RequestMapping(value = "/getallcustomers", method = RequestMethod.GET)
	public List<CompanyDetails_DTO> getallcustomers() {
		List<CompanyDetails_DTO> cutomerList = contService.getCustomerMasterList();
		return cutomerList;
	}
	
	@RequestMapping(value = "/mapemployee/{qbId}/{candId}", method = RequestMethod.GET)
	public String mapemployee(@PathVariable("qbId") String qbId, @PathVariable("candId") String candId) {
		String mapping=h1bService.mapemployee(qbId,candId);
		return mapping;
	}
}
