package com.sun.utils;

import java.text.DateFormat;
import java.text.SimpleDateFormat;

public class DateUtil {
	/**
	 * yyyy-MM-dd格式DateFormat
	 */
	public static DateFormat yyyyMMdd = new SimpleDateFormat("yyyy-MM-dd");
	/**
	 * yyyy-MM-dd HH:mm:ss格式DateFormat
	 */
	public static DateFormat yyyyMMdd_HHmmss = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	/**
	 * dd格式DateFormat
	 */
	public static DateFormat dd = new SimpleDateFormat("dd");
}
