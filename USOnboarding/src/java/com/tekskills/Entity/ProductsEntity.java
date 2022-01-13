package com.tekskills.Entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Tbl_Products")
public class ProductsEntity {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="product_id")
	private Integer product_id;
	
	@Column(name="payrate_id")
    private Integer payrate_id;
	
	@Column(name="qb_productid")
    private Integer qb_productid;

	@Column(name="unitprice")
    private Integer  unitprice;
	
	@Column(name="product_name")
	private String product_name;
	
	@Column(name="product_type")
	private String product_type;
	
	@Column(name="description")
	private String description;
	
	@Column(name="status")
	private String status;
	
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Integer getProduct_id() {
		return product_id;
	}

	public void setProduct_id(Integer product_id) {
		this.product_id = product_id;
	}

	public Integer getPayrate_id() {
		return payrate_id;
	}

	public void setPayrate_id(Integer payrate_id) {
		this.payrate_id = payrate_id;
	}

	public Integer getQb_productid() {
		return qb_productid;
	}

	public void setQb_productid(Integer qb_productid) {
		this.qb_productid = qb_productid;
	}

	public Integer getUnitprice() {
		return unitprice;
	}

	public void setUnitprice(Integer unitprice) {
		this.unitprice = unitprice;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public String getProduct_type() {
		return product_type;
	}

	public void setProduct_type(String product_type) {
		this.product_type = product_type;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}


	
}
