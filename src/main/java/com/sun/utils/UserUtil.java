package com.sun.utils;

import java.util.Date;

public class UserUtil {

	public static int getId(){
		int id = 0;
		Date d = new Date();
		System.out.println(d.getTime());
		return id;
	}
	
	public static String getMD5(String pwd){
		return MD5Util.md5(pwd);
	}
	
	public static void main(String[] args) {
		String s = getMD5("123456");
		System.out.println(s);
		System.out.println(getId());
	}

}
