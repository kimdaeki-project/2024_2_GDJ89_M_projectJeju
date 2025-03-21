package com.jeju.app.pages;

public class PB_Pager {
	
	private Long startNum;
	private Long endNum;
	private Long start;
	private Long end;
	private Long page;
	private Long perPage;
	private boolean endCheck;
	
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
	public Long getStart() {
		return start;
	}
	public void setStart(Long start) {
		this.start = start;
	}
	public Long getEnd() {
		return end;
	}
	public void setEnd(Long end) {
		this.end = end;
	}
	public boolean isEndCheck() {
		return endCheck;
	}
	public void setEndCheck(boolean endCheck) {
		this.endCheck = endCheck;
	}
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
		if (this.perPage==null) {
			this.perPage=10L;
		}
		return perPage;
	}
	public void setPerPage(Long perPage) {
		this.perPage = perPage;
	}
	
	public void makeNum() {
		this.startNum = (this.getPage()-1)*this.getPerPage()+1;
		this.endNum = this.getPage()*this.getPerPage();
	}
	
	//page번호를 계산하는 메서드 make
	public void make(Long totalCount) {
		if (totalCount<1) {
			totalCount=1L;
		}
		
		Long totalPage = totalCount/10;
		if (totalCount%10 != 0) {
			totalPage++;
		}
		
		Long totalBlock = totalPage/5;
		if (totalPage%5 !=0) {
			totalBlock++;
		}
		
		Long curBlock = this.getPage()/5;
		if (this.getPage()%5 != 0) {
			curBlock++;
		}
		
		Long start = (curBlock-1)*5+1;
		Long end = curBlock*5;
		
		this.setStart(start);
		this.setEnd(end);
		
		if (totalBlock == curBlock) {
			this.setEnd(totalPage);
			this.setEndCheck(true);
		}
		
	}
	
}
