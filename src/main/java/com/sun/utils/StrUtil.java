package com.sun.utils;

public class StrUtil {
	public static boolean notNull(String str){
		boolean notNull = true;
		str = str.trim();
		if(str == null || str.length() <= 0){
			notNull = false;
		}
		return notNull;
	}
	public static void main(String[] args) {
		
	}
}
