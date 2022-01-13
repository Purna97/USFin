package com.tekskills.Dto;

import java.util.List;


public class MyDashboardDto {
	
	private int count;
	List<CustomerDto> custlist;
	List<VendorDto> venlist;
	List<CandidateDocDto> candElist;
	List<CandidateDocDto> candClist;
	private int expcount;
	
	List<CustomerDto> prevcustlist;
	List<VendorDto> prevvenlist;
	List<CandidateDocDto> prevcandElist;
	List<CandidateDocDto> prevcandClist;
	
	public List<CustomerDto> getPrevcustlist() {
		return prevcustlist;
	}
	public void setPrevcustlist(List<CustomerDto> prevcustlist) {
		this.prevcustlist = prevcustlist;
	}
	public List<VendorDto> getPrevvenlist() {
		return prevvenlist;
	}
	public void setPrevvenlist(List<VendorDto> prevvenlist) {
		this.prevvenlist = prevvenlist;
	}
	public List<CandidateDocDto> getPrevcandElist() {
		return prevcandElist;
	}
	public void setPrevcandElist(List<CandidateDocDto> prevcandElist) {
		this.prevcandElist = prevcandElist;
	}
	public List<CandidateDocDto> getPrevcandClist() {
		return prevcandClist;
	}
	public void setPrevcandClist(List<CandidateDocDto> prevcandClist) {
		this.prevcandClist = prevcandClist;
	}
	public List<CandidateDocDto> getCandElist() {
		return candElist;
	}
	public void setCandElist(List<CandidateDocDto> candElist) {
		this.candElist = candElist;
	}
	public List<CandidateDocDto> getCandClist() {
		return candClist;
	}
	public void setCandClist(List<CandidateDocDto> candClist) {
		this.candClist = candClist;
	}
	public List<CustomerDto> getCustlist() {
		return custlist;
	}
	public void setCustlist(List<CustomerDto> custlist) {
		this.custlist = custlist;
	}
	public List<VendorDto> getVenlist() {
		return venlist;
	}
	public void setVenlist(List<VendorDto> venlist) {
		this.venlist = venlist;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getExpcount() {
		return expcount;
	}
	public void setExpcount(int expcount) {
		this.expcount = expcount;
	}
	
}
