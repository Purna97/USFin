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
@Table(name="Tbl_VendorMaster")
public class VendorMasterEntity {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="vendor_id")
	private int vendorid;
	      
	@Column(name="vendor_name")
	private String vendorname;	
	
	@Column(name="vendor_contact_no")
	private String vendor_contact_no;
	
	@Column(name="vendor_mgr_email")
	private String vendor_mgr_email;
	
	@Column(name="status")
	private String vstatus;
	public String getVendor_type() {
		return vendor_type;
	}

	public void setVendor_type(String vendor_type) {
		this.vendor_type = vendor_type;
	}

	@Column(name="vendor_type")
	private String vendor_type;
	
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="submitted_on")
	private Date submittedOn;
	
	@Column(name="posted_by")
	private int postedBy;
	
	@Column(name="fed_id")
	private String fed_id;
	
	public String getFed_id() {
		return fed_id;
	}

	public void setFed_id(String fed_id) {
		this.fed_id = fed_id;
	}

	public int getVendorid() {
		return vendorid;
	}

	public void setVendorid(int vendorid) {
		this.vendorid = vendorid;
	}

	public String getVendorname() {
		return vendorname;
	}

	public void setVendorname(String vendorname) {
		this.vendorname = vendorname;
	}
	
	public String getVstatus() {
		return vstatus;
	}

	public void setVstatus(String vstatus) {
		this.vstatus = vstatus;
	}

	public Date getSubmittedOn() {
		return submittedOn;
	}

	public void setSubmittedOn(Date submittedOn) {
		this.submittedOn = submittedOn;
	}

	public int getPostedBy() {
		return postedBy;
	}

	public void setPostedBy(int postedBy) {
		this.postedBy = postedBy;
	}

	public String getVendor_contact_no() {
		return vendor_contact_no;
	}

	public void setVendor_contact_no(String vendor_contact_no) {
		this.vendor_contact_no = vendor_contact_no;
	}

	public String getVendor_mgr_email() {
		return vendor_mgr_email;
	}

	public void setVendor_mgr_email(String vendor_mgr_email) {
		this.vendor_mgr_email = vendor_mgr_email;
	}
}
