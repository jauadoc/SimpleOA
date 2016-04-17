package com.sun.utils;

import java.util.regex.Matcher;
import java.util.regex.Pattern;


public class SafeUtil {
	/**
	 * 用户名合法校验
	 * @param uname
	 * @return
	 */
	public static boolean checkUname(String uname){
		Pattern p = Pattern.compile("^[a-zA-Z]{1}[a-zA-Z0-9_]{3,15}$");
		Matcher m = p.matcher(uname);
		if(m.matches()){
			return true;
		}else{
			return false;
		}
	}
}
