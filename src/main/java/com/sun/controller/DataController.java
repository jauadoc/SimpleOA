package com.sun.controller;


import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sun.service.GlobalService;
import com.sun.service.QuickUseService;

/**
 * 
 * @author javadoc
 */
@Controller
@RequestMapping("/data")
public class DataController extends BaseController{
	/**
	 * 左侧模块-添加快捷方式
	 * 获取功能列表
	 */
	@Autowired
	SqlSessionFactory sqlSessionFactory;
	@RequestMapping(value = "/getFunction.do")
	public ModelAndView getFunction(HttpServletRequest request,  HttpServletResponse response) {
		String json = request.getParameter("data");
		try {
			new QuickUseService().getFunction(json, sqlSessionFactory, response);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
	/**
	 * 左侧模块-添加快捷方式
	 * 添加功能快捷方式
	 */
	@RequestMapping(value = "/addQuickUse.do")
	public ModelAndView addQuickUse(HttpServletRequest request,  HttpServletResponse response) {
		
		String json = request.getParameter("data");
		try {
			new QuickUseService().addQuickUse(json, sqlSessionFactory, response);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	/**
	 * 系统信息模块-获取目录
	 * 获取系统导航信息
	 */
	@RequestMapping(value = "/getSystem.do")
	public ModelAndView getSystem(HttpServletRequest request,  HttpServletResponse response){
		String json = request.getParameter("data");
		try {
			new GlobalService().getSystem(json, sqlSessionFactory, response);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	/**
	 * 系统信息模块-获取左侧个人信息
	 * 获取左侧个人信息
	 */
	@RequestMapping(value = "/getUserInfo.do")
	public ModelAndView getUserInfo(HttpServletRequest request,  HttpServletResponse response){
		String uid = request.getParameter("uid");
		try {
			new GlobalService().getUserInfo(uid, sqlSessionFactory, response);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
}