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
@Table(name="Tbl_TimeSheetMailReminderCount")
public class MailReminderCountEntity {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="reminder_id")
	private int reminder_id;
		
	@Column(name="candidate_id")
	private int candidate_id;
	
	@Column(name="submitted_by")
	private int submitted_by;
	
	@Column(name="from_date")
	private String from_date;

	@Column(name="to_date")
	private String to_date;

	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="submitted_on")
	private Date submitted_on;

	public int getReminder_id() {
		return reminder_id;
	}

	public void setReminder_id(int reminder_id) {
		this.reminder_id = reminder_id;
	}

	public int getCandidate_id() {
		return candidate_id;
	}

	public void setCandidate_id(int candidate_id) {
		this.candidate_id = candidate_id;
	}

	public Date getSubmitted_on() {
		return submitted_on;
	}

	public void setSubmitted_on(Date submitted_on) {
		this.submitted_on = submitted_on;
	}

	public int getSubmitted_by() {
		return submitted_by;
	}

	public void setSubmitted_by(int submitted_by) {
		this.submitted_by = submitted_by;
	}

	public String getFrom_date() {
		return from_date;
	}

	public void setFrom_date(String from_date) {
		this.from_date = from_date;
	}

	public String getTo_date() {
		return to_date;
	}

	public void setTo_date(String to_date) {
		this.to_date = to_date;
	}

}
