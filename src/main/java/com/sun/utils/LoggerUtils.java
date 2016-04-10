package com.sun.utils;
import java.net.URL;
import java.util.Date;

import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;

public class LoggerUtils {
	public final static String db_error_log= "db_error_log";
	public final static String db_sql_log= "db_sql_log";
	public final static String file_log= "file_log";
	public final static String file_error_log= "file_error_log";
	public final static String user_log= "user_log";
	public final static String other_error_log= "other_error_log";
	//����ʹ��
	public static Logger getLogg(String loggerName){
		//log·�����������⣬��sevlet���޷���ȷ��Ѱ
        PropertyConfigurator.configure(System.getProperty("user.dir")+"\\log4j.properties");
		Logger logger = Logger.getLogger(loggerName);  
		return logger;
	}
	//webʹ�ã���Ϊ·���ǹ̶�
	public static Logger getLogg(String loggerName,String webPath){
		//log·�����������⣬��sevlet���޷���ȷ��Ѱ
		URL realPath = Thread.currentThread().getContextClassLoader().getResource("");
		PropertyConfigurator.configure(realPath+"\\"+"log4j.properties");
		Logger logger = Logger.getLogger(loggerName);  
		return logger;
	}
	public static String getDate(){
		String date = "["+new Date()+"]:";
		return date;
	}
}
