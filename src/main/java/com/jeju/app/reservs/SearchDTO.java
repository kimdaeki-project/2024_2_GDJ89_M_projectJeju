package com.jeju.app.reservs;

import java.sql.Date;

public class SearchDTO {
	
	private String depAirportId;
	private String arrAirportId;
	private String depPlandTime;
	private String depPlandTimeToCome;
	private Long adult;
	private Long child;
	private Long infant;
	
	
	public String getDepAirportId() {
		return depAirportId;
	}
	public void setDepAirportId(String depAirportId) {
		this.depAirportId = depAirportId;
	}
	public String getArrAirportId() {
		return arrAirportId;
	}
	public void setArrAirportId(String arrAirportId) {
		this.arrAirportId = arrAirportId;
	}
	public String getDepPlandTime() {
		return depPlandTime;
	}
	public void setDepPlandTime(String depPlandTime) {
		this.depPlandTime = depPlandTime;
	}
	public String getDepPlandTimeToCome() {
		return depPlandTimeToCome;
	}
	public void setDepPlandTimeToCome(String depPlandTimeToCome) {
		this.depPlandTimeToCome = depPlandTimeToCome;
	}
	public Long getAdult() {
		return adult;
	}
	public void setAdult(Long adult) {
		this.adult = adult;
	}
	public Long getChild() {
		return child;
	}
	public void setChild(Long child) {
		this.child = child;
	}
	public Long getInfant() {
		return infant;
	}
	public void setInfant(Long infant) {
		this.infant = infant;
	}	
	

}
