package com.tekskills.Dto;

import java.util.List;
import java.util.Map;

public class viewDocsBean {

	private String offerletter;
	private String agreement;
	private String i9;
	private String w4;
	private int ed_id;
	private String filename;
	private String filetype;

	List<FileBean> i9supported;
	List<FileBean> additionaldocs;

	private String w9copy;
	private String ssncopy;
	List<FileBean> additionaldocsC2C;
	List<FileBean> additionaldocs1099;
	private String cust_w_order;
	private String ven_w_order;
	private String cagreement;
	private String cCompliance;
	private String cust_msa;
	private String ven_msa;
	private String bank_form;
	private String workauthcopy;
	private String mgr_apr_mail;
	private String cmsamgr_apr_mail;
	private String vmsamgr_apr_mail;
	private String mgr_apr_mail_cwo;
	private String mgr_apr_mail_vwo;
	List<FileBean> vendordocs;
	private String vendorname;
	private String custname;
	
	
	    private Integer c_edid;
	    private Integer v_edid;
	    private Integer cca_edid;
	    private Integer cc_edid;
	    private Integer cmgr_edid;
	    private Integer vmgr_edid;
	   

	
	    private String cwostartdate;
		private String cwoexpirydate;
		private String vwostartdate;
		private String vwoexpirydate;
		private String ccstartdate;
		private String ccexpirydate;
		
		private String cmsastartdate;
		private String cmsaexpirydate;
		private String vmsastartdate;
		private String vmsaexpirydate;
		
		private int cmsafileid;
		private int cmgrfileid;
		private int vmsafileid;
		private int irsfileid;
		private int icfileid;
		private int cifileid;
		private int gscfileid;
		private int vmgrfileid;
		
    	public int getCmsafileid() {
			return cmsafileid;
		}

		public void setCmsafileid(int cmsafileid) {
			this.cmsafileid = cmsafileid;
		}

		public int getCmgrfileid() {
			return cmgrfileid;
		}

		public void setCmgrfileid(int cmgrfileid) {
			this.cmgrfileid = cmgrfileid;
		}

		public int getVmsafileid() {
			return vmsafileid;
		}

		public void setVmsafileid(int vmsafileid) {
			this.vmsafileid = vmsafileid;
		}

		public int getIrsfileid() {
			return irsfileid;
		}

		public void setIrsfileid(int irsfileid) {
			this.irsfileid = irsfileid;
		}

		public int getIcfileid() {
			return icfileid;
		}

		public void setIcfileid(int icfileid) {
			this.icfileid = icfileid;
		}

		public int getCifileid() {
			return cifileid;
		}

		public void setCifileid(int cifileid) {
			this.cifileid = cifileid;
		}

		public int getGscfileid() {
			return gscfileid;
		}

		public void setGscfileid(int gscfileid) {
			this.gscfileid = gscfileid;
		}

		public int getVmgrfileid() {
			return vmgrfileid;
		}

		public void setVmgrfileid(int vmgrfileid) {
			this.vmgrfileid = vmgrfileid;
		}

	public Integer getC_edid() {
			return c_edid;
		}

		public void setC_edid(Integer c_edid) {
			this.c_edid = c_edid;
		}

		public Integer getV_edid() {
			return v_edid;
		}

		public void setV_edid(Integer v_edid) {
			this.v_edid = v_edid;
		}

		public Integer getCca_edid() {
			return cca_edid;
		}

		public void setCca_edid(Integer cca_edid) {
			this.cca_edid = cca_edid;
		}

		public Integer getCc_edid() {
			return cc_edid;
		}

		public void setCc_edid(Integer cc_edid) {
			this.cc_edid = cc_edid;
		}

		public Integer getCmgr_edid() {
			return cmgr_edid;
		}

		public void setCmgr_edid(Integer cmgr_edid) {
			this.cmgr_edid = cmgr_edid;
		}

		public Integer getVmgr_edid() {
			return vmgr_edid;
		}

		public void setVmgr_edid(Integer vmgr_edid) {
			this.vmgr_edid = vmgr_edid;
		}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public String getFiletype() {
		return filetype;
	}

	public void setFiletype(String filetype) {
		this.filetype = filetype;
	}
	public String getMgr_apr_mail_cwo() {
		return mgr_apr_mail_cwo;
	}

	public void setMgr_apr_mail_cwo(String mgr_apr_mail_cwo) {
		this.mgr_apr_mail_cwo = mgr_apr_mail_cwo;
	}

	public String getMgr_apr_mail_vwo() {
		return mgr_apr_mail_vwo;
	}

	public void setMgr_apr_mail_vwo(String mgr_apr_mail_vwo) {
		this.mgr_apr_mail_vwo = mgr_apr_mail_vwo;
	}
	public String getMgr_apr_mail() {
		return mgr_apr_mail;
	}

	public void setMgr_apr_mail(String mgr_apr_mail) {
		this.mgr_apr_mail = mgr_apr_mail;
	}

	public String getCmsamgr_apr_mail() {
		return cmsamgr_apr_mail;
	}

	public void setCmsamgr_apr_mail(String cmsamgr_apr_mail) {
		this.cmsamgr_apr_mail = cmsamgr_apr_mail;
	}

	public String getVmsamgr_apr_mail() {
		return vmsamgr_apr_mail;
	}

	public void setVmsamgr_apr_mail(String vmsamgr_apr_mail) {
		this.vmsamgr_apr_mail = vmsamgr_apr_mail;
	}

