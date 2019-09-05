<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title></title>
<script type="text/javascript" src="js/jquery-1.8.3.js"></script>

<script type="text/javascript">
	function doReg(){
		
		var username=$("#username").val();
		var password=$("#password").val();
		var realname=$("#realname").val();
		var gender=$("#gender").val();
		var age=$("#age").val();
		
		if(username=="" || password=="" || realname=="" || age==""){
			alert("请填写完整的信息");
		}else{
			
			$.post("admin/reg",{"username":username,"password":password,"realname":realname,"gender":gender,"age":age},function(data){
				
				if(data){
					alert("注册成功!");
					window.location.href="login.jsp";
				}else{
					alert("注册失败,请重新注册!");
					window.location.href="reg.jsp";
				}
				
			},"text")
			
		}
		
	}

</script>


<style>
td {
	text-align: center;
}
</style>
</head>
<body>

	<table border="1px solid gray" cellspacing="0">
		<tr>
			<td>用户名:</td>
			<td><input type="text" id="username" value="wangwu" name="username"></td>
		</tr>
		<tr>
			<td>密码:</td>
			<td><input type="password" id="password" value="123" name="password">
			</td>
		</tr>
		<tr>
			<td>姓名:</td>
			<td><input type="text" id="realname" value="王五" name="realname"></td>
		</tr>
		<tr>
			<td>性别:</td>
			<td>
				<input type="radio" id="gender" checked="checked" name="gender" value="男">男&nbsp;&nbsp;
				<input type="radio" id="gender" name="gender" value="女">女
			</td>
		</tr>
		<tr>
			<td>年龄:</td>
			<td><input type="text" id="age" value="25" name="age"></td>
		</tr>
		<tr>
			<td colspan="2"><input type="button" onclick="doReg()"
				value="提交"></td>
		</tr>
	</table>

</body>
</html>