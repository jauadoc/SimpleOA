package com.sun.dao;

import com.sun.entity.data.User;
import com.sun.entity.dataModel.MoreRelationship;

public interface IM_UserInfo {
	/**
	 * 保存用户更改的跟人信息
	 */
	public void subUserInfo(MoreRelationship userInfo);

	/**
	 * 获取用户个人信息
	 */
	public User getUserInfo(int uid);
}
