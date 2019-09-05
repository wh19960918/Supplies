package com.wuheng.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.wuheng.pojo.Admin;
import com.wuheng.service.AdminService;

@RestController
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private AdminService adminService;

	//登录
	@RequestMapping("/login")
	@ResponseBody
	public Boolean login(String username, String password,HttpSession session) {
		
		Admin admin=new Admin();
		admin.setUsername(username);
		admin.setPassword(password);
		Admin admins = adminService.findUserAndPwd(admin);
		System.out.println("admin:"+admins);
		if(admins!=null) {
			session.setAttribute("admin",admins);
			return true;
		}
		return false;
	}
	
	//注册
	@RequestMapping("/reg")
	@ResponseBody
	public Boolean reg(String username,String password,Integer age,String gender,String realname) {
		Admin admin=new Admin();
		admin.setUsername(username);
		admin.setPassword(password);
		admin.setAge(age);
		admin.setRealname(realname);
		admin.setGender(gender);
		Boolean flag = adminService.add(admin);
		return flag;
	}
}
