package com.sun.controller;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sun.dao.IUser;
import com.sun.entity.OutMessage;
import com.sun.entity.PageUser;
import com.sun.service.GeneralService;
import com.sun.service.GlobalService;
import com.sun.service.QuickUseService;
import com.sun.utils.DateUtil;
import com.sun.utils.MD5Util;
import com.sun.utils.SafeUtil;
import com.sun.utils.StrUtil;
/**
 * 
 * @author javadoc
 * 首页及基本控制器
 */
@Controller
@RequestMapping("/data")
public class GlobalController extends BaseController{
	/**
	 * 首页
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