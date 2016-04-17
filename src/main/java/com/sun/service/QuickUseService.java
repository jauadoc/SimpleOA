package com.sun.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.JsonGenerator;
import org.codehaus.jackson.map.ObjectMapper;

import com.sun.dao.IData;
import com.sun.entity.InMessage_group;
import com.sun.entity.OutMessage;
import com.sun.entity.data.Function;
import com.sun.entity.dataModel.IntRelationship;
import com.sun.utils.DateUtil;
import com.sun.utils.JsonUtil;

public class QuickUseService {
	/**
	 * 添加快捷方式
	 * @param json
	 * @param sqlSessionFactory
	 * @param response
	 * @throws IOException
	 * 
	 */
	public void addQuickUse(String json,SqlSessionFactory sqlSessionFactory,HttpServletResponse response) throws  IOException{
		//获取前端传来json，将json处理成Map<fid,uid>进行数据库查询
		ObjectMapper objectMapper = new ObjectMapper();
		Map inMessage = objectMapper.readValue(json, Map.class);
		int uid = (Integer) inMessage.get("uid");
		ArrayList data = (ArrayList) inMessage.get("data");
		List<IntRelationship> quickuses = new ArrayList<IntRelationship>();
		for(int i=0;i<data.size();i++){
			Map func = (Map) data.get(i);
			IntRelationship intRelationship = new IntRelationship();
			intRelationship.setP1(uid);
			intRelationship.setP2(Integer.parseInt((String) func.get("func")));
			quickuses.add(intRelationship);
		}
		
		ObjectMapper mapper = new ObjectMapper();
		String outSJosn = mapper.writeValueAsString(new OutMessage("success", "添加成功", DateUtil.yyyyMMdd.format(new Date())));
		String outEJosn = mapper.writeValueAsString(new OutMessage("error", "添加失败", DateUtil.yyyyMMdd.format(new Date())));
		//数据库查询功能列表数据
		//开启事务，将删除和插入操作放在一个事务内
		SqlSession session = sqlSessionFactory.openSession(false);
		IData iData = session.getMapper(IData.class);
		try{
			iData.deleteQuickUse(uid);
			iData.addQuickUse(quickuses);
			session.commit();
		}catch (Exception e) {
			session.rollback();
			response.getWriter().write(outEJosn);
		}finally{
			session.close();
		}
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(outSJosn);
		//动态拼接返回json数据。并通过jsonGenerator的构造方法设定输出流。
	}
	/**
	 * 获取功能列表
	 * @param json
	 * @param sqlSessionFactory
	 * @param response
	 * @throws IOException
	 * 
	 */
	public void getFunction(String json,SqlSessionFactory sqlSessionFactory,HttpServletResponse response) throws  IOException{
		//获取前端传来json，将json处理成Map<fid,uid>进行数据库查询
		ObjectMapper objectMapper = new ObjectMapper();
		InMessage_group inMessage = objectMapper.readValue(json, InMessage_group.class);
		int uid = inMessage.getUid();

		//数据库查询功能列表数据
		SqlSession session = sqlSessionFactory.openSession();
		IData iData = session.getMapper(IData.class);
		List<Function> functions = iData.getFunction(uid);
		List<String> chooseFunctions = iData.getChooseFunction(uid);
		Map<String, Boolean> isChoose = new HashMap<String, Boolean>(); 
		for(int i=0;i<chooseFunctions.size();i++){
			isChoose.put(chooseFunctions.get(i), true);
		}
		session.close();
		
		//动态拼接返回json数据。并通过jsonGenerator的构造方法设定输出流。
		JsonGenerator jsonGenerator= JsonUtil.getJsonGenerator(response.getOutputStream());
		try {
			
	        jsonGenerator.writeStartObject();//{
				jsonGenerator.writeArrayFieldStart("functions");//function:[
					for(int i=0;i<functions.size();i++){
						jsonGenerator.writeStartObject();//{
							jsonGenerator.writeObjectField("name", functions.get(i).getName());
							if(isChoose.get(functions.get(i).getName())!=null&&isChoose.get(functions.get(i).getName())){
								jsonGenerator.writeObjectField("isChoose", "true");
							}else{
								jsonGenerator.writeObjectField("isChoose", "false");
							}
							jsonGenerator.writeObjectField("fid", functions.get(i).getId());
						jsonGenerator.writeEndObject(); // }  
					}
		        jsonGenerator.writeEndArray();//]
				jsonGenerator.writeObjectField("count", functions.size());
		    jsonGenerator.writeEndObject(); // }
	        jsonGenerator.close();
		} catch (JsonGenerationException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}  
	}
	

	
}
