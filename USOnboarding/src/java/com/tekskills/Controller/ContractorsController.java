package com.tekskills.Controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.json.JSONObject;
import org.json.XML;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.tekskills.Dto.AttachmentBean;
import com.tekskills.Dto.BasicDetailsDto;
import com.tekskills.Dto.ClientVendorMaster_DTO;
import com.tekskills.Dto.CommonDetailDto;
import com.tekskills.Dto.CompanyDetails_DTO;
import com.tekskills.Dto.CustomerDetails_DTO;
import com.tekskills.Dto.DocumentHistoryDto;
import com.tekskills.Dto.EmployeeDto;
import com.tekskills.Dto.ManagerDto;
import com.tekskills.Dto.ProjectDetailsHistoryDto;
import com.tekskills.Dto.VendorDetails_DTO;
import com.tekskills.Dto.ViewDocBean;
import com.tekskills.Dto.viewDocsBean;
import com.tekskills.Entity.BankPaymentDetailsEntity;
import com.tekskills.Entity.CustomerMasterEntity;
import com.tekskills.Entity.EmpBasicDetailsEntity;
import com.tekskills.Entity.EmpPayRateDetails;
import com.tekskills.Entity.PageStatusEntity;
import com.tekskills.Entity.ProductsEntity;
import com.tekskills.Entity.SOCcodeMasterEntity;
import com.tekskills.Entity.WorkAuthorization;
import com.tekskills.Service.ContractorsService;
import com.tekskills.Service.EmployeesService;
import com.tekskills.Service.H1BService;
import com.tekskills.Service.ImmigrationService;

@Controller
@PropertySource("/WEB-INF/mail.properties")
public class ContractorsController {
	private static final Logger logger = Logger.getLogger(ContractorsController.class);
	@Autowired
	private ContractorsService contService;
	@Autowired
	private H1BService h1bService;
	@Autowired
	private EmployeesService empService;
	@Autowired
	private ImmigrationService immiService;
	@Autowired
	private Environment env;

	@RequestMapping(value = { "/addContractors" }, method = RequestMethod.GET)
	public String AddContractors(Model model, HttpServletRequest request, HttpServletResponse response) {
		String userName = (String) request.getSession().getAttribute("username");
		try {
			if (userName == null) {
				return "redirect:/loginpage";
			} else {
				HttpSession session = request.getSession(true);
				List<WorkAuthorization> workAuthList = contService.getWorkAuthnListForContractors();
				List<ManagerDto> contractTeamList = contService.getContractTeamList();
				session.setAttribute("waList", workAuthList);
				session.setAttribute("contractTeam", contractTeamList);

				String candidates = "candidates";
				session.setAttribute("candidates", candidates);
				session.setAttribute("templates", null);
				session.setAttribute("stsreports", null);
				session.setAttribute("timesheet", null);
				session.setAttribute("myimmidocs", null);
			}
		} catch (Exception e) {
			logger.error("Error in ContractorsController method AddContractors" + e);
		}
		return "AddContractors";
	}

	@RequestMapping(value = { "/saveContrators" }, method = RequestMethod.POST, consumes = "application/json")
	@ResponseBody
	public EmployeeDto saveContrators(HttpServletRequest request, Model model, HttpServletResponse response,
			@RequestBody CommonDetailDto Contractors) {
		EmployeeDto empdto = new EmployeeDto();
		try {
			HttpSession session = request.getSession(true);
			Integer loginempno = (Integer) session.getAttribute("empno");
			String autouname = request.getParameter("autouname");
			Integer candidateId = contService.saveContrators(loginempno, Contractors, autouname);
			if (candidateId != null) {
				EmpBasicDetailsEntity empObj = contService.getEmployeeDetailsByCandidateId(candidateId);
				String message = "Basic Details Added Successfully for Contractor UserName=" + empObj.getUserName()
						+ "";
				empdto.setMessage(message);
				empdto.setCandidateId(candidateId);
				empdto.setEmpType(Contractors.getCandidateInfo().getEmp_type());
			}
		} catch (Exception e) {
			logger.error("Error occured in ContractorsController method saveContrators ---", e);
		}
		return empdto;
	}

	@RequestMapping(value = { "/addClientVendor" }, method = RequestMethod.GET)
	public String addClientVendor(Model model, HttpServletRequest request, HttpServletResponse response) {
		String userName = (String) request.getSession().getAttribute("username");
		try {
			if (userName == null) {
				return "redirect:/loginpage";
			} else {
				HttpSession session = request.getSession(true);
				String candidate_id = request.getParameter("candidate_id");
				String empType = request.getParameter("empType");
				session.setAttribute("candidate_id", candidate_id);
				session.setAttribute("empType", empType);
				List<CompanyDetails_DTO> cutomerList = contService.getCustomerMasterList();
				model.addAttribute("cutomerList", cutomerList);
				List<CompanyDetails_DTO> vendorList = contService.getVendorMasterList();
				model.addAttribute("vendorList", vendorList);
				EmployeeDto basicObj = contService.getCanidateDetailsByCanId(candidate_id);
				session.setAttribute("basicObj", basicObj);
				List<SOCcodeMasterEntity> soccodeList = h1bService.getSocCodeMasterList();
				model.addAttribute("soccodeList", soccodeList);
				ClientVendorMaster_DTO countObj = null;
				if (basicObj != null) {
					countObj = contService.getclientsizebybillingtype(candidate_id, basicObj.getBilling());
					System.out.println(countObj.getClientcount() + "------countObj-----" + countObj.getInhousecount());
				}
				model.addAttribute("countObj", countObj);
				// return "AddClientVendor";
			}

		} catch (Exception e) {
			logger.error("Error in addClientVendor " + e);
		}
		return "AddClientVendor";
	}

	@RequestMapping(value = { "/addCustomer" }, method = RequestMethod.GET)
	public String addCustomer(Model model, HttpServletRequest request, HttpServletResponse response) {
		String userName = (String) request.getSession().getAttribute("username");
		try {
			if (userName == null) {
				return "redirect:/loginpage";
			} else {
				List<CompanyDetails_DTO> cutomerList = contService.getCustomerMasterList();
				model.addAttribute("cutomerList", cutomerList);
			}
		} catch (Exception e) {
			logger.error("Error occured in AddCustomer ---", e);
		}
		return "AddCustomer";
	}

	@RequestMapping(value = { "/addVendor" }, method = RequestMethod.GET)
	public String addVendor(Model model, HttpServletRequest request, HttpServletResponse response) {
		String userName = (String) request.getSession().getAttribute("username");
		try {
			if (userName == null) {
				return "redirect:/loginpage";
			} else {
				List<CompanyDetails_DTO> vendorList = contService.getVendorMasterList();
				model.addAttribute("vendorList", vendorList);
			}
		} catch (Exception e) {
			logger.error("Error occured in addVendor ---", e);
		}
		return "AddVendor";
	}

	@RequestMapping(value = { "/saveVendorMaster" }, method = RequestMethod.POST)
	@ResponseBody
	public String saveVendorMaster(Model model, HttpServletRequest request, HttpServletResponse response,
			@RequestParam("Ven_MSA") MultipartFile venMSA, @RequestParam("exe_irs_w9_form") MultipartFile irsw9form,
			@RequestParam("insu_certi") MultipartFile insucerti, @RequestParam("certi_corp") MultipartFile certicorp,
			@RequestParam("std_cert") MultipartFile stdcert,
			@RequestParam("mgr_mail_proof") MultipartFile mailproofVendor) {
		String userName = (String) request.getSession().getAttribute("username");
		String message = null;
		if (userName == null) {
			return "redirect:/loginpage";
		} else {
			String ven_msa = "Vendor_MSA";
			String executed_irs_w9_form = "Executed_irs_w9_form";
			String insurance_certificate = "insurance_certificate";
			String certificate_incorporation = "certificate_incorporation";
			String standing_certificate = "standing_certificate";
			String mailprooftype = "Manager_Approved_Email_VMSA";
			HttpSession session = request.getSession(true);
			String vendorname = request.getParameter("vendor_name");
			// String vendorAddress = request.getParameter("ven_add");
			String v_contactperson = request.getParameter("ven_phne_no");
			String v_mgr_email = request.getParameter("ven_mgr_emailid");

			String fed_id = request.getParameter("fed_id");
			String line1 = request.getParameter("line1");
			String line2 = request.getParameter("line2");
			String zipcode = request.getParameter("zipcode");
			String city = request.getParameter("city");
			String state = request.getParameter("state");

			String msa_fromdate = request.getParameter("msa_fromdate");
			String msa_expirydate = request.getParameter("msa_expirydate");
			String irs_fromdate = request.getParameter("irs_fromdate");
			String irs_expirydate = request.getParameter("irs_expirydate");
			String ic_fromdate = request.getParameter("ic_fromdate");
			String ic_expirydate = request.getParameter("ic_expirydate");
			String gsc_fromdate = request.getParameter("gsc_fromdate");
			String gsc_expirydate = request.getParameter("gsc_expirydate");

			Integer loginempno = (Integer) session.getAttribute("empno");
			Integer vendor_id = contService.saveVendorMaster(vendorname, fed_id, v_contactperson, v_mgr_email, ven_msa,
					venMSA, executed_irs_w9_form, irsw9form, insucerti, insurance_certificate, certicorp,
					certificate_incorporation, stdcert, standing_certificate, mailprooftype, mailproofVendor,
					loginempno, msa_fromdate, msa_expirydate, irs_fromdate, irs_expirydate, ic_fromdate, ic_expirydate,
					gsc_fromdate, gsc_expirydate);
			if (vendor_id != 0) {
				String companytype = "Vendor";
				contService.saveCompanyAddress(vendor_id, companytype, loginempno, line1, line2, city, state, zipcode,"");
				message = "New Vendor Details Added Successfully";
			}
			return message;
		}
	}

	@RequestMapping(value = { "/saveCustomerMaster" }, method = RequestMethod.POST)
	@ResponseBody
	public String saveCustomerMaster(Model model, HttpServletRequest request, HttpServletResponse response,
			@RequestParam(name = "Cust_MSA", required = false) MultipartFile customerMSA,
			@RequestParam("mgr_mail_proof_Cmsa") MultipartFile mailproofCustomer) throws IOException {
		String userName = (String) request.getSession().getAttribute("username");
		String message = null;
		 String jsonString=null;
		 String access_token = (String) request.getSession().getAttribute("access_token");
		if (userName == null) {
			return "redirect:/loginpage";
		} else {
			String cust_msa = "Customer_MSA";
			String mailtype = "Manager_Approved_Email_CMSA";
			HttpSession session = request.getSession(true);
			String custname = request.getParameter("cust_name");
			String cust_contactperson = request.getParameter("cust_phne_no");
			String cust_mgr_email = request.getParameter("cust_mgr_emailid");
			String fed_id = request.getParameter("fed_id");
			String line1 = request.getParameter("line1");
			String line2 = request.getParameter("line2");
			String zipcode = request.getParameter("zipcode");
			String city = request.getParameter("city");
			String country = request.getParameter("country");
			String state = request.getParameter("state");
			String payment_terms = request.getParameter("payment_terms");
			String payment_term_id = request.getParameter("payment_term_id");
			String fromdate = request.getParameter("fromdate");
			String expiry_date = request.getParameter("expirydate");
			Integer loginempno = (Integer) session.getAttribute("empno");
		Integer customer_id = contService.saveCustomerMaster(custname, fed_id, cust_contactperson, cust_mgr_email,
					customerMSA, cust_msa, mailtype, mailproofCustomer, loginempno, fromdate, expiry_date,payment_term_id);
			if (customer_id != 0) {
				String companytype = "Customer";
				contService.saveCompanyAddress(customer_id, companytype, loginempno, line1, line2, city, state,
						zipcode,country);
				message = "New Customer Details Added Successfully";
			}
			
			 String companyId = env.getProperty("CompanyID");  
			 URL url = new URL("https://sandbox-quickbooks.api.intuit.com/v3/company/"+companyId+"/customer?minorversion=62");

			    HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		        conn.setRequestProperty("Authorization","Bearer "+access_token);
		        conn.setRequestProperty("Content-Type","application/json;charset=UTF-8");
		        conn.setDoOutput(true);
		        conn.setRequestMethod("POST");
		        String notes = "";
		        
		        String json="{\r\n" + 
		        		"    \"BillAddr\": {\r\n" + 
		        		"        \"Line1\": \""+line1+"\",\r\n" + 
		        		"        \"Line2\": \""+line2+"\",\r\n" + 
		        		"        \"City\": \""+city+"\",\r\n" + 
		        		"        \"Country\": \""+country+"\",\r\n" + 
		        		"        \"CountrySubDivisionCode\": \""+state+"\",\r\n" + 
		        		"        \"PostalCode\": \""+zipcode+"\"\r\n" + 
		        		"    },\r\n" + 
		        		"    \"SalesTermRef\": {\r\n" + 
		        		"       \"value\": \""+payment_term_id+"\"\r\n" + 
		        		"     },\r\n" + 
		        		"    \"Notes\": \""+notes+"\",\r\n" + 
		        		"    \"DisplayName\": \""+custname+"\",\r\n" + 
		        		"    \"CompanyName\": \""+custname+"\",\r\n" + 
		        		"    \"PrimaryPhone\": {\r\n" + 
		        		"        \"FreeFormNumber\": \""+cust_contactperson+"\"\r\n" + 
		        		"    },\r\n" + 
		        		"    \"PrimaryEmailAddr\": {\r\n" + 
		        		"        \"Address\": \""+cust_mgr_email+"\"\r\n" + 
		        		"    }\r\n" + 
		        		"}\r\n" + 
		        		"";
		        OutputStream os = conn.getOutputStream();
		           os.write(json.getBytes("UTF-8"));
		           os.close();

		        BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		        String output;
		        StringBuffer response1 = new StringBuffer();
		        while ((output = in.readLine()) != null) {
		        	response1.append(output);
		        	response1.append("\r");
		        }
		        in.close();
		        JSONObject obj_JSONObject = XML.toJSONObject(response1.toString());
		        jsonString=obj_JSONObject.toString();
		        System.out.println("jsonString******"+jsonString);
		        JSONObject jo = new JSONObject(jsonString).getJSONObject("IntuitResponse").getJSONObject("Customer");
		        Integer qbcustomerid = jo.getInt("Id");
		        System.out.println("qbcustomerid*****"+qbcustomerid);
		        contService.updateCustomerMasterQBCustomerId(customer_id,qbcustomerid);
		      /*  System.out.println("jsonString******"+jsonString);
		        JSONObject cust = new JSONObject(obj_JSONObject);
		        Integer qbcustmid = cust.getJSONObject("Customer").getInt("Id");
		        System.out.println("qbcustmid******"+qbcustmid);*/
		       /* JSONObject cust=(new JSONObject(jsonString)).getJSONObject("Customer");  
		        Integer qbcustmid=cust.getInt("Id");  
			    System.out.println("qbcustmid******"+qbcustmid);*/
			return message;
		}
	}
	

	@RequestMapping(value = { "/CustomerDetailsById" }, method = RequestMethod.GET)
	@ResponseBody
	public CustomerDetails_DTO CustomerDetailsById(Model model, HttpServletRequest request,
			HttpServletResponse response) {
		CustomerDetails_DTO custdetobj = null;
		String custid = request.getParameter("custid");
		custdetobj = contService.getCustomerDetailsById(custid);
		return custdetobj;
	}

	@RequestMapping(value = { "/VendorDetailsById" }, method = RequestMethod.GET)
	@ResponseBody
	public VendorDetails_DTO VendorDetailsById(Model model, HttpServletRequest request, HttpServletResponse response) {
		VendorDetails_DTO vendetobj = null;
		String venid = request.getParameter("venid");
		vendetobj = contService.getVendorDetailsById(venid);
		return vendetobj;
	}