	public final String getVendorname() {
		return vendorname;
	}

	public final void setVendorname(String vendorname) {
		this.vendorname = vendorname;
	}

	public final String getCustname() {
		return custname;
	}

	public final void setCustname(String custname) {
		this.custname = custname;
	}

	public final List<FileBean> getVendordocs() {
		return vendordocs;
	}

	public final void setVendordocs(List<FileBean> vendordocs) {
		this.vendordocs = vendordocs;
	}

	public String getWorkauthcopy() {
		return workauthcopy;
	}

	public void setWorkauthcopy(String workauthcopy) {
		this.workauthcopy = workauthcopy;
	}

	public String getW9copy() {
		return w9copy;
	}

	public void setW9copy(String w9copy) {
		this.w9copy = w9copy;
	}

	public String getSsncopy() {
		return ssncopy;
	}

	public void setSsncopy(String ssncopy) {
		this.ssncopy = ssncopy;
	}

	public List<FileBean> getAdditionaldocsC2C() {
		return additionaldocsC2C;
	}

	public void setAdditionaldocsC2C(List<FileBean> othreodclistc2c) {
		this.additionaldocsC2C = othreodclistc2c;
	}

	public List<FileBean> getAdditionaldocs1099() {
		return additionaldocs1099;
	}

	public void setAdditionaldocs1099(List<FileBean> additionaldocs1099) {
		this.additionaldocs1099 = additionaldocs1099;
	}

	public String getCust_w_order() {
		return cust_w_order;
	}

	public void setCust_w_order(String cust_w_order) {
		this.cust_w_order = cust_w_order;
	}

	public String getVen_w_order() {
		return ven_w_order;
	}

	public void setVen_w_order(String ven_w_order) {
		this.ven_w_order = ven_w_order;
	}

	public String getCagreement() {
		return cagreement;
	}

	public void setCagreement(String cagreement) {
		this.cagreement = cagreement;
	}

	public String getcCompliance() {
		return cCompliance;
	}

	public void setcCompliance(String cCompliance) {
		this.cCompliance = cCompliance;
	}

	public String getCust_msa() {
		return cust_msa;
	}

	public void setCust_msa(String cust_msa) {
		this.cust_msa = cust_msa;
	}

	public String getVen_msa() {
		return ven_msa;
	}

	public void setVen_msa(String ven_msa) {
		this.ven_msa = ven_msa;
	}

	public String getBank_form() {
		return bank_form;
	}

	public void setBank_form(String bank_form) {
		this.bank_form = bank_form;
	}

	public String getOfferletter() {
		return offerletter;
	}

	public void setOfferletter(String offerletter) {
		this.offerletter = offerletter;
	}

	public String getAgreement() {
		return agreement;
	}

	public void setAgreement(String agreement) {
		this.agreement = agreement;
	}

	public String getI9() {
		return i9;
	}

	public void setI9(String i9) {
		this.i9 = i9;
	}

	public String getW4() {
		return w4;
	}

	public void setW4(String w4) {
		this.w4 = w4;
	}

	public List<FileBean> getI9supported() {
		return i9supported;
	}

	public void setI9supported(List<FileBean> i9suplist) {
		this.i9supported = i9suplist;
	}

	public List<FileBean> getAdditionaldocs() {
		return additionaldocs;
	}

	public void setAdditionaldocs(List<FileBean> otherdoclist) {
		this.additionaldocs = otherdoclist;
	}

	public int getEd_id() {
		return ed_id;
	}

	public void setEd_id(int ed_id) {
		this.ed_id = ed_id;
	}

	public String getCwostartdate() {
		return cwostartdate;
	}

	public void setCwostartdate(String cwostartdate) {
		this.cwostartdate = cwostartdate;
	}

	public String getCwoexpirydate() {
		return cwoexpirydate;
	}

	public void setCwoexpirydate(String cwoexpirydate) {
		this.cwoexpirydate = cwoexpirydate;
	}

	public String getVwoexpirydate() {
		return vwoexpirydate;
	}

	public void setVwoexpirydate(String vwoexpirydate) {
		this.vwoexpirydate = vwoexpirydate;
	}

	public String getCcstartdate() {
		return ccstartdate;
	}

	public void setCcstartdate(String ccstartdate) {
		this.ccstartdate = ccstartdate;
	}

	public String getCcexpirydate() {
		return ccexpirydate;
	}

	public void setCcexpirydate(String ccexpirydate) {
		this.ccexpirydate = ccexpirydate;
	}

	public String getVwostartdate() {
		return vwostartdate;
	}

	public void setVwostartdate(String vwostartdate) {
		this.vwostartdate = vwostartdate;
	}
	
	public String getVmsastartdate() {
		return vmsastartdate;
	}

	public void setVmsastartdate(String vmsastartdate) {
		this.vmsastartdate = vmsastartdate;
	}

	public String getVmsaexpirydate() {
		return vmsaexpirydate;
	}

	public void setVmsaexpirydate(String vmsaexpirydate) {
		this.vmsaexpirydate = vmsaexpirydate;
	}

	public String getCmsastartdate() {
		return cmsastartdate;
	}

	public void setCmsastartdate(String cmsastartdate) {
		this.cmsastartdate = cmsastartdate;
	}

	public String getCmsaexpirydate() {
		return cmsaexpirydate;
	}

	public void setCmsaexpirydate(String cmsaexpirydate) {
		this.cmsaexpirydate = cmsaexpirydate;
	}

}
