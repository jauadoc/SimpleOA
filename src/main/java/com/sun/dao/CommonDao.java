package com.sun.dao;

import java.util.List;
import java.util.Map;
/**
 * 
 * @author Administrator
 *  网上找到的模版=================================================================================
 * @param <T>
 */
public interface CommonDao<T> {
    /**
     * 根据id查找唯一对象
     * @param mapper
     * @param t
     * @return
     */
    public T findById(String mapper,T t);
    /**
     * 根据where条件查找唯一对象
     * @param mapper
     * @param t
     * @return
     */
    public T findByWhere(String mapper,T t);
    /**
     * 根据sql语句查找唯一对象
     * @param mapper
     * @param t
     * @return
     */
    public T findBySql(String mapper,T t);
    /**
     * 根据where条件查找对象列表
     * @param mapper
     * @param t
     * @return
     */
    public List<T> findListByWhere(String mapper,T t);
    /**
     * 查找和t某些值相等的对象列表
     * @param mapper
     * @param t
     * @return
     */
    public List<T> findListByObj(String mapper,T t);
    /**
     * 根据sql语句查找对象列表
     * @param mapper
     * @param t
     * @return
     */
    public List<T> findListBySql(String mapper,T t);
    /**
     * 根据sql语句查询唯一字段值
     * @param mapper
     * @param t
     * @return
     */
    public Object findValueBySql(String mapper,T t);//
     /**
      * 根据id更新
      * @param mapper
      * @param t
      */
    public void updateById(String mapper,T t);
    /**
     * 根据where条件更新
     * @param mapper
     * @param t
     */
    public void deleteByWhere(String mapper,T t);
     
    public void updateByWhere(String mapper,T t);
    public void deleteById(String mapper,T t);
     
     
    //以下方法基本调用sqlsession的相应方法 ，isAuto:是否自动提交
    public void insert(String mapper,T t);
    public void updateById(String mapper,T t,boolean isAuto);
    public void deleteByWhere(String mapper,T t,boolean isAuto);
    public void updateByWhere(String mapper,T t,boolean isAuto);
    public void deleteById(String mapper,T t,boolean isAuto);
     
     
    public void insert(String mapper,T t,boolean isAuto);
  
     
     
     
    public T selectOne(String mapper);
    public List<T> selectList(String mapper);
    public void update(String mapper);
    public void delete(String mapper);
    public void insert(String mapper);
    public Map selectMap(String mapper,String  arg1);
    public Map selectMap(String mapper,String  arg1,String arg2);
  
    public void update(String mapper,boolean isAuto);
    public void delete(String mapper,boolean isAuto);
    public void insert(String mapper,boolean isAuto);
     
    /**
     * 执行sql语句 ：增，删，改
     * @param mapper
     * @param t
     */
    public void executeSql(String mapper,T t);
    public void commit();
    public void close();
}