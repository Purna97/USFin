package com.tekskills.Entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Tbl_WorkAuthorization")
public class WorkAuthorization {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="work_auth_id")
	private int work_auth_id;
	
	@Column(name="work_auth_name")
	private String work_auth_name;

	public int getWork_auth_id() {
		return work_auth_id;
	}

	public void setWork_auth_id(int work_auth_id) {
		this.work_auth_id = work_auth_id;
	}

	public String getWork_auth_name() {
		return work_auth_name;
	}

	public void setWork_auth_name(String work_auth_name) {
		this.work_auth_name = work_auth_name;
	}
}
