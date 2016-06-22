package com.sun.utils;

import java.lang.reflect.Field;
import java.util.HashMap;
import java.util.Map;

import com.sun.entity.PageUser;

public class Obj2key_valueMapUtil {
	public static Map<String, Object> Obj2key_valueMap(Object obj){
		Map<String, Object> key_valueMap = new HashMap<String, Object>();
		
		try {
			Field fields[] = obj.getClass().getDeclaredFields();// 获得对象所有属性\
			Field field = null;
			for (int i = 0; i < fields.length; i++) {
				field=fields[i];
				field.setAccessible(true);//修改访问权限
				String key = field.getName();
				Object value = field.get(obj);
				key_valueMap.put(key, value);
			}
		} catch (SecurityException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalArgumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return key_valueMap;
	}
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		Map<String, Object> map = Obj2key_valueMap(new PageUser(1, "test", "test", "test", "test", 2));
		for(String key:map.keySet()){
			System.out.println(key+":"+map.get(key));
		}
	}

}
