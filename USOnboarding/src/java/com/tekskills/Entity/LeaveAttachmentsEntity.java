package com.tekskills.Entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Tbl_LeaveAttachements")
public class LeaveAttachmentsEntity {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="leaves_id")
	private int leaves_id; 
	
	@Column(name="candidate_id")
	private int candidate_id;
	
	@Column(name="timesheet_id")
	private int timesheet_id;
	

	@Column(name="leave_filename")
	private String leave_filename;

	public int getLeaves_id() {
		return leaves_id;
	}

	public void setLeaves_id(int leaves_id) {
		this.leaves_id = leaves_id;
	}

	public int getCandidate_id() {
		return candidate_id;
	}

	public void setCandidate_id(int candidate_id) {
		this.candidate_id = candidate_id;
	}

	public int getTimesheet_id() {
		return timesheet_id;
	}

	public void setTimesheet_id(int timesheet_id) {
		this.timesheet_id = timesheet_id;
	}

	public String getLeave_filename() {
		return leave_filename;
	}

	public void setLeave_filename(String leave_filename) {
		this.leave_filename = leave_filename;
	}
	
}
