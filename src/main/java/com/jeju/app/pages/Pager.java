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
		if (page==null || page<1) {
			page=1L;
		}
		return page;
	}
	public void setPage(Long page) {
		this.page = page;
	}
	public String getKind() {
		if (search==null) {
			search="k1";
		}
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	public String getSearch() {
		if (search==null) {
			search="";
		}
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
	public String getSearchKind() {
		if (searchKind==null) {
			searchKind="sk1";
		}
		return searchKind;
	}
	public void setSearchKind(String searchKind) {
		this.searchKind = searchKind;
	}
	public Long getPerPage() {
		if (perPage==null) {
			perPage=10L;
		}
		return perPage;
	}
	public void setPerPage(Long perPage) {
		this.perPage = perPage;
	}
	
	//page - 현재 페이지 perPage - 한 페이지에 보여줄 row의 개수
	
	//시작번호, 끝번호를 계산하는 메서드 makeNum
	public void makeNum() {
		
	}
	
	//page번호를 계산하는 메서드 make
	public void make() {
		
	}

	
	
}
