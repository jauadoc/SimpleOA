package com.sun.dao;

import java.util.List;
import java.util.Map;
 
import org.apache.ibatis.session.ExecutorType;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
 
 
@Service("commonDao")
public class CommonDaoImpl<T> implements CommonDao<Object>{
    @Autowired
    private SqlSessionFactory sqlSessionFactory;
    private SqlSession sqlSession;
    private boolean isAuto=true;//默认自动提交
    public SqlSessionFactory getSqlSessionFactory() {
        return sqlSessionFactory;
    }
 
    public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
        this.sqlSessionFactory = sqlSessionFactory;
    }
 
    public Object findById(String mapper,Object obj) {
          Object o=getSqlSession().selectOne(mapper, obj);
          return  o;
    }
  
 
    public Object findByWhere(String mapper,Object t) {
        List list=getSqlSession().selectList(mapper,t);
        if(list!=null&&list.size()>0){
            return list.get(0);
        }else{
            return null;
        }
    }
      
    public Object findBySql(String mapper,Object t) {
        List list=getSqlSession().selectList(mapper,t);
        if(list!=null&&list.size()>0){
            return list.get(0);
        }else{
            return null;
        }
    }
  
    public List findListByWhere(String mapper,Object t) {
        List list=getSqlSession().selectList(mapper,t);
        return list;  
 
    }
    public List findListByObj(String mapper,Object t) {
        List list=getSqlSession().selectList(mapper,t);
        return list;  
 
    }
    public List findListBySql(String mapper,Object t) {
        List list=getSqlSession().selectList(mapper,t);
        return list;  
    }
     
     
     
    public Object findValueBySql(String mapper, Object t) {
        List list=getSqlSession().selectList(mapper,t);
        if(list!=null&&list.size()>0){
            return list.get(0);
        }else{
            return null;
        }
    }
  
    public Map selectMap(String mapper,  String arg1) {
        Map map=getSqlSession().selectMap(mapper,arg1);
        return map;
 
    }
    public Map selectMap(String mapper,  String arg1,String arg2) {
        Map map=getSqlSession().selectMap(mapper,arg1,arg2);
        return map;
    }
 
     
     
     
    public void updateById(String mapper, Object t) {
        this.getSqlSession().update(mapper, t);
    }
 
    public void deleteByWhere(String mapper, Object t) {
         this.getSqlSession().update(mapper, t);
    }
 
    public void updateById(String mapper, Object t, boolean isAuto) {
         this.setAuto(isAuto);
         this.getSqlSession().update(mapper, t);
    }
 
    public void deleteByWhere(String mapper, Object t, boolean isAuto) {
         this.setAuto(isAuto);
         this.getSqlSession().update(mapper, t);
     }
     
     
     
     
     
     
    public void updateByWhere(String mapper, Object t) {
         this.setAuto(isAuto);
 
         this.getSqlSession().update(mapper, t);        
    }
 
    public void deleteById(String mapper, Object t) {
         this.getSqlSession().delete(mapper, t);
    }
 
    public void updateByWhere(String mapper, Object t, boolean isAuto) {
         this.setAuto(isAuto);
         this.getSqlSession().update(mapper, t);        
 
         
    }
 
    public void deleteById(String mapper, Object t, boolean isAuto) {
         this.setAuto(isAuto);
         this.getSqlSession().delete(mapper, t);
 
         
    }
 
    public void insert(String mapper,Object t) {
        getSqlSession().insert(mapper,t);
    }
    
    public void insert(String mapper,Object t, boolean isAuto) {
         this.setAuto(isAuto);
         this.getSqlSession().insert(mapper,t);
    }
  
    public Object selectOne(String mapper) {
        Object obj=this.getSqlSession().selectOne(mapper);
        return obj; 
    }
 
    public List<Object> selectList(String mapper) {
        List list=this.getSqlSession().selectList(mapper);
        return list;
    }
 
    public void update(String mapper) {
        this.getSqlSession().update(mapper);
    }
 
    public void delete(String mapper) {
       this.getSqlSession().delete(mapper); 
    }
 
    public void insert(String mapper) {
       this.getSqlSession().insert(mapper); 
    }
   
   public void update(String mapper, boolean isAuto) {
        this.setAuto(isAuto);
        this.getSqlSession().update(mapper);    
    }
 
    public void delete(String mapper, boolean isAuto) {
        this.setAuto(isAuto);
        this.getSqlSession().delete(mapper);
    }
    public void insert(String mapper, boolean isAuto) {
        this.setAuto(isAuto);
        this.getSqlSession().insert(mapper);
    }
  
    public void executeSql(String mapper,Object t) {
        this.getSqlSession().update(mapper, t);
    }
 
    public void commit() {
        if(sqlSession!=null)
            sqlSession.commit();
    }
 
    
    
   private SqlSession getSqlSession(){
      //  sqlSession=sqlSession==null? 
       //    sqlSessionFactory.openSession(ExecutorType.BATCH, isAuto):sqlSession;  执行后必须要commit
       sqlSession=sqlSession==null? sqlSessionFactory.openSession(isAuto):sqlSession;
       return sqlSession;
   }
   private boolean isAuto() {
       return isAuto;
   }
   private void setAuto(boolean isAuto) {
      this.isAuto = isAuto;
   }
 
   public void close() {
    if(sqlSession!=null)
        sqlSession.close();
   }
     
}