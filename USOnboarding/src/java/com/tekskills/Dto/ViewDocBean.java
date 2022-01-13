package com.tekskills.Dto;
import java.util.ArrayList;
import java.util.List;
public class ViewDocBean {
	
	private int userid;
	private int empno;
	private int ofileid;
	private int afileid;
	private int ifileid;
	private int wfileid;
	
	private String ofilename;
	private String afilename;
	private String ifilename;
	private String wfilename;
	
	private String wafilename;
	private String w9filename;
    private String ssnfilename;
    private String bfilename;
    
    private int wafileid;
	private int w9fileid;
	private int ssnfileid;
	private int mgrfileid;
	private int bfileid;
	private String mgr_apr_mail;
	
	private String wastartdate;
	private String waenddate;  
	
   

List<FileBean> adddocsC2C=new ArrayList<FileBean>();
List<FileBean> adddocs1099=new ArrayList<FileBean>();

List<FileBean> i9suplist=new ArrayList<FileBean>();
List<FileBean> othersuplist=new ArrayList<FileBean>();
List<FileBean> i9addlist=new ArrayList<FileBean>();

	 public List<FileBean> getI9addlist() {
	return i9addlist;
}
public void setI9addlist(List<FileBean> i9addlist) {
	this.i9addlist = i9addlist;
}
	public final String getBfilename() {
		return bfilename;
	}
	public final void setBfilename(String bfilename) {
		this.bfilename = bfilename;
	}
	public final int getBfileid() {
		return bfileid;
	}
	public final void setBfileid(int bfileid) {
		this.bfileid = bfileid;
	}
	
	public final String getWafilename() {
		return wafilename;
	}
	public final void setWafilename(String wafilename) {
		this.wafilename = wafilename;
	}
	public final String getW9filename() {
		return w9filename;
	}
	public final void setW9filename(String w9filename) {
		this.w9filename = w9filename;
	}
	public final String getSsnfilename() {
		return ssnfilename;
	}
	public final void setSsnfilename(String ssnfilename) {
		this.ssnfilename = ssnfilename;
	}
	public final int getWafileid() {
		return wafileid;
	}
	public final void setWafileid(int wafileid) {
		this.wafileid = wafileid;
	}
	public final int getW9fileid() {
		return w9fileid;
	}
	public final void setW9fileid(int w9fileid) {
		this.w9fileid = w9fileid;
	}
	public final int getSsnfileid() {
		return ssnfileid;
	}
	public final void setSsnfileid(int ssnfileid) {
		this.ssnfileid = ssnfileid;
	}
	
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public int getEmpno() {
		return empno;
	}
	public void setEmpno(int empno) {
		this.empno = empno;
	}
	public int getOfileid() {
		return ofileid;
	}
	public void setOfileid(int ofileid) {
		this.ofileid = ofileid;
	}
	public int getAfileid() {
		return afileid;
	}
	public void setAfileid(int afileid) {
		this.afileid = afileid;
	}
	public int getIfileid() {
		return ifileid;
	}
	public void setIfileid(int ifileid) {
		this.ifileid = ifileid;
	}
	public int getWfileid() {
		return wfileid;
	}
	public void setWfileid(int wfileid) {
		this.wfileid = wfileid;
	}
	public String getOfilename() {
		return ofilename;
	}
	public void setOfilename(String ofilename) {
		this.ofilename = ofilename;
	}
	public String getAfilename() {
		return afilename;
	}
	public void setAfilename(String afilename) {
		this.afilename = afilename;
	}
	public String getIfilename() {
		return ifilename;
	}
	public void setIfilename(String ifilename) {
		this.ifilename = ifilename;
	}
	public String getWfilename() {
		return wfilename;
	}
	public void setWfilename(String wfilename) {
		this.wfilename = wfilename;
	}
	public List<FileBean> getI9suplist() {
		return i9suplist;
	}
	public void setI9suplist(List<FileBean> i9suplist) {
		this.i9suplist = i9suplist;
	}
	public List<FileBean> getOthersuplist() {
		return othersuplist;
	}
	public void setOthersuplist(List<FileBean> othersuplist) {
		this.othersuplist = othersuplist;
	}
	public final List<FileBean> getAdddocsC2C() {
		return adddocsC2C;
	}
	public final void setAdddocsC2C(List<FileBean> adddocsC2C) {
		this.adddocsC2C = adddocsC2C;
	}
	public final List<FileBean> getAdddocs1099() {
		return adddocs1099;
	}
	public final void setAdddocs1099(List<FileBean> adddocs1099) {
		this.adddocs1099 = adddocs1099;
	}
	public String getMgr_apr_mail() {
		return mgr_apr_mail;
	}
	public void setMgr_apr_mail(String mgr_apr_mail) {
		this.mgr_apr_mail = mgr_apr_mail;
	}
	
	public String getWastartdate() {
		return wastartdate;
	}
	public void setWastartdate(String wastartdate) {
		this.wastartdate = wastartdate;
	}
	public String getWaenddate() {
		return waenddate;
	}
	public void setWaenddate(String waenddate) {
		this.waenddate = waenddate;
	}
	public int getMgrfileid() {
		return mgrfileid;
	}
	public void setMgrfileid(int mgrfileid) {
		this.mgrfileid = mgrfileid;
	}

}
