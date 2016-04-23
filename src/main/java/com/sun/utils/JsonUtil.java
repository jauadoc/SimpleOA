package com.sun.utils;

import java.io.IOException;
import java.io.OutputStream;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.codehaus.jackson.JsonEncoding;
import org.codehaus.jackson.JsonGenerator;
import org.codehaus.jackson.JsonProcessingException;
import org.codehaus.jackson.map.ObjectMapper;

import com.sun.entity.data.Message;

public class JsonUtil {
	public static JsonGenerator getJsonGenerator(OutputStream out) {
		JsonGenerator jsonGenerator = null;
		try {
			jsonGenerator = new ObjectMapper().getJsonFactory().createJsonGenerator(out, JsonEncoding.UTF8);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return jsonGenerator;
	}

	public static ObjectMapper getObjectMapper() {
		return new ObjectMapper();
	}
	/**
	 * 返回  (标准数据对象) 的json -> {"status":"success","data":[{"field1":"value1"},{"field2":"value"}],"date":"1461137577596"}
	 * 
	 * @param list
	 * @param writer
	 * @throws IOException
	 * @throws IllegalArgumentException
	 * @throws IllegalAccessException
	 */
	
	public static <T> void writeJson(List<T> list, OutputStream writer) throws IOException, IllegalArgumentException, IllegalAccessException {
		//-----------json格式可手动更改，拼接不同类型json
		JsonGenerator jsonGenerator = JsonUtil.getJsonGenerator(writer);
		jsonGenerator.writeStartObject();// {
		jsonGenerator.writeObjectField("status", "success");
		jsonGenerator.writeArrayFieldStart("data");// data:[
		/*===========================================================*/
		/* 数据对象拼接，{field1:value1,field2:value2}  */
		for (int k = 0; k < list.size(); k++) {
			T obj = list.get(k);
			jsonGenerator.writeStartObject();
				Field fields[] = obj.getClass().getDeclaredFields();// 获得对象所有属性\
				Field field = null;
				for (int i = 0; i < fields.length; i++) {
					field=fields[i];
					field.setAccessible(true);//修改访问权限
					jsonGenerator.writeObjectField(field.getName(), field.get(obj));// 读取属性值
				}
			jsonGenerator.writeEndObject();
		}
		/*===========================================================*/
		jsonGenerator.writeEndArray(); // ]
		jsonGenerator.writeObjectField("date", new Long(System.currentTimeMillis()).toString());
		jsonGenerator.writeEndObject(); // }
		jsonGenerator.close();
	}
	
	/**
	 * 返回操作成功提示
	 * @param writer
	 * @throws IOException
	 */
	public static void returnSuccessMessage(OutputStream writer) throws IOException{
		//-----------json格式可手动更改，拼接不同类型json
		JsonGenerator jsonGenerator = JsonUtil.getJsonGenerator(writer);
		jsonGenerator.writeStartObject();// {
		jsonGenerator.writeObjectField("status", "success");
		jsonGenerator.writeArrayFieldStart("data");// data:[
		/*===========================================================*/
			jsonGenerator.writeStartObject();
				jsonGenerator.writeObjectField("status", "操作成功");
			jsonGenerator.writeEndObject();
		/*===========================================================*/
		jsonGenerator.writeEndArray(); // ]
		jsonGenerator.writeObjectField("date", new Long(System.currentTimeMillis()).toString());
		jsonGenerator.writeEndObject(); // }
		jsonGenerator.close();
	}	
	/**
	 * 返回操作失败提示
	 * @param writer
	 * @throws IOException
	 */
	public static void returnErrorMessage(OutputStream writer) throws IOException{
		//-----------json格式可手动更改，拼接不同类型json
		JsonGenerator jsonGenerator = JsonUtil.getJsonGenerator(writer);
		jsonGenerator.writeStartObject();// {
		jsonGenerator.writeObjectField("status", "success");
		jsonGenerator.writeArrayFieldStart("data");// data:[
		/*===========================================================*/
			jsonGenerator.writeStartObject();
				jsonGenerator.writeObjectField("status", "操作失败");
			jsonGenerator.writeEndObject();
		/*===========================================================*/
		jsonGenerator.writeEndArray(); // ]
		jsonGenerator.writeObjectField("date", new Long(System.currentTimeMillis()).toString());
		jsonGenerator.writeEndObject(); // }
		jsonGenerator.close();
	}
	public static void main(String[] args) {

	}
}
