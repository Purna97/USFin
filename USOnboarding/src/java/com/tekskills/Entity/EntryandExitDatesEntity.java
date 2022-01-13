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
@Table(name="Tbl_EntryandExitDates")
public class EntryandExitDatesEntity {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	
	@Column(name="dates_id")
	private int dates_id; 
	
	@Column(name="h1questionnrie_id")
	private int h1questionnrie_id; 
	
	@Column(name="candidate_id")
	private int candidate_id;
	
	@Column(name="beneficiary_type")
	private String beneficiary_type;
	
	@Column(name="arrival_date")
	private String arrival_date;
	
	@Column(name="arrival_visa")
	private String arrival_visa;
	
	@Column(name="departure_date")
	private String departure_date;
	
	@Column(name="departure_visa")
	private String departure_visa;

	@Column(name="status")
	private String status;
	
	@Column(name="posted_by")
	private int posted_by;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="submitted_on")
	private Date submitted_on;

	public int getDates_id() {
		return dates_id;
	}

	public void setDates_id(int dates_id) {
		this.dates_id = dates_id;
	}

	public int getH1questionnrie_id() {
		return h1questionnrie_id;
	}

	public void setH1questionnrie_id(int h1questionnrie_id) {
		this.h1questionnrie_id = h1questionnrie_id;
	}

	public int getCandidate_id() {
		return candidate_id;
	}

	public void setCandidate_id(int candidate_id) {
		this.candidate_id = candidate_id;
	}

	public String getArrival_date() {
		return arrival_date;
	}

	public void setArrival_date(String arrival_date) {
		this.arrival_date = arrival_date;
	}

	public String getArrival_visa() {
		return arrival_visa;
	}

	public void setArrival_visa(String arrival_visa) {
		this.arrival_visa = arrival_visa;
	}

	public String getDeparture_date() {
		return departure_date;
	}

	public void setDeparture_date(String departure_date) {
		this.departure_date = departure_date;
	}

	public String getDeparture_visa() {
		return departure_visa;
	}

	public void setDeparture_visa(String departure_visa) {
		this.departure_visa = departure_visa;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getPosted_by() {
		return posted_by;
	}

	public void setPosted_by(int posted_by) {
		this.posted_by = posted_by;
	}

	public Date getSubmitted_on() {
		return submitted_on;
	}

	public void setSubmitted_on(Date submitted_on) {
		this.submitted_on = submitted_on;
	}

	public String getBeneficiary_type() {
		return beneficiary_type;
	}

	public void setBeneficiary_type(String beneficiary_type) {
		this.beneficiary_type = beneficiary_type;
	} 
		
}
