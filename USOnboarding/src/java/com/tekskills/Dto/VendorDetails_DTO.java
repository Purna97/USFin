package com.tekskills.Dto;

import java.util.LinkedList;
import java.util.List;

import com.tekskills.Entity.CompanyAdressEntity;
import com.tekskills.Entity.VendorMasterEntity;

public class VendorDetails_DTO {
	private VendorMasterEntity vendObj;
	private VendorDocumentsDto venDocsObj;
	private List<DocEmpBean> vendorDocs=new LinkedList<DocEmpBean>();
	
	private CompanyAdressEntity vendorAddressObj;
	public List<DocEmpBean> getVendorDocs() {
		return vendorDocs;
	}
	public void setVendorDocs(List<DocEmpBean> vendorDocs) {
		this.vendorDocs = vendorDocs;
	}
	public VendorMasterEntity getVendObj() {
		return vendObj;
	}
	public void setVendObj(VendorMasterEntity vendObj) {
		this.vendObj = vendObj;
	}
	public CompanyAdressEntity getVendorAddressObj() {
		return vendorAddressObj;
	}
	public void setVendorAddressObj(CompanyAdressEntity vendorAddressObj) {
		this.vendorAddressObj = vendorAddressObj;
	}
	public VendorDocumentsDto getVenDocsObj() {
		return venDocsObj;
	}
	public void setVenDocsObj(VendorDocumentsDto venDocsObj) {
		this.venDocsObj = venDocsObj;
	}	
}