	@RequestMapping(value = { "/saveClientVendor" }, method = RequestMethod.POST)
	@ResponseBody
	public EmployeeDto saveClientVendor(Model model, HttpServletRequest request, HttpServletResponse response,
			@RequestParam(name = "cw_order", required = false) MultipartFile cworder,
			@RequestParam(name = "w_order", required = false) MultipartFile vworder,
			@RequestParam(name = "cagreement", required = false) MultipartFile cagreement,
			@RequestParam(name = "cCompliance", required = false) MultipartFile cCompliance,
			@RequestParam(name = "mgr_approved_mail_VWO", required = false) MultipartFile mailproofVendor,
			@RequestParam(name = "mgr_approved_mail_CWO", required = false) MultipartFile mailproofCustomer) {
		String message = null;
		String jsonString=null;
		EmployeeDto empdto = new EmployeeDto();
		try {
			HttpSession session = request.getSession(true);
			Integer loginempno = (Integer) session.getAttribute("empno");
			
			 String access_token = (String) request.getSession().getAttribute("access_token");

			String addedClientDetails = "";
			String billpayrateDetails = "";
			String vwofromdate = null;
			String vwoexpirydate = null;
			String ccfromdate = null;
			String ccexpirydate = null;
			Integer payrateId = null;
			String pay_rate = null;
			String pcurrency = null;
			String p_term = null;
			Integer customer_Id = null;
			Integer vendorId = null;
			String c_work_order = "cust_work_order";
			String v_work_order = "ven_work_order";
			String CC_Agreement = "Consultant_Consent_Agreement";
			String C_Compliance = "Consultant_Compliance";
			String mailproofCust = null;
			String mailproofVen = null;
			Integer clientId = 0;
			String organization_name = null;
			String cand_job_title = null;
			String education = null;
			String workinglocation = null;
			String reason_lca = null;
			String remote_line1 = null;
			String remote_line2 = null;
			String remote_city = null;
			String remote_state = null;
			String remote_zipcode = null;
			String remote_county = null;
			String remote_soc_code = null;
			String remote_metro_politan_area = null;

			String candidate_id = request.getParameter("candidate_id");
			Integer candidate_Id = 0;
			if (candidate_id != null) {
				candidate_Id = Integer.parseInt(candidate_id);
			}

			String customerid = request.getParameter("customertype");
			if (customerid != null) {
				customer_Id = Integer.parseInt(customerid);
			}
			if (mailproofCustomer != null) {
				if (!mailproofCustomer.getOriginalFilename().isEmpty()) {
					mailproofCust = request.getParameter("Manager_Approved_Email_CWO");
				}
			}

			if (mailproofVendor != null) {
				if (!mailproofVendor.getOriginalFilename().isEmpty()) {
					mailproofVen = request.getParameter("Manager_Approved_Email_VWO");
				}
			}

			String bill_rate = request.getParameter("bill_rate");
			String invoice_terms = request.getParameter("invoice_terms");
			String invoice_period = request.getParameter("invoice_period");
			String bcurrency = request.getParameter("bcurrency");
			String proj_startDate = request.getParameter("pro_startdate");
			String proj_endDate = request.getParameter("pro_enddate");
			String payrolltype = request.getParameter("payrolltype");

			String cwofromdate = request.getParameter("cwofromdate");
			String cwoexpirydate = request.getParameter("cwoexpirydate");

			String emptype = request.getParameter("emp_type");

			if (emptype.equalsIgnoreCase("C2C")) {
				String vendorid = request.getParameter("vendortype");
				if (vendorid != null) {
					vendorId = Integer.parseInt(vendorid);
				}
				pay_rate = request.getParameter("pay_rate");
				pcurrency = request.getParameter("pcurrency");
				p_term = request.getParameter("payment_terms");

				vwofromdate = request.getParameter("vwofromdate");
				vwoexpirydate = request.getParameter("vwoexpirydate");
				ccfromdate = request.getParameter("ccfromdate");
				ccexpirydate = request.getParameter("ccexpirydate");
			} else {

			}

			payrateId = contService.savePayRateBillRateDetails(bill_rate, pay_rate, invoice_terms, proj_startDate,
					proj_endDate, p_term, customer_Id, vendorId, candidate_Id, bcurrency, pcurrency, cworder,
					c_work_order, vworder, v_work_order, cagreement, CC_Agreement, cCompliance, C_Compliance,
					mailproofCustomer, mailproofCust, mailproofVendor, mailproofVen, emptype, loginempno, payrolltype,
					cwofromdate, cwoexpirydate, vwofromdate, vwoexpirydate, ccfromdate, ccexpirydate,invoice_period);

			String client_name = request.getParameter("client_name");
			String project_name = request.getParameter("project_name");
			String fed_id = request.getParameter("fed_id");
			String client_mgr = request.getParameter("client_mgr_name");
			String client_mgr_email = request.getParameter("client_mgr_emailid");
			String client_mgr_extn = request.getParameter("mgrdeskNumber");
			String client_emp_email = request.getParameter("emp_emailid");
			String client_emp_extn = request.getParameter("empdeskNumber");
			String line1 = request.getParameter("line1");
			String line2 = request.getParameter("line2");
			String city = request.getParameter("city");
			String state = request.getParameter("state");
			String zipcode = request.getParameter("zipcode");
			String client_type = "EndClient";
			String metro_politan_area = null;

			String lcaenddate = null;
			String lcastartdate = null;
			String wageRate = null;
			String lcaPostedDate = null;
			String wr_option = null;
			String job_duties = null;
			String work_authorization = request.getParameter("work_authorization");
			if (work_authorization.equalsIgnoreCase("H-1B") && emptype.equalsIgnoreCase("W2")) {
				organization_name = request.getParameter("organization_name");
				cand_job_title = request.getParameter("cand_job_title");
				education = request.getParameter("education");
				job_duties = request.getParameter("job_duties");
				workinglocation = request.getParameter("workinglocation");
				reason_lca = request.getParameter("reason_lca");
				remote_county = request.getParameter("remote_county");
				remote_soc_code = request.getParameter("remote_soc_code");
				metro_politan_area = request.getParameter("metro_politan_area");

				wr_option = request.getParameter("wr_option");
				wageRate = request.getParameter("wageRate");
				lcastartdate = request.getParameter("lcaBeginDate");
				lcaenddate = request.getParameter("lcaEndDate");
				lcaPostedDate = request.getParameter("lcaPostedDate");

				if (workinglocation.equalsIgnoreCase("Remote/Home")) {
					remote_line1 = request.getParameter("remote_line1");
					remote_line2 = request.getParameter("remote_line2");
					remote_city = request.getParameter("remote_city");
					remote_state = request.getParameter("remote_state");
					remote_zipcode = request.getParameter("remote_zipcode");
					remote_metro_politan_area = request.getParameter("remote_metro_politan_area");
				}

			}
			clientId = contService.saveClientDetails(client_name, fed_id, client_mgr, client_mgr_email, client_mgr_extn,
					client_emp_email, client_emp_extn, candidate_Id, loginempno, project_name, client_type, payrateId,
					organization_name, cand_job_title, education, workinglocation, remote_county, remote_soc_code,
					reason_lca, lcastartdate, lcaenddate, wageRate, metro_politan_area, lcaPostedDate, wr_option,
					job_duties);
			String companytype = "";

			if (clientId != 0) {
				companytype = "EndClient";
				addedClientDetails = "Success";
				if (work_authorization.equalsIgnoreCase("H-1B") && emptype.equalsIgnoreCase("W2")) {
					immiService.saveCompanyAddress(clientId, companytype, loginempno, line1, line2, city, state,
							zipcode, metro_politan_area);
				} else {
					contService.saveCompanyAddress(clientId, companytype, loginempno, line1, line2, city, state,
							zipcode,"");
				}
				if (workinglocation != null && workinglocation.equalsIgnoreCase("Remote/Home")) {
					companytype = "Remote/Home";
					immiService.saveCompanyAddress(clientId, companytype, loginempno, remote_line1, remote_line2,
							remote_city, remote_state, remote_zipcode, remote_metro_politan_area);
				}

				String[] lca_othr_line1s = request.getParameterValues("lca_othr_line1[]");
				String[] lca_othr_line2s = request.getParameterValues("lca_othr_line2[]");
				String[] lca_othr_citys = request.getParameterValues("lca_othr_city[]");
				String[] lca_othr_states = request.getParameterValues("lca_othr_state[]");
				String[] lca_othr_zipcodes = request.getParameterValues("lca_othr_zipcode[]");
				String[] lca_othr_remote_metros = request.getParameterValues("lca_othr_remote_metro[]");

				if (lca_othr_line1s != null) {
					for (int t = 1; t < lca_othr_line1s.length; t++) {
						String lca_othr_line1 = lca_othr_line1s[t];
						String lca_othr_line2 = lca_othr_line2s[t];
						String lca_othr_city = lca_othr_citys[t];
						String lca_othr_state = lca_othr_states[t];
						String lca_othr_zipcode = lca_othr_zipcodes[t];
						String lca_othr_metro = lca_othr_remote_metros[t];
						// String othr_client_type="OtherClient";
						String lcompanytype = "LCALocation";
						immiService.saveCompanyAddress(clientId, lcompanytype, loginempno, lca_othr_line1,
								lca_othr_line2, lca_othr_city, lca_othr_state, lca_othr_zipcode, lca_othr_metro);
					}
				}

			} else {
				addedClientDetails = "Error";
			}

			String[] othr_client_types = request.getParameterValues("othr_client_type[]");
			String[] othr_client_names = request.getParameterValues("othr_client_name[]");
			String[] othr_fed_ids = request.getParameterValues("othr_fed_id[]");
			String[] othr_client_mgrs = request.getParameterValues("othr_client_mgr[]");
			String[] othr_client_mgr_emails = request.getParameterValues("othr_client_mgr_email[]");
			String[] othr_client_mgr_extns = request.getParameterValues("othr_client_mgr_extn[]");
			String[] othr_emp_email_clients = request.getParameterValues("othr_emp_email_client[]");
			String[] othr_emp_client_extns = request.getParameterValues("othr_emp_client_extn[]");
			String[] othr_line1s = request.getParameterValues("othr_line1[]");
			String[] othr_line2s = request.getParameterValues("othr_line2[]");
			String[] othr_citys = request.getParameterValues("othr_city[]");
			String[] othr_states = request.getParameterValues("othr_state[]");
			String[] othr_zipcodes = request.getParameterValues("othr_zipcode[]");

			if (othr_client_names != null) {
				for (int t = 1; t < othr_client_names.length; t++) {
					String othr_client_type = othr_client_types[t];
					String othr_client_name = othr_client_names[t];
					String othr_fed_id = othr_fed_ids[t];
					String othr_client_mgr = othr_client_mgrs[t];
					String othr_client_mgr_email = othr_client_mgr_emails[t];
					String othr_client_mgr_extn = othr_client_mgr_extns[t];
					String othr_emp_email_client = othr_emp_email_clients[t];
					String othr_emp_client_extn = othr_emp_client_extns[t];
					String othr_line1 = othr_line1s[t];
					String othr_line2 = othr_line2s[t];
					String othr_city = othr_citys[t];
					String othr_state = othr_states[t];
					String othr_zipcode = othr_zipcodes[t];
					// String othr_client_type="OtherClient";

					Integer otherclient_Id = contService.saveOtherClientDetails(othr_client_name, othr_fed_id,
							othr_client_mgr, othr_client_mgr_email, othr_client_mgr_extn, othr_emp_email_client,
							othr_emp_client_extn, candidate_Id, loginempno, othr_client_type, payrateId);
					if (otherclient_Id != 0) {
						companytype = othr_client_type;
						contService.saveCompanyAddress(otherclient_Id, companytype, loginempno, othr_line1, othr_line2,
								othr_city, othr_state, othr_zipcode,"");
					}
				}
			}
			
			CustomerDetails_DTO custObj=contService.getCustomerDetailsById(customerid);
			EmpBasicDetailsEntity empObj=contService.getEmployeeDetailsByCandidateId(candidate_Id);
			    SimpleDateFormat format = new SimpleDateFormat("MM/dd/yyyy");
			    Date date = format.parse (proj_startDate);  
			    System.out.println("date****"+date);
                SimpleDateFormat mdyFormat = new SimpleDateFormat("MM-dd-yyyy");
			    String newdate=mdyFormat.format(date);
			    System.out.println("newdate****"+newdate);
			    String projectStartdate=newdate.replace("-","");
			
			
			String productName=empObj.getFullName()+"_"+custObj.getCustObj().getCustomer_name()+projectStartdate;
			String desc="Consulting and Services";
			Integer productId=contService.saveProductServices(productName,bill_rate,payrateId,desc,"");
			
			//String name=productname+hireddate;
			String companyId = env.getProperty("CompanyID");  
			
		    URL url = new URL("https://sandbox-quickbooks.api.intuit.com/v3/company/"+companyId+"/item?minorversion=62");

		    HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestProperty("Authorization","Bearer "+access_token);
	        conn.setRequestProperty("Content-Type","application/json;charset=UTF-8");
	        conn.setDoOutput(true);
	        conn.setRequestMethod("POST");
	   
	        String json = "{\r\n" + 
	        		"  \"Name\": \""+productName+"\",\r\n" + 
	        		"  \"IncomeAccountRef\": {\r\n" + 
	        		"    \"value\": \"79\",\r\n" + 
	        		"    \"name\": \"Sales of Product Income\"\r\n" + 
	        		"  },\r\n" + 
	        		" \r\n" + 
	        		"  \"ExpenseAccountRef\": {\r\n" + 
	        		"    \"value\": \"80\",\r\n" + 
	        		"    \"name\": \"Cost of Goods Sold\"\r\n" + 
	        		"  },\r\n" + 
	        		"  \"AssetAccountRef\": {\r\n" + 
	        		"    \"value\": \"81\",\r\n" + 
	        		"    \"name\": \"Inventory Asset\"\r\n" + 
	        		"  },\r\n" + 
	        		"  \"UnitPrice\": "+bill_rate+", \r\n" + 
	        		"  \"Type\": \"Service\",\r\n" + 
	        		"  \"InvStartDate\": \"2015-01-01\",\r\n" + 
	        		"  \"Description\": \""+desc+"\"\r\n" + 
	        		"}";
	        
	        OutputStream os = conn.getOutputStream();
	           os.write(json.getBytes("UTF-8"));
	           os.close();

	        BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        String output;
	        StringBuffer response1 = new StringBuffer();
	        while ((output = in.readLine()) != null) {
	        	response1.append(output);
	        	response1.append("\r");
	        }
	        in.close();
	        JSONObject obj_JSONObject = XML.toJSONObject(response1.toString());
	        jsonString=obj_JSONObject.toString();
	        JSONObject jo = new JSONObject(jsonString).getJSONObject("IntuitResponse").getJSONObject("Item");
	        Integer qbproductid = jo.getInt("Id");
	        System.out.println("qbproductid*****"+qbproductid);
	        String messagee = contService.updateQBProductId(productId,qbproductid);
			if (payrateId != null && addedClientDetails.equalsIgnoreCase("Success")) {
				message = "New Client & Vendor Details Added Successfully";
				PageStatusEntity pageObj = contService.getRedirectPageStatus(candidate_Id);
				empdto.setMessage(message);
				empdto.setCandidateId(candidate_Id);
				empdto.setBankstatus(pageObj.getBank_status());
				empdto.setEmpType(emptype);
				//empdto.setJsonString(jsonString);
				//empdto.setProductId(productId);
			} else {
				message = "New Client & Vendor Not Added";
			}
		} catch (Exception e) {
			logger.error("Error occured in saveClientVendor ---", e);
		}
		return empdto;
	}

	@RequestMapping(value = { "/viewClientVendor" }, method = RequestMethod.GET)
	public String viewClientVendor(Model model, HttpServletRequest request, HttpServletResponse response) {
		String userName = (String) request.getSession().getAttribute("username");
		try {
			if (userName == null) {
				return "redirect:/loginpage";
			} else {
				HttpSession ses = request.getSession(true);
				String candidate_id = request.getParameter("candidate_id");
				String empType = request.getParameter("empType");

				String payrateid = "";
				List<ClientVendorMaster_DTO> otherclientlist = contService.viewClientDetailsByCandidateId(candidate_id,
						payrateid);
				/*
				 * ClientVendorMaster_DTO endClient =
				 * contService.viewEndClientDetailsByCandidateId(candidate_id,payrateid);
				 * List<ClientVendorMaster_DTO> otherclientlist =
				 * contService.viewClientDetailsByCandidateId(candidate_id,payrateid);
				 * List<ClientVendorMaster_DTO> custlist =
				 * contService.viewCustomerDetailsByCandidateId(candidate_id,payrateid);
				 * List<ClientVendorMaster_DTO> vendorlist =
				 * contService.viewVendorDetailsByCandidateId(candidate_id,payrateid);
				 */
				List<ClientVendorMaster_DTO> ccvlist = contService.viewEndclientByCandidateId(candidate_id);
				/*
				 * viewDocsBean viewcvbean =
				 * contService.viewClientVendorDocsByCandidateId(candidate_id,payrateid);
				 */
				/*
				 * EmpPayRateDetails
				 * parateObj=contService.getPayrateDetailsByPayrateId(payrateid,candidate_id);
				 */
				EmpPayRateDetails parateObjactive = contService.getActivePayrateDetailsByPayrateId(payrateid,
						candidate_id);
				if (parateObjactive != null) {
					int psize = 1;
					model.addAttribute("payratesize", psize);
				} else {
					int psize = 0;
					model.addAttribute("payratesize", psize);
				}
				List<CompanyDetails_DTO> cutomerList = contService.getCustomerMasterList();
				model.addAttribute("cutomerList", cutomerList);
				List<CompanyDetails_DTO> vendorList = contService.getVendorMasterList();
				model.addAttribute("vendorList", vendorList);
				EmployeeDto basicObj = contService.getCanidateDetailsByCanId(candidate_id);
				if (basicObj == null) {
					int activestatus = 0;
					model.addAttribute("activestatus", activestatus);
				} else {
					int activestatus = 1;
					model.addAttribute("activestatus", activestatus);
				}
				ClientVendorMaster_DTO countObj = null;
				if (basicObj != null) {
					countObj = contService.getclientsizebybillingtype(candidate_id, basicObj.getBilling());
				}
				model.addAttribute("basicObj", basicObj);
				model.addAttribute("countObj", countObj);
				/*
				 * model.addAttribute("otherclientlist", otherclientlist);
				 * model.addAttribute("custlist", custlist); model.addAttribute("vendorlist",
				 * vendorlist); model.addAttribute("viewcvbean", viewcvbean);
				 * model.addAttribute("endClient", endClient);
				 */
				model.addAttribute("activeclientlist", otherclientlist.size());
				model.addAttribute("ccvlist", ccvlist);
				model.addAttribute("ccvlistsize", ccvlist.size());
				/* model.addAttribute("parateObj", parateObj); */

				ses.setAttribute("candidate_id", candidate_id);
				ses.setAttribute("empType", empType);
			}
		} catch (Exception e) {
			logger.error("Error occured in viewClientVendor ---", e);
		}
		return "EditClientVendor";
	}
	/*
	 * @RequestMapping(value = { "/saveEmpbankDetailsc" }, method =
	 * RequestMethod.GET)
	 * 
	 * @ResponseBody public String saveEmployeebankc(HttpServletRequest request,
	 * Model model, HttpServletResponse response,
	 * 
	 * @RequestParam("file") MultipartFile file1) { String message = null; try {
	 * 
	 * String accountNo = request.getParameter("acc_name"); String bankname =
	 * request.getParameter("bank_name"); String swiftcode =
	 * request.getParameter("swift_code"); String ibancode =
	 * request.getParameter("ibank_code"); String routingno =
	 * request.getParameter("bank_routing"); String bankamount =
	 * request.getParameter("bank_amount"); String bankBtnVal[] =
	 * request.getParameterValues("btncount"); Integer userid =
	 * Integer.parseInt(request.getParameter("userid"));
	 * 
	 * message = contService.saveEmpbankDetails(accountNo, bankname, swiftcode,
	 * ibancode, routingno, file1, bankamount, bankBtnVal, userid); } catch
	 * (Exception e) { logger.error("Error occured in saveEmpbankDetails ---", e); }
	 * return message; }
	 */

	@RequestMapping(value = { "/viewConsultantInfo" }, method = RequestMethod.GET)
	public String viewConsultantInfo(Model model, HttpServletRequest request, HttpServletResponse response) {
		String userName = (String) request.getSession().getAttribute("username");
		if (userName == null) {
			return "redirect:/loginpage";
		} else {
			try {
				List<WorkAuthorization> workAuthList = null;
				String candidate_id = request.getParameter("candidate_id");
				BasicDetailsDto consultantInfoObj = contService.viewConsultantInfo(candidate_id);
				// List<WorkAuthorization> workAuthList =
				// contService.getWorkAuthnListForContractors();
				String emptype = request.getParameter("empType");
				if (emptype.equalsIgnoreCase("1099")) {
					workAuthList = contService.getWorkAuthnListForContractors();
				} else {
					workAuthList = empService.getWorkAuthnList();
				}
				List<ManagerDto> contractTeamList = contService.getContractTeamList();
				model.addAttribute("waList", workAuthList);
				model.addAttribute("contractTeam", contractTeamList);
				model.addAttribute("editbasic", consultantInfoObj);
			} catch (Exception e) {
				logger.error("Error occured in ContractorsController method viewConsultantInfo ---", e);
			}
			return "UpdateConsultants";
		}
	}

	@RequestMapping(value = { "/updateConsultantsBasicInfo" }, method = RequestMethod.POST)
	@ResponseBody
	public EmployeeDto updateConsultantsBasicInfo(Model model, HttpServletRequest request,
			HttpServletResponse response) {
		EmployeeDto empdto = new EmployeeDto();
		try {
			String userName = (String) request.getSession().getAttribute("username");
			String ssn_no = request.getParameter("ssn_emp");
			String candidate_id = request.getParameter("candidate_id");
			String firstName = request.getParameter("firstName");
			String middleName = request.getParameter("middleName");
			String familyName = request.getParameter("familyName");
			String recrutier_name = request.getParameter("rec_name");
			String cont_team_name = request.getParameter("cont_team_name");
			String email_id = request.getParameter("email_id");
			String phne_no = request.getParameter("phne_no");
			String phne_no2 = request.getParameter("phne_no2");
			String phne_no3 = request.getParameter("phne_no3");
			String ctype2 = request.getParameter("ctype2");
			String ctype3 = request.getParameter("ctype3");
			String dob = request.getParameter("dob");
			String work_auth = request.getParameter("work_auth");
			String joining_Date = request.getParameter("joining_Date");
			String designation = request.getParameter("designation");
			String bgcType = request.getParameter("bgcType");
			String c2cType = request.getParameter("c2cType");
			String validateby = request.getParameter("validateby");
			// String payrolltype = request.getParameter("payrolltype");
			String payrolltype = "";
			Integer loginempno = (Integer) request.getSession().getAttribute("empno");
			Integer candidateId = 0;
			if (!candidate_id.isEmpty()) {
				candidateId = Integer.parseInt(candidate_id);
			}
			String message = contService.updateConsultantsBasicInfo(ssn_no, firstName, recrutier_name, cont_team_name,
					email_id, phne_no, dob, joining_Date, designation, middleName, familyName, candidateId, bgcType,
					c2cType, work_auth, loginempno, phne_no2, phne_no3, ctype2, ctype3, validateby, payrolltype);
			empdto.setMessage(message);
			empdto.setCandidateId(candidateId);
		} catch (Exception e) {
			logger.error("Error in saveEmployees" + e.getMessage());
		}
		return empdto;
	}

