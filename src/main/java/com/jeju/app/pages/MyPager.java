package com.jeju.app.pages;

public class MyPager {
	
	private Long page;
	private Long perPage;
	private Long startNum;
	private Long endNum;
	
	
	public Long getPage() {
		if (this.page==null || this.page<1) {
			this.page=1L;
		}
		return page;
	}
	public void setPage(Long page) {
		this.page = page;
	}
	public Long getPerPage() {
		this.perPage=10L;
		return perPage;
	}
	public void setPerPage(Long perPage) {
		this.perPage = perPage;
	}
	public Long getStartNum() {
		return startNum;
	}
	public void setStartNum(Long startNum) {
		this.startNum = startNum;
	}
	public Long getEndNum() {
		return endNum;
	}
	public void setEndNum(Long endNum) {
		this.endNum = endNum;
	}
	
	public void makeNum() {
		this.startNum = (this.getPage()-1)*this.getPerPage()+1;
		this.endNum = this.getPage()*this.getPerPage();
	}
	
}
