package com.jeju.app.reservs;

import java.sql.Date;

public class BoardingInfo {
	
	private String name;
	private String birth;
	private String reservNum;
	private String div;
	private String chargeDiv;
	private String fNumGo;
	private String fNumCome;
	
	
	
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getChargeDiv() {
		return chargeDiv;
	}
	public void setChargeDiv(String chargeDiv) {
		this.chargeDiv = chargeDiv;
	}
	public String getfNumGo() {
		return fNumGo;
	}
	public void setfNumGo(String fNumGo) {
		this.fNumGo = fNumGo;
	}
	public String getfNumCome() {
		return fNumCome;
	}
	public void setfNumCome(String fNumCome) {
		this.fNumCome = fNumCome;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getReservNum() {
		return reservNum;
	}
	public void setReservNum(String reservNum) {
		this.reservNum = reservNum;
	}
	public String getDiv() {
		return div;
	}
	public void setDiv(String div) {
		this.div = div;
	}

}
