package com.sun.controller;


import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSessionFactory;
import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.JsonGenerator;
import org.codehaus.jackson.JsonProcessingException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sun.dao.IData;
import com.sun.entity.InMessage;
import com.sun.entity.data.Function;
import com.sun.utils.JsonUtil;

/**
 * 
 * @author javadoc
 */
@Controller
@RequestMapping("/data")
public class DataController extends BaseController{
	/**
	 * 获取功能列表
	 */
	@Autowired
	SqlSessionFactory sqlSessionFactory;
	@RequestMapping(value = "/getFunction.do")
	public ModelAndView getFunction(HttpServletRequest request,  HttpServletResponse response)throws Exception {
		//获取前端传来json
		String json = request.getParameter("data");
		ObjectMapper objectMapper = new ObjectMapper();
		InMessage inMessage = objectMapper.readValue(json, InMessage.class);
		int uid = inMessage.getUid();

		//数据库查询功能列表数据
		IData iData = sqlSessionFactory.openSession().getMapper(IData.class);
		List<Function> functions = iData.getFunction(uid);
//		List<Function> functions = new ArrayList<Function>();
//		functions.add(new Function("test1", 101));
//		functions.add(new Function("test12", 101));
//		functions.add(new Function("test13", 101));
//		functions.add(new Function("test14", 101));
//		functions.add(new Function("test6", 101));
//		functions.add(new Function("test7", 101));
//		functions.add(new Function("test7", 101));
//		functions.add(new Function("test8", 101));
//		
		//动态拼接返回json数据。并通过jsonGenerator的构造方法设定输出流。
		JsonGenerator jsonGenerator= JsonUtil.getJsonGenerator(response.getOutputStream());
		try {
			
	        jsonGenerator.writeStartObject();//{
				jsonGenerator.writeArrayFieldStart("functions");//function:[
					for(int i=0;i<functions.size();i++){
						jsonGenerator.writeStartObject();//{
							jsonGenerator.writeObjectField("name", functions.get(i).getName());
							if(functions.get(i).getIsChoose()==101){
								jsonGenerator.writeObjectField("isChoose", "true");
							}else{
								jsonGenerator.writeObjectField("isChoose", "false");
							}
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
		return null;
	}
}