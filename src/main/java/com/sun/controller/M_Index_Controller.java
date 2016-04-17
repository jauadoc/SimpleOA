package com.sun.controller;


import java.io.IOException;
import java.text.ParseException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sun.service.GlobalService;
import com.sun.service.M_IndexService;
import com.sun.service.QuickUseService;

/**
 * 
 * index模块控制器
 * @author javadoc
 */
@Controller
@RequestMapping("/m_index")
public class M_Index_Controller extends BaseController{
	
	@Autowired
	SqlSessionFactory sqlSessionFactory;
	/**
	 * 获取模块信息-任务信息
	 * 获取任务信息
	 * 
	 */
	@RequestMapping(value = "/getToday.do")
	public ModelAndView getToday(HttpServletRequest request,  HttpServletResponse response){
		String json = request.getParameter("data");
		try {
			new M_IndexService().getToday(json, sqlSessionFactory, response);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	@RequestMapping(value = "/getAttendance.do")
	public ModelAndView getAttendance(HttpServletRequest request,  HttpServletResponse response){
		String json = request.getParameter("data");
		try {
			new M_IndexService().getAttendance(json, sqlSessionFactory, response);
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ParseException e) {
			e.printStackTrace();
			System.out.println("======================日期解析异常=======================");
		}
		return null;
	}
	@RequestMapping(value = "/getAnnouncement.do")
	public ModelAndView getAnnouncement(HttpServletRequest request,  HttpServletResponse response){
		String uid = request.getParameter("uid");
		try {
			new M_IndexService().getAnnouncement(uid, sqlSessionFactory, response);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
}