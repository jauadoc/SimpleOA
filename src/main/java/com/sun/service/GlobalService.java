package com.sun.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.JsonGenerator;
import org.codehaus.jackson.map.ObjectMapper;

import com.sun.dao.IData;
import com.sun.dao.IGlobal;
import com.sun.dao.IUser;
import com.sun.entity.InMessage_group;
import com.sun.entity.PageUser;
import com.sun.entity.data.Directory;
import com.sun.entity.data.Function;
import com.sun.utils.JsonUtil;


public class GlobalService {
	/**
	 * 获取系统信息
	 * @param json
	 * @param sqlSessionFactory
	 * @param response
	 * @throws IOException
	 * 
	 */
	public void getSystem(String json,SqlSessionFactory sqlSessionFactory,HttpServletResponse response) throws  IOException{
		//查询目录信息
		SqlSession session = sqlSessionFactory.openSession();
		IGlobal iGlobal = session.getMapper(IGlobal.class);
		List<Directory> direcotrys = iGlobal.getSystem();
		session.close();
		
		
		//动态拼接返回json数据。并通过jsonGenerator的构造方法设定输出流。
		JsonGenerator jsonGenerator= JsonUtil.getJsonGenerator(response.getOutputStream());
        try {
			jsonGenerator.writeStartObject();//{
				jsonGenerator.writeObjectField("status", "success");
				jsonGenerator.writeObjectFieldStart("data");//data:{
					jsonGenerator.writeArrayFieldStart("directory");//{
						//for
						for(int i=0;i<direcotrys.size();i++){
							jsonGenerator.writeStartObject();
								jsonGenerator.writeObjectField("name", direcotrys.get(i).getName());
								jsonGenerator.writeObjectField("img",  direcotrys.get(i).getImg());
								jsonGenerator.writeObjectField("href",  direcotrys.get(i).getHref());
							jsonGenerator.writeEndObject();
						}
						//for end
					jsonGenerator.writeEndArray();
				jsonGenerator.writeEndObject();                 // }
				jsonGenerator.writeObjectField("date", new Long(System.currentTimeMillis()).toString());
		    jsonGenerator.writeEndObject();  //}
		    jsonGenerator.close();
        } catch (JsonGenerationException e) {
	        // TODO Auto-generated catch block
	        e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
	
	/**
	 * 获取用户信息
	 * @param json
	 * @param sqlSessionFactory
	 * @param response
	 * @throws IOException
	 */
	public void getUserInfo(String id,SqlSessionFactory sqlSessionFactory,HttpServletResponse response) throws  IOException{
		//获取前端传来的数据	
		int uid = Integer.parseInt(id);
		//根据前端数据进行查询
		SqlSession session = sqlSessionFactory.openSession();
		IUser iUser = session.getMapper(IUser.class);
		IData iData = session.getMapper(IData.class);
		PageUser pageUser = iUser.getUser(uid);
		String job = iUser.getJob(pageUser.getJid());
		List<Function> functions = iData.getQuickUse(uid);
		session.close();
		
		//将数据以交互格式返回
		//动态拼接返回json数据。并通过jsonGenerator的构造方法设定输出流。
		JsonGenerator jsonGenerator= JsonUtil.getJsonGenerator(response.getOutputStream());
		jsonGenerator.writeStartObject();//{
			jsonGenerator.writeObjectField("status", "success");
			jsonGenerator.writeObjectFieldStart("data");//data:{
				jsonGenerator.writeObjectField("head", pageUser.getHead());
				jsonGenerator.writeObjectField("name", pageUser.getName());
				jsonGenerator.writeObjectField("job", job);
				jsonGenerator.writeArrayFieldStart("quickuse");//[
					//for
					for(int i=0;i<functions.size();i++){
						jsonGenerator.writeStartObject();
							jsonGenerator.writeObjectField("name", functions.get(i).getName());
							jsonGenerator.writeObjectField("href",  functions.get(i).getHref());
						jsonGenerator.writeEndObject();
					}
					//for end
				jsonGenerator.writeEndArray();//]
			jsonGenerator.writeEndObject(); // }
			jsonGenerator.writeObjectField("date", new Long(System.currentTimeMillis()).toString());
	    jsonGenerator.writeEndObject();  //}
	    jsonGenerator.close();
		
	}
}
