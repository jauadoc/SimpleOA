package com.sun.utils;

import java.util.HashMap;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class JsonParse {
	public static Map<String, String> getDataOneClass(String data){
		Map<String, String> map = new HashMap<String, String>();
		//�Ƚ�����2�㼶���ƥ�����
		Pattern pattern = Pattern.compile("([\".*?[a-z]|[\u4e00-\u9fa5].*?\"]+:\\[\\{\".*?\"\\}\\])");
		Matcher m = pattern.matcher(data);
		String datas = "";
		while(m.find()){
			datas = m.group(1);
		}
		//������е�2������������ȡ����е����м�ֵ��
		data = data.replace(","+datas, "");
		pattern = Pattern.compile("(\".*?\":\".*?\")");
		m = pattern.matcher(data);
		while(m.find()){
			String key_value = m.group(1);
			String kv[] = key_value.split(":");
			map.put(kv[0].replace("\"", ""), kv[1].replace("\"", ""));
		}
		//"computer":[{"data":"��������:����,�����Ʒ��:����Y580,test:null,mac��ַ:04-7D-7B-E6-AF-53,����ϵͳ:windows8,id:1,ip��ַ:192.168.1.14,������:����"},{"data":"��������:����,�����Ʒ��:����Y580,test:null,mac��ַ:04-7D-7B-E6-AF-54,����ϵͳ:windows-XP,id:2,ip��ַ:192.168.0.12,������:����"},{"data":"��������:����,�����Ʒ��:����Y570,test:null,mac��ַ:04-7D-7B-E6-AF-55,����ϵͳ:windows7,id:3,ip��ַ:192.168.0.13,������:����"}]
		String key = datas.substring(1,datas.indexOf("\":["));
		String value = datas.substring(datas.indexOf("\":[")+3,datas.indexOf("}]")+1);
		map.put(key,value);
		return map;
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String data = "{\"fileds\":\"id,����ϵͳ,�����Ʒ��,ip��ַ,mac��ַ,������,��������,test\",\"count\":\"3\",\"computer\":[{\"data\":\"��������:����,�����Ʒ��:����Y580,test:null,mac��ַ:04-7D-7B-E6-AF-53,����ϵͳ:windows8,id:1,ip��ַ:192.168.1.14,������:����\"},{\"data\":\"��������:����,�����Ʒ��:����Y580,test:null,mac��ַ:04-7D-7B-E6-AF-54,����ϵͳ:windows-XP,id:2,ip��ַ:192.168.0.12,������:����\"},{\"data\":\"��������:����,�����Ʒ��:����Y570,test:null,mac��ַ:04-7D-7B-E6-AF-55,����ϵͳ:windows7,id:3,ip��ַ:192.168.0.13,������:����\"}]}";
		getDataOneClass(data);
		
	}

}
