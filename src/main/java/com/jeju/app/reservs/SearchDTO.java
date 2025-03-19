package com.jeju.app.reservs;

import java.sql.Date;

public class SearchDTO {
	
	private String depAirportNm;
	private Date plandGoDate;
	private Date plandComeDate;
	private Long person;
	
	
	public String getDepAirportNm() {
		return depAirportNm;
	}
	public void setDepAirportNm(String depAirportNm) {
		this.depAirportNm = depAirportNm;
	}
	public Date getPlandGoDate() {
		return plandGoDate;
	}
	public void setPlandGoDate(Date plandGoDate) {
		this.plandGoDate = plandGoDate;
	}
	public Date getPlandComeDate() {
		return plandComeDate;
	}
	public void setPlandComeDate(Date plandComeDate) {
		this.plandComeDate = plandComeDate;
	}
	public Long getPerson() {
		return person;
	}
	public void setPerson(Long person) {
		this.person = person;
	}

}
