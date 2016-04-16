package com.sun.test;

import java.io.IOException;
import java.util.Date;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.JsonGenerator;

import com.sun.utils.JsonUtil;

public class Test2 {

	public static void main(String[] args) {
		JsonGenerator jsonGenerator= JsonUtil.getJsonGenerator(System.out);
//		var data = {"status":"success","data":{"directory":[{"name":"首页","img":"jics/images/home.png","href":"index"},{"name":"联系人","img":"jics/images/friend.png","href":"friend"},{"name":"工作","img":"jics/images/work.png","href":"work"},{"name":"消息","img":"jics/images/msg.png","href":"message"}],"logo":"jics/images/logo.png"},"date":"3902392"};
        try {
			jsonGenerator.writeStartObject();//{
				jsonGenerator.writeObjectField("status", "success");
				jsonGenerator.writeObjectFieldStart("data");//data:{
					jsonGenerator.writeArrayFieldStart("directory");//{
						//for
						for(int i=0;i<1;i++){
							jsonGenerator.writeStartObject();
								jsonGenerator.writeObjectField("name", "首页");
								jsonGenerator.writeObjectField("img", "test");
								jsonGenerator.writeObjectField("href", "index");
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
}
