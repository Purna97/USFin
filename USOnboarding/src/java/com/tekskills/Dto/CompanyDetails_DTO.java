package com.tekskills.Dto;

public class CompanyDetails_DTO {
		
		private int companyId;
	    private String companyName; 
	    private String company_contactperson;
	    private String company_mgr_email;
	    private String companystaus;
	    private String companyfedId;
	    
	    private String line1;
		private String line2;
		private String city;
		private String state;
		private String zipcode;
		private String vendor_type;
		
		private String payment_terms;
		private String country;
		
		public String getPayment_terms() {
			return payment_terms;
		}
		public void setPayment_terms(String payment_terms) {
			this.payment_terms = payment_terms;
		}
		public String getCountry() {
			return country;
		}
		public void setCountry(String country) {
			this.country = country;
		}
		public String getCompanyfedId() {
			return companyfedId;
		}
		public void setCompanyfedId(String companyfedId) {
			this.companyfedId = companyfedId;
		}
		public String getCompanyName() {
			return companyName;
		}
		public void setCompanyName(String companyName) {
			this.companyName = companyName;
		}
		public String getCompany_contactperson() {
			return company_contactperson;
		}
		public void setCompany_contactperson(String company_contactperson) {
			this.company_contactperson = company_contactperson;
		}
		public String getCompany_mgr_email() {
			return company_mgr_email;
		}
		public void setCompany_mgr_email(String company_mgr_email) {
			this.company_mgr_email = company_mgr_email;
		}
		
		public String getLine1() {
			return line1;
		}
		public void setLine1(String line1) {
			this.line1 = line1;
		}
		public String getLine2() {
			return line2;
		}
		public void setLine2(String line2) {
			this.line2 = line2;
		}
		public String getCity() {
			return city;
		}
		public void setCity(String city) {
			this.city = city;
		}
		public String getState() {
			return state;
		}
		public void setState(String state) {
			this.state = state;
		}
		public String getZipcode() {
			return zipcode;
		}
		public void setZipcode(String zipcode) {
			this.zipcode = zipcode;
		}
		public String getCompanystaus() {
			return companystaus;
		}
		public void setCompanystaus(String companystaus) {
			this.companystaus = companystaus;
		}
		public int getCompanyId() {
			return companyId;
		}
		public void setCompanyId(int companyId) {
			this.companyId = companyId;
		}
		public String getVendor_type() {
			return vendor_type;
		}
		public void setVendor_type(String vendor_type) {
			this.vendor_type = vendor_type;
		}
	    
}