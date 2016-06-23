package com.sun.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.time.DateUtils;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sun.dao.IM_Index;
import com.sun.dao.IM_Message;
import com.sun.dao.IM_UserInfo;
import com.sun.dao.IUser;
import com.sun.entity.InMessage_group;
import com.sun.entity.data.Message;
import com.sun.entity.data.User;
import com.sun.entity.dataModel.MoreRelationship;
import com.sun.entity.outData.PersonInfo;
import com.sun.utils.DateUtil;
import com.sun.utils.JsonUtil;
import com.sun.utils.Obj2key_valueMapUtil;

public class M_UserInfoService {

	public void subUserInfo(String json, SqlSessionFactory sqlSessionFactory, HttpServletResponse response) throws JsonParseException, JsonMappingException, IOException {
		//获取前端传来json，将json处理成Map<fid,uid>进行数据库查询
		ObjectMapper objectMapper = new ObjectMapper();
		InMessage_group inMessage_group = objectMapper.readValue(json, InMessage_group.class);
		int uid = inMessage_group.getUid();		
		String data = inMessage_group.getData();
		String k_vs[] = data.split(",");
		
		/**
		 * 把前端传来的用户信息存储到数据库，xx:xx,xx:xx,....
		 */
		//查询数据
		SqlSession session = sqlSessionFactory.openSession();
		IM_UserInfo iM_UserInfo = session.getMapper(IM_UserInfo.class);
		MoreRelationship userInfo = new MoreRelationship();
		userInfo.setIntParam1(uid);
		for(int i=0;i<k_vs.length;i++){
			String k_v[] = k_vs[i].split(":");
			if(k_v.length>1){
				String key = k_v[0];
				String value = k_v[1];
				if(key.equals("name")){
					userInfo.setStringParam1(value);
				}else if(key.equals("tel_phone")){
					userInfo.setStringParam2(value);
				}else if(key.equals("mobile_phone")){
					userInfo.setStringParam3(value);
				}else if(key.equals("email")){
					userInfo.setStringParam4(value);
				}else if(key.equals("status")){
					userInfo.setStringParam5(value);
				}
			}
		}
		iM_UserInfo.subUserInfo(userInfo);
		session.close();
		
		
		//返回前端数据
		response.setCharacterEncoding("UTF-8");
		JsonUtil.returnSuccessMessage(response.getOutputStream());
	}

	public void getUserInfo(String json, SqlSessionFactory sqlSessionFactory, HttpServletResponse response) throws JsonParseException, JsonMappingException, IOException {
		//获取前端传来json，将json处理成Map<fid,uid>进行数据库查询
		ObjectMapper objectMapper = new ObjectMapper();
		InMessage_group inMessage_group = objectMapper.readValue(json, InMessage_group.class);
		int uid = inMessage_group.getUid();
		String data = inMessage_group.getData();
		
		/**
		 * 根据用户id获取用户信息，前端数据展示未定，根据此处写的返回信息进行处理
		 * 返回json
		 * data = {"status":"success","data":[
		 * {"show":"头像","key":"head","value":"www.baidu.com","modify":"true"},
		 * {"show":"ee","key":"job","value":"ee","modify":"true"},
		 * {"show":"dd","key":"head","value":"dd","modify":"true"}
		 * ],"date":"1465785341711"};
		 */
		//查询数据
		SqlSession session = sqlSessionFactory.openSession();
		IM_UserInfo iM_UserInfo = session.getMapper(IM_UserInfo.class);
		User user = iM_UserInfo.getUserInfo(uid);
		session.close();
		Map<String, Object> map = Obj2key_valueMapUtil.Obj2key_valueMap(user);
		List<PersonInfo> personInfos = new ArrayList<PersonInfo>();
		for(String key: map.keySet()){
			if(map.get(key)==null||map.get(key)==""){
				break;
			}
			PersonInfo psersonInfo = null;
			if(key=="name"){
				
				psersonInfo = new PersonInfo("昵称", "name", map.get(key).toString(), "show");
				personInfos.add(psersonInfo);
			}else if(key=="tel_phone"){
				
				psersonInfo = new PersonInfo("分机号", "tel_phone", map.get(key).toString(), "show");
				personInfos.add(psersonInfo);
			}else if(key=="mobile_phone"){

				psersonInfo = new PersonInfo("移动电话", "mobile_phone", map.get(key).toString(), "show");
				personInfos.add(psersonInfo);
			}else if(key=="email"){
				
				psersonInfo = new PersonInfo("电子邮件", "email", map.get(key).toString(), "show");
				personInfos.add(psersonInfo);
			}else if(key=="status"){
				
				psersonInfo = new PersonInfo("状态", "status", map.get(key).toString(), "show");
				personInfos.add(psersonInfo);
			}else if(key=="birthday"){
				psersonInfo = new PersonInfo("生日", "birthday", DateUtil.yyyyMMdd.format(map.get(key)), "hidden");
				personInfos.add(psersonInfo);
			}else if(key=="gender"){
				if(map.get(key).toString()=="103"){
					psersonInfo = new PersonInfo("性别", "gender", "男", "hidden");
				}else{
					psersonInfo = new PersonInfo("性别", "gender", "女", "hidden");
				}
				personInfos.add(psersonInfo);
			}else if(key=="job"){
				psersonInfo = new PersonInfo("职位", "job", "java工程师", "hidden");
				personInfos.add(psersonInfo);
			}else if(key=="department"){
//				System.out.println("=============="+map.get(key).toString());
//				if(map.get(key).toString()=="1101"){
					psersonInfo = new PersonInfo("部门", "department", "技术部", "hidden");
//					System.out.println("================="+map.get(key).toString());
//				}
				personInfos.add(psersonInfo);
			}else if(key=="head"){
				psersonInfo = new PersonInfo("头像", "head", map.get(key).toString(), "show");
				personInfos.add(psersonInfo);
			}
		}
//		for(PersonInfo key: personInfos){
//			System.out.println(key);
//		}
		
		//将数据写回客户端
		try {
			JsonUtil.writeJson(personInfos, response.getOutputStream());
		} catch (IllegalArgumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