	@RequestMapping(value = { "/updateClientVendorDetails" }, method = RequestMethod.POST)
	@ResponseBody
	public EmployeeDto updateClientVendor(Model model, HttpServletRequest request, HttpServletResponse response,
			@RequestParam(name = "cw_order", required = false) MultipartFile cworder,
			@RequestParam(name = "w_order", required = false) MultipartFile vworder,
			@RequestParam(name = "cagreement", required = false) MultipartFile cagreement,
			@RequestParam(name = "cCompliance", required = false) MultipartFile cCompliance,
			@RequestParam(name = "mgr_approved_mail_VWO", required = false) MultipartFile mailproofVendor,
			@RequestParam(name = "mgr_approved_mail_CWO", required = false) MultipartFile mailproofCustomer) {
		EmployeeDto empdto = new EmployeeDto();
		try {
			 String jsonString=null;
			HttpSession session = request.getSession(true);
			Integer loginempno = (Integer) session.getAttribute("empno");
			String access_token = (String) request.getSession().getAttribute("access_token");
			String upcvPayrateDetails = "";
			String upclientDetails = "";
			String pay_rate = null;
			String p_term = null;
			Integer customer_Id = null;
			Integer vendorId = null;
			String c_work_order = null;
			String v_work_order = null;
			String CC_Agreement = null;
			String C_Compliance = null;
			Integer payRate_Id = 0;
			String candidate_id = request.getParameter("candidate_id");
			Integer candidateId = 0;
			// if (candidate_id!="") {
			if (!candidate_id.isEmpty()) {
				candidateId = Integer.parseInt(candidate_id);
			}
			System.out.println("candidate_id66666666666666666666666666666********" + candidate_id);
			String emptype = request.getParameter("emp_type");
			String customerid = request.getParameter("customertype");
			if (customerid != null) {
				customer_Id = Integer.parseInt(customerid);
			}
			String payRateid = request.getParameter("payRateid");
			if (payRateid != null) {
				payRate_Id = Integer.parseInt(payRateid);
			}
			Integer customerIdDb = null;
			Integer vendorIdDb = null;
			String custIdDb = request.getParameter("cust_id");
			if (custIdDb != null) {
				customerIdDb = Integer.parseInt(custIdDb);
			}
			System.out.println("payRate_Id" + payRate_Id + "payRateid" + payRateid);
			String billrate = request.getParameter("bill_rate");
			String invoice_terms = request.getParameter("invoice_terms");
			String invoice_period = request.getParameter("invoice_period");
			String proj_startDate = request.getParameter("pro_startdate");
			String proj_endDate = request.getParameter("pro_enddate");
			String payrolltype = request.getParameter("payrolltype");
			/*
			 * String c_edid=request.getParameter("c_edid"); String
			 * v_edid=request.getParameter("v_edid"); String
			 * cca_edid=request.getParameter("cca_edid"); String
			 * cc_edid=request.getParameter("cc_edid");
			 */

			if (emptype.equalsIgnoreCase("C2C")) {
				String vendorid = request.getParameter("vendortype");
				if (vendorid != null) {
					vendorId = Integer.parseInt(vendorid);
				}
				String venIdDb = request.getParameter("ven_id");
				if (venIdDb != null) {
					vendorIdDb = Integer.parseInt(venIdDb);
				}
				pay_rate = request.getParameter("pay_rate");
				p_term = request.getParameter("payment_terms");

				if (vworder != null) {
					if (!vworder.getOriginalFilename().isEmpty()) {
						v_work_order = request.getParameter("ven_work_order");
						String vwofromdate = request.getParameter("vwofromdate");
						String vwoexpirydate = request.getParameter("vwoexpirydate");

						// if (v_edid == null || v_edid =="" || v_edid.isEmpty()) {
						contService.saveClientVendorDocs(vworder, v_work_order, candidate_id, loginempno, null,
								vendorId, vwofromdate, vwoexpirydate, vendorIdDb, null, emptype, payRateid);
						/*
						 * }else { contService.updateDocumentById(vworder, v_edid, candidate_id,
						 * loginempno); }
						 */
					}
				}
				if (cagreement != null) {
					if (!cagreement.getOriginalFilename().isEmpty()) {
						CC_Agreement = request.getParameter("Consultant_Consent_Agreement");
						// if (cca_edid == null || cca_edid =="" || cca_edid.isEmpty()) {
						contService.saveClientVendorDocs(cagreement, CC_Agreement, candidate_id, loginempno, null,
								vendorId, null, null, vendorIdDb, null, emptype, payRateid);
						/*
						 * }else { contService.updateDocumentById(cagreement, cca_edid, candidate_id,
						 * loginempno); }
						 */
					}
				}
				if (cCompliance != null) {
					if (!cCompliance.getOriginalFilename().isEmpty()) {
						C_Compliance = request.getParameter("Consultant_Compliance");
						String ccfromdate = request.getParameter("ccfromdate");
						String ccexpirydate = request.getParameter("ccexpirydate");
						// if (cc_edid == null || cc_edid =="" || cc_edid.isEmpty()) {
						contService.saveClientVendorDocs(cCompliance, C_Compliance, candidate_id, loginempno, null,
								vendorId, ccfromdate, ccexpirydate, vendorIdDb, null, emptype, payRateid);
						/*
						 * }else { contService.updateDocumentById(cCompliance, cc_edid, candidate_id,
						 * loginempno); }
						 */
					}
				}
				if (mailproofVendor != null) {
					if (!mailproofVendor.getOriginalFilename().isEmpty()) {
						String mailproofVen = request.getParameter("Manager_Approved_Email_VWO");
						contService.saveClientVendorDocs(mailproofVendor, mailproofVen, candidate_id, loginempno, null,
								vendorId, null, null, vendorIdDb, null, emptype, payRateid);
					}
				}
			} else {
				
				EmpPayRateDetails payrateObj=contService.getPayrateDetailsByPayrateId(payRateid, candidate_id);
				if(!payrateObj.getProj_startDate().equalsIgnoreCase(proj_startDate)) {
					CustomerDetails_DTO custObj=contService.getCustomerDetailsById(customerid);
					EmpBasicDetailsEntity empObj=contService.getEmployeeDetailsByCandidateId(candidateId);
					
					SimpleDateFormat format = new SimpleDateFormat("MM/dd/yyyy");
				    Date date = format.parse (proj_startDate);  
				    
	                SimpleDateFormat mdyFormat = new SimpleDateFormat("MM-dd-yyyy");
				    String newdate=mdyFormat.format(date);
				    
				    String projectStartdate=newdate.replace("-","");
					
					String productName=empObj.getFullName()+"_"+custObj.getCustObj().getCustomer_name()+projectStartdate;
					String desc="Consulting and Services";
					
					Integer productId=contService.saveProductServices(productName,billrate,payRate_Id,desc,"");

					String companyId = env.getProperty("CompanyID");  
					
				    URL url = new URL("https://sandbox-quickbooks.api.intuit.com/v3/company/"+companyId+"/item?minorversion=62");

				    HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			        conn.setRequestProperty("Authorization","Bearer "+access_token);
			        conn.setRequestProperty("Content-Type","application/json;charset=UTF-8");
			        conn.setDoOutput(true);
			        conn.setRequestMethod("POST");
			   
			        String json = "{\r\n" + 
			        		"  \"Name\": \""+productName+"\",\r\n" + 
			        		"  \"IncomeAccountRef\": {\r\n" + 
			        		"    \"value\": \"79\",\r\n" + 
			        		"    \"name\": \"Sales of Product Income\"\r\n" + 
			        		"  },\r\n" + 
			        		" \r\n" + 
			        		"  \"ExpenseAccountRef\": {\r\n" + 
			        		"    \"value\": \"80\",\r\n" + 
			        		"    \"name\": \"Cost of Goods Sold\"\r\n" + 
			        		"  },\r\n" + 
			        		"  \"AssetAccountRef\": {\r\n" + 
			        		"    \"value\": \"81\",\r\n" + 
			        		"    \"name\": \"Inventory Asset\"\r\n" + 
			        		"  },\r\n" + 
			        		"  \"UnitPrice\": "+billrate+", \r\n" + 
			        		"  \"Type\": \"Service\",\r\n" + 
			        		"  \"InvStartDate\": \"2015-01-01\",\r\n" + 
			        		"  \"Description\": \""+desc+"\"\r\n" + 
			        		"}";
			        
			        OutputStream os = conn.getOutputStream();
			           os.write(json.getBytes("UTF-8"));
			           os.close();

			        BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			        String output;
			        StringBuffer response1 = new StringBuffer();
			        while ((output = in.readLine()) != null) {
			        	response1.append(output);
			        	response1.append("\r");
			        }
			        in.close();
			        JSONObject obj_JSONObject = XML.toJSONObject(response1.toString());
			        jsonString=obj_JSONObject.toString();
			        
			        JSONObject jo = new JSONObject(jsonString).getJSONObject("IntuitResponse").getJSONObject("Item");
			        Integer qbproductid = jo.getInt("Id");
			        String message = contService.updateQBProductId(productId,qbproductid);
			        //empdto.setProductId(productId);
					//empdto.setJsonString(jsonString);
				}else if(payrateObj.getBillrate().equalsIgnoreCase(billrate)){
					
					/*ProductsEntity productObj=contService.getProductServicesByPayRateId(payRateid);
					Integer qbprod_id=productObj.getQb_productid();
					try {
					//	String invoice = request.getParameter("invoiceid");
						 String companyId = env.getProperty("CompanyID");  
						  URL url = new URL("https://sandbox-quickbooks.api.intuit.com/v3/company/"+companyId+"/item/"+qbprod_id+"?minorversion=62");
						 // String access_token = (String) request.getSession().getAttribute("access_token");
					        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
					        conn.setRequestProperty("Authorization","Bearer "+ access_token);
					        conn.setRequestProperty("Content-Type","application/json");
					        conn.setRequestMethod("GET");

					        BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
					        String output;
					        StringBuffer response1 = new StringBuffer();
					        while ((output = in.readLine()) != null) {
					            response1.append(output);
					            response1.append("\r");
					        }
					        in.close();
					        JSONObject obj_JSONObject = XML.toJSONObject(response1.toString());
					        String jsonString1 = obj_JSONObject.toString();
					        System.out.println("jsonString--"+jsonString1);
						      
					} catch (Exception e) {
						e.printStackTrace();
						logger.error("Error in get product sync token " + e);
					}
				*/}
			}

			String organization_name = null;
			String cand_job_title = null;
			String education = null;
			String workinglocation = null;
			String reason_lca = null;

			String remote_line1 = null;
			String remote_line2 = null;
			String remote_city = null;
			String remote_state = null;
			String remote_zipcode = null;
			String remote_county = null;
			String remote_soc_code = null;
			String metro_politan_area = null;

			upcvPayrateDetails = contService.updatepayratedetails(billrate, pay_rate, invoice_terms, proj_startDate,
					proj_endDate, p_term, customer_Id, vendorId, candidateId, payRate_Id, loginempno, payrolltype,invoice_period);
			System.out.println("upcvPayrateDetails*********" + upcvPayrateDetails);
			if (cworder != null) {
				if (!cworder.getOriginalFilename().isEmpty()) {
					c_work_order = request.getParameter("cust_work_order");
					String cwofromdate = request.getParameter("cwofromdate");
					String cwoexpirydate = request.getParameter("cwoexpirydate");

					// if (c_edid == null || c_edid =="" || c_edid.isEmpty()) {
					contService.saveClientVendorDocs(cworder, c_work_order, candidate_id, loginempno, customer_Id, null,
							cwofromdate, cwoexpirydate, null, customerIdDb, emptype, payRateid);
					/*
					 * }else { contService.updateDocumentById(cworder, c_edid, candidate_id,
					 * loginempno); }
					 */
				}
			}
			if (mailproofCustomer != null) {
				if (!mailproofCustomer.getOriginalFilename().isEmpty()) {
					String mailproofCust = request.getParameter("Manager_Approved_Email_CWO");
					contService.saveClientVendorDocs(mailproofCustomer, mailproofCust, candidate_id, loginempno,
							customer_Id, null, null, null, null, customerIdDb, emptype, payRateid);
				}
			}

			String companytype = "EndClient";
			String endclientid = request.getParameter("endclientid");
			Integer endclient_id = 0;
			if (!endclientid.isEmpty()) {
				endclient_id = Integer.parseInt(endclientid);
			}
			String endclient_name = request.getParameter("endclient_name");
			String project_name = request.getParameter("project_name");
			String endfed_id = request.getParameter("endfed_id");
			String endline1 = request.getParameter("endline1");
			String endline2 = request.getParameter("endline2");
			String endcity = request.getParameter("endcity");
			String endstate = request.getParameter("endstate");
			String endzipcode = request.getParameter("endzipcode");
			String endclient_mgr = request.getParameter("endclient_mgr_name");
			String endclient_mgr_email = request.getParameter("endclient_mgr_emailid");
			String endclient_mgr_extn = request.getParameter("endmgrdeskNumber");
			String endclient_emp_email = request.getParameter("endemp_emailid");
			String endclient_emp_extn = request.getParameter("endempdeskNumber");

			String work_authorization = request.getParameter("work_authorization");
			System.out.println("work_authorization" + work_authorization);
			if (work_authorization.equalsIgnoreCase("H-1B") && emptype.equalsIgnoreCase("W2")) {
				organization_name = request.getParameter("organization_name");
				cand_job_title = request.getParameter("cand_job_title");
				education = request.getParameter("education");
				workinglocation = request.getParameter("workinglocation");
				remote_county = request.getParameter("remote_county");
				remote_soc_code = request.getParameter("remote_soc_code");
				reason_lca = request.getParameter("reason_lca");
				metro_politan_area = request.getParameter("metro_politan_area");
				System.out.println("workinglocation********" + workinglocation);
				if (workinglocation != null) {
					if (workinglocation.equalsIgnoreCase("Remote/Home")) {
						remote_line1 = request.getParameter("remote_line1");
						remote_line2 = request.getParameter("remote_line2");
						remote_city = request.getParameter("remote_city");
						remote_state = request.getParameter("remote_state");
						remote_zipcode = request.getParameter("remote_zipcode");
					}
				}
			}
			upclientDetails = contService.updateClientDetails(endclient_name, endclient_mgr, endclient_mgr_email,
					endclient_mgr_extn, endclient_emp_email, endclient_emp_extn, endclient_id, candidate_id, endline1,
					endline2, endcity, endstate, endzipcode, companytype, loginempno, endfed_id, project_name,
					payRate_Id, organization_name, cand_job_title, education, remote_county, remote_soc_code,
					workinglocation, remote_line1, remote_line2, remote_city, remote_state, remote_zipcode,
					work_authorization, reason_lca, metro_politan_area);
			// System.out.println("upclientDetails***end*****"+upclientDetails);

			String[] otherclientid = request.getParameterValues("otherclientid");
			String[] othrclienttypes = request.getParameterValues("othrclienttype");
			String[] client_names = request.getParameterValues("otherclient_name");
			String[] fed_ids = request.getParameterValues("otherfed_id");
			String[] line1 = request.getParameterValues("otherline1");
			String[] line2 = request.getParameterValues("otherline2");
			String[] city = request.getParameterValues("othercity");
			String[] state = request.getParameterValues("otherstate");
			String[] zipcode = request.getParameterValues("otherzipcode");
			String[] client_mgrs = request.getParameterValues("otherclient_mgr_name");
			String[] client_mgr_emails = request.getParameterValues("otherclient_mgr_emailid");
			String[] client_mgr_extns = request.getParameterValues("othermgrdeskNumber");
			String[] client_emp_emails = request.getParameterValues("otheremp_emailid");
			String[] client_emp_extns = request.getParameterValues("otherempdeskNumber");

			if (otherclientid != null) {
				for (int i = 0; i < otherclientid.length; i++) {
					Integer otherclient_id = Integer.parseInt(otherclientid[i]);
					String othrclienttype = othrclienttypes[i];
					String client_name = client_names[i];
					String fed_id = fed_ids[i];
					String client_mgr = client_mgrs[i];
					String client_mgr_email = client_mgr_emails[i];
					String client_mgr_extn = client_mgr_extns[i];
					String client_emp_email = client_emp_emails[i];
					String client_emp_extn = client_emp_extns[i];
					String line11 = line1[i];
					String line21 = line2[i];
					String city1 = city[i];
					String state1 = state[i];
					String zipcode1 = zipcode[i];
					// String othercompanytype="OtherClient";
					// System.out.println("othrclienttype****"+othrclienttype);
					upclientDetails = contService.updateOtherClientDetails(client_name, client_mgr, client_mgr_email,
							client_mgr_extn, client_emp_email, client_emp_extn, otherclient_id, candidate_id, line11,
							line21, city1, state1, zipcode1, othrclienttype, loginempno, fed_id, payRate_Id);
				}
			}

			String[] lcaother_addr_ids = request.getParameterValues("lcaother_addr_id");
			String[] lcaline1s = request.getParameterValues("lcaotherline1");
			String[] lcaline2s = request.getParameterValues("lcaotherline2");
			String[] lcacitys = request.getParameterValues("lcaothercity");
			String[] lcastates = request.getParameterValues("lcaotherstate");
			String[] lcazipcodes = request.getParameterValues("lcaotherzipcode");
			String[] lcaothermetros = request.getParameterValues("lcaothermetro");
			if (lcaother_addr_ids != null) {
				for (int i = 0; i < lcaother_addr_ids.length; i++) {
					Integer lcaaddr_id = Integer.parseInt(lcaother_addr_ids[i]);
					String lca_line1 = lcaline1s[i];
					String lca_line2 = lcaline2s[i];
					String lca_city = lcacitys[i];
					String lca_state = lcastates[i];
					String lca_zipcode = lcazipcodes[i];
					String lca_othermetro = lcaothermetros[i];
					// String othercompanytype="OtherClient";
					// System.out.println("othrclienttype****"+othrclienttype);
					immiService.updateCompanyAddress(lcaaddr_id, loginempno, lca_line1, lca_line2, lca_city, lca_state,
							lca_zipcode, lca_othermetro);
				}
			}

			String[] lca_othr_line1s = request.getParameterValues("lca_othr_line1[]");
			String[] lca_othr_line2s = request.getParameterValues("lca_othr_line2[]");
			String[] lca_othr_citys = request.getParameterValues("lca_othr_city[]");
			String[] lca_othr_states = request.getParameterValues("lca_othr_state[]");
			String[] lca_othr_zipcodes = request.getParameterValues("lca_othr_zipcode[]");
			String[] lca_othr_remote_metros = request.getParameterValues("lca_othr_remote_metro[]");

			if (lca_othr_line1s != null) {
				for (int t = 1; t < lca_othr_line1s.length; t++) {
					String lca_othr_line1 = lca_othr_line1s[t];
					String lca_othr_line2 = lca_othr_line2s[t];
					String lca_othr_city = lca_othr_citys[t];
					String lca_othr_state = lca_othr_states[t];
					String lca_othr_zipcode = lca_othr_zipcodes[t];
					String lca_othr_metro = lca_othr_remote_metros[t];
					String lcompanytype = "LCALocation";
					immiService.saveCompanyAddress(endclient_id, lcompanytype, loginempno, lca_othr_line1,
							lca_othr_line2, lca_othr_city, lca_othr_state, lca_othr_zipcode, lca_othr_metro);
				}
			}

			// System.out.println("upclientDetails****other****"+upclientDetails);

			String[] othr_client_types = request.getParameterValues("othr_client_type[]");
			String[] othr_client_names = request.getParameterValues("othr_client_name[]");
			String[] othr_fed_ids = request.getParameterValues("othr_fed_id[]");
			String[] othr_client_mgrs = request.getParameterValues("othr_client_mgr[]");
			String[] othr_client_mgr_emails = request.getParameterValues("othr_client_mgr_email[]");
			String[] othr_client_mgr_extns = request.getParameterValues("othr_client_mgr_extn[]");
			String[] othr_emp_email_clients = request.getParameterValues("othr_emp_email_client[]");
			String[] othr_emp_client_extns = request.getParameterValues("othr_emp_client_extn[]");
			String[] othr_line1s = request.getParameterValues("othr_line1[]");
			String[] othr_line2s = request.getParameterValues("othr_line2[]");
			String[] othr_citys = request.getParameterValues("othr_city[]");
			String[] othr_states = request.getParameterValues("othr_state[]");
			String[] othr_zipcodes = request.getParameterValues("othr_zipcode[]");

			// System.out.println("******othr_client_types********"+othr_client_types);
			if (othr_client_names != null) {
				for (int t = 1; t < othr_client_names.length; t++) {
					String othr_client_type = othr_client_types[t];
					String othr_client_name = othr_client_names[t];
					String othr_fed_id = othr_fed_ids[t];
					String othr_client_mgr = othr_client_mgrs[t];
					String othr_client_mgr_email = othr_client_mgr_emails[t];
					String othr_client_mgr_extn = othr_client_mgr_extns[t];
					String othr_emp_email_client = othr_emp_email_clients[t];
					String othr_emp_client_extn = othr_emp_client_extns[t];
					String othr_line1 = othr_line1s[t];
					String othr_line2 = othr_line2s[t];
					String othr_city = othr_citys[t];
					String othr_state = othr_states[t];
					String othr_zipcode = othr_zipcodes[t];
					// String othr_client_type="OtherClient";

					Integer clientId = contService.saveOtherClientDetails(othr_client_name, othr_fed_id,
							othr_client_mgr, othr_client_mgr_email, othr_client_mgr_extn, othr_emp_email_client,
							othr_emp_client_extn, candidateId, loginempno, othr_client_type, payRate_Id);
					if (clientId != 0) {
						companytype = othr_client_type;
						contService.saveCompanyAddress(clientId, companytype, loginempno, othr_line1, othr_line2,
								othr_city, othr_state, othr_zipcode,"");
					}
				}
			}

			/*
			 * if(upcvPayrateDetails.equalsIgnoreCase("Success") ||
			 * upclientDetails.equalsIgnoreCase("Success")) {
			 */
			EmpBasicDetailsEntity empObj = contService.getEmployeeDetailsByCandidateId(candidateId);
			String message = "Client & Vendor Details Updated Successfully";
			empdto.setMessage(message);
			
			// empdto.setCandidateId(empObj.getCandidate_id());
			empdto.setCandidateId(candidateId);
			empdto.setEmpType(emptype);

			/* } */
		} catch (Exception e) {
			logger.error("Error in ContractorsController method updateClientVendor" + e.getMessage());
		}
		return empdto;
	}

