package com.sun.service;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.JsonGenerator;
import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;

import com.sun.dao.IM_Index;
import com.sun.dao.IUser;
import com.sun.entity.InMessage_group;
import com.sun.entity.PageUser;
import com.sun.entity.data.Announcement;
import com.sun.entity.data.Attendance;
import com.sun.entity.data.Calendar;
import com.sun.entity.data.Mission;
import com.sun.entity.dataModel.Int_StringRelationship;
import com.sun.entity.dataModel.MoreRelationship;
import com.sun.utils.DateUtil;
import com.sun.utils.JsonUtil;
import com.sun.utils.StrUtil;


public class M_IndexService {

	/**
	 * 获取当日信息- 任务+安排
	 * @param json
	 * @param sqlSessionFactory
	 * @param response
	 * @throws IOException
	 */
	public void getToday(String json, SqlSessionFactory sqlSessionFactory, HttpServletResponse response) throws IOException {
		//获取前端传来json，将json处理成Map<fid,uid>进行数据库查询
		ObjectMapper objectMapper = new ObjectMapper();
		InMessage_group inMessage_group = objectMapper.readValue(json, InMessage_group.class);
		int uid = inMessage_group.getUid();
		String currDay = inMessage_group.getData();
		MoreRelationship uid_currDay = new MoreRelationship();
		uid_currDay.setIntParam1(uid);
		try {
			uid_currDay.setDateParam1(DateUtil.yyyyMMdd.parse(currDay));
		} catch (ParseException e1) {
			System.out.println("======================================================日期解析异常==============");
		}
		
		//查询数据
		SqlSession session = sqlSessionFactory.openSession();
		IM_Index iM_Index = session.getMapper(IM_Index.class);
		List<Mission> missions = iM_Index.getMission(uid_currDay);
		List<Calendar> calendars = iM_Index.getCalendar(uid_currDay);
		session.close();
		//拼接返回json
		//动态拼接返回json数据。并通过jsonGenerator的构造方法设定输出流。
		JsonGenerator jsonGenerator= JsonUtil.getJsonGenerator(response.getOutputStream());
		jsonGenerator.writeStartObject();//{
			jsonGenerator.writeObjectField("status", "success");
			jsonGenerator.writeArrayFieldStart("data");//data:[
				if(missions.size()<1 || missions==null){
					jsonGenerator.writeStartObject();//{
						jsonGenerator.writeObjectField("id", "-1");
						jsonGenerator.writeObjectField("content", "==暂无任务==");
						jsonGenerator.writeObjectField("kind", "mission");
					jsonGenerator.writeEndObject();  //}
				}else{
					for(int j=0;j<missions.size();j++){
						Mission mission = missions.get(j);
						jsonGenerator.writeStartObject();//{
						jsonGenerator.writeObjectField("id", mission.getId());
						jsonGenerator.writeObjectField("content", mission.getName());
						jsonGenerator.writeObjectField("kind", "mission");
						jsonGenerator.writeEndObject();  //}
					}
				}
				if(calendars.size()<1 || calendars==null){
					jsonGenerator.writeStartObject();//{
						jsonGenerator.writeObjectField("id", "-1");
						jsonGenerator.writeObjectField("content", "==今日无安排==");
						jsonGenerator.writeObjectField("kind", "calendar");
					jsonGenerator.writeEndObject();  //}
				}else{
					for(int i=0;i<calendars.size();i++){
						Calendar calendar = calendars.get(i);
						jsonGenerator.writeStartObject();//{
						jsonGenerator.writeObjectField("id", calendar.getId());
						jsonGenerator.writeObjectField("content", calendar.getMatter());
						jsonGenerator.writeObjectField("kind", "calendar");
						jsonGenerator.writeEndObject();  //}
					}
				}
			jsonGenerator.writeEndArray(); // ]
			jsonGenerator.writeObjectField("date", new Long(System.currentTimeMillis()).toString());
	    jsonGenerator.writeEndObject();  //}
	    jsonGenerator.close();

		

	}
	/**
	 * 获取考勤信息
	 * @param json
	 * @param sqlSessionFactory
	 * @param response
	 * @throws IOException
	 * @throws ParseException
	 */
	public void getAttendance(String json, SqlSessionFactory sqlSessionFactory,
			HttpServletResponse response) throws IOException, ParseException {
		//获取前端传来json，将json处理成Map<fid,uid>进行数据库查询
		ObjectMapper objectMapper = new ObjectMapper();
		InMessage_group inMessage_group = objectMapper.readValue(json, InMessage_group.class);
		int uid = inMessage_group.getUid();
		String currMonthLastDayStr = inMessage_group.getData();
		Date currMonthFirstDay = DateUtil.yyyyMMdd.parse(currMonthLastDayStr.substring(0, currMonthLastDayStr.length()-2)+"01");
		Date currMonthLastDay = DateUtil.yyyyMMdd.parse(currMonthLastDayStr);
		
		//查询数据
		MoreRelationship uid_firstDay_lastDay = new MoreRelationship();
		uid_firstDay_lastDay.setIntParam1(uid);
		uid_firstDay_lastDay.setDateParam1(currMonthFirstDay);
		uid_firstDay_lastDay.setDateParam2(currMonthLastDay);
		SqlSession session = sqlSessionFactory.openSession();
		IM_Index iM_Index = session.getMapper(IM_Index.class);
		List<Attendance> attendances = iM_Index.getAttendance(uid_firstDay_lastDay);
		session.close();
//		var data = {"status":"success","data":{"workday":"1,2,5,11,23,22,17,30","rest":"4,13","absent":"3,6"},"date":"12312312"};
		
		//动态拼接返回json数据。并通过jsonGenerator的构造方法设定输出流。
		String workday = "";
		String restday = "";
		String absentday = "";
		for(int i=0;i<attendances.size();i++){
			Attendance attendance = attendances.get(i);
			//如果不是 旷工|请假|调休 - 即正常工作
			if(attendance.getIs_absent()==102 && attendance.getIs_rest()==102){
				workday += DateUtil.dd.format(attendance.getAttendance_date()).toString()+",";
			}
			//如果请假
			if(attendance.getIs_rest()==101){
				restday += DateUtil.dd.format(attendance.getAttendance_date()).toString()+",";
			}
			//如果 旷工
			if(attendance.getIs_absent()==101){
				absentday += DateUtil.dd.format(attendance.getAttendance_date()).toString()+",";
			}
		}
		workday = StrUtil.trimLast(workday, 1);
		restday = StrUtil.trimLast(restday, 1);
		absentday = StrUtil.trimLast(absentday, 1);
		JsonGenerator jsonGenerator= JsonUtil.getJsonGenerator(response.getOutputStream());
		jsonGenerator.writeStartObject();//{
			jsonGenerator.writeObjectField("status", "success");
			jsonGenerator.writeObjectFieldStart("data");//data:{
				jsonGenerator.writeObjectField("workday", workday);
				jsonGenerator.writeObjectField("restday", restday);
				jsonGenerator.writeObjectField("absentday", absentday);
			jsonGenerator.writeEndObject(); // }
			jsonGenerator.writeObjectField("date", new Long(System.currentTimeMillis()).toString());
	    jsonGenerator.writeEndObject();  //}
	    jsonGenerator.close();
	}
	/**
	 * 获取公告新闻信息
	 * @param id
	 * @param sqlSessionFactory
	 * @param response
	 * @throws IOException
	 */
	public void getAnnouncement(String id, SqlSessionFactory sqlSessionFactory, HttpServletResponse response) throws IOException {
		//前端数据获取
		int uid = Integer.parseInt(id);
		
		//数据查询
		SqlSession session = null;
		List<Announcement> announcements = null;
		try {
			session = sqlSessionFactory.openSession();
			IM_Index iM_Index = session.getMapper(IM_Index.class);
			IUser iuser = session.getMapper(IUser.class);
			PageUser user = iuser.getUser(uid);
			int did = iM_Index.getDepartment(user.getJid());
			announcements = iM_Index.getAnnouncement(did);
		} finally{
			session.close();
		}
		
//var data = {"status":"success","data":[{"kind":"new","title":"今天不错","content":"真不错！！","date":"2016-1-11","department":"公司"},{"kind":"announcement","title":"今天不错","content":"真不错！！","date":"2016-1-11","department":"公司"},{"kind":"announcement","title":"今天不错","content":"真不错！！","date":"2016-1-11","department":"部门"}],"date":"12312312"};		
		//动态json数据拼接
		JsonGenerator jsonGenerator= JsonUtil.getJsonGenerator(response.getOutputStream());
		jsonGenerator.writeStartObject();//{
			jsonGenerator.writeObjectField("status", "success");
			jsonGenerator.writeArrayFieldStart("data");//data:[
				for(int i=0;i<announcements.size();i++){
					Announcement announcement = announcements.get(i);
					jsonGenerator.writeStartObject();//{
						if(announcement.getKind()==1001){
							jsonGenerator.writeObjectField("kind", "new");
						}else{
							jsonGenerator.writeObjectField("kind", "announcement");
						}
						jsonGenerator.writeObjectField("title", announcement.getName());
						jsonGenerator.writeObjectField("content", announcement.getName());
						jsonGenerator.writeObjectField("date", DateUtil.yyyyMMdd.format(announcement.getAnnouncement_date()));
						if(announcement.getDid()==1100){
							jsonGenerator.writeObjectField("department", "公司");
						}else{
							jsonGenerator.writeObjectField("department", "部门");
						}
						if(announcement.getHref()==null || announcement.getHref()==""){
							jsonGenerator.writeObjectField("href", "javascript:void(0)");
						}else{
							jsonGenerator.writeObjectField("href", announcement.getHref());
						}
				    jsonGenerator.writeEndObject();  //}
				}
			jsonGenerator.writeEndArray(); // ]
			jsonGenerator.writeObjectField("date", new Long(System.currentTimeMillis()).toString());
	    jsonGenerator.writeEndObject();  //}
	    jsonGenerator.close();
		
	}
	
}
