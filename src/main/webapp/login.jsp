<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>物资管理系统---登录</title>
<script type="text/javascript" src="js/jquery-1.8.3.js"></script>

<script type="text/javascript">
	function doLogin(){
		
		var username = $("#username");
		var password = $("#password");
		
		if(username.val()=="" || password.val()==""){
			alert("用户名或密码不能为空 !");
		}else{
			
			$.post("admin/login?username="+username.val()+"&password="+password.val(),{},function(data){
				
				if(data=='true'){
					window.location.href="supplies/findAll";
				}else if(data=='false'){
					alert("用户名或者密码输入错误!");
				}
				
			},"text")
			
		}
		
	}
	
	function doReg(){
		window.location.href="reg.jsp";
	}
</script>

<style>
	td{
		text-align: center;
	}
</style>
</head>
<body>
	<table border="1px solid gray" cellspacing="0">
		<tr>
			<td>用户名:</td>
			<td>
				<input type="text" id="username" name="username">
			</td>
		</tr>
		<tr>
			<td>密码:</td>
			<td>
				<input type="password" id="password" name="password">
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="button" onclick="doLogin()" value="登录">
				<input type="button" onclick="doReg()" value="注册">
			</td>
		</tr>
	</table>
</body>
</html>