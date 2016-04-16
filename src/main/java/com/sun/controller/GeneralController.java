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
import com.sun.service.GeneralService;
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
public class GeneralController extends BaseController{
	
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
		return model;
	}
	/**
	 * 跳转至登录页面
	 */
	@RequestMapping(value = "login.do")
	public ModelAndView login_jsp(HttpServletRequest request,  HttpServletResponse response)throws Exception {
		if(request.getSession().getAttribute("pageUser")!=null){
			return new ModelAndView("index");
		}
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
		if(uname==null || pwd==null){
			return new ModelAndView("404");
		}
		new GeneralService().checkUser(uname, pwd, sqlSessionFactory, request, response);

		return null;
	}
	/**
	 * 页面获取转跳控制器
	 * 
	 */
	@RequestMapping(value = "goPage.do")
	public ModelAndView goPage(HttpServletRequest request,  HttpServletResponse response)throws Exception {
		response.setCharacterEncoding("UTF-8");

		String basePath = "content/";
		String uid = request.getParameter("uid");
		String pageUrl = basePath + request.getParameter("pageUrl");
		if(uid==null || uid.equals("0")){
			return new ModelAndView("404");
		}
		Map<String,Object> mv = new HashMap<String,Object>();
		PageUser pageUser = new PageUser(Integer.parseInt(uid), null, null, null, null, 0);
		mv.put("pageUser", pageUser);
		
		ModelAndView model = new ModelAndView(pageUrl,mv);
		return model;
	}	
	
	/**
	 * 退出登录
	 * 
	 */
	@RequestMapping(value = "logout.do")
	public ModelAndView getFunction(HttpServletRequest request,  HttpServletResponse response)throws Exception {
		ModelAndView model = new ModelAndView("logout");
		return model;
	}
}