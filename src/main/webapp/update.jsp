<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>物资管理系统---登录</title>
<script type="text/javascript" src="${request.getContextPath.contextPath}/js/jquery-1.8.3.js"></script>
<script type="text/javascript">

	 function doUpdate(id){
		
	 	var sname=$("#sname").val();
		var snum=$("#snum").val();
		var sprice=$("#sprice").val();
		var sele=$("#sele").val();
		
	   $.post("/supplies/update",{"id":id,"sname":sname,"snum":snum,"sprice":sprice,"sele":sele},function(data){
			
			if(data==true){
				alert("修改成功！ ");
				location.href="/supplies/findAll";
			}else{
				alert("修改失败 ！ ");
				location.href="/supplies/findById?id="+id;
			}
			
			
		},"json"); 
	} 
	 
</script>
<style>
	td{
		text-align: center;
		padding:10px;
	}
	
	a{
		margin:5px;
		text-decoration: none;
	}
</style>

</head>
<body>
	<table border="1px solid gray" cellspacing="0">
		<tr>
			<td>当前用户</td>
			<td>物资规格编号</td>
			<td>物资名称</td>
			<td>物资数量</td>
			<td>物资单价</td>
			<td>生产厂商</td>
			<td>操作</td>
		</tr>
		<tr>
			<td>${admin.username}</td>
			<td>${supplies.sid}</td>
			<td>
				<input type="text" name="sname" id="sname" value="${supplies.sname}" >
			</td>
			<td>
				<input type="text" name="snum" id="snum" value="${supplies.snum}" >
			</td>
			<td>
				<input type="text" name="sprice" id="sprice" value="${supplies.sprice}" >
			</td>
			
			<td>
				<select name="sele" id="sele" >
					<c:forEach items="${list}" var="list">
						<c:if test="${supplies.sproduct==list.pid}">
							<option value="${list.pid}" selected="selected" >${list.pname}</option>
						</c:if>
						<c:if test="${supplies.sproduct!=list.pid}">
							<option value="${list.pid}">${list.pname}</option>
						</c:if>
					</c:forEach>
				</select>
			</td>
			<td>
				<input type="button" onclick="doUpdate(${supplies.sid})" value="修改完成提交" >
			</td>
		</tr>
	</table>
	
</body>
</html>