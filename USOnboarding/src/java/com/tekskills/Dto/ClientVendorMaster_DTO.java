// Decompiled using: fernflower
// Took: 71ms

package com.tekskills.Dto;

import com.tekskills.Entity.CompanyAdressEntity;

public class ClientVendorMaster_DTO {
    private String clientName;
    private String clientType;
    private String client_addr;
    private String client_mgr;
    private String client_mgr_extn;
    private String client_mgr_email;
    private String emp_extn_clent;
    private String emp_email_clent;
    private String csatus;
    private int ctblpk;
    private int vendid;
    private int custid;
    private int clientid;
    private String custname; 
    private String custAddress;
    private String cust_contactperson;
    private String cust_mgr_email;
    private int custstaus;
    private String vendorname;
    private String vendorAddress;
    private String v_contactperson;
    private String v_mgr_email;
    private String vstatus;
    private int payrate_id;
    private String payrate;
    private String billrate;
    private String proj_startDate;
    private String proj_endDate;
    private String payroll_type;
    private String payterms;
    private String invoiceterms;
    private String bcurrency;
    private String pcurrency;
    private String pstaus;
    private String fileName;
    private String fileType;
    private int fileId;
    private int  candidate_id;
    private int companyId;
    private String companyName;
    private int activeCount;
    
    private Integer clientcount;
    private Integer inhousecount;
    
    private String job_title;
    private String organization_name;
    private String education; 
    private String county;
    private String soc_code;
    private String workinglocation;
    private String reason_lca;
    private String metro_politan_area;
    
    private Integer lcadocCount;
    
    private CompanyAdressEntity remoteAddress;
    
    private Integer address_id;
    private String metrop_area;
    
    private String invoice_period;
    
    public Integer getAddress_id() {
		return address_id;
	}

	public void setAddress_id(Integer address_id) {
		this.address_id = address_id;
	}

	public String getMetrop_area() {
		return metrop_area;
	}

	public void setMetrop_area(String metrop_area) {
		this.metrop_area = metrop_area;
	}
    

	public CompanyAdressEntity getRemoteAddress() {
		return remoteAddress;
	}

	public void setRemoteAddress(CompanyAdressEntity remoteAddress) {
		this.remoteAddress = remoteAddress;
	}

	public String getJob_title() {
		return job_title;
	}

	public void setJob_title(String job_title) {
		this.job_title = job_title;
	}

	public String getOrganization_name() {
		return organization_name;
	}

	public void setOrganization_name(String organization_name) {
		this.organization_name = organization_name;
	}

	public String getEducation() {
		return education;
	}

	public void setEducation(String education) {
		this.education = education;
	}

	public String getCounty() {
		return county;
	}

	public void setCounty(String county) {
		this.county = county;
	}

	public String getSoc_code() {
		return soc_code;
	}

	public Integer getClientcount() {
		return clientcount;
	}

	public void setClientcount(Integer clientcount) {
		this.clientcount = clientcount;
	}

	public Integer getInhousecount() {
		return inhousecount;
	}

	public void setInhousecount(Integer inhousecount) {
		this.inhousecount = inhousecount;
	}

	public void setSoc_code(String soc_code) {
		this.soc_code = soc_code;
	}

	public String getWorkinglocation() {
		return workinglocation;
	}

	public void setWorkinglocation(String workinglocation) {
		this.workinglocation = workinglocation;
	}

	public int getCompanyId() {
		return companyId;
	}

