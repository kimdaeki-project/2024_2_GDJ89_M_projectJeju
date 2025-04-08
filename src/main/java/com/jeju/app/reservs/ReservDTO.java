package com.jeju.app.reservs;

import java.sql.Date;

public class ReservDTO {
	
	private String reservNum;
	private String userId;
	
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
