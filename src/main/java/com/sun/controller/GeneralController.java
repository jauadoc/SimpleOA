package com.sun.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.sun.dao.User;
/**
 * 
 * @author javadoc
 * �����أ�����ҳ����ת���ء�
 */
@Controller
public class GeneralController extends BaseController{
	/**
	 * @param model
	 * index_jsp ��ҳ����
	 */
	@Autowired
	SqlSessionFactory sqlSessionFactory;
	@RequestMapping(value = "index.do")
	public ModelAndView index_jsp(HttpServletRequest request,  HttpServletResponse response)throws Exception {
		ModelAndView model = new ModelAndView("test");
		SqlSession session = sqlSessionFactory.openSession();
		User user = session.selectOne("com.sun.user.getUser",1);
		System.out.println(user);
		model.addObject("user", user);
		return model;
	}
	/**
	 * @param model
	 * login_jsp��¼����
	 * @return 
	 */
	@RequestMapping(value = "login.do")
	public ModelAndView login_jsp(HttpServletRequest request,  HttpServletResponse response)throws Exception {
		return new ModelAndView("login");
	}

	@RequestMapping(value = "check.do")
	public ModelAndView check_user(HttpServletRequest request,  
	        HttpServletResponse response)throws Exception{
		
		String uname = (String)request.getParameter("uname");
		String pwd = (String)request.getParameter("pwd");
		System.out.println("uname"+":"+uname);
		Map<String,Object> mv = new HashMap<String,Object>();
		mv.put("test", "test");
		mv.put("abc", "abc");
		return new ModelAndView("index",mv);
	}
}