package com.wuheng.service;

import com.wuheng.pojo.Admin;

public interface AdminService {

	//登录
	Admin findUserAndPwd(Admin admin);
	
	//注册
	Boolean add(Admin admin);
	
}
