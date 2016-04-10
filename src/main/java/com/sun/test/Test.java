package com.sun.test;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sun.dao.User;

@Service
public class Test {    
	@Autowired
    private SqlSessionFactory sqlSessionFactory;
    public SqlSessionFactory getSqlSessionFactory() {
        return sqlSessionFactory;
    }

	public void test(){
		 SqlSession session = getSqlSessionFactory().openSession();
		 User user = session.selectOne("com.sun.userMapper.getUser",1);
		 System.out.println(user);
	}
}
