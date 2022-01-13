package com.tekskills.Entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name="Tbl_SOCcodeMaster")
public class SOCcodeMasterEntity {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="soc_id")
	private int soc_id;
		
	@Column(name="soc_code")
	private String soc_code;
	
	@Column(name="soccode_title")
	private String soccode_title;
	
	@Column(name="duties")
	private String duties;
	
	@Column(name="from_wage_range")
	private String from_wage_range;
	
	@Column(name="to_wage_range")
	private String to_wage_range;
	
	@Column(name="occupation_calssification")
	private String occupation_calssification;
	
	@Column(name="submitted_by")
	private int submitted_by;
	
	@Temporal(TemporalType.DATE)
	@Column(name="submitted_on")
	private Date submitted_on;

	public int getSoc_id() {
		return soc_id;
	}

	public void setSoc_id(int soc_id) {
		this.soc_id = soc_id;
	}

	public String getSoc_code() {
		return soc_code;
	}

	public void setSoc_code(String soc_code) {
		this.soc_code = soc_code;
	}

	public String getSoccode_title() {
		return soccode_title;
	}

	public void setSoccode_title(String soccode_title) {
		this.soccode_title = soccode_title;
	}

	public String getDuties() {
		return duties;
	}

	public void setDuties(String duties) {
		this.duties = duties;
	}

	

	public String getOccupation_calssification() {
		return occupation_calssification;
	}

	public void setOccupation_calssification(String occupation_calssification) {
		this.occupation_calssification = occupation_calssification;
	}

	public int getSubmitted_by() {
		return submitted_by;
	}

	public void setSubmitted_by(int submitted_by) {
		this.submitted_by = submitted_by;
	}

	public Date getSubmitted_on() {
		return submitted_on;
	}

	public void setSubmitted_on(Date submitted_on) {
		this.submitted_on = submitted_on;
	}

	public String getFrom_wage_range() {
		return from_wage_range;
	}

	public void setFrom_wage_range(String from_wage_range) {
		this.from_wage_range = from_wage_range;
	}

	public String getTo_wage_range() {
		return to_wage_range;
	}

	public void setTo_wage_range(String to_wage_range) {
		this.to_wage_range = to_wage_range;
	}


}
