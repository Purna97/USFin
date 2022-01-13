package com.tekskills.Dto;

public class fileHistoryDto {
	
	private int bgc_checklist_id;
	private int fileid;
	private String fileName;
	private String subdate;
	private String posted_by;
	private String candidatename;
	public String getCandidatename() {
		return candidatename;
	}

	public void setCandidatename(String candidatename) {
		this.candidatename = candidatename;
	}

	public int getBgc_checklist_id() {
		return bgc_checklist_id;
	}

	public void setBgc_checklist_id(int bgc_checklist_id) {
		this.bgc_checklist_id = bgc_checklist_id;
	}

	public String getSubdate() {
		return subdate;
	}

	public void setSubdate(String subdate) {
		this.subdate = subdate;
	}
	public String getPosted_by() {
		return posted_by;
	}

	public void setPosted_by(String posted_by) {
		this.posted_by = posted_by;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public int getFileid() {
		return fileid;
	}

	public void setFileid(int fileid) {
		this.fileid = fileid;
	}
}
