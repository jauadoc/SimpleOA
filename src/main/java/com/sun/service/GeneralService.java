package com.sun.service;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.codehaus.jackson.map.ObjectMapper;

import com.sun.dao.IUser;
import com.sun.entity.OutMessage;
import com.sun.entity.PageUser;
import com.sun.utils.DateUtil;
import com.sun.utils.MD5Util;
import com.sun.utils.SafeUtil;
import com.sun.utils.StrUtil;

public class GeneralService {
	private static String userRight = "登录成功,正在转跳首页...";
	private static String userWrong = "用户名或密码错误";
	/**
	 * 用户登录校验
	 * @param uname
	 * @param pwd
	 * @param sqlSessionFactory
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	public void checkUser(String uname, String pwd, SqlSessionFactory sqlSessionFactory,HttpServletRequest request, HttpServletResponse response) throws  IOException{
		ObjectMapper mapper = new ObjectMapper();
		if(SafeUtil.checkUname(uname)){
			String json = mapper.writeValueAsString(new OutMessage("error", userWrong, DateUtil.yyyyMMdd.format(new Date())));
			response.getWriter().write(json);
		}
		if(StrUtil.notNull(pwd)){
			pwd = MD5Util.md5(pwd);
		}
		SqlSession session = sqlSessionFactory.openSession();
		IUser iUser = session.getMapper(IUser.class);
		PageUser pageUser = new PageUser(0, uname, null, null, pwd, 0);
		pageUser = iUser.checkUser(pageUser);
		session.close();
		
	//	密码不正确返回错误信息，正确返回正确信息并跳转页面
		if(pageUser==null || pageUser==new PageUser()){
			String json = mapper.writeValueAsString(new OutMessage("error", userWrong, DateUtil.yyyyMMdd.format(new Date())));
			response.getWriter().write(json);
		}
		request.getSession().setAttribute("pageUser", pageUser);
		String json = mapper.writeValueAsString(new OutMessage("success", userRight, DateUtil.yyyyMMdd.format(new Date())));
		response.getWriter().write(json);
		
		Map<String,Object> mv = new HashMap<String,Object>();
		mv.put("pageUser", pageUser);
	}
}
