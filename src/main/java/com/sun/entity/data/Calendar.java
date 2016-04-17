package com.sun.entity.data;

import java.util.Date;

public class Calendar {
	int id;
	String matter;
	Date calender_date;
	int uid;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getMatter() {
		return matter;
	}
	public void setMatter(String matter) {
		this.matter = matter;
	}
	public Date getCalender_date() {
		return calender_date;
	}
	public void setCalender_date(Date calender_date) {
		this.calender_date = calender_date;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public Calendar(int id, String matter, Date calender_date, int uid) {
		super();
		this.id = id;
		this.matter = matter;
		this.calender_date = calender_date;
		this.uid = uid;
	}
	public Calendar() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Calendar [id=" + id + ", matter=" + matter + ", calender_date="
				+ calender_date + ", uid=" + uid + "]";
	}
}
