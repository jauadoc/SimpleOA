package com.sun.utils;

public class StrUtil {
	public static boolean notNull(String str){
		boolean notNull = true;
		if(str == null || str.length() <= 0){
			notNull = false;
		}else{
			str = str.trim();
		}
		return notNull;
	}
}
