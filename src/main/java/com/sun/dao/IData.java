package com.sun.dao;

import java.util.List;

import com.sun.entity.data.Function;
import com.sun.entity.dataModel.IntRelationship;
import com.sun.entity.dataModel.MoreRelationship;

public interface IData {

	/**
	 * 获取功能名称列表
	 * @param uid_jid_auth
	 * @return
	 */
	public List<Function> getFunction(MoreRelationship uid_jid_auth);
	/**
	 * 获取用户选择的快捷方式名称
	 * @param uid
	 * @return
	 */
	public List<String> getChooseFunction(int uid);
	/**
	 * 获取用户快捷方式的详细信息
	 * @param uid
	 * @return
	 */
	public List<Function> getQuickUse(int uid);
	
	/**
	 * 删除快捷方式
	 * @param uid
	 */
	public void deleteQuickUse(int uid);
	/**
	 * 添加快捷方式
	 * @param quickuses
	 */
	public void addQuickUse(List<IntRelationship> quickuses);
}
