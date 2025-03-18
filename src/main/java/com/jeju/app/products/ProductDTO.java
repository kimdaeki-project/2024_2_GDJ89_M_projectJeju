package com.jeju.app.products;

import java.sql.Date;

public class ProductDTO {
	
	private Long productNum;
	private String remark;
	private String companyName;
	private Long price;
	private Byte person;
	private Date startDate;
	private Date endDate;
	private String category;
	
	
	
	public Long getProductNum() {
		return productNum;
	}
	public void setProductNum(Long productNum) {
		this.productNum = productNum;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public Long getPrice() {
		return price;
	}
	public void setPrice(Long price) {
		this.price = price;
	}
	public Byte getPerson() {
		return person;
	}
	public void setPerson(Byte person) {
		this.person = person;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	
}
