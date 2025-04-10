package com.jeju.app.reservs;

import java.sql.Date;
import java.util.List;

import com.jeju.app.flights.FlightDTO;

public class ReservDTO {
	
	private String reservNum;
	private String userId;
	private String payment;
	private String fNumGo;
	private String fNumCome;
	private String chargeDiv;
	private FlightDTO fGo;
	private FlightDTO fCome;
	private List<BoardingInfo> boarders;
	

	public List<BoardingInfo> getBoarders() {
		return boarders;
	}
	public void setBoarders(List<BoardingInfo> boarders) {
		this.boarders = boarders;
	}
	public FlightDTO getfGo() {
		return fGo;
	}
	public void setfGo(FlightDTO fGo) {
		this.fGo = fGo;
	}
	public FlightDTO getfCome() {
		return fCome;
	}
	public void setfCome(FlightDTO fCome) {
		this.fCome = fCome;
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
	public String getChargeDiv() {
		return chargeDiv;
	}
	public void setChargeDiv(String chargeDiv) {
		this.chargeDiv = chargeDiv;
	}
	public String getPayment() {
		return payment;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}
	public String getReservNum() {
		return reservNum;
	}
	public void setReservNum(String reservNum) {
		this.reservNum = reservNum;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
}
