package com.sun.controller;

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
import com.sun.utils.DateUtil;
import com.sun.utils.MD5Util;
import com.sun.utils.SafeUtil;
import com.sun.utils.StrUtil;
/**
 * 
 * @author javadoc
 */
@Controller
public class GeneralController extends BaseController{
	private static String userRight = "登录成功,正在转跳首页...";
	private static String userWrong = "用户名或密码错误";
	
	/**
	 * 首页
	 */
	@Autowired
	SqlSessionFactory sqlSessionFactory;
	@RequestMapping(value = "index.do")
	public ModelAndView index_jsp(HttpServletRequest request,  HttpServletResponse response)throws Exception {
		ModelAndView model = new ModelAndView("index");
		return model;
	}
	/**
	 * 测试Mybatis
	 * 
	 */
	@RequestMapping(value = "test.do")
	public ModelAndView test_jsp(HttpServletRequest request,  HttpServletResponse response)throws Exception {
		ModelAndView model = new ModelAndView("test");
//		SqlSession session = sqlSessionFactory.openSession();
//		User user = session.selectOne("com.sun.user.getUser",1);
//		System.out.println(user);
//		model.addObject("user", user);
		return model;
	}
	/**
	 * 跳转至登录页面
	 */
	@RequestMapping(value = "login.do")
	public ModelAndView login_jsp(HttpServletRequest request,  HttpServletResponse response)throws Exception {
		return new ModelAndView("login");
	}

	/**
	 * 用户登录
	 */
	@RequestMapping(value = "check.do")
	public ModelAndView check_user(HttpServletRequest request,  
	        HttpServletResponse response)throws Exception{
		//获取前端用户名密码，验证用户名密码是否正确
		String uname = (String)request.getParameter("uname");
		String pwd = (String)request.getParameter("pwd");
		ObjectMapper mapper = new ObjectMapper();
		if(SafeUtil.checkUname(uname)){
			String json = mapper.writeValueAsString(new OutMessage("error", userWrong, DateUtil.yyyyMMdd.format(new Date())));
			response.getWriter().write(json);
			return null;
		}
		if(StrUtil.notNull(pwd)){
			pwd = MD5Util.md5(pwd);
		}
		SqlSession session = sqlSessionFactory.openSession();
		IUser iUser = session.getMapper(IUser.class);
		PageUser pageUser = new PageUser(0, uname, null, null, pwd, 0);
		pageUser = iUser.checkUser(pageUser);
//		密码不正确返回错误信息，正确返回正确信息并跳转页面
		if(pageUser==null || pageUser==new PageUser()){
			String json = mapper.writeValueAsString(new OutMessage("error", userWrong, DateUtil.yyyyMMdd.format(new Date())));
			response.getWriter().write(json);
			return null;
		}
		request.getSession().setAttribute("pageUser", pageUser);
		String json = mapper.writeValueAsString(new OutMessage("success", userRight, DateUtil.yyyyMMdd.format(new Date())));
		response.getWriter().write(json);
//		-----------------------------------------------------------------------
		System.out.println(json);
		System.out.println("==========================");
//		-----------------------------------------------------------------------
		Map<String,Object> mv = new HashMap<String,Object>();
		mv.put("pageUser", pageUser);
//		return new ModelAndView("index",mv);
		return null;
	}
}