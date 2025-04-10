package com.jeju.app.pages;

public class Pager {
	
	private Long startNum;
	private Long endNum;
	private Long start;
	private Long end;
	private Long page;
	private Long perPage;
	private boolean endCheck;
	private String kind;
	private String search;
	private String searchKind;
	private String locationKind;
	
	public String getLocationKind() {
		return locationKind;
	}
	public void setLocationKind(String locationKind) {
		this.locationKind = locationKind;
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
	public String getKind() {
		if (this.kind==null) {
			this.kind="k1";
		}
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	public String getSearch() {
		if (this.search==null) {
			this.search="";
		}
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
	public String getSearchKind() {
		if (this.searchKind==null) {
			this.searchKind="sk1";
		}
		return searchKind;
	}
	public void setSearchKind(String searchKind) {
		this.searchKind = searchKind;
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
	
	//page - 현재 페이지 perPage - 한 페이지에 보여줄 row의 개수
	
	//시작번호, 끝번호를 계산하는 메서드 makeNum
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
		System.out.println(curBlock+"curBl");
		Long start = (curBlock-1)*5+1;
		Long end = curBlock*5;
		
		this.setStart(start);
		this.setEnd(end);
		
		if (totalBlock == curBlock) {
			this.setEnd(totalPage);
			this.setEndCheck(true);
		}
		
	}
	
	public void cardMake(Long totalCount) {
		if (totalCount<1) {
			totalCount=1L;
		}
		
		Long totalPage = totalCount/10;
		if (totalCount%10 != 0) {
			totalPage++;
		}
		
		Long totalBlock = totalPage/5;
		if (totalPage%5 != 0) {
			totalBlock++;
		}
		
		Long curBlock = getPage()/5;
		if (getPage()%5 != 0) {
			curBlock++;
		}
		
		Long start = (curBlock-1)*5+1;
		Long end = curBlock*5;
		
		setStart(start);
		setEnd(end);
		
		if (totalBlock == curBlock) {
			setEnd(totalPage);
			setEndCheck(true);
		}
	}

	
	
}
