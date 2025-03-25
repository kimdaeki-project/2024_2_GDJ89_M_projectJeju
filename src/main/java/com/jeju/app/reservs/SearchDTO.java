package com.jeju.app.reservs;

import java.sql.Date;

public class SearchDTO {
	
	private String depAirportId;
	private Date plandGoDate;
	private Date plandComeDate;
	private Long person;
	
	
	public String getDepAirportId() {
		return depAirportId;
	}
	public void setDepAirportId(String depAirportId) {
		this.depAirportId = depAirportId;
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
