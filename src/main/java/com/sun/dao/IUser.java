package com.sun.dao;

import com.sun.entity.PageUser;

public interface IUser {
	/**
	 * 	用户登录校验，返回PageUser对象
	 * @param pageUser
	 * @return
	 */
	public PageUser checkUser(PageUser pageUser);
	/**
	 *  获取用户信息
	 * @param uid
	 * @return
	 */
	public PageUser getUser(int uid);
	/**
	 * 根据jid获取job名称
	 * @param jid
	 * @return
	 */
	public String getJob(int jid);
}
