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
@Table(name="TaskDetails")
public class TaskDetailsEntity {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)	
	@Column(name="task_id")
	private int task_id;
		
	@Column(name="task_name")
	private String task_name;
	
	@Column(name="task_description")
	private String task_description;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="created_date")
	private Date created_date;
	

	@Column(name="due_date")
	private String due_date;
	
	@Column(name="task_status")
	private String task_status;
	
	@Column(name="payrate_id")
	private int payrate_id;
	
	@Column(name="client_id")
	private Integer client_id;
	
	@Column(name="candidate_id")
	private int candidate_id;
	
	@Column(name="posted_by")
	private int posted_by;
	
	@Column(name="documenttype_id")
	private Integer documenttype_id;
	
	@Column(name="documenttype_name")
	private String documenttype_name;
	
	@Column(name="comments")
	private String comments;
	
	@Column(name="immigration_id")
	private Integer immigration_id;
	
	public Integer getImmigration_id() {
		return immigration_id;
	}

	public void setImmigration_id(Integer immigration_id) {
		this.immigration_id = immigration_id;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public Integer getClient_id() {
		return client_id;
	}

	public void setClient_id(Integer client_id) {
		this.client_id = client_id;
	}
	public int getTask_id() {
		return task_id;
	}

	public void setTask_id(int task_id) {
		this.task_id = task_id;
	}

	public String getTask_name() {
		return task_name;
	}

	public void setTask_name(String task_name) {
		this.task_name = task_name;
	}

	public String getTask_description() {
		return task_description;
	}

	public void setTask_description(String task_description) {
		this.task_description = task_description;
	}

	public Date getCreated_date() {
		return created_date;
	}

	public void setCreated_date(Date created_date) {
		this.created_date = created_date;
	}

	public String getDue_date() {
		return due_date;
	}

	public void setDue_date(String due_date) {
		this.due_date = due_date;
	}

	public String getTask_status() {
		return task_status;
	}

	public void setTask_status(String task_status) {
		this.task_status = task_status;
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

	public Integer getDocumenttype_id() {
		return documenttype_id;
	}

	public void setDocumenttype_id(Integer documenttype_id) {
		this.documenttype_id = documenttype_id;
	}

	public String getDocumenttype_name() {
		return documenttype_name;
	}

	public void setDocumenttype_name(String documenttype_name) {
		this.documenttype_name = documenttype_name;
	}
}
