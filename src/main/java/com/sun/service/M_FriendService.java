package com.sun.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;

import com.sun.dao.IM_Friend;
import com.sun.entity.InMessage_group;
import com.sun.entity.outData.Friend;
import com.sun.entity.outData.FriendInfo;
import com.sun.utils.JsonUtil;

public class M_FriendService {
	/**
	 * @throws IllegalAccessException 
	 * @throws IllegalArgumentException 
	 * 
	 */
	public void getFriend(String json, SqlSessionFactory sqlSessionFactory, HttpServletResponse response) throws JsonParseException, JsonMappingException, IOException, IllegalArgumentException, IllegalAccessException {
		//获取前端传来json，将json处理成Map<fid,uid>进行数据库查询
		ObjectMapper objectMapper = new ObjectMapper();
		InMessage_group inMessage_group = objectMapper.readValue(json, InMessage_group.class);
		int uid = inMessage_group.getUid();
		
		//查询数据
		SqlSession session = sqlSessionFactory.openSession();
		IM_Friend iM_Friend = session.getMapper(IM_Friend.class);
		List<Friend> friends = iM_Friend.getFriendByUid(uid);
		session.close();
		
		//拼接返回数据
		//动态拼接返回json数据。并通过jsonGenerator的构造方法设定输出流。
		JsonUtil.writeJson(friends, response.getOutputStream());
	}

	/**
	 * @throws IllegalAccessException 
	 * @throws IllegalArgumentException 
	 * 
	 */
	public void getFriendInfo(String json, SqlSessionFactory sqlSessionFactory, HttpServletResponse response) throws JsonParseException, JsonMappingException, IOException, IllegalArgumentException, IllegalAccessException {
		//获取前端传来json，将json处理成Map<fid,uid>进行数据库查询
		ObjectMapper objectMapper = new ObjectMapper();
		InMessage_group inMessage_group = objectMapper.readValue(json, InMessage_group.class);
		int uid = inMessage_group.getUid();
		String data = inMessage_group.getData();
		
		//查询数据
		int fid = Integer.parseInt(data);
		SqlSession session = sqlSessionFactory.openSession();
		IM_Friend iM_Friend = session.getMapper(IM_Friend.class);
		FriendInfo friendInfo = iM_Friend.getFriendInfoByFid(fid);
		List<FriendInfo> friendInfos = new ArrayList<FriendInfo>();
		friendInfos.add(friendInfo);
		session.close();
		
		//拼接返回数据
		//动态拼接返回json数据。并通过jsonGenerator的构造方法设定输出流。
		JsonUtil.writeJson(friendInfos, response.getOutputStream());
	}

}
