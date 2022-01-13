package com.tekskills.Entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Tbl_EmpTypeMaster")
public class EmpTypeMaster {
	      
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="emp_type_id")
	private int e_id; 
		
	@Column(name="emp_type")
	private String emp_type;

	public int getE_id() {
		return e_id;
	}

	public void setE_id(int e_id) {
		this.e_id = e_id;
	}

	public String getEmp_type() {
		return emp_type;
	}

	public void setEmp_type(String emp_type) {
		this.emp_type = emp_type;
	}
}
