package com.sun.entity.data;

import java.util.Date;

public class Attendance {
	int id;
	int uid;
	Date work_start;
	Date work_end;
	int work_time;
	Date attendance_date;
	int is_rest;
	int is_absent;
	int is_compensated;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public Date getWork_start() {
		return work_start;
	}
	public void setWork_start(Date work_start) {
		this.work_start = work_start;
	}
	public Date getWork_end() {
		return work_end;
	}
	public void setWork_end(Date work_end) {
		this.work_end = work_end;
	}
	public int getWork_time() {
		return work_time;
	}
	public void setWork_time(int work_time) {
		this.work_time = work_time;
	}
	public Date getAttendance_date() {
		return attendance_date;
	}
	public void setAttendance_date(Date attendance_date) {
		this.attendance_date = attendance_date;
	}
	public int getIs_rest() {
		return is_rest;
	}
	public void setIs_rest(int is_rest) {
		this.is_rest = is_rest;
	}
	public int getIs_absent() {
		return is_absent;
	}
	public void setIs_absent(int is_absent) {
		this.is_absent = is_absent;
	}
	public int getIs_compensated() {
		return is_compensated;
	}
	public void setIs_compensated(int is_compensated) {
		this.is_compensated = is_compensated;
	}
	@Override
	public String toString() {
		return "Attendance [id=" + id + ", uid=" + uid + ", work_start="
				+ work_start + ", work_end=" + work_end + ", work_time="
				+ work_time + ", attendance_date=" + attendance_date
				+ ", is_rest=" + is_rest + ", is_absent=" + is_absent
				+ ", is_compensated=" + is_compensated + "]";
	}
	public Attendance(int id, int uid, Date work_start, Date work_end,
			int work_time, Date attendance_date, int is_rest, int is_absent,
			int is_compensated) {
		super();
		this.id = id;
		this.uid = uid;
		this.work_start = work_start;
		this.work_end = work_end;
		this.work_time = work_time;
		this.attendance_date = attendance_date;
		this.is_rest = is_rest;
		this.is_absent = is_absent;
		this.is_compensated = is_compensated;
	}
	public Attendance() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