	public void setCompanyId(int companyId) {
		this.companyId = companyId;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	
    public int getCandidate_id() {
		return candidate_id;
	}

	public void setCandidate_id(int candidate_id) {
		this.candidate_id = candidate_id;
	}

	private String project_status;
    
    private String projectName;
    private String line1;
	private String line2;
	private String city;
	private String state;
	private String zipcode;
	private String fed_id;
    
    public String getFed_id() {
		return fed_id;
	}

	public void setFed_id(String fed_id) {
		this.fed_id = fed_id;
	}

	public String getLine1() {
		return line1;
	}

	public void setLine1(String line1) {
		this.line1 = line1;
	}

	public String getLine2() {
		return line2;
	}

	public void setLine2(String line2) {
		this.line2 = line2;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public ClientVendorMaster_DTO() {
        super();
    }
    
   public final String getBcurrency() {
        return this.bcurrency;
    }
    
    public final void setBcurrency(final String bcurrency) {
        this.bcurrency = bcurrency;
    }
    
    public final String getPcurrency() {
        return this.pcurrency;
    }
    
    public final void setPcurrency(final String pcurrency) {
        this.pcurrency = pcurrency;
    }
    
    public final String getFileName() {
        return this.fileName;
    }
    
    public final void setFileName(final String fileName) {
        this.fileName = fileName;
    }
    
    public final String getFileType() {
        return this.fileType;
    }
    
    public final void setFileType(final String fileType) {
        this.fileType = fileType;
    }
    
    public final int getFileId() {
        return this.fileId;
    }
    
    public final void setFileId(final int fileId) {
        this.fileId = fileId;
    }
       
    public final String getInvoiceterms() {
        return this.invoiceterms;
    }
    
    public final void setInvoiceterms(final String invoiceterms) {
        this.invoiceterms = invoiceterms;
    }
    
    public final int getVendid() {
        return this.vendid;
    }
    
    public final void setVendid(final int vendid) {
        this.vendid = vendid;
    }
    
    public final int getCustid() {
        return this.custid;
    }
    
    public final void setCustid(final int custid) {
        this.custid = custid;
    }
    
    public final int getClientid() {
        return this.clientid;
    }
    
    public final void setClientid(final int clientid) {
        this.clientid = clientid;
    }
    
    public final String getPayterms() {
        return this.payterms;
    }
    
    public final void setPayterms(final String payterms) {
        this.payterms = payterms;
    }
    
    public final String getClientName() {
        return this.clientName;
    }
    
    public final void setClientName(final String clientName) {
        this.clientName = clientName;
    }
    
    public final String getClient_addr() {
        return this.client_addr;
    }
    
    public final void setClient_addr(final String client_addr) {
        this.client_addr = client_addr;
    }
    
    public final String getClient_mgr() {
        return this.client_mgr;
    }
    
    public final void setClient_mgr(final String client_mgr) {
        this.client_mgr = client_mgr;
    }
    
    public final String getClient_mgr_extn() {
        return this.client_mgr_extn;
    }
    
    public final void setClient_mgr_extn(final String client_mgr_extn) {
        this.client_mgr_extn = client_mgr_extn;
    }
    
    public final String getClient_mgr_email() {
        return this.client_mgr_email;
    }
    
    public final void setClient_mgr_email(final String client_mgr_email) {
        this.client_mgr_email = client_mgr_email;
    }
    
    public final String getEmp_extn_clent() {
        return this.emp_extn_clent;
    }
    
    public final void setEmp_extn_clent(final String emp_extn_clent) {
        this.emp_extn_clent = emp_extn_clent;
    }
    
    public final String getEmp_email_clent() {
        return this.emp_email_clent;
    }
    
    public final void setEmp_email_clent(final String emp_email_clent) {
        this.emp_email_clent = emp_email_clent;
    }
    
   
    
    public final String getCustname() {
        return this.custname;
    }
    
    public final void setCustname(final String custname) {
        this.custname = custname;
    }
    
    public final String getCustAddress() {
        return this.custAddress;
    }
    
    public final void setCustAddress(final String custAddress) {
        this.custAddress = custAddress;
    }
    
    public final String getCust_contactperson() {
        return this.cust_contactperson;
    }
    
    public final void setCust_contactperson(final String cust_contactperson) {
        this.cust_contactperson = cust_contactperson;
    }
    
    public final String getCust_mgr_email() {
        return this.cust_mgr_email;
    }
    
    public final void setCust_mgr_email(final String cust_mgr_email) {
        this.cust_mgr_email = cust_mgr_email;
    }
    
    public final int getCuststaus() {
        return this.custstaus;
    }
    
    public final void setCuststaus(final int custstaus) {
        this.custstaus = custstaus;
    }
    
    public final String getVendorname() {
        return this.vendorname;
    }
    
    public final void setVendorname(final String vendorname) {
        this.vendorname = vendorname;
    }
    
    public final String getVendorAddress() {
        return this.vendorAddress;
    }
    
    public final void setVendorAddress(final String vendorAddress) {
        this.vendorAddress = vendorAddress;
    }
    
    public final String getV_contactperson() {
        return this.v_contactperson;
    }
    
    public final void setV_contactperson(final String v_contactperson) {
        this.v_contactperson = v_contactperson;
    }
    
    public final String getV_mgr_email() {
        return this.v_mgr_email;
    }
    
    public final void setV_mgr_email(final String v_mgr_email) {
        this.v_mgr_email = v_mgr_email;
    }
       
    public final String getProj_startDate() {
        return this.proj_startDate;
    }
    
    public final void setProj_startDate(final String proj_startDate) {
        this.proj_startDate = proj_startDate;
    }
    
    public final String getProj_endDate() {
        return this.proj_endDate;
    }
    
    public final void setProj_endDate(final String proj_endDate) {
        this.proj_endDate = proj_endDate;
    }
    
    public int getCtblpk() {
        return this.ctblpk;
    }
    
    public void setCtblpk(final int ctblpk) {
        this.ctblpk = ctblpk;
    }

	public String getPayrate() {
		return payrate;
	}

	public void setPayrate(String payrate) {
		this.payrate = payrate;
	}

	public String getBillrate() {
		return billrate;
	}

	public void setBillrate(String billrate) {
		this.billrate = billrate;
	}

	public String getCsatus() {
		return csatus;
	}

	public void setCsatus(String csatus) {
		this.csatus = csatus;
	}

	public String getVstatus() {
		return vstatus;
	}

	public void setVstatus(String vstatus) {
		this.vstatus = vstatus;
	}

	public String getPstaus() {
		return pstaus;
	}

	public void setPstaus(String pstaus) {
		this.pstaus = pstaus;
	}

	public int getPayrate_id() {
		return payrate_id;
	}

	public void setPayrate_id(int payrate_id) {
		this.payrate_id = payrate_id;
	}

	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	public String getPayroll_type() {
		return payroll_type;
	}

	public void setPayroll_type(String payroll_type) {
		this.payroll_type = payroll_type;
	}

	public String getProject_status() {
		return project_status;
	}

	public void setProject_status(String project_status) {
		this.project_status = project_status;
	}

	public int getActiveCount() {
		return activeCount;
	}

	public void setActiveCount(int activeCount) {
		this.activeCount = activeCount;
	}

	public String getClientType() {
		return clientType;
	}

	public void setClientType(String clientType) {
		this.clientType = clientType;
	}

	public String getReason_lca() {
		return reason_lca;
	}

	public void setReason_lca(String reason_lca) {
		this.reason_lca = reason_lca;
	}

	public Integer getLcadocCount() {
		return lcadocCount;
	}

	public void setLcadocCount(Integer lcadocCount) {
		this.lcadocCount = lcadocCount;
	}

	public String getMetro_politan_area() {
		return metro_politan_area;
	}

	public void setMetro_politan_area(String metro_politan_area) {
		this.metro_politan_area = metro_politan_area;
	}

	public String getInvoice_period() {
		return invoice_period;
	}

	public void setInvoice_period(String invoice_period) {
		this.invoice_period = invoice_period;
	}
}
