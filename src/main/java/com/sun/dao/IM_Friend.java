package com.sun.dao;

import java.util.List;

import com.sun.entity.outData.Friend;
import com.sun.entity.outData.FriendInfo;

public interface IM_Friend {
	/**
	 * 根据用户id获取用户联系人列表
	 * @return
	 */
	public List<Friend> getFriendByUid(int uid);

	/**
	 * 根据联系人id获取联系人信息
	 * @param mid_uid
	 */
	public FriendInfo getFriendInfoByFid(int fid);

}
