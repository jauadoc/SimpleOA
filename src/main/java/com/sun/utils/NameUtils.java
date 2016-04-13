package com.sun.utils;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

public class NameUtils {
	/**
	 * 根据当前时间戳，返回唯一字母组成字符串
	 * @return
	 */
	public static String getUnique(){
		Map<Integer, String> n2c = new HashMap<Integer, String>();
		n2c.put(0, "a");
		n2c.put(1, "b");
		n2c.put(2, "c");
		n2c.put(3, "d");
		n2c.put(4, "e");
		n2c.put(5, "f");
		n2c.put(6, "g");
		n2c.put(7, "h");
		n2c.put(8, "i");
		n2c.put(9, "j");
		String now = new Long(new Date().getTime()).toString();
		String unique = "";
		for(int i=0;i<now.length();i++){
			unique += n2c.get(Integer.parseInt(now.substring(i, i+1)));
		}
		return unique;
	}
	public static void main(String[] args) {
		String name = getUnique();
		System.out.println(name);
	}
}
