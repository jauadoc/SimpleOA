package com.sun.controller;


import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sun.service.M_MessageService;

/**
 * 
 * index模块控制器
 * @author javadoc
 */
@Controller
@RequestMapping("/m_message")
public class M_Message_Controller extends BaseController{
	
	@Autowired
	SqlSessionFactory sqlSessionFactory;
	/**
	 * 获取消息信息
	 * 
	 */
	@RequestMapping(value = "/getMessage.do")
	public ModelAndView getMessage(HttpServletRequest request,  HttpServletResponse response){
		String json = request.getParameter("data");
		try {
			new M_MessageService().getMessage(json, sqlSessionFactory, response);
		} catch (IOException e) {
			e.printStackTrace();
		} catch (IllegalArgumentException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		}
		return null;
	}	
	
	/**
	 * 删除消息信息
	 * 
	 */
	@RequestMapping(value = "/deleteMessage.do")
	public ModelAndView deleteMessage(HttpServletRequest request,  HttpServletResponse response){
		String json = request.getParameter("data");
		try {
			new M_MessageService().deleteMessage(json, sqlSessionFactory, response);
		} catch (IOException e) {
			e.printStackTrace();
		} catch (IllegalArgumentException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 更新消息是否已读
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/setMessageIsRead.do")
	public ModelAndView setMessageIsRead(HttpServletRequest request,  HttpServletResponse response){
		String json = request.getParameter("data");
		try {
			new M_MessageService().setMessageIsRead(json, sqlSessionFactory, response);
		} catch (IOException e) {
			e.printStackTrace();
		} catch (IllegalArgumentException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
}