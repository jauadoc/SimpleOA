package com.sun.controller;


import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSessionFactory;
import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.map.JsonMappingException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sun.service.M_MessageService;
import com.sun.service.M_UserInfoService;

/**
 * 
 * index模块控制器
 * @author javadoc
 */
@Controller
@RequestMapping("/m_userInfo")
public class M_UserInfo_Controller extends BaseController{
	
	@Autowired
	SqlSessionFactory sqlSessionFactory;
	/**
	 * 获取个人信息
	 * 
	 */
	@RequestMapping(value = "/getUserInfo.do")
	public ModelAndView getUserInfo(HttpServletRequest request,  HttpServletResponse response){
		String json = request.getParameter("data");
		try {
			new M_UserInfoService().getUserInfo(json, sqlSessionFactory, response);
		} catch (IllegalArgumentException e) {
			e.printStackTrace();
		} catch (JsonParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonMappingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}	
	
	/**
	 * 保存个人信息
	 * 
	 */
	@RequestMapping(value = "/subUserInfo.do")
	public ModelAndView subUserInfo(HttpServletRequest request,  HttpServletResponse response){
		String json = request.getParameter("data");
		try {
			new M_UserInfoService().subUserInfo(json, sqlSessionFactory, response);
		} catch (IllegalArgumentException e) {
			e.printStackTrace();
		} catch (JsonParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonMappingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		return null;
	}	
	
}