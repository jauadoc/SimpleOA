package com.sun.utils;

import java.io.IOException;
import java.io.OutputStream;

import org.codehaus.jackson.JsonEncoding;
import org.codehaus.jackson.JsonGenerator;
import org.codehaus.jackson.map.ObjectMapper;

public class JsonUtil {
	public static JsonGenerator getJsonGenerator(OutputStream out){
		JsonGenerator jsonGenerator = null;
		try {
			jsonGenerator = new ObjectMapper().getJsonFactory().createJsonGenerator(out, JsonEncoding.UTF8);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return jsonGenerator;
	}
	public static ObjectMapper getObjectMapper(){
		return new ObjectMapper();
	}
}
