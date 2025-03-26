package com.jeju.app.search;

import java.sql.Date;

import java.util.Calendar;

public class Days {
	
	private Date today;
	private Date searchDay;
	private Date b3Day;
	private Date b2Day;
	private Date b1Day;
	private Date a1Day;
	private Date a2Day;
	private Date a3Day;
	
	public Date getB3Day() {
		Calendar ca = this.stringToCalendar(this.searchDay.toString());
		ca.set(Calendar.DATE, ca.get(Calendar.DATE)-3);
		Date b3Day = new Date(ca.getTimeInMillis());
		return b3Day;
	}
	public void setB3Day(Date b3Day) {
		this.b3Day = b3Day;
	}
	public Date getB2Day() {
		Calendar ca = this.stringToCalendar(this.searchDay.toString());
		ca.set(Calendar.DATE, ca.get(Calendar.DATE)-2);
		Date b2Day = new Date(ca.getTimeInMillis());
		return b2Day;
	}
	public void setB2Day(Date b2Day) {
		this.b2Day = b2Day;
	}
	public Date getB1Day() {
		Calendar ca = this.stringToCalendar(this.searchDay.toString());
		ca.set(Calendar.DATE, ca.get(Calendar.DATE)-1);
		Date b1Day = new Date(ca.getTimeInMillis());
		return b1Day;
	}
	public void setB1Day(Date b1Day) {
		this.b1Day = b1Day;
	}
	public Date getA1Day() {
		Calendar ca = this.stringToCalendar(this.searchDay.toString());
		ca.set(Calendar.DATE, ca.get(Calendar.DATE)+1);
		Date a1Day = new Date(ca.getTimeInMillis());
		return a1Day;
	}
	public void setA1Day(Date a1Day) {
		this.a1Day = a1Day;
	}
	public Date getA2Day() {
		Calendar ca = this.stringToCalendar(this.searchDay.toString());
		ca.set(Calendar.DATE, ca.get(Calendar.DATE)+2);
		Date a2Day = new Date(ca.getTimeInMillis());
		return a2Day;
	}
	public void setA2Day(Date a2Day) {
		this.a2Day = a2Day;
	}
	public Date getA3Day() {
		Calendar ca = this.stringToCalendar(this.searchDay.toString());
		ca.set(Calendar.DATE, ca.get(Calendar.DATE)+3);
		Date a3Day = new Date(ca.getTimeInMillis());
		return a3Day;
	}
	public void setA3Day(Date a3Day) {
		this.a3Day = a3Day;
	}
	public Date getToday() {
		Calendar ca = Calendar.getInstance();
		today = new Date(ca.getTimeInMillis());
		return today;
	}
	public void setToday(Date today) {
		
		this.today = today;
	}
	public Date getSearchDay() {
		return searchDay;
	}
	public void setSearchDay(Date searchDay) {
		this.searchDay = searchDay;
	}
	public void setSearchDay(String searchDay) {
		Calendar ca = this.stringToCalendar(searchDay);
		Date date = new Date(ca.getTimeInMillis());
		this.searchDay = date;
	}
	
	public Calendar stringToCalendar(String str) {
		Calendar ca = Calendar.getInstance();
		ca.set(Integer.parseInt(str.substring(0, 4)), Integer.parseInt(str.substring(5, 7))-1, Integer.parseInt(str.substring(8, 10)));
		
		return ca;
	}

}