	@RequestMapping(value = { "/addConsultantDocs" }, method = RequestMethod.GET)
	public String addConsultantDocs(Model model, HttpServletRequest request, HttpServletResponse response) {
		String userName = (String) request.getSession().getAttribute("username");
		try {
			if (userName == null) {
				return "redirect:/loginpage";
			} else {
				HttpSession session = request.getSession(true);
				String candidate_id = request.getParameter("candidate_id");
				String empType = request.getParameter("empType");
				if (empType.equalsIgnoreCase("1099")) {
					AttachmentBean attachmentBean = contService.getFilesByCandidateId(candidate_id);
					session.setAttribute("attachmentBean", attachmentBean);
				}
				EmployeeDto basicObj = contService.getCanidateDetailsByCanId(candidate_id);
				model.addAttribute("basicObj", basicObj);

				session.setAttribute("empType", empType);
				session.setAttribute("candidate_id", candidate_id);
			}
		} catch (Exception e) {
			logger.error("Error while in ContractorsController method addConsultantDocs" + e);
		}
		return "AddConsultantDocs";
	}

	@RequestMapping(value = { "/saveConsultantDocs" }, method = RequestMethod.POST)
	public String saveConsultantDocs(Model model, HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value = "othr_c2c_file[]", required = false) CommonsMultipartFile othr_c2c_file[]) {
		String msg = null;
		String userName = (String) request.getSession().getAttribute("username");
		try {
			if (userName == null) {
				return "redirect:/loginpage";
			} else {
				HttpSession session = request.getSession(true);
				String candidate_id = request.getParameter("candidate_id");
				String empType = request.getParameter("empType");
				Integer loginempno = (Integer) session.getAttribute("empno");

				String filetype = "additionaldocs_C2C";
				String[] other_c2c_doc = request.getParameterValues("other_c2c_doc[]");
				msg = contService.saveConsultantDocs(othr_c2c_file, filetype, other_c2c_doc, candidate_id, loginempno);
				/*
				 * if(msg.equalsIgnoreCase("Success")) {
				 * 
				 * PrintWriter out = response.getWriter();
				 * out.println("<script type=\"text/javascript\">");
				 * out.println("alert('Documents Uploaded Successfully');");
				 * out.println("window.location='addClientVendor?candidate_id="+candidate_id+
				 * "&empType="+empType+"'"); out.println("</script>"); out.close(); }
				 */

				if (msg.equalsIgnoreCase("Success")) {
					contService.updatePageStatus(candidate_id);
					PrintWriter out = response.getWriter();
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Documents Uploaded Successfully');");
					out.println("window.location='viewConsultantDocs?candidate_id=" + candidate_id + "&empType="
							+ empType + "'");
					out.println("</script>");
					out.close();
					/*
					 * PageStatusEntity pageObj =
					 * contService.getRedirectPageStatus(Integer.parseInt(candidate_id));
					 * if(pageObj.getClient_status()==0) { PrintWriter out = response.getWriter();
					 * out.println("<script type=\"text/javascript\">");
					 * out.println("alert('Documents Uploaded Successfully');");
					 * out.println("window.location='addClientVendor?candidate_id="+candidate_id+
					 * "&empType="+empType+"'"); out.println("</script>"); out.close(); }else {
					 * PrintWriter out = response.getWriter();
					 * out.println("<script type=\"text/javascript\">");
					 * out.println("alert('Documents Uploaded Successfully');");
					 * out.println("window.location='viewClientVendor?candidate_id="+candidate_id+
					 * "&empType="+empType+"'"); out.println("</script>"); out.close(); }
					 */
				}
				session.setAttribute("empType", empType);
				session.setAttribute("candidate_id", candidate_id);
			}
		} catch (Exception e) {
			logger.error("Error while in ContractorsController method saveConsultantDocs" + e);
		}
		return null;
	}

	@RequestMapping(value = { "/saveConsultantAddDocs" }, method = RequestMethod.POST)
	public String saveConsultantAddDocs(Model model, HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value = "othr_c2c_file[]", required = false) CommonsMultipartFile othr_c2c_file[],
			@RequestParam(value = "othr_1099_file[]", required = false) CommonsMultipartFile othr_1099_file[],
			@RequestParam(value = "addFile", required = false) MultipartFile addFile) {
		String msg = null;
		String userName = (String) request.getSession().getAttribute("username");
		try {
			if (userName == null) {
				return "redirect:/loginpage";
			} else {
				HttpSession session = request.getSession(true);
				String candidate_id = request.getParameter("candidate_id");
				String empType = request.getParameter("empType");
				Integer loginempno = (Integer) session.getAttribute("empno");
				String filetype = null;
				if (othr_c2c_file != null) {
					filetype = "additionaldocs_C2C";
					String[] other_c2c_doc = request.getParameterValues("other_c2c_doc[]");
					msg = contService.saveConsultantDocs(othr_c2c_file, filetype, other_c2c_doc, candidate_id,
							loginempno);
				}
				if (othr_1099_file != null) {
					filetype = "additionaldocs_1099";
					String[] other_1099_doc = request.getParameterValues("other_1099_doc[]");
					msg = contService.saveConsultantDocs(othr_1099_file, filetype, other_1099_doc, candidate_id,
							loginempno);
				}
				if (addFile != null) {
					filetype = request.getParameter("afileType");
					msg = contService.saveConsultantDoc(addFile, filetype, candidate_id, loginempno);
				}

				if (msg.equalsIgnoreCase("Success")) {
					PrintWriter out = response.getWriter();
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Documents Uploaded Successfully');");
					out.println("window.location='viewConsultantDocs?candidate_id=" + candidate_id + "&empType="
							+ empType + "'");
					out.println("</script>");
					out.close();
				}
				session.setAttribute("empType", empType);
				session.setAttribute("candidate_id", candidate_id);
			}
		} catch (Exception e) {
			logger.error("Error while in ContractorsController method saveConsultantAddDocs" + e);
		}
		return msg;
	}

	@RequestMapping(value = { "/saveConsultantDocs1099" }, method = RequestMethod.POST)
	public String saveConsultantDocs1099(Model model, HttpServletRequest request, HttpServletResponse response,
			@RequestParam(name = "WA_copy", required = false) MultipartFile WA_copy,
			@RequestParam(name = "W9_copy", required = false) MultipartFile W9_copy,
			@RequestParam(name = "SSNCopy", required = false) MultipartFile SSNCopy,
			@RequestParam(name = "mgr_approved_mail", required = false) MultipartFile mgr_mail_proofDoc,
			@RequestParam(value = "othr_1099_file[]", required = false) CommonsMultipartFile othr_1099_file[]) {
		String msg = null;
		String userName = (String) request.getSession().getAttribute("username");
		try {
			if (userName == null) {
				return "redirect:/loginpage";
			} else {
				String filetype = null;
				String wafromdate = "";
				String waexpirydate = "";
				// MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest)
				// request;
				HttpSession session = request.getSession(true);
				String candidate_id = request.getParameter("candidate_id");
				String empType = request.getParameter("empType");
				Integer loginempno = (Integer) session.getAttribute("empno");

				if (WA_copy != null) {
					wafromdate = request.getParameter("wafromdate");
					waexpirydate = request.getParameter("waexpirydate");
				}
				msg = contService.saveConsultantDocs1099(WA_copy, W9_copy, SSNCopy, mgr_mail_proofDoc, candidate_id,
						loginempno, wafromdate, waexpirydate);
				if (othr_1099_file != null) {
					filetype = "additionaldocs_1099";
					String[] other_1099_doc = request.getParameterValues("other_1099_doc[]");
					msg = contService.saveConsultantDocs(othr_1099_file, filetype, other_1099_doc, candidate_id,
							loginempno);
				}

				AttachmentBean attachmentBean = contService.getFilesByCandidateId(candidate_id);
				if ((attachmentBean.getWorkauthcopy() != null & attachmentBean.getW9copy() != null
						& attachmentBean.getSsncopy() != null) || attachmentBean.getMgmtaproval() != null) {
					System.out.println("*******all Docs*******");
					contService.updatePageStatus(candidate_id);
				}
				Integer candidateId = Integer.parseInt(candidate_id);
				PageStatusEntity pageObj = contService.getRedirectPageStatus(candidateId);
				if (msg.equalsIgnoreCase("Success")) {
					if (pageObj.getDocument_status() == 0) {
						PrintWriter out = response.getWriter();
						out.println("<script type=\"text/javascript\">");
						out.println("alert('Documents Uploaded Successfully');");
						out.println("window.location='addConsultantDocs?candidate_id=" + candidate_id + "&empType="
								+ empType + "'");
						out.println("</script>");
						out.close();
					} else {
						PrintWriter out = response.getWriter();
						out.println("<script type=\"text/javascript\">");
						out.println("alert('Documents Uploaded Successfully');");
						out.println("window.location='viewConsultantDocs?candidate_id=" + candidate_id + "&empType="
								+ empType + "'");
						out.println("</script>");
						out.close();

						/*
						 * if(pageObj.getClient_status()==0) { PrintWriter out = response.getWriter();
						 * out.println("<script type=\"text/javascript\">");
						 * out.println("alert('Documents Uploaded Successfully');");
						 * out.println("window.location='addClientVendor?candidate_id="+candidate_id+
						 * "&empType="+empType+"'"); out.println("</script>"); out.close(); }else {
						 * PrintWriter out = response.getWriter();
						 * out.println("<script type=\"text/javascript\">");
						 * out.println("alert('Documents Uploaded Successfully');");
						 * out.println("window.location='viewClientVendor?candidate_id="+candidate_id+
						 * "&empType="+empType+"'"); out.println("</script>"); out.close(); }
						 */
					}
				}
				session.setAttribute("empType", empType);
				session.setAttribute("candidate_id", candidate_id);
			}
		} catch (Exception e) {
			logger.error("Error while in ContractorsController method saveConsultantDocs1099" + e);
		}
		return msg;
	}

	@RequestMapping(value = { "/viewConsultantDocs" }, method = RequestMethod.GET)
	public String viewConsultantDocs(Model model, HttpServletRequest request, HttpServletResponse response) {
		String userName = (String) request.getSession().getAttribute("username");
		try {
			if (userName == null) {
				return "redirect:/loginpage";
			} else {

				HttpSession session = request.getSession(true);
				String candidate_id = request.getParameter("candidate_id");
				String empType = request.getParameter("empType");
				ViewDocBean docObj = contService.getConsultantDocsByCandidateId(candidate_id, empType);
				EmployeeDto basicObj = contService.getCanidateDetailsByCanId(candidate_id);
				model.addAttribute("basicObj", basicObj);

				session.setAttribute("viewbean", docObj);
				session.setAttribute("empType", empType);
				session.setAttribute("candidate_id", candidate_id);
			}
		} catch (Exception e) {
			logger.error("Error while in ContractorsController method saveConsultantDocs1099" + e);
		}
		return "viewConsultantDocs";
	}

	@RequestMapping(value = { "/deleteConsultantDocument" }, method = RequestMethod.POST)
	public String deleteConsultantDocument(Model model, HttpServletRequest request, HttpServletResponse response) {
		try {
			HttpSession session = request.getSession(true);
			String userName = (String) request.getSession().getAttribute("username");
			if (userName == null) {
				return "redirect:/loginpage";
			} else {
				String candidate_id = request.getParameter("candidate_id");
				String empType = request.getParameter("empType");
				String fileId = request.getParameter("fileId");
				String msg = contService.deleteConsultantDocumentByDocId(fileId);
				session.setAttribute("candidate_id", candidate_id);
				if (msg.equalsIgnoreCase("Success")) {
					PrintWriter out = response.getWriter();
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Document Deleted  Successfully');");
					out.println("window.location='viewConsultantDocs?candidate_id=" + candidate_id + "&empType="
							+ empType + "'");
					out.println("</script>");
					out.close();
				} else {
					PrintWriter out = response.getWriter();
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Document not deleted');");
					out.println("window.location='viewConsultantDocs?candidate_id=" + candidate_id + "&empType="
							+ empType + "'");
					out.println("</script>");
					out.close();
				}
			}
		} catch (Exception e) {
			logger.error("Error while in deleteConsultantDocument" + e);
		}
		return null;
	}

	@RequestMapping(value = { "/EditDocument" }, method = RequestMethod.POST)
	public String EditDocument(Model model, HttpServletRequest request, HttpServletResponse response,
			@RequestParam("editFile") MultipartFile editFile) {
		try {
			String userName = (String) request.getSession().getAttribute("username");
			if (userName == null) {
				return "redirect:/loginpage";
			} else {
				HttpSession session = request.getSession(true);
				String candidate_id = request.getParameter("candidate_id");
				String empType = request.getParameter("empType");
				String fileId = request.getParameter("fileId");
				String fileType = request.getParameter("fileType");
				Integer loginempno = (Integer) session.getAttribute("empno");
				String msg = contService.updateDocumentById(editFile, fileId, candidate_id, loginempno, fileType);

				session.setAttribute("emp_type", empType);
				session.setAttribute("candidate_id", candidate_id);
				if (msg.equalsIgnoreCase("Success")) {
					PrintWriter out = response.getWriter();
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Documents Uploaded Successfully');");
					out.println("window.location='viewConsultantDocs?candidate_id=" + candidate_id + "&empType="
							+ empType + "'");
					out.println("</script>");
					out.close();
				}
			}
		} catch (Exception e) {
			logger.error("Error while in ContractorsController method EditDocument" + e);
		}
		return null;
	}

	@RequestMapping(value = { "/addConsultantBankDetails" }, method = RequestMethod.GET)
	public String addbankc(Model model, HttpServletRequest request, HttpServletResponse response) {
		String userName = (String) request.getSession().getAttribute("username");
		try {
			if (userName == null) {
				return "redirect:/loginpage";
			} else {
				HttpSession session = request.getSession(true);
				String candidate_id = request.getParameter("candidate_id");
				String empType = request.getParameter("empType");
				List<ClientVendorMaster_DTO> vendorlist = contService.viewVendorDetailsByCandidateId(candidate_id,"");

				session.setAttribute("vendorList", vendorlist);
				session.setAttribute("empType", empType);
				session.setAttribute("candidate_id", candidate_id);
			}
		} catch (Exception e) {
			logger.error("Error occured in addConsultantBankDetails ---", e);
		}
		return "ConsultantBankDetails";
	}

	@RequestMapping(value = { "/saveConsultantBankDetails" }, method = RequestMethod.POST)
	public void saveConsultantBankDetails(HttpServletRequest request, Model model, HttpServletResponse response,
			@RequestParam(name = "bfile", required = false) MultipartFile file1) {
		try {
			String userName = (String) request.getSession().getAttribute("username");
			if (userName == null) {
				PrintWriter out = response.getWriter();
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Session Expired');");
				out.println("location='loginpage");
				out.println("</script>");
				out.close();
			} else {
				String message = null;
				MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
				HttpSession session = request.getSession(true);
				String accountNo = request.getParameter("acc_no");
				String bankname = request.getParameter("bank_name");
				String swiftcode = request.getParameter("swift_code");
				String ibancode = request.getParameter("ibank_code");
				String routingno = request.getParameter("bank_routing");
				// String bankamount = request.getParameter("bank_amount");
				String candidate_id = request.getParameter("candidate_id");
				Integer loginempno = (Integer) session.getAttribute("empno");
				String empType = request.getParameter("empType");
				if (empType.equalsIgnoreCase("C2C")) {
					String vendor = request.getParameter("vendorid");
					String paymentMode = request.getParameter("paymentMode");
					message = contService.saveConsultantBankDetails(accountNo, bankname, swiftcode, ibancode, routingno,
							file1, candidate_id, loginempno, paymentMode, vendor);
				} else {
					message = contService.saveConsultantBankDetails(accountNo, bankname, swiftcode, ibancode, routingno,
							file1, candidate_id, loginempno, null, null);
				}

				if (request.getParameterValues("btncount") != null) {
					String bankBtnVal[] = request.getParameterValues("btncount");
					for (int i = 1; i <= bankBtnVal.length; i++) {
						String accountNo1 = request.getParameter("acc_name" + i + "");
						String bankname1 = request.getParameter("bank_name" + i + "");
						String swiftcode1 = request.getParameter("swift_code" + i + "");
						String ibancode1 = request.getParameter("ibank_code" + i + "");
						String routingno1 = request.getParameter("bank_routing" + i + "");
						// String bankamount1 = request.getParameter("bank_amount"+i+"");
						MultipartFile ofile = multipartRequest.getFile("ofile" + i);
						message = contService.saveConsultantBankDetails(accountNo1, bankname1, swiftcode1, ibancode1,
								routingno1, ofile, candidate_id, loginempno, null, null);
					}
				}

				if (message.equalsIgnoreCase("Success")) {
					PrintWriter out = response.getWriter();
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Employee Bank Details Added Successfully');");
					out.println("location='viewConsultantBankDetails?candidate_id=" + candidate_id + "&empType="
							+ empType + "'");
					out.println("</script>");
					out.close();
				}
			}
		} catch (Exception e) {
			logger.error("Error occured in saveConsultantBankDetails ---", e);
		}
	}

	@RequestMapping(value = { "/viewConsultantBankDetails" }, method = RequestMethod.GET)
	public String viewConsultantBankDetails(Model model, HttpServletRequest request, HttpServletResponse response) {
		String userName = (String) request.getSession().getAttribute("username");
		try {
			if (userName == null) {
				return "redirect:/loginpage";
			} else {
				HttpSession session = request.getSession();
				String candidate_id = request.getParameter("candidate_id");
				String empType = request.getParameter("empType");
				List<BankPaymentDetailsEntity> conBanklist = contService.viewConsultantBankDetails(candidate_id);
				// EmpBasicDetailsEntity
				// basicObj=contService.getEmployeeDetailsByCandidateId(Integer.parseInt(userid));
				// session.setAttribute("basicObj", basicObj);
				List<ClientVendorMaster_DTO> vendorlist = contService.viewVendorDetailsByCandidateId(candidate_id,
						null);

				session.setAttribute("vendorList", vendorlist);
				session.setAttribute("conBanklist", conBanklist);
				session.setAttribute("empType", empType);
				session.setAttribute("candidate_id", candidate_id);
			}
		} catch (Exception e) {
			logger.error("Error occured in viewConsultantBankDetails ---", e);
		}
		return "UpdateConsultantBankDetails";
	}

	@RequestMapping(value = { "/updateConsultantBankDetails" }, method = RequestMethod.POST)
	public String updateConsultantBankDetails(Model model, HttpServletRequest request, HttpServletResponse response,
			@RequestParam(name = "bfile1", required = false) MultipartFile bfile1,
			@RequestParam(value = "bfile2", required = false) CommonsMultipartFile bfile2[]) {
		String userName = (String) request.getSession().getAttribute("username");
		Integer loginempno = (Integer) request.getSession().getAttribute("empno");
		HttpSession session = request.getSession();
		String message = null;
		String fileName = "";
		try {
			if (userName == null) {
				return "redirect:/loginpage";
			} else {
				String candidate_id = request.getParameter("candidate_id");
				String empType = request.getParameter("empType");
				MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
				if (empType.equalsIgnoreCase("C2C")) {
					String vendor = request.getParameter("vendorid");
					String paymentMode = request.getParameter("paymentMode");
					String accountNo = request.getParameter("acc_no");
					String bankname = request.getParameter("bank_name");
					String swiftcode = request.getParameter("swift_code");
					String ibancode = request.getParameter("ibank_code");
					String routingno = request.getParameter("bank_routing");
					String cpayment_id = request.getParameter("cpayment_id");

					message = contService.updateConsultantBankDetailsC2C(accountNo, bankname, swiftcode, ibancode,
							routingno, bfile1, candidate_id, loginempno, paymentMode, vendor, cpayment_id);
				} else {
					String[] payment_idb = request.getParameterValues("payment_idb");
					String[] accountNo = request.getParameterValues("txtAccount");
					String[] bankname = request.getParameterValues("txtBank");
					String[] swiftcode = request.getParameterValues("txtswift");
					String[] ibancode = request.getParameterValues("txtiban");
					String[] routingno = request.getParameterValues("txtrouting");
					message = contService.updateConsultantBankDetails(accountNo, bankname, swiftcode, ibancode,
							routingno, bfile2, candidate_id, payment_idb, loginempno);
				}
				if (request.getParameterValues("bankbtncount") != null) {
					String bankBtnVal[] = request.getParameterValues("bankbtncount");
					for (int i = 1; i <= bankBtnVal.length; i++) {
						String accountNo1 = request.getParameter("acc_name" + i + "");
						String bankname1 = request.getParameter("bank_name" + i + "");
						String swiftcode1 = request.getParameter("swift_code" + i + "");
						String ibancode1 = request.getParameter("ibank_code" + i + "");
						String routingno1 = request.getParameter("bank_routing" + i + "");
						// String bankamount1 = request.getParameter("bank_amount"+i+"");
						MultipartFile ofile = multipartRequest.getFile("ofile" + i);
						message = contService.saveConsultantBankDetails(accountNo1, bankname1, swiftcode1, ibancode1,
								routingno1, ofile, candidate_id, loginempno, null, null);
					}
				}

				PrintWriter out = response.getWriter();
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Employee Bank Details Updated Successfully');");
				out.println("location='viewConsultantBankDetails?candidate_id=" + candidate_id + "&empType=" + empType
						+ "'");
				out.println("</script>");
				out.close();
			}
		} catch (Exception e) {
			logger.error("Error occured in updateConsultantBankDetails ---", e);
		}
		return null;
	}

	@RequestMapping(value = { "/getWorkAutharization" }, method = RequestMethod.GET)
	@ResponseBody
	public List<WorkAuthorization> getWorkAutharization(HttpServletRequest request, Model model,
			HttpServletResponse response) {
		List<WorkAuthorization> workAuthList = null;
		try {
			String emptype = request.getParameter("emptype");
			if (emptype.equalsIgnoreCase("1099")) {
				workAuthList = contService.getWorkAuthnListForContractors();
			} else {
				workAuthList = empService.getWorkAuthnList();
			}
		} catch (Exception e) {
			logger.error("Error occured in ContractorsController method getWorkAutharization ---", e);
		}
		return workAuthList;
	}

	@RequestMapping(value = { "/addClientCustomer" }, method = RequestMethod.GET)
	public String addClientCustomer(Model model, HttpServletRequest request, HttpServletResponse response) {
		String userName = (String) request.getSession().getAttribute("username");
		try {
			if (userName == null) {
				return "redirect:/loginpage";
			} else {
				HttpSession session = request.getSession(true);
				String candidate_id = request.getParameter("candidate_id");
				String empType = request.getParameter("empType");
				session.setAttribute("candidate_id", candidate_id);
				session.setAttribute("empType", empType);
				List<CompanyDetails_DTO> cutomerList = contService.getCustomerMasterList();
				model.addAttribute("cutomerList", cutomerList);
				List<CompanyDetails_DTO> vendorList = contService.getVendorMasterList();
				model.addAttribute("vendorList", vendorList);
				EmployeeDto basicObj = contService.getCanidateDetailsByCanId(candidate_id);
				session.setAttribute("basicObj", basicObj);
				List<SOCcodeMasterEntity> soccodeList = h1bService.getSocCodeMasterList();
				model.addAttribute("soccodeList", soccodeList);
				ClientVendorMaster_DTO countObj = null;
				if (basicObj != null) {
					countObj = contService.getclientsizebybillingtype(candidate_id, basicObj.getBilling());
					System.out.println(countObj.getClientcount() + "------countObj-----" + countObj.getInhousecount());
				}
				model.addAttribute("countObj", countObj);
				// return "AddClientCustomer";
			}

		} catch (Exception e) {
			logger.error("Error in empsearchbySSN " + e);
		}
		return "AddClientCustomer";
	}

	@RequestMapping(value = { "/saveClientCustomerDetails" }, method = RequestMethod.POST)
	@ResponseBody
	public EmployeeDto saveClientCustomer(Model model, HttpServletRequest request, HttpServletResponse response,
			@RequestParam(name = "cw_order", required = false) MultipartFile cworder,
			@RequestParam(name = "w_order", required = false) MultipartFile vworder,
			@RequestParam(name = "cagreement", required = false) MultipartFile cagreement,
			@RequestParam(name = "cCompliance", required = false) MultipartFile cCompliance,
			@RequestParam(name = "mgr_approved_mail_VWO", required = false) MultipartFile mailproofVendor,
			@RequestParam(name = "mgr_approved_mail_CWO", required = false) MultipartFile mailproofCustomer) {
		String message = null;
		String jsonString=null;
		EmployeeDto empdto = new EmployeeDto();
		try {
			 String access_token = (String) request.getSession().getAttribute("access_token");
			HttpSession session = request.getSession(true);
			Integer loginempno = (Integer) session.getAttribute("empno");

			String addedClientDetails = "";
			String billpayrateDetails = "";
			String vwofromdate = null;
			String vwoexpirydate = null;
			String ccfromdate = null;
			String ccexpirydate = null;
			Integer payrateId = null;
			String pay_rate = null;
			String pcurrency = null;
			String p_term = null;
			Integer customer_Id = null;
			Integer vendorId = null;
			String c_work_order = "cust_work_order";
			String v_work_order = "ven_work_order";
			String CC_Agreement = "Consultant_Consent_Agreement";
			String C_Compliance = "Consultant_Compliance";
			String mailproofCust = null;
			String mailproofVen = null;
			Integer clientId = 0;

			String organization_name = null;
			String cand_job_title = null;
			String education = null;
			String workinglocation = null;
			String reason_lca = null;

			String remote_line1 = null;
			String remote_line2 = null;
			String remote_city = null;
			String remote_state = null;
			String remote_zipcode = null;
			String remote_county = null;
			String remote_soc_code = null;
			String remote_metro_politan_area = null;

			String candidate_id = request.getParameter("candidate_id");
			Integer candidate_Id = 0;
			if (candidate_id != null) {
				candidate_Id = Integer.parseInt(candidate_id);
			}

			String customerid = request.getParameter("customertype");
			if (customerid != null) {
				customer_Id = Integer.parseInt(customerid);
			}
			if (mailproofCustomer != null) {
				if (!mailproofCustomer.getOriginalFilename().isEmpty()) {
					mailproofCust = request.getParameter("Manager_Approved_Email_CWO");
				}
			}

			if (mailproofVendor != null) {
				if (!mailproofVendor.getOriginalFilename().isEmpty()) {
					mailproofVen = request.getParameter("Manager_Approved_Email_VWO");
				}
			}

			String bill_rate = request.getParameter("bill_rate");
			String invoice_terms = request.getParameter("invoice_terms");
			String invoice_period = request.getParameter("invoice_period");
			String bcurrency = request.getParameter("bcurrency");
			String proj_startDate = request.getParameter("pro_startdate");
			String proj_endDate = request.getParameter("pro_enddate");
			String payrolltype = request.getParameter("payrolltype");

			String cwofromdate = request.getParameter("cwofromdate");
			String cwoexpirydate = request.getParameter("cwoexpirydate");

			String emptype = request.getParameter("emp_type");

			if (emptype.equalsIgnoreCase("C2C")) {
				String vendorid = request.getParameter("vendortype");
				if (vendorid != null) {
					vendorId = Integer.parseInt(vendorid);
				}
				pay_rate = request.getParameter("pay_rate");
				pcurrency = request.getParameter("pcurrency");
				p_term = request.getParameter("payment_terms");

				vwofromdate = request.getParameter("vwofromdate");
				vwoexpirydate = request.getParameter("vwoexpirydate");
				ccfromdate = request.getParameter("ccfromdate");
				ccexpirydate = request.getParameter("ccexpirydate");

			} else {
				
				
				

			}
			payrateId = contService.savePayRateBillRateDetails(bill_rate, pay_rate, invoice_terms, proj_startDate,
					proj_endDate, p_term, customer_Id, vendorId, candidate_Id, bcurrency, pcurrency, cworder,
					c_work_order, vworder, v_work_order, cagreement, CC_Agreement, cCompliance, C_Compliance,
					mailproofCustomer, mailproofCust, mailproofVendor, mailproofVen, emptype, loginempno, payrolltype,
					cwofromdate, cwoexpirydate, vwofromdate, vwoexpirydate, ccfromdate, ccexpirydate,invoice_period);

			String client_name = request.getParameter("client_name");
			String project_name = request.getParameter("project_name");
			String fed_id = request.getParameter("fed_id");
			String client_mgr = request.getParameter("client_mgr_name");
			String client_mgr_email = request.getParameter("client_mgr_emailid");
			String client_mgr_extn = request.getParameter("mgrdeskNumber");
			String client_emp_email = request.getParameter("emp_emailid");
			String client_emp_extn = request.getParameter("empdeskNumber");
			String line1 = request.getParameter("line1");
			String line2 = request.getParameter("line2");
			String city = request.getParameter("city");
			String state = request.getParameter("state");
			String zipcode = request.getParameter("zipcode");
			String client_type = "EndClient";

			String lcaenddate = null;
			String lcastartdate = null;
			String wageRate = null;
			String metro_politan_area = null;
			String lcaPostedDate = null;
			String wr_option = null;
			String job_duties = null;
			String work_authorization = request.getParameter("work_authorization");
			if (work_authorization.equalsIgnoreCase("H-1B") && emptype.equalsIgnoreCase("W2")) {
				organization_name = request.getParameter("organization_name");
				cand_job_title = request.getParameter("cand_job_title");
				education = request.getParameter("education");
				workinglocation = request.getParameter("workinglocation");
				reason_lca = request.getParameter("reason_lca");
				remote_county = request.getParameter("remote_county");
				remote_soc_code = request.getParameter("remote_soc_code");
				wr_option = request.getParameter("wr_option");
				job_duties = request.getParameter("job_duties");
				wageRate = request.getParameter("wageRate");
				lcastartdate = request.getParameter("lcaBeginDate");
				lcaenddate = request.getParameter("lcaEndDate");
				lcaPostedDate = request.getParameter("lcaPostedDate");

				metro_politan_area = request.getParameter("metro_politan_area");

				if (workinglocation.equalsIgnoreCase("Remote/Home")) {
					remote_line1 = request.getParameter("remote_line1");
					remote_line2 = request.getParameter("remote_line2");
					remote_city = request.getParameter("remote_city");
					remote_state = request.getParameter("remote_state");
					remote_zipcode = request.getParameter("remote_zipcode");
					remote_metro_politan_area = request.getParameter("remote_metro_politan_area");
				}

			}

			clientId = contService.saveClientDetails(client_name, fed_id, client_mgr, client_mgr_email, client_mgr_extn,
					client_emp_email, client_emp_extn, candidate_Id, loginempno, project_name, client_type, payrateId,
					organization_name, cand_job_title, education, workinglocation, remote_county, remote_soc_code,
					reason_lca, lcastartdate, lcaenddate, wageRate, metro_politan_area, lcaPostedDate, wr_option,
					job_duties);
			String companytype = "";
			if (clientId != 0) {
				companytype = "EndClient";
				addedClientDetails = "Success";
				if (work_authorization.equalsIgnoreCase("H-1B") && emptype.equalsIgnoreCase("W2")) {
					immiService.saveCompanyAddress(clientId, companytype, loginempno, line1, line2, city, state,
							zipcode, metro_politan_area);
				} else {
					contService.saveCompanyAddress(clientId, companytype, loginempno, line1, line2, city, state,
							zipcode,"");
				}
				if (workinglocation != null && workinglocation.equalsIgnoreCase("Remote/Home")) {
					companytype = "Remote/Home";
					immiService.saveCompanyAddress(clientId, companytype, loginempno, remote_line1, remote_line2,
							remote_city, remote_state, remote_zipcode, remote_metro_politan_area);
				}
			} else {
				addedClientDetails = "Error";
			}

			String[] lca_othr_line1s = request.getParameterValues("lca_othr_line1[]");
			String[] lca_othr_line2s = request.getParameterValues("lca_othr_line2[]");
			String[] lca_othr_citys = request.getParameterValues("lca_othr_city[]");
			String[] lca_othr_states = request.getParameterValues("lca_othr_state[]");
			String[] lca_othr_zipcodes = request.getParameterValues("lca_othr_zipcode[]");
			String[] lca_othr_remote_metros = request.getParameterValues("lca_othr_remote_metro[]");

			if (lca_othr_line1s != null) {
				for (int t = 1; t < lca_othr_line1s.length; t++) {
					String lca_othr_line1 = lca_othr_line1s[t];
					String lca_othr_line2 = lca_othr_line2s[t];
					String lca_othr_city = lca_othr_citys[t];
					String lca_othr_state = lca_othr_states[t];
					String lca_othr_zipcode = lca_othr_zipcodes[t];
					String lca_othr_metro = lca_othr_remote_metros[t];
					// String othr_client_type="OtherClient";
					if (clientId != 0) {
						String lcompanytype = "LCALocation";
						immiService.saveCompanyAddress(clientId, lcompanytype, loginempno, lca_othr_line1,
								lca_othr_line2, lca_othr_city, lca_othr_state, lca_othr_zipcode, lca_othr_metro);
					}
				}
			}

			String[] othr_client_types = request.getParameterValues("othr_client_type[]");
			String[] othr_client_names = request.getParameterValues("othr_client_name[]");
			String[] othr_fed_ids = request.getParameterValues("othr_fed_id[]");
			String[] othr_client_mgrs = request.getParameterValues("othr_client_mgr[]");
			String[] othr_client_mgr_emails = request.getParameterValues("othr_client_mgr_email[]");
			String[] othr_client_mgr_extns = request.getParameterValues("othr_client_mgr_extn[]");
			String[] othr_emp_email_clients = request.getParameterValues("othr_emp_email_client[]");
			String[] othr_emp_client_extns = request.getParameterValues("othr_emp_client_extn[]");
			String[] othr_line1s = request.getParameterValues("othr_line1[]");
			String[] othr_line2s = request.getParameterValues("othr_line2[]");
			String[] othr_citys = request.getParameterValues("othr_city[]");
			String[] othr_states = request.getParameterValues("othr_state[]");
			String[] othr_zipcodes = request.getParameterValues("othr_zipcode[]");

			if (othr_client_names != null) {
				for (int t = 1; t < othr_client_names.length; t++) {
					String othr_client_type = othr_client_types[t];
					String othr_client_name = othr_client_names[t];
					String othr_fed_id = othr_fed_ids[t];
					String othr_client_mgr = othr_client_mgrs[t];
					String othr_client_mgr_email = othr_client_mgr_emails[t];
					String othr_client_mgr_extn = othr_client_mgr_extns[t];
					String othr_emp_email_client = othr_emp_email_clients[t];
					String othr_emp_client_extn = othr_emp_client_extns[t];
					String othr_line1 = othr_line1s[t];
					String othr_line2 = othr_line2s[t];
					String othr_city = othr_citys[t];
					String othr_state = othr_states[t];
					String othr_zipcode = othr_zipcodes[t];
					// String othr_client_type="OtherClient";

					Integer otherclient_Id = contService.saveOtherClientDetails(othr_client_name, othr_fed_id,
							othr_client_mgr, othr_client_mgr_email, othr_client_mgr_extn, othr_emp_email_client,
							othr_emp_client_extn, candidate_Id, loginempno, othr_client_type, payrateId);
					if (otherclient_Id != 0) {
						companytype = othr_client_type;
						contService.saveCompanyAddress(otherclient_Id, companytype, loginempno, othr_line1, othr_line2,
								othr_city, othr_state, othr_zipcode,"");
					}
				}
			}
			
			
			CustomerDetails_DTO custObj=contService.getCustomerDetailsById(customerid);
			EmpBasicDetailsEntity empObj=contService.getEmployeeDetailsByCandidateId(candidate_Id);
			    SimpleDateFormat format = new SimpleDateFormat("MM/dd/yyyy");
			    Date date = format.parse (proj_startDate);  
			    System.out.println("date****"+date);
                SimpleDateFormat mdyFormat = new SimpleDateFormat("MM-dd-yyyy");
			    String newdate=mdyFormat.format(date);
			    System.out.println("newdate****"+newdate);
			    String projectStartdate=newdate.replace("-","");
			
			
			String productName=empObj.getFullName()+"_"+custObj.getCustObj().getCustomer_name()+projectStartdate;
			String desc="Consulting and Services";
			Integer productId=contService.saveProductServices(productName,bill_rate,payrateId,desc,"");
			
			//String name=productname+hireddate;
			String companyId = env.getProperty("CompanyID");  
			
		    URL url = new URL("https://sandbox-quickbooks.api.intuit.com/v3/company/"+companyId+"/item?minorversion=62");

		    HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestProperty("Authorization","Bearer "+access_token);
	        conn.setRequestProperty("Content-Type","application/json;charset=UTF-8");
	        conn.setDoOutput(true);
	        conn.setRequestMethod("POST");
	   
	        String json = "{\r\n" + 
	        		"  \"Name\": \""+productName+"\",\r\n" + 
	        		"  \"IncomeAccountRef\": {\r\n" + 
	        		"    \"value\": \"79\",\r\n" + 
	        		"    \"name\": \"Sales of Product Income\"\r\n" + 
	        		"  },\r\n" + 
	        		" \r\n" + 
	        		"  \"ExpenseAccountRef\": {\r\n" + 
	        		"    \"value\": \"80\",\r\n" + 
	        		"    \"name\": \"Cost of Goods Sold\"\r\n" + 
	        		"  },\r\n" + 
	        		"  \"AssetAccountRef\": {\r\n" + 
	        		"    \"value\": \"81\",\r\n" + 
	        		"    \"name\": \"Inventory Asset\"\r\n" + 
	        		"  },\r\n" + 
	        		"  \"UnitPrice\": "+bill_rate+", \r\n" + 
	        		"  \"Type\": \"Service\",\r\n" + 
	        		"  \"InvStartDate\": \"2015-01-01\",\r\n" + 
	        		"  \"Description\": \""+desc+"\"\r\n" + 
	        		"}";
	        
	        OutputStream os = conn.getOutputStream();
	           os.write(json.getBytes("UTF-8"));
	           os.close();

	        BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        String output;
	        StringBuffer response1 = new StringBuffer();
	        while ((output = in.readLine()) != null) {
	        	response1.append(output);
	        	response1.append("\r");
	        }
	        in.close();
	        JSONObject obj_JSONObject = XML.toJSONObject(response1.toString());
	        jsonString=obj_JSONObject.toString();
	        JSONObject jo = new JSONObject(jsonString).getJSONObject("IntuitResponse").getJSONObject("Item");
	        Integer qbproductid = jo.getInt("Id");
	        System.out.println("qbproductid*****"+qbproductid);
	        String messagee = contService.updateQBProductId(productId,qbproductid);
			if (payrateId != null && addedClientDetails.equalsIgnoreCase("Success")) {
				message = "New Client & Vendor Details Added Successfully";
				PageStatusEntity pageObj = contService.getRedirectPageStatus(candidate_Id);
				empdto.setMessage(message);
				empdto.setCandidateId(candidate_Id);
				empdto.setBankstatus(pageObj.getBank_status());
				empdto.setEmpType(emptype);
			} else {
				message = "New Client & Vendor Not Added";
			}
		} catch (Exception e) {
			logger.error("Error occured in saveClientCustomer ---", e);
		}
		return empdto;

	}

	@RequestMapping(value = { "/updateProjectStatus" }, method = RequestMethod.GET)
	@ResponseBody
	public String updateProjectStatus(Model model, HttpServletRequest request, HttpServletResponse response) {
		String userName = (String) request.getSession().getAttribute("username");
		String message = "";
		try {
			if (userName == null) {
				return "redirect:/loginpage";
			} else {
				HttpSession ses = request.getSession(true);
				String candidate_id = request.getParameter("candidate_id");
				String empType = request.getParameter("empType");
				String payrate_id = request.getParameter("payrate_id");
				String project_status = request.getParameter("project_status");

				message = contService.updateProjectStatus(candidate_id, empType, payrate_id, project_status);
			}
		} catch (Exception e) {
			logger.error("Error occured in updateProjectStatus ---", e);
		}
		return message;
	}

	@RequestMapping(value = { "/viewW2ClientVendor" }, method = RequestMethod.GET)
	public String viewW2ClientVendor(Model model, HttpServletRequest request, HttpServletResponse response) {
		String userName = (String) request.getSession().getAttribute("username");
		try {
			if (userName == null) {
				return "redirect:/loginpage";
			} else {
				HttpSession ses = request.getSession(true);

				String candidate_id = request.getParameter("candidate_id");
				String payrate_id = request.getParameter("payrate_id");
				String empType = request.getParameter("empType");

				ClientVendorMaster_DTO endClient = contService.viewEndClientDetailsByCandidateId(candidate_id,
						payrate_id);
				List<ClientVendorMaster_DTO> otherclientlist = contService.viewClientDetailsByCandidateId(candidate_id,
						payrate_id);
				List<ClientVendorMaster_DTO> custlist = contService.viewCustomerDetailsByCandidateId(candidate_id,
						payrate_id);
				List<ClientVendorMaster_DTO> vendorlist = contService.viewVendorDetailsByCandidateId(candidate_id,
						payrate_id);
				List<ClientVendorMaster_DTO> ccvlist = contService.viewEndclientByCandidateId(candidate_id);

				List<ClientVendorMaster_DTO> otherloclist = contService
						.viewOtherClientDetailsByCandidateId(candidate_id, payrate_id);

				List<SOCcodeMasterEntity> soccodeList = h1bService.getSocCodeMasterList();
				model.addAttribute("soccodeList", soccodeList);

				ArrayList<String> clietnTypelist = new ArrayList<String>();
				clietnTypelist.add("Primary Vendor");
				clietnTypelist.add("MSP");
				clietnTypelist.add("Implementation Partner");

				EmpPayRateDetails parateObj = contService.getPayrateDetailsByPayrateId(payrate_id, candidate_id);
				EmpPayRateDetails parateObjactive = contService.getActivePayrateDetailsByPayrateId("",
						candidate_id);
				List<ProjectDetailsHistoryDto> projectHistoryList = contService
						.getPayrateHistoryDetailsByPayrateId(payrate_id);
				if (parateObjactive != null) {
					int psize = 1;
					model.addAttribute("payratesize", psize);
				} else {
					int psize = 0;
					model.addAttribute("payratesize", psize);
				}

				viewDocsBean viewcvbean = contService.viewClientVendorDocsByCandidateId(candidate_id, payrate_id);
				List<CompanyDetails_DTO> cutomerList = contService.getCustomerMasterList();
				model.addAttribute("cutomerList", cutomerList);
				List<CompanyDetails_DTO> vendorList = contService.getVendorMasterList();
				model.addAttribute("vendorList", vendorList);
				EmployeeDto basicObj = contService.getCanidateDetailsByCanId(candidate_id);
				if (basicObj == null) {
					int activestatus = 0;
					System.out.println("viewClientVendor   33333333333333333 else");
					model.addAttribute("activestatus", activestatus);
				} else {
					int activestatus = 1;
					System.out.println("viewClientVendor   44444444444444 else");
					model.addAttribute("activestatus", activestatus);
				}
				ClientVendorMaster_DTO countObj = null;
				if (basicObj != null) {
					countObj = contService.getclientsizebybillingtype(candidate_id, basicObj.getBilling());
				}

				model.addAttribute("countObj", countObj);

				model.addAttribute("projectHistoryList", projectHistoryList);
				model.addAttribute("basicObj", basicObj);
				model.addAttribute("otherclientlist", otherclientlist);
				model.addAttribute("activeclientlist", otherclientlist.size());

				model.addAttribute("otherloclist", otherloclist);
				model.addAttribute("custlist", custlist);
				model.addAttribute("vendorlist", vendorlist);
				model.addAttribute("viewcvbean", viewcvbean);
				model.addAttribute("endClient", endClient);
				model.addAttribute("ccvlist", ccvlist);
				model.addAttribute("parateObj", parateObj);
				model.addAttribute("ccvlistsize", ccvlist.size());
				model.addAttribute("clietnTypelist", clietnTypelist);
				ses.setAttribute("candidate_id", candidate_id);
				ses.setAttribute("empType", empType);
			}
		} catch (Exception e) {
			logger.error("Error occured in viewW2ClientVendor ---", e);
		}
		return "EditW2ClientVendor";
	}

	@RequestMapping(value = { "/editCustomer" }, method = RequestMethod.GET)
	public String editCustomer(Model model, HttpServletRequest request, HttpServletResponse response) {
		String userName = (String) request.getSession().getAttribute("username");
		try {
			if (userName == null) {
				return "redirect:/loginpage";
			} else {
				HttpSession session = request.getSession(true);
				String id = request.getParameter("id");
				CustomerDetails_DTO customerObj = contService.getCustomerDetailsById(id);
				session.setAttribute("customerObj", customerObj);
			}
		} catch (Exception e) {
			logger.error("Error occured in editCustomer ---", e);
		}
		return "UpdateCustomer";
	}

	@RequestMapping(value = { "/editVendor" }, method = RequestMethod.GET)
	public String editVendor(Model model, HttpServletRequest request, HttpServletResponse response) {
		String userName = (String) request.getSession().getAttribute("username");
		try {
			if (userName == null) {
				return "redirect:/loginpage";
			} else {
				HttpSession session = request.getSession(true);
				String id = request.getParameter("id");
				VendorDetails_DTO vendetobj = contService.getVendorDetailsById(id);
				session.setAttribute("vendetobj", vendetobj);
			}
		} catch (Exception e) {
			logger.error("Error occured in editVendor ---", e);
		}
		return "UpdateVendor";
	}

	@RequestMapping(value = { "/updateCustomer" }, method = RequestMethod.POST)
	@ResponseBody
	public String updateCustomer(Model model, HttpServletRequest request, HttpServletResponse response,
			@RequestParam(name = "Cust_MSA", required = false) MultipartFile customerMSA,
			@RequestParam(name = "mgr_mail_proof_Cmsa", required = false) MultipartFile mailproofCustomer) {
		String userName = (String) request.getSession().getAttribute("username");
		String message = null;
		if (userName == null) {
			return "redirect:/loginpage";
		} else {
			String cust_msa = "Customer_MSA";
			String mailtype = "Manager_Approved_Email_CMSA";
			HttpSession session = request.getSession(true);
			String custname = request.getParameter("cust_name");
			String cust_contactperson = request.getParameter("cust_phne_no");
			String cust_mgr_email = request.getParameter("cust_mgr_emailid");
			String fed_id = request.getParameter("fed_id");
			String line1 = request.getParameter("line1");
			String line2 = request.getParameter("line2");
			String zipcode = request.getParameter("zipcode");
			String city = request.getParameter("city");
			String state = request.getParameter("state");
			String fromdate = request.getParameter("fromdate");
			String expiry_date = request.getParameter("expirydate");
			String customerid = request.getParameter("customerid");
			String address_id = request.getParameter("address_id");
			String payment_term_id = request.getParameter("payment_term_id");
			
			String fileId = request.getParameter("fileId");
			System.out.println("fileId*****************" + fileId);
			Integer loginempno = (Integer) session.getAttribute("empno");
			message = contService.updateCustomerMaster(custname, fed_id, cust_contactperson, cust_mgr_email,
					customerMSA, cust_msa, mailtype, mailproofCustomer, loginempno, customerid, address_id, fileId,
					line1, line2, city, state, zipcode, fromdate, expiry_date,payment_term_id);
			/*
			 * if (customer_id.equalsIgnoreCase("")) { String companytype="Customer";
			 * contService.saveCompanyAddress(customer_id, companytype, loginempno, line1,
			 * line2, city, state, zipcode); message =
			 * "Customer Details Updated Successfully"; }
			 */
			return message;
		}
	}

	@RequestMapping(value = { "/updateVendor" }, method = RequestMethod.POST)
	@ResponseBody
	public String updateVendor(Model model, HttpServletRequest request, HttpServletResponse response,
			@RequestParam(name = "mgr_mail_proof", required = false) MultipartFile mailproofVendor) {
		String userName = (String) request.getSession().getAttribute("username");
		String message = null;
		if (userName == null) {
			return "redirect:/loginpage";
		} else {

			String mailprooftype = "Manager_Approved_Email_VMSA";
			HttpSession session = request.getSession(true);
			String vendorname = request.getParameter("vendor_name");
			// String vendorAddress = request.getParameter("ven_add");
			String v_contactperson = request.getParameter("ven_phne_no");
			String v_mgr_email = request.getParameter("ven_mgr_emailid");

			String fed_id = request.getParameter("fed_id");
			String line1 = request.getParameter("line1");
			String line2 = request.getParameter("line2");
			String zipcode = request.getParameter("zipcode");
			String city = request.getParameter("city");
			String state = request.getParameter("state");
			String vendorid = request.getParameter("vendorid");
			String address_id = request.getParameter("address_id");
			String fileId = request.getParameter("fileId");
			Integer loginempno = (Integer) session.getAttribute("empno");
			message = contService.updateVendorMaster(vendorname, fed_id, v_contactperson, v_mgr_email, mailprooftype,
					mailproofVendor, loginempno, vendorid, address_id, fileId, line1, line2, city, state, zipcode);
			return message;
		}
	}

	@RequestMapping(value = { "/editCustomerDocument" }, method = RequestMethod.POST)
	public String editEmployeeDocument(Model model, HttpServletRequest request, HttpServletResponse response,
			@RequestParam(name = "editFile", required = false) MultipartFile editFile) {
		try {
			HttpSession session = request.getSession(true);
			String userName = (String) request.getSession().getAttribute("username");
			if (userName == null) {
				return "redirect:/loginpage";
			} else {

				String fromdate = request.getParameter("fromdate");
				String expiry_date = request.getParameter("expirydate");

				String fileId = request.getParameter("fileId");
				String custid = request.getParameter("custmid");
				Integer loginempno = (Integer) session.getAttribute("empno");
				String msg = contService.updateCustomerDocumentById(editFile, fileId, fromdate, expiry_date, custid,
						loginempno);

				if (msg.equalsIgnoreCase("Success")) {
					PrintWriter out = response.getWriter();
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Documents Details Updated Successfully');");
					out.println("window.location='editCustomer?id=" + custid + "'");
					out.println("</script>");
					out.close();
				} else {
					PrintWriter out = response.getWriter();
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Documents Details Not Updated');");
					out.println("window.location='editCustomer?id=" + custid + "'");
					out.println("</script>");
					out.close();
				}
			}
		} catch (Exception e) {
			logger.error("Error while in editCustomerDocument" + e);
		}
		return null;
	}

	@RequestMapping(value = { "/getCustomerDocumentHistiryById" }, method = RequestMethod.GET)
	@ResponseBody
	public List<DocumentHistoryDto> getCustomerDocumentHistiryByCustomerId(Model model, HttpServletRequest request,
			HttpServletResponse response) {
		String docid = request.getParameter("docId");
		List<DocumentHistoryDto> customerdocs = contService.getCustomerDocumentHistiryByCustomerId(docid);
		return customerdocs;
	}

	@RequestMapping(value = { "/editVendorDocument" }, method = RequestMethod.POST)
	public String editVendorDocument(Model model, HttpServletRequest request, HttpServletResponse response,
			@RequestParam(name = "editFile", required = false) MultipartFile editFile) {
		try {
			HttpSession session = request.getSession(true);
			String userName = (String) request.getSession().getAttribute("username");
			if (userName == null) {
				return "redirect:/loginpage";
			} else {

				String fromdate = request.getParameter("fromdate");
				String expiry_date = request.getParameter("expirydate");

				String fileId = request.getParameter("fileId");
				String vendId = request.getParameter("venId");
				String efileType = request.getParameter("efileType");
				String efileInputVal = request.getParameter("efileInputVal");

				Integer loginempno = (Integer) session.getAttribute("empno");
				String msg = contService.updateVendorDocumentById(editFile, fileId, fromdate, expiry_date, vendId,
						loginempno, efileType, efileInputVal);

				if (msg.equalsIgnoreCase("Success")) {
					PrintWriter out = response.getWriter();
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Documents Details Updated Successfully');");
					out.println("window.location='editVendor?id=" + vendId + "'");
					out.println("</script>");
					out.close();
				} else {
					PrintWriter out = response.getWriter();
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Documents Details Not Updated');");
					out.println("window.location='editVendor?id=" + vendId + "'");
					out.println("</script>");
					out.close();
				}
			}
		} catch (Exception e) {
			logger.error("Error while in editVendorDocument" + e);
		}
		return null;
	}

	@RequestMapping(value = { "/editCIVendorDocument" }, method = RequestMethod.POST)
	public String editCIVendorDocument(Model model, HttpServletRequest request, HttpServletResponse response,
			@RequestParam(name = "cieditFile", required = false) MultipartFile editFile) {
		try {
			HttpSession session = request.getSession(true);
			String userName = (String) request.getSession().getAttribute("username");
			if (userName == null) {
				return "redirect:/loginpage";
			} else {

				String fromdate = "";
				String expiry_date = "";
				String fileId = request.getParameter("cifileId");
				String vendId = request.getParameter("civenId");
				String efileType = request.getParameter("ciefileType");
				String efileInputVal = request.getParameter("ciefileInputVal");

				Integer loginempno = (Integer) session.getAttribute("empno");
				String msg = contService.updateVendorDocumentById(editFile, fileId, fromdate, expiry_date, vendId,
						loginempno, efileType, efileInputVal);

				if (msg.equalsIgnoreCase("Success")) {
					PrintWriter out = response.getWriter();
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Documents Details Updated Successfully');");
					out.println("window.location='editVendor?id=" + vendId + "'");
					out.println("</script>");
					out.close();
				} else {
					PrintWriter out = response.getWriter();
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Documents Details Not Updated');");
					out.println("window.location='editVendor?id=" + vendId + "'");
					out.println("</script>");
					out.close();
				}
			}
		} catch (Exception e) {
			logger.error("Error while in editCIVendorDocument" + e);
		}
		return null;
	}

	@RequestMapping(value = { "/editMgrMailproofVendorDocument" }, method = RequestMethod.POST)
	public String editMgrMailproofVendorDocument(Model model, HttpServletRequest request, HttpServletResponse response,
			@RequestParam(name = "msgeditFile", required = false) MultipartFile editFile) {
		try {
			HttpSession session = request.getSession(true);
			String userName = (String) request.getSession().getAttribute("username");
			if (userName == null) {
				return "redirect:/loginpage";
			} else {
				String fileId = request.getParameter("msgefileId");
				String vendId = request.getParameter("msgvenId");
				String efileType = request.getParameter("msgefileType");

				Integer loginempno = (Integer) session.getAttribute("empno");
				String msg = contService.updateMailProofVendorDocumentById(editFile, fileId, vendId, loginempno,
						efileType);

				if (msg.equalsIgnoreCase("Success")) {
					PrintWriter out = response.getWriter();
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Documents Details Updated Successfully');");
					out.println("window.location='editVendor?id=" + vendId + "'");
					out.println("</script>");
					out.close();
				} else {
					PrintWriter out = response.getWriter();
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Documents Details Not Updated');");
					out.println("window.location='editVendor?id=" + vendId + "'");
					out.println("</script>");
					out.close();
				}
			}
		} catch (Exception e) {
			logger.error("Error while in editMgrMailproofVendorDocument" + e);
		}
		return null;
	}

	@RequestMapping(value = { "/getVendorDocumentHistiryById" }, method = RequestMethod.GET)
	@ResponseBody
	public List<DocumentHistoryDto> getVendorDocumentHistiryById(Model model, HttpServletRequest request,
			HttpServletResponse response) {
		//String vendId = request.getParameter("venId");
		String docid = request.getParameter("docId");
		String fileType = request.getParameter("fileType");
		String inputVal = request.getParameter("inputVal");
		List<DocumentHistoryDto> vendordocs = contService.getVendorDocumentHistiryById(docid, fileType, inputVal);
		return vendordocs;
	}

	@RequestMapping(value = { "/addVendorDocument" }, method = RequestMethod.POST)
	public String addVendorDocument(Model model, HttpServletRequest request, HttpServletResponse response,
			@RequestParam(name = "aFile", required = false) MultipartFile editFile) {
		try {
			HttpSession session = request.getSession(true);
			String userName = (String) request.getSession().getAttribute("username");
			if (userName == null) {
				return "redirect:/loginpage";
			} else {

				String fromdate = request.getParameter("afromdate");
				String expiry_date = request.getParameter("aexpirydate");
				String vendId = request.getParameter("avenId");
				String efileType = request.getParameter("afileType");
				String efileInputVal = request.getParameter("afileInputVal");

				Integer loginempno = (Integer) session.getAttribute("empno");
				String msg = contService.saveVendorDocument(editFile, fromdate, expiry_date, vendId, loginempno,
						efileType, efileInputVal);

				if (msg.equalsIgnoreCase("Success")) {
					PrintWriter out = response.getWriter();
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Documents Details Updated Successfully');");
					out.println("window.location='editVendor?id=" + vendId + "'");
					out.println("</script>");
					out.close();
				} else {
					PrintWriter out = response.getWriter();
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Documents Details Not Updated');");
					out.println("window.location='editVendor?id=" + vendId + "'");
					out.println("</script>");
					out.close();
				}
			}
		} catch (Exception e) {
			logger.error("Error while in addVendorDocument" + e);
		}
		return null;
	}

	@RequestMapping(value = { "/addCIVendorDocument" }, method = RequestMethod.POST)
	public String addCIVendorDocument(Model model, HttpServletRequest request, HttpServletResponse response,
			@RequestParam(name = "ciaFile", required = false) MultipartFile editFile) {
		try {
			HttpSession session = request.getSession(true);
			String userName = (String) request.getSession().getAttribute("username");
			if (userName == null) {
				return "redirect:/loginpage";
			} else {
				String fromdate = "";
				String expiry_date = "";
				String vendId = request.getParameter("ciavenId");
				String efileType = request.getParameter("ciafileType");
				String efileInputVal = request.getParameter("ciafileInputVal");

				Integer loginempno = (Integer) session.getAttribute("empno");
				String msg = contService.saveVendorDocument(editFile, fromdate, expiry_date, vendId, loginempno,
						efileType, efileInputVal);

				if (msg.equalsIgnoreCase("Success")) {
					PrintWriter out = response.getWriter();
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Documents Details Updated Successfully');");
					out.println("window.location='editVendor?id=" + vendId + "'");
					out.println("</script>");
					out.close();
				} else {
					PrintWriter out = response.getWriter();
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Documents Details Not Updated');");
					out.println("window.location='editVendor?id=" + vendId + "'");
					out.println("</script>");
					out.close();
				}
			}
		} catch (Exception e) {
			logger.error("Error while in addCIVendorDocument" + e);
		}
		return null;
	}

	@RequestMapping(value = { "/addMailProofVendorDocument" }, method = RequestMethod.POST)
	public String addMailProofVendorDocument(Model model, HttpServletRequest request, HttpServletResponse response,
			@RequestParam(name = "msgaFile", required = false) MultipartFile editFile) {
		try {
			HttpSession session = request.getSession(true);
			String userName = (String) request.getSession().getAttribute("username");
			if (userName == null) {
				return "redirect:/loginpage";
			} else {

				String vendId = request.getParameter("msgavenId");
				String efileType = request.getParameter("msgafileType");

				Integer loginempno = (Integer) session.getAttribute("empno");
				String msg = contService.saveMailProofVendorDocument(editFile, vendId, loginempno, efileType);

				if (msg.equalsIgnoreCase("Success")) {
					PrintWriter out = response.getWriter();
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Documents Details Updated Successfully');");
					out.println("window.location='editVendor?id=" + vendId + "'");
					out.println("</script>");
					out.close();
				} else {
					PrintWriter out = response.getWriter();
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Documents Details Not Updated');");
					out.println("window.location='editVendor?id=" + vendId + "'");
					out.println("</script>");
					out.close();
				}
			}
		} catch (Exception e) {
			logger.error("Error while in addMailProofVendorDocument" + e);
		}
		return null;
	}

	@RequestMapping(value = { "/editMailProofCustomerDocument" }, method = RequestMethod.POST)
	public String editMailProofCustomerDocument(Model model, HttpServletRequest request, HttpServletResponse response,
			@RequestParam(name = "msgeditFile", required = false) MultipartFile editFile) {
		try {
			HttpSession session = request.getSession(true);
			String userName = (String) request.getSession().getAttribute("username");
			if (userName == null) {
				return "redirect:/loginpage";
			} else {

				String msgefileType = request.getParameter("msgefileType");
				String fileId = request.getParameter("msgefileId");
				String custid = request.getParameter("msgecustmid");
				Integer loginempno = (Integer) session.getAttribute("empno");
				String msg = contService.updateMailProofCustomerDocumentById(editFile, fileId, custid, msgefileType,
						loginempno);

				if (msg.equalsIgnoreCase("Success")) {
					PrintWriter out = response.getWriter();
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Documents Details Updated Successfully');");
					out.println("window.location='editCustomer?id=" + custid + "'");
					out.println("</script>");
					out.close();
				} else {
					PrintWriter out = response.getWriter();
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Documents Details Not Updated');");
					out.println("window.location='editCustomer?id=" + custid + "'");
					out.println("</script>");
					out.close();
				}
			}
		} catch (Exception e) {
			logger.error("Error while in editMailProofCustomerDocument" + e);
		}
		return null;
	}

	@RequestMapping(value = { "/editClientCustomerDocument" }, method = RequestMethod.POST)
	public String editClientCustomerDocument(Model model, HttpServletRequest request, HttpServletResponse response,
			@RequestParam(name = "ceditFile", required = false) MultipartFile editFile) {
		try {
			HttpSession session = request.getSession(true);
			String userName = (String) request.getSession().getAttribute("username");
			if (userName == null) {
				return "redirect:/loginpage";
			} else {
				String venid = "";
				String fromdate = request.getParameter("cfromdate");
				String expiry_date = request.getParameter("cexpirydate");

				String fileId = request.getParameter("cfileId");
				String custmid = request.getParameter("custmid");
				String efileType = request.getParameter("cefileType");
				String ceCandidateId = request.getParameter("ceCandidateId");
				String emptype = request.getParameter("cemptype");
				String payrate_id = request.getParameter("cepayrateid");
				Integer loginempno = (Integer) session.getAttribute("empno");
				String msg = contService.updateClientVendorDocumentById(editFile, fileId, fromdate, expiry_date, venid,
						loginempno, efileType, custmid, ceCandidateId);

				if (msg.equalsIgnoreCase("Success")) {
					PrintWriter out = response.getWriter();
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Documents Details Updated Successfully');");
					out.println("window.location='viewW2ClientVendor?candidate_id=" + ceCandidateId + "&empType="
							+ emptype + "&payrate_id=" + payrate_id + "'");
					out.println("</script>");
					out.close();
				} else {
					PrintWriter out = response.getWriter();
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Documents Details Not Updated');");
					out.println("window.location='viewW2ClientVendor?candidate_id=" + ceCandidateId + "&empType="
							+ emptype + "&payrate_id=" + payrate_id + "'");
					out.println("</script>");
					out.close();
				}
			}
		} catch (Exception e) {
			logger.error("Error while in editClientCustomerDocument" + e);
		}
		return null;
	}

	@RequestMapping(value = { "/editClientVendorDocument" }, method = RequestMethod.POST)
	public String editClientVendorDocument(Model model, HttpServletRequest request, HttpServletResponse response,
			@RequestParam(name = "editFile", required = false) MultipartFile editFile) {
		try {
			HttpSession session = request.getSession(true);
			String userName = (String) request.getSession().getAttribute("username");
			if (userName == null) {
				return "redirect:/loginpage";
			} else {
				String custmid = "";
				String fromdate = request.getParameter("fromdate");
				String expiry_date = request.getParameter("expirydate");
				String fileId = request.getParameter("fileId");
				String vendId = request.getParameter("venId");
				String efileType = request.getParameter("efileType");
				String ceCandidateId = request.getParameter("eCandidateId");
				String emptype = request.getParameter("vemptype");

				String payrate_id = request.getParameter("ecvpayrateid");

				Integer loginempno = (Integer) session.getAttribute("empno");
				String msg = contService.updateClientVendorDocumentById(editFile, fileId, fromdate, expiry_date, vendId,
						loginempno, efileType, custmid, ceCandidateId);

				if (msg.equalsIgnoreCase("Success")) {
					PrintWriter out = response.getWriter();
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Documents Details Updated Successfully');");
					out.println("window.location='viewW2ClientVendor?candidate_id=" + ceCandidateId + "&empType="
							+ emptype + "&payrate_id=" + payrate_id + "'");
					out.println("</script>");
					out.close();
				} else {
					PrintWriter out = response.getWriter();
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Documents Details Not Updated');");
					out.println("window.location='viewW2ClientVendor?candidate_id=" + ceCandidateId + "&empType="
							+ emptype + "&payrate_id=" + payrate_id + "'");
					out.println("</script>");
					out.close();
				}
			}
		} catch (Exception e) {
			logger.error("Error while in editClientVendorDocument" + e);
		}
		return null;
	}

	@RequestMapping(value = { "/editMgrMailproofClientCustomerDocument" }, method = RequestMethod.POST)
	public String editMgrMailproofClientCustomerDocument(Model model, HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam(name = "msgeditFile", required = false) MultipartFile editFile) {
		try {
			HttpSession session = request.getSession(true);
			String userName = (String) request.getSession().getAttribute("username");
			if (userName == null) {
				return "redirect:/loginpage";
			} else {
				String fileId = request.getParameter("msgefileId");
				String efileType = request.getParameter("msgefileType");
				String ceCandidateId = request.getParameter("msgeCandidateId");
				String msgcustmid = request.getParameter("msgcustmid");
				String emptype = request.getParameter("msgemptype");
				String payrate_id = request.getParameter("msgepayrateid");

				Integer loginempno = (Integer) session.getAttribute("empno");
				String msg = contService.updateClientCustomerDocumentById(editFile, fileId, msgcustmid, efileType,
						loginempno, ceCandidateId);

				if (msg.equalsIgnoreCase("Success")) {
					PrintWriter out = response.getWriter();
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Documents Details Updated Successfully');");
					out.println("window.location='viewW2ClientVendor?candidate_id=" + ceCandidateId + "&empType="
							+ emptype + "&payrate_id=" + payrate_id + "'");
					out.println("</script>");
					out.close();
				} else {
					PrintWriter out = response.getWriter();
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Documents Details Not Updated');");
					out.println("window.location='viewW2ClientVendor?candidate_id=" + ceCandidateId + "&empType="
							+ emptype + "&payrate_id=" + payrate_id + "'");
					out.println("</script>");
					out.close();
				}
			}
		} catch (Exception e) {
			logger.error("Error while in editMgrMailproofClientCustomerDocument" + e);
		}
		return null;
	}

	@RequestMapping(value = { "/editMgrMailproofClientVendorDocument" }, method = RequestMethod.POST)
	public String editMgrMailproofClientVendorDocument(Model model, HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam(name = "vmsgeditFile", required = false) MultipartFile editFile) {
		try {
			HttpSession session = request.getSession(true);
			String userName = (String) request.getSession().getAttribute("username");
			if (userName == null) {
				return "redirect:/loginpage";
			} else {
				String fileId = request.getParameter("vmsgefileId");
				String efileType = request.getParameter("vmsgefileType");
				String vendId = request.getParameter("vmsgvenid");
				String ceCandidateId = request.getParameter("vmsgeCandidateId");
				String emptype = request.getParameter("vmsgemptype");
				String payrate_id = request.getParameter("vmsgepayrateid");
				Integer loginempno = (Integer) session.getAttribute("empno");
				String msg = contService.updateVendorCCADocumentById(editFile, fileId, vendId, efileType, loginempno,
						ceCandidateId);

				if (msg.equalsIgnoreCase("Success")) {
					PrintWriter out = response.getWriter();
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Documents Details Updated Successfully');");
					out.println("window.location='viewW2ClientVendor?candidate_id=" + ceCandidateId + "&empType="
							+ emptype + "&payrate_id=" + payrate_id + "'");
					out.println("</script>");
					out.close();
				} else {
					PrintWriter out = response.getWriter();
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Documents Details Not Updated');");
					out.println("window.location='viewW2ClientVendor?candidate_id=" + ceCandidateId + "&empType="
							+ emptype + "&payrate_id=" + payrate_id + "'");
					out.println("</script>");
					out.close();
				}
			}
		} catch (Exception e) {
			logger.error("Error while in editMgrMailproofClientVendorDocument" + e);
		}
		return null;
	}

	@RequestMapping(value = { "/editClientVendorCCADocument" }, method = RequestMethod.POST)
	public String editClientVendorCCADocument(Model model, HttpServletRequest request, HttpServletResponse response,
			@RequestParam(name = "caeditFile", required = false) MultipartFile editFile) {
		try {
			HttpSession session = request.getSession(true);
			String userName = (String) request.getSession().getAttribute("username");
			if (userName == null) {
				return "redirect:/loginpage";
			} else {

				String fileId = request.getParameter("cafileId");
				String vendId = request.getParameter("cavenId");
				String efileType = request.getParameter("caefileType");
				String ceCandidateId = request.getParameter("caeCandidateId");
				String emptype = request.getParameter("cavemptype");
				String payrate_id = request.getParameter("ccaepayrateid");
				Integer loginempno = (Integer) session.getAttribute("empno");
				String msg = contService.updateVendorCCADocumentById(editFile, fileId, vendId, efileType, loginempno,
						ceCandidateId);

				if (msg.equalsIgnoreCase("Success")) {
					PrintWriter out = response.getWriter();
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Documents Details Updated Successfully');");
					out.println("window.location='viewW2ClientVendor?candidate_id=" + ceCandidateId + "&empType="
							+ emptype + "&payrate_id=" + payrate_id + "'");
					out.println("</script>");
					out.close();
				} else {
					PrintWriter out = response.getWriter();
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Documents Details Not Updated');");
					out.println("window.location='viewW2ClientVendor?candidate_id=" + ceCandidateId + "&empType="
							+ emptype + "&payrate_id=" + payrate_id + "'");
					out.println("</script>");
					out.close();
				}
			}
		} catch (Exception e) {
			logger.error("Error while in editClientVendorCCADocument" + e);
		}
		return null;
	}

	@RequestMapping(value = { "/addMailProofClientVendorDocument" }, method = RequestMethod.POST)
	public String addMailProofClientVendorDocument(Model model, HttpServletRequest request,
			HttpServletResponse response, @RequestParam(name = "msgaFile", required = false) MultipartFile editFile) {
		try {
			HttpSession session = request.getSession(true);
			String userName = (String) request.getSession().getAttribute("username");
			if (userName == null) {
				return "redirect:/loginpage";
			} else {

				String efileType = request.getParameter("msgafileType");
				String vendId = request.getParameter("msgavenid");
				String ceCandidateId = request.getParameter("msgaCandidateId");
				String emptype = request.getParameter("msgaemptype");
				String payrate_id = request.getParameter("vmsgapayrateid");

				Integer loginempno = (Integer) session.getAttribute("empno");
				String msg = contService.saveMailProofClientVendorDocument(editFile, vendId, loginempno, efileType,
						ceCandidateId);

				if (msg.equalsIgnoreCase("Success")) {
					PrintWriter out = response.getWriter();
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Documents Details Updated Successfully');");
					out.println("window.location='viewW2ClientVendor?candidate_id=" + ceCandidateId + "&empType="
							+ emptype + "&payrate_id=" + payrate_id + "'");
					out.println("</script>");
					out.close();
				} else {
					PrintWriter out = response.getWriter();
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Documents Details Not Updated');");
					out.println("window.location='viewW2ClientVendor?candidate_id=" + ceCandidateId + "&empType="
							+ emptype + "&payrate_id=" + payrate_id + "'");
					out.println("</script>");
					out.close();
				}
			}
		} catch (Exception e) {
			logger.error("Error while in addMailProofClientVendorDocument" + e);
		}
		return null;
	}

	@RequestMapping(value = { "/addClientVendorCCADocument" }, method = RequestMethod.POST)
	public String addClientVendorCCADocument(Model model, HttpServletRequest request, HttpServletResponse response,
			@RequestParam(name = "ccaFile", required = false) MultipartFile editFile) {
		try {
			HttpSession session = request.getSession(true);
			String userName = (String) request.getSession().getAttribute("username");
			if (userName == null) {
				return "redirect:/loginpage";
			} else {

				String efileType = request.getParameter("ccafileType");
				String vendId = request.getParameter("ccavenid");
				String ceCandidateId = request.getParameter("ccaCandidateId");
				String emptype = request.getParameter("ccaemptype");
				String payrate_id = request.getParameter("ccapayrateid");
				Integer loginempno = (Integer) session.getAttribute("empno");
				String msg = contService.saveMailProofClientVendorDocument(editFile, vendId, loginempno, efileType,
						ceCandidateId);

				if (msg.equalsIgnoreCase("Success")) {
					PrintWriter out = response.getWriter();
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Documents Details Updated Successfully');");
					out.println("window.location='viewW2ClientVendor?candidate_id=" + ceCandidateId + "&empType="
							+ emptype + "&payrate_id=" + payrate_id + "'");
					out.println("</script>");
					out.close();
				} else {
					PrintWriter out = response.getWriter();
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Documents Details Not Updated');");
					out.println("window.location='viewW2ClientVendor?candidate_id=" + ceCandidateId + "&empType="
							+ emptype + "&payrate_id=" + payrate_id + "'");
					out.println("</script>");
					out.close();
				}
			}
		} catch (Exception e) {
			logger.error("Error while in addClientVendorCCADocument" + e);
		}
		return null;
	}

	@RequestMapping(value = { "/addMailProofClientCustomerDocument" }, method = RequestMethod.POST)
	public String addMailProofClientCustomerDocument(Model model, HttpServletRequest request,
			HttpServletResponse response, @RequestParam(name = "cmsgaFile", required = false) MultipartFile editFile) {
		try {
			HttpSession session = request.getSession(true);
			String userName = (String) request.getSession().getAttribute("username");
			if (userName == null) {
				return "redirect:/loginpage";
			} else {

				String efileType = request.getParameter("cmsgafileType");
				String cmsgacustmid = request.getParameter("cmsgacustmid");
				String ceCandidateId = request.getParameter("cmsgaCandidateId");
				String emptype = request.getParameter("cmsgaemptype");
				String payrate_id = request.getParameter("cmsgapayrateid");
				Integer loginempno = (Integer) session.getAttribute("empno");
				String msg = contService.saveMailProofClientCustomerDocument(editFile, cmsgacustmid, loginempno,
						efileType, ceCandidateId);

				if (msg.equalsIgnoreCase("Success")) {
					PrintWriter out = response.getWriter();
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Documents Details Updated Successfully');");
					out.println("window.location='viewW2ClientVendor?candidate_id=" + ceCandidateId + "&empType="
							+ emptype + "&payrate_id=" + payrate_id + "'");
					out.println("</script>");
					out.close();
				} else {
					PrintWriter out = response.getWriter();
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Documents Details Not Updated');");
					out.println("window.location='viewW2ClientVendor?candidate_id=" + ceCandidateId + "&empType="
							+ emptype + "&payrate_id=" + payrate_id + "'");
					out.println("</script>");
					out.close();
				}
			}
		} catch (Exception e) {
			logger.error("Error while in addMailProofClientCustomerDocument" + e);
		}
		return null;
	}

	@RequestMapping(value = { "/addClientVendorDocument" }, method = RequestMethod.POST)
	public String addClientVendorDocument(Model model, HttpServletRequest request, HttpServletResponse response,
			@RequestParam(name = "aFile", required = false) MultipartFile editFile) {
		try {
			HttpSession session = request.getSession(true);
			String userName = (String) request.getSession().getAttribute("username");
			if (userName == null) {
				return "redirect:/loginpage";
			} else {

				String fromdate = request.getParameter("afromdate");
				String expiry_date = request.getParameter("aexpirydate");
				String vendId = request.getParameter("avenid");
				String efileType = request.getParameter("afileType");
				String ceCandidateId = request.getParameter("aCandidateId");
				String emptype = request.getParameter("aemptype");
				String payrate_id = request.getParameter("apayrateid");

				Integer loginempno = (Integer) session.getAttribute("empno");
				String msg = contService.saveClientVendorDocument(editFile, fromdate, expiry_date, vendId, loginempno,
						efileType, ceCandidateId);

				if (msg.equalsIgnoreCase("Success")) {
					PrintWriter out = response.getWriter();
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Documents Details Updated Successfully');");
					out.println("window.location='viewW2ClientVendor?candidate_id=" + ceCandidateId + "&empType="
							+ emptype + "&payrate_id=" + payrate_id + "'");
					out.println("</script>");
					out.close();
				} else {
					PrintWriter out = response.getWriter();
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Documents Details Not Updated');");
					out.println("window.location='viewW2ClientVendor?candidate_id=" + ceCandidateId + "&empType="
							+ emptype + "&payrate_id=" + payrate_id + "'");
					out.println("</script>");
					out.close();
				}
			}
		} catch (Exception e) {
			logger.error("Error while in addClientVendorDocument" + e);
		}
		return null;
	}

	@RequestMapping(value = { "/addClientCustomerDocument" }, method = RequestMethod.POST)
	public String addClientCustomerDocument(Model model, HttpServletRequest request, HttpServletResponse response,
			@RequestParam(name = "caFile", required = false) MultipartFile editFile) {
		try {
			HttpSession session = request.getSession(true);
			String userName = (String) request.getSession().getAttribute("username");
			if (userName == null) {
				return "redirect:/loginpage";
			} else {

				String fromdate = request.getParameter("cafromdate");
				String expiry_date = request.getParameter("caexpirydate");
				String custId = request.getParameter("cacustmid");
				String efileType = request.getParameter("cafileType");
				String ceCandidateId = request.getParameter("caCandidateId");
				String emptype = request.getParameter("caemptype");
				System.out.println("efileType******" + efileType);
				Integer loginempno = (Integer) session.getAttribute("empno");
				String payrate_id = request.getParameter("capayrateid");
				String msg = contService.saveClientCustomerDocument(editFile, fromdate, expiry_date, custId, loginempno,
						efileType, ceCandidateId);

				if (msg.equalsIgnoreCase("Success")) {
					PrintWriter out = response.getWriter();
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Documents Details Updated Successfully');");
					out.println("window.location='viewW2ClientVendor?candidate_id=" + ceCandidateId + "&empType="
							+ emptype + "&payrate_id=" + payrate_id + "'");
					out.println("</script>");
					out.close();
				} else {
					PrintWriter out = response.getWriter();
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Documents Details Not Updated');");
					out.println("window.location='viewW2ClientVendor?candidate_id=" + ceCandidateId + "&empType="
							+ emptype + "&payrate_id=" + payrate_id + "'");
					out.println("</script>");
					out.close();
				}
			}
		} catch (Exception e) {
			logger.error("Error while in addClientCustomerDocument" + e);
		}
		return null;
	}

	@RequestMapping(value = { "/getClientCustomerDocumentHistiryById" }, method = RequestMethod.GET)
	@ResponseBody
	public List<DocumentHistoryDto> getClientCustomerDocumentHistiryById(Model model, HttpServletRequest request,
			HttpServletResponse response) {
		String custid = request.getParameter("custId");
		String candidateId = request.getParameter("candidateId");
		List<DocumentHistoryDto> customerdocs = contService.getClientCustomerDocumentHistiryById(custid, candidateId);
		return customerdocs;
	}

	@RequestMapping(value = { "/getClientVendorDocumentHistiryById" }, method = RequestMethod.GET)
	@ResponseBody
	public List<DocumentHistoryDto> getClientVendorDocumentHistiryById(Model model, HttpServletRequest request,
			HttpServletResponse response) {
		String vendId = request.getParameter("vendId");
		String candidateId = request.getParameter("candidateId");
		String fileType = request.getParameter("fileType");
		List<DocumentHistoryDto> customerdocs = contService.getClientVendorDocumentHistiryById(vendId, candidateId,
				fileType);
		return customerdocs;
	}

	@RequestMapping(value = { "/getConsultantDocumentHistiryById" }, method = RequestMethod.GET)
	@ResponseBody
	public List<DocumentHistoryDto> getConsultantDocumentHistiryById(Model model, HttpServletRequest request,
			HttpServletResponse response) {
		String fileType = request.getParameter("fileType");
		String InputVal = request.getParameter("InputVal");
		String docid = request.getParameter("docId");
		List<DocumentHistoryDto> customerdocs = contService.getConsultantDocumentHistiryById(docid, fileType,
				InputVal);
		return customerdocs;
	}

	@RequestMapping(value = { "/editConsultantWADocument" }, method = RequestMethod.POST)
	public String editConsultantWADocument(Model model, HttpServletRequest request, HttpServletResponse response,
			@RequestParam(name = "waeditFile", required = false) MultipartFile editFile) {
		try {
			HttpSession session = request.getSession(true);
			String userName = (String) request.getSession().getAttribute("username");
			if (userName == null) {
				return "redirect:/loginpage";
			} else {
				String fromdate = request.getParameter("wafromdate");
				String expiry_date = request.getParameter("waexpirydate");
				String waefileId = request.getParameter("waefileId");
				String waCandidateId = request.getParameter("waCandidateId");
				String efileType = request.getParameter("waefileType");
				String emptype = request.getParameter("waempType");

				Integer loginempno = (Integer) session.getAttribute("empno");
				String msg = contService.updateConsultantWADocument(editFile, waefileId, fromdate, expiry_date,
						waCandidateId, loginempno, efileType);

				if (msg.equalsIgnoreCase("Success")) {
					PrintWriter out = response.getWriter();
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Documents Details Updated Successfully');");
					out.println("window.location='viewConsultantDocs?candidate_id=" + waCandidateId + "&empType="
							+ emptype + "'");
					out.println("</script>");
					out.close();
				} else {
					PrintWriter out = response.getWriter();
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Documents Details Not Updated');");
					out.println("window.location='viewConsultantDocs?candidate_id=" + waCandidateId + "&empType="
							+ emptype + "'");
					out.println("</script>");
					out.close();
				}
			}
		} catch (Exception e) {
			logger.error("Error while in editClientVendorDocument" + e);
		}
		return null;
	}

	@RequestMapping(value = { "/getProjectDetailsHistoryById" }, method = RequestMethod.GET)
	@ResponseBody
	public List<ProjectDetailsHistoryDto> getProjectDetailsHistoryById(Model model, HttpServletRequest request,
			HttpServletResponse response) {
		String payRateId = request.getParameter("payRateId");
		List<ProjectDetailsHistoryDto> projectHistoryList = contService.getPayrateHistoryDetailsByPayrateId(payRateId);
		return projectHistoryList;
	}

	@RequestMapping(value = { "/saveupdateinhouseproject" }, method = RequestMethod.POST)
	@ResponseBody
	public String saveupdateinhouseproject(Model model, HttpServletRequest request, HttpServletResponse response) {
		String message = null;
		try {
			Integer lgempno = (Integer) request.getSession().getAttribute("empno");
			Integer lgcandidateid = (Integer) request.getSession().getAttribute("candidateid");
			if (lgempno != null) {
				String projectname = request.getParameter("projectname");
				String startdate = request.getParameter("in_startdate");
				String enddate = request.getParameter("in_enddate");
				String payrolltype = request.getParameter("payrolltype");
				String line1 = request.getParameter("in_line1");
				String line2 = request.getParameter("in_line2");
				String city = request.getParameter("in_city");
				String state = request.getParameter("in_state");
				String zipcode = request.getParameter("in_zipcode");
				String candidateid = request.getParameter("candidateid");
				String emptype = request.getParameter("emp_type");

				String payrateid = request.getParameter("payrateid");
				System.out.println("---------" + payrateid);

				message = contService.saveupdateinhouseproject(projectname, startdate, enddate, payrolltype, line1,
						line2, city, state, zipcode, lgempno, lgcandidateid, candidateid, emptype, payrateid);
			} else {
				message = null;
			}
		} catch (Exception e) {
			logger.error("Error in saveupdateinhouseproject" + e);
		}
		return message;
	}

	@RequestMapping(value = { "/viewInhouseproject" }, method = RequestMethod.GET)
	@ResponseBody
	public ClientVendorMaster_DTO viewInhouseproject(Model model, HttpServletRequest request,
			HttpServletResponse response) {
		String userName = (String) request.getSession().getAttribute("username");
		ClientVendorMaster_DTO inhouedetails = null;
		try {

			String candidate_id = request.getParameter("candidate_id");
			String empType = request.getParameter("empType");
			String payrate_id = request.getParameter("payrate_id");

			inhouedetails = contService.viewInhouseproject(candidate_id, empType, payrate_id);
		} catch (Exception e) {
			logger.error("Error occured in viewInhouseproject ---", e);
		}
		return inhouedetails;
	}
	/*@RequestMapping(value = { "/updateQBCustomerId" }, method = RequestMethod.POST)
	@ResponseBody
	public String updateCustomer(Model model, HttpServletRequest request, HttpServletResponse response) {
		String userName = (String) request.getSession().getAttribute("username");
		String message = null;
		if (userName == null) {
			return "redirect:/loginpage";
		} else {
			String customer_name = request.getParameter("customer_name");
			String qbcustomerid = request.getParameter("qbcustomer_id");
			message = contService.updateCustomerMasterQBCustomerId(customer_name,qbcustomerid);
			
			return message;
		}
	}*/
	
	@RequestMapping(value = { "/updateQBProductId" }, method = RequestMethod.POST)
	@ResponseBody
	public String updateQBProductId(Model model, HttpServletRequest request, HttpServletResponse response) {
		String userName = (String) request.getSession().getAttribute("username");
		String message = null;
		if (userName == null) {
			return "redirect:/loginpage";
		} else {
			String productId = request.getParameter("productId");
			String qbproductid = request.getParameter("qbproduct_id");
			System.out.println(productId+"updateQBProductId***"+qbproductid);
			//message = contService.updateQBProductId(productId,qbproductid);
			
			return message;
		}
	}
	
	@RequestMapping(value = { "/getProductServicesByPayRateId" }, method = RequestMethod.GET)
	@ResponseBody
	public ProductsEntity getProductServicesByPayRateId(Model model, HttpServletRequest request,
			HttpServletResponse response) {
		String userName = (String) request.getSession().getAttribute("username");
		ProductsEntity prodObj = null;
		try {
			String payrate_id = request.getParameter("payrate_id");
			prodObj = contService.getProductServicesByPayRateId(payrate_id);
		} catch (Exception e) {
			logger.error("Error occured in getProductServicesByPayRateId ---", e);
		}
		return prodObj;
	}
	
	@RequestMapping(value = { "/checkCustomerName" }, method = RequestMethod.GET)
	@ResponseBody
	public String checkCustomerName(Model model, HttpServletRequest request, HttpServletResponse response) {
		String custName = null;
		try {
			String cust_name = request.getParameter("cust_name");
			custName = contService.checkCustomerName(cust_name);
		} catch (Exception e) {
			logger.error("Error in checkCustomerName " + e);
		}
		return custName;
	}
	
	@RequestMapping(value = { "/checkqbproduct" }, method = RequestMethod.GET)
	@ResponseBody
	public String checkqbproduct(Model model, HttpServletRequest request, HttpServletResponse response) {
		String msg = null;
		try {
			String productid = request.getParameter("productid");
			msg = contService.checkQbProduct(productid);
		} catch (Exception e) {
			logger.error("Error in checkqbproduct " + e);
		}
		return msg;
	}
	
	@RequestMapping(value = { "/saveclientproductdetails" }, method = RequestMethod.POST)
	@ResponseBody
	public EmployeeDto saveclientproductdetails(Model model, HttpServletRequest request, HttpServletResponse response) {
		String message = null;
		EmployeeDto empdto = new EmployeeDto();
		try {
			HttpSession session = request.getSession(true);
			Integer loginempno = (Integer) session.getAttribute("empno");
			Integer payrateId = null;
			Integer customer_Id = null;
			String candidate_id = request.getParameter("candidate_id");
			Integer candidate_Id = 0;
			if (candidate_id != null) {
				candidate_Id = Integer.parseInt(candidate_id);
			}

			String customerid = request.getParameter("customertype");
			if (customerid != null) {
				customer_Id = Integer.parseInt(customerid);
			}
			
			String bill_rate = request.getParameter("bill_rate");
			String invoice_terms = request.getParameter("invoice_terms");
			String invoice_period = request.getParameter("invoice_period");
			String bcurrency = request.getParameter("bcurrency");
			String proj_startDate = request.getParameter("pro_startdate");
			String proj_endDate = request.getParameter("pro_enddate");
			String payrolltype = request.getParameter("payrolltype");

			payrateId = contService.saveBillRateDetails(bill_rate, invoice_terms, proj_startDate,
					proj_endDate, customer_Id, candidate_Id, bcurrency,invoice_period,payrolltype,loginempno);

			String client_name = request.getParameter("client_name");
			
			String client_type = "EndClient";
			contService.saveEndClientDetails(client_name, candidate_Id, loginempno, client_type, payrateId);
			
			String qb_productid = request.getParameter("qb_productid");
			String qb_productName = request.getParameter("qb_productName");
			String qb_productDesc = request.getParameter("qb_productDesc");
		
			Integer productId=contService.saveProductServices(qb_productName,bill_rate,payrateId,qb_productDesc,qb_productid);
			if (payrateId!=0 && productId!=0) {
				message = "Client & Customer Details Added Successfully";
				PageStatusEntity pageObj = contService.getRedirectPageStatus(candidate_Id);
				empdto.setMessage(message);
				empdto.setCandidateId(candidate_Id);
				//empdto.setJsonString(jsonString);
				//empdto.setProductId(productId);
			} else {
				message = "Client & Customer Not Added";
			}
		} catch (Exception e) {
			logger.error("Error occured in saveClientVendor ---", e);
		}
		return empdto;
	}
	
	@RequestMapping(value = { "/saveqbempdetailstousobt" }, method = RequestMethod.POST)
	public void saveqbempdetailstousobt(Model model, HttpServletRequest request, HttpServletResponse response) {
		try {
			Integer qbempId = 0;
			String qbId = request.getParameter("qbId");
			if (qbId!=null) {
				qbempId = Integer.parseInt(qbId);
			}
			//String ssn = request.getParameter("ssn");
			//String billrate = request.getParameter("billrate");
			String firstname = request.getParameter("firstname");
			String middlename = request.getParameter("middlename");
			String familyname = request.getParameter("familyname");
			String line1 = request.getParameter("line1");
			String city = request.getParameter("city");
			String state = request.getParameter("state");
			String zipcode = request.getParameter("zipcode");
			//String country = request.getParameter("country");
			String hiredate = request.getParameter("hiredate");
			String birthdate = request.getParameter("birthdate");
			String phone = request.getParameter("phone");
			String mobile = request.getParameter("mobile");
			String mail = request.getParameter("email");
			System.out.println(firstname+"***"+middlename+"***"+familyname+"***"+line1+"***"+city+"***"+state+"***"+zipcode+"***"+hiredate+"***"+birthdate+"***"+phone+"***"+mobile+"***"+mail);
			contService.saveQBEmpDetailsToUsObt(firstname, middlename, familyname,hiredate,birthdate,phone,mobile,mail,
									line1, city, state, zipcode,qbId);
		} catch (Exception e) {
			logger.error("Error occured in saveqbempdetailstousobt ---", e);
		}
	}
}
