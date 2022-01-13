package com.tekskills.Entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Tbl_LCADetails")
public class LCADetailsEntity {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)	
	@Column(name="lca_id")
	private int lca_id;
		
	@Column(name="lca_number")
	private String lca_number;
	
	@Column(name="case_type")
	private String case_type;
	
	@Column(name="lca_submitted_date")
	private String lca_submitted_date;
	
	@Column(name="lca_begin_date")
	private String lca_begin_date;
	
	@Column(name="lca_end_date")
	private String lca_end_date;
	
	@Column(name="lca_certified_date")
	private String lca_certified_date;
	
	@Column(name="job_title")
	private String job_title;
	
	@Column(name="soc")
	private String soc;
	
	@Column(name="wage_rate")
	private String wage_rate;
	
	@Column(name="wr_option")
	private String wr_option;

	@Column(name="previling_wage")
	private String previling_wage;
	
	@Column(name="wage_level")
	private String wage_level;
	
	@Column(name="payrate_id")
	private int payrate_id;
	
	@Column(name="candidate_id")
	private int candidate_id;
	
	@Column(name="posted_by")
	private int posted_by;
	
	@Column(name="client_id")
	private int client_id;

	
	@Column(name="lca_reference")
	private Integer lca_reference;
	
	@Column(name="status")
	private String lcastatus;
	
	@Column(name="job_duties")
	private String job_duties;
	
	
	/*@Column(name="lcaPostedDate")
	private String lcaPostedDate;
	
	public String getLcaPostedDate() {
		return lcaPostedDate;
	}

	public void setLcaPostedDate(String lcaPostedDate) {
		this.lcaPostedDate = lcaPostedDate;
	}
*/
	
	public String getJob_duties() {
		return job_duties;
	}

	public void setJob_duties(String job_duties) {
		this.job_duties = job_duties;
	}

	public String getWr_option() {
		return wr_option;
	}

	public void setWr_option(String wr_option) {
		this.wr_option = wr_option;
	}
	public String getLcastatus() {
		return lcastatus;
	}

	public void setLcastatus(String lcastatus) {
		this.lcastatus = lcastatus;
	}

	public int getClient_id() {
		return client_id;
	}

	public void setClient_id(int client_id) {
		this.client_id = client_id;
	}

	public int getLca_id() {
		return lca_id;
	}

	public void setLca_id(int lca_id) {
		this.lca_id = lca_id;
	}

	public String getLca_number() {
		return lca_number;
	}

	public void setLca_number(String lca_number) {
		this.lca_number = lca_number;
	}

	public String getCase_type() {
		return case_type;
	}

	public void setCase_type(String case_type) {
		this.case_type = case_type;
	}
	
	public String getLca_submitted_date() {
		return lca_submitted_date;
	}

	public void setLca_submitted_date(String lca_submitted_date) {
		this.lca_submitted_date = lca_submitted_date;
	}

	public String getLca_begin_date() {
		return lca_begin_date;
	}

	public void setLca_begin_date(String lca_begin_date) {
		this.lca_begin_date = lca_begin_date;
	}

	public String getLca_end_date() {
		return lca_end_date;
	}

	public void setLca_end_date(String lca_end_date) {
		this.lca_end_date = lca_end_date;
	}

	public String getLca_certified_date() {
		return lca_certified_date;
	}

	public void setLca_certified_date(String lca_certified_date) {
		this.lca_certified_date = lca_certified_date;
	}

	public String getJob_title() {
		return job_title;
	}

	public void setJob_title(String job_title) {
		this.job_title = job_title;
	}

	public String getSoc() {
		return soc;
	}

	public void setSoc(String soc) {
		this.soc = soc;
	}

	public String getWage_rate() {
		return wage_rate;
	}

	public void setWage_rate(String wage_rate) {
		this.wage_rate = wage_rate;
	}

	public String getPreviling_wage() {
		return previling_wage;
	}

	public void setPreviling_wage(String previling_wage) {
		this.previling_wage = previling_wage;
	}

	public String getWage_level() {
		return wage_level;
	}

	public void setWage_level(String wage_level) {
		this.wage_level = wage_level;
	}

	public int getPayrate_id() {
		return payrate_id;
	}

	public void setPayrate_id(int payrate_id) {
		this.payrate_id = payrate_id;
	}

	public int getCandidate_id() {
		return candidate_id;
	}

	public void setCandidate_id(int candidate_id) {
		this.candidate_id = candidate_id;
	}

	public int getPosted_by() {
		return posted_by;
	}

	public void setPosted_by(int posted_by) {
		this.posted_by = posted_by;
	}

	public Integer getLca_reference() {
		return lca_reference;
	}

	public void setLca_reference(Integer lca_reference) {
		this.lca_reference = lca_reference;
	}
}
