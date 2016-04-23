package com.sun.dao;

import java.util.List;

import com.sun.entity.data.Message;
import com.sun.entity.dataModel.MoreRelationship;

public interface IM_Message {
	/**
	 * 根据用户uid获取该用户的指定类别的message
	 * @return
	 */
	public List<Message> getMessageByUid(Message message);

	/**
	 * 根据消息id删除指定消息
	 * @param mid_uid
	 */
	public void deleteMessageById(List<Integer> uids);

	/**
	 * 根据消息id更新消息是否已读
	 * @param mid
	 */
	public void setMessageIsReadByid(int mid);


}
