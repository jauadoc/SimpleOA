package com.sun.utils;

import java.util.Date;

public class StrUtil {
	/**
	 * 验证字符串是否为空
	 * @param str
	 * @return
	 */
	public static boolean notNull(String str){
		boolean notNull = true;
		str = str.trim();
		if(str == null || str.length() <= 0){
			notNull = false;
		}
		return notNull;
	}
	/**
	 * 去除结尾n个长度字符串
	 * 如果截取长度超过字符串长度则返回原字符串，不进行处理
	 * @param str
	 * @param num
	 * @return
	 */
	public static String trimLast(String str,int num){
		if(str.length()>num){
			str = str.substring(0, str.length()-num);
		}
		return str;
	}
	/**
	 * 去除开始的n个长度字符串
	 * 如果截取长度超过字符串长度则返回原字符串，不进行处理
	 * @param str
	 * @param num
	 * @return
	 */
	public static String trimFirst(String str,int num){
		str = str.substring(0, str.length()-num);
		return str;
	}
	public static void main(String[] args) {
	}
}
