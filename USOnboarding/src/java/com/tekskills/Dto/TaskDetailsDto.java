package com.tekskills.Dto;

import java.util.List;
import com.tekskills.Entity.ClientDetailsEntity;
import com.tekskills.Entity.TaskDetailsEntity;

public class TaskDetailsDto {
	
	private int task_id;
	private String task_name;
	private String task_description;
	private String created_date;
	private String due_date;
	private String task_status;
	private int payrate_id;
	private Integer client_id;
	private int candidate_id;
	private int posted_by;
	private Integer documenttype_id;
	private String documenttype_name;
	private String comments;
	private String clientName;
	private Integer immigration_id;
	private String lca_number;
	private Integer lca_reference;

	
	List<TaskDetailsEntity>  taskDetailsList;
	ClientDetailsEntity clientObj;
	public List<TaskDetailsEntity> getTaskDetailsList() {
		return taskDetailsList;
	}
	public void setTaskDetailsList(List<TaskDetailsEntity> taskDetailsList) {
		this.taskDetailsList = taskDetailsList;
	}
	public ClientDetailsEntity getClientObj() {
		return clientObj;
	}
	public void setClientObj(ClientDetailsEntity clientObj) {
		this.clientObj = clientObj;
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
	public String getCreated_date() {
		return created_date;
	}
	public void setCreated_date(String created_date) {
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
	public Integer getClient_id() {
		return client_id;
	}
	public void setClient_id(Integer client_id) {
		this.client_id = client_id;
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
	public String getLca_number() {
		return lca_number;
	}
	public void setLca_number(String lca_number) {
		this.lca_number = lca_number;
	}
	public Integer getLca_reference() {
		return lca_reference;
	}
	public void setLca_reference(Integer lca_reference) {
		this.lca_reference = lca_reference;
	}
	public void setDocumenttype_name(String documenttype_name) {
		this.documenttype_name = documenttype_name;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	public String getClientName() {
		return clientName;
	}
	public void setClientName(String clientName) {
		this.clientName = clientName;
	}
	public Integer getImmigration_id() {
		return immigration_id;
	}
	public void setImmigration_id(Integer immigration_id) {
		this.immigration_id = immigration_id;
	}

}
