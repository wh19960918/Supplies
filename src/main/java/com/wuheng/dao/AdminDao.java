package com.wuheng.dao;

import org.apache.ibatis.annotations.Mapper;

import com.wuheng.pojo.Admin;

@Mapper
public interface AdminDao {
	
	//登录
	Admin findUserAndPwd(Admin admin);
	
	//注册
	Boolean add(Admin admin);

}
