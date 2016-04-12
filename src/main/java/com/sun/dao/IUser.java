package com.sun.dao;

import com.sun.entity.PageUser;

public interface IUser {
//	用户登录校验，返回PageUser对象
	public PageUser checkUser(PageUser pageUser);
	
}
