package com.tekskills.Dto;

import java.util.ArrayList;
import java.util.List;

public class AttachmentBean {

	private int fileId;
	private int afile;
	private int ifile;
	private int wfile;
	public int getAfile() {
		return afile;
	}
	public void setAfile(int afile) {
		this.afile = afile;
	}
	public int getIfile() {
		return ifile;
	}
	public void setIfile(int ifile) {
		this.ifile = ifile;
	}
	public int getWfile() {
		return wfile;
	}
	public void setWfile(int wfile) {
		this.wfile = wfile;
	}
	private String fileName;
	private int userid;
	private int emp_number;
	private String offerletter;
	private String agreement;
	private String i9;
	private String w4;
	
	
	private String workauthcopy; 
	private String w9copy;
    private String ssncopy;
	private String mgmtaproval;
	private List<FileBean> i9addlist;
	private List<FileBean> i9suplist;
	private List<FileBean> othersuplist;
	private List<FileBean> adddocs1099;
	private List<FileBean> i9suplist2;
	
	private String wastartdate;
	private String waenddate;
	
	
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
	public List<FileBean> getI9addlist() {
		return i9addlist;
	}
	public void setI9addlist(List<FileBean> i9addlist) {
		this.i9addlist = i9addlist;
	}
	
	public String getMgmtaproval() {
		return mgmtaproval;
	}
	public void setMgmtaproval(String mgmtaproval) {
		this.mgmtaproval = mgmtaproval;
	}
	
	
	public final String getWorkauthcopy() {
		return workauthcopy;
	}
	public final void setWorkauthcopy(String workauthcopy) {
		this.workauthcopy = workauthcopy;
	}
	public final String getW9copy() {
		return w9copy;
	}
	public final void setW9copy(String w9copy) {
		this.w9copy = w9copy;
	}
	public final String getSsncopy() {
		return ssncopy;
	}
	public final void setSsncopy(String ssncopy) {
		this.ssncopy = ssncopy;
	}
	
	
	
	public int getFileId() {
		return fileId;
	}
	public void setFileId(int fileId) {
		this.fileId = fileId;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public int getEmp_number() {
		return emp_number;
	}
	public void setEmp_number(int emp_number) {
		this.emp_number = emp_number;
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
	public List<FileBean> getAdddocs1099() {
		return adddocs1099;
	}
	public void setAdddocs1099(List<FileBean> adddocs1099) {
		this.adddocs1099 = adddocs1099;
	}
	public List<FileBean> getI9suplist2() {
		return i9suplist2;
	}
	public void setI9suplist2(List<FileBean> i9suplist2) {
		this.i9suplist2 = i9suplist2;
	}

}
