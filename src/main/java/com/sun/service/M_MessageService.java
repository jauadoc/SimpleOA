package com.sun.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.codehaus.jackson.map.ObjectMapper;

import com.sun.dao.IM_Message;
import com.sun.entity.InMessage_group;
import com.sun.entity.data.Message;
import com.sun.utils.JsonUtil;

public class M_MessageService {
	/**
	 * 
	 * @param json
	 * @param sqlSessionFactory
	 * @param response
	 * @throws IOException
	 * @throws IllegalArgumentException
	 * @throws IllegalAccessException
	 * 获取消息服务
	 */
	public void getMessage(String json, SqlSessionFactory sqlSessionFactory, HttpServletResponse response) throws  IOException, IllegalArgumentException, IllegalAccessException {
		//获取前端传来json，将json处理成Map<fid,uid>进行数据库查询
		ObjectMapper objectMapper = new ObjectMapper();
		InMessage_group inMessage_group = objectMapper.readValue(json, InMessage_group.class);
		int uid = inMessage_group.getUid();
		int kind = Integer.parseInt(inMessage_group.getData());
		
		
		//查询数据
		SqlSession session = sqlSessionFactory.openSession();
		IM_Message iM_Message = session.getMapper(IM_Message.class);
		Message message = new Message(0, "", "", 0, new Date(), 0, "", uid, kind);
		List<Message> messages = iM_Message.getMessageByUid(message);
		session.close();
		
		//拼接返回数据
		//动态拼接返回json数据。并通过jsonGenerator的构造方法设定输出流。
		JsonUtil.writeJson(messages, response.getOutputStream());

	}

	/**
	 * 
	 * @param json
	 * @param sqlSessionFactory
	 * @param response
	 * @throws IOException
	 * 删除消息服务
	 */
	public void deleteMessage(String json, SqlSessionFactory sqlSessionFactory, HttpServletResponse response) throws  IOException {
		//获取前端数据
		ObjectMapper objectMapper = new ObjectMapper();
		InMessage_group inMessage_group = objectMapper.readValue(json, InMessage_group.class);
		int uid = inMessage_group.getUid();
		String data = inMessage_group.getData();
		
		//执行sql
		String string_mids[] = data.split(",");
		List<Integer> mids = new ArrayList<Integer>();
		for (int i = 0; i < string_mids.length; i++) {
			mids.add(Integer.parseInt(string_mids[i]));
		}
		SqlSession session = sqlSessionFactory.openSession();
		IM_Message iM_Message = session.getMapper(IM_Message.class);
		iM_Message.deleteMessageById(mids);
		session.close();
		
		//暂不返回数据，前端自己处理
		JsonUtil.returnSuccessMessage(response.getOutputStream());
		
	}

	/**
	 * 
	 * @param json
	 * @param sqlSessionFactory
	 * @param response
	 * @throws IOException
	 * 设置消息是否已读
	 */
	public void setMessageIsRead(String json, SqlSessionFactory sqlSessionFactory, HttpServletResponse response) throws IOException {
		//获取前端数据
		ObjectMapper objectMapper = new ObjectMapper();
		InMessage_group inMessage_group = objectMapper.readValue(json, InMessage_group.class);
		int uid = inMessage_group.getUid();
		String data = inMessage_group.getData();		
		
		//更新数据
		int mid = Integer.parseInt(data);
		SqlSession session = sqlSessionFactory.openSession();
		IM_Message iM_Message = session.getMapper(IM_Message.class);
		iM_Message.setMessageIsReadByid(mid);
		session.close();
		
		//返回操作提示
		JsonUtil.returnSuccessMessage(response.getOutputStream());
		
	}

}
