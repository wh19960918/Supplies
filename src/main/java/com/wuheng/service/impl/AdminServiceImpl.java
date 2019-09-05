package com.wuheng.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import com.wuheng.dao.AdminDao;
import com.wuheng.pojo.Admin;
import com.wuheng.service.AdminService;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminDao adminDao;

	@Override
	public Admin findUserAndPwd(Admin admin) {
		return adminDao.findUserAndPwd(admin);
	}

	@Override
	public Boolean add(Admin admin) {
		return adminDao.add(admin);
	}
	
	

}
