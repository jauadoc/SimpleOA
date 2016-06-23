package com.sun.controller;


import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sun.service.M_FriendService;
import com.sun.service.M_MessageService;

/**
 * 
 * index模块控制器
 * @author javadoc
 */
@Controller
@RequestMapping("/m_friend")
public class M_Friend_Controller extends BaseController{
	
	@Autowired
	SqlSessionFactory sqlSessionFactory;
	/**
	 * 获取联系人列表
	 * 
	 */
	@RequestMapping(value = "/getFriend.do")
	public ModelAndView getMessage(HttpServletRequest request,  HttpServletResponse response){
		String json = request.getParameter("data");
		try {
			new M_FriendService().getFriend(json, sqlSessionFactory, response);
		} catch (IOException e) {
			e.printStackTrace();
		} catch (IllegalArgumentException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}	
	
	/**
	 * 获取联系人信息
	 * 
	 */
	@RequestMapping(value = "/getFriendInfo.do")
	public ModelAndView deleteMessage(HttpServletRequest request,  HttpServletResponse response){
		String json = request.getParameter("data");
		try {
			new M_FriendService().getFriendInfo(json, sqlSessionFactory, response);
		} catch (IOException e) {
			e.printStackTrace();
		} catch (IllegalArgumentException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
}