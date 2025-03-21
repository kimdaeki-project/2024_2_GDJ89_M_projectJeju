package com.jeju.app.apis;

public class ApiBodyDTO {
	
	private ApiItemsDTO items;
	private Long pageNo;
	private Long numOfRows;
	private Long totalCount;
	
	
	
	public ApiItemsDTO getItems() {
		return items;
	}
	public void setItems(ApiItemsDTO items) {
		this.items = items;
	}
	public Long getPageNo() {
		return pageNo;
	}
	public void setPageNo(Long pageNo) {
		this.pageNo = pageNo;
	}
	public Long getNumOfRows() {
		return numOfRows;
	}
	public void setNumOfRows(Long numOfRows) {
		this.numOfRows = numOfRows;
	}
	public Long getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(Long totalCount) {
		this.totalCount = totalCount;
	}

}
