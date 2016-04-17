package com.sun.dao;

import java.util.List;

import com.sun.entity.data.Announcement;
import com.sun.entity.data.Attendance;
import com.sun.entity.data.Calendar;
import com.sun.entity.data.Mission;
import com.sun.entity.dataModel.Int_StringRelationship;
import com.sun.entity.dataModel.MoreRelationship;

public interface IM_Index {
	/**
	 * 获取用户的任务信息
	 * @param uid_currDay
	 * @return
	 */
	public List<Mission> getMission(MoreRelationship uid_currDay) ;
	
	/**
	 * 获取用户的日程安排
	 * @param uid_currDay
	 * @return
	 */
	public List<Calendar> getCalendar(MoreRelationship uid_currDay);
	
	/**
	 * 获取考勤信息
	 * @param uid_firstDay_lastDay
	 * @return
	 */
	public List<Attendance> getAttendance(MoreRelationship uid_firstDay_lastDay);
	
	/**
	 * 获取公告信息
	 * @param did
	 * @return
	 */
	public List<Announcement> getAnnouncement(int did);
	
	/**
	 * 根据职位id获取部门id
	 * @param jid
	 * @return
	 */
	public int getDepartment(int jid);
}
