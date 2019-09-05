<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>物资管理系统---登录</title>
<script type="text/javascript"
	src="${request.getContextPath.contextPath}/js/jquery-1.8.3.js"></script>

<script>
window.onload=function(){
	
	document.getElementById("firstcb").onclick=function(){
		var cbs=document.getElementsByName("sid");
		
		for(var i=0;i<cbs.length;i++){
			cbs[i].checked=this.checked;
		}
		
	}
	
	document.getElementById("deleteSelect").onclick = function () {
        if (confirm("你确定要删除选择的条目吗?")) {
            var flag=false;
            var cbs = document.getElementsByName("sid");

            for(var i=0;i<cbs.length;i++){
                if(cbs[i].checked){
                    flag=true;
                    break;
                }
            }
            if(flag){
            	document.getElementById("form").submit();
            }
        }
    }
}

</script>





<style>
td {
	padding:10px;
	text-align: center;
}

a {
	margin: 5px;
	text-decoration: none;
}
</style>

</head>
<body>
	<!-- 查询 -->
 	<form action="/supplies/findAll"  method="post">
		<div id="select" style="margin:10px">
			<a>物资名称:</a>&nbsp;<input type="text" name="suppliesname" id="suppliesname" >&nbsp;&nbsp;
			<a>厂商:</a>&nbsp;
			<select name="pselect">
				<option value=""></option>
				<c:forEach items="${plist}" var="plist">
					<option value="${plist.pid}">${plist.pname}</option>
				</c:forEach>
			</select>
			&nbsp;&nbsp;
			<a>价格:</a>&nbsp;
			<input type="text" name="minprice" >---
			<input type="text" name="maxprice">
			&nbsp;&nbsp;
			<button id="bt" type="submit" class="btn btn btn-default btn-sm">查询</button>
		</div>
	</form>
	
	<div style="padding:10px;" >
		<input type="submit" id="deleteSelect" value="批量删除" >
	</div>
	
	<form id="form" action="/supplies/deleteSelect" method="post" >
		<table border="1px solid gray" cellspacing="0">
			<tr>
				<td><input type="checkbox" id="firstcb"></td>
				<td>当前用户</td>
				<td>物资规格编号</td>
				<td>物资名称</td>
				<td>物资数量</td>
				<td>物资单价</td>
				<td>生产厂商</td>
				<td>操作</td>
			</tr>
			<c:forEach items="${pageInfo.list}" var="list">
				<tr>
					<td><input type="checkbox" value="${list.sid}" name="sid"></td>
					<td>${admin.username}</td>
					<td>${list.sid}</td>
					<td>${list.sname}</td>
					<td>${list.snum}</td>
					<td>${list.sprice}</td>
					<td>${list.product.pname}</td>
					<td>
						<%-- <button onclick="del(${list.sid})">删除</button> --%>
						<a href="/supplies/delete?id=${list.sid}">删除</a>
						<a href="/supplies/findById?id=${list.sid}">修改</a>
					</td>
				</tr>
			</c:forEach>
		</table>
</form>

	<div>
		<p>
			当前 <span>${pageInfo.pageNum}</span> 页,总 <span>${pageInfo.pages}</span>
			页,共 <span>${pageInfo.total}</span> 条记录
		</p>
		<a href="${pageContext.request.contextPath}/supplies/findAll?cp=1">首页</a>

		<c:if test="${pageInfo.isFirstPage}">
			<a href="${pageContext.request.contextPath}/supplies/findAll?cp=1">上一页</a>
		</c:if>
		<c:if test="${!pageInfo.isFirstPage}">
			<a
				href="${pageContext.request.contextPath}/supplies/findAll?cp=${pageInfo.pageNum-1}">上一页</a>
		</c:if>

		<c:forEach items="${pageInfo.navigatepageNums}" var="num">
			<c:if test="${num==pageInfo.pageNum}">
				<a style="color: red;"
					href="${pageContext.request.contextPath}/supplies/findAll?cp=${num}">${num}</a>
			</c:if>
			<c:if test="${num!=pageInfo.pageNum}">
				<a
					href="${pageContext.request.contextPath}/supplies/findAll?cp=${num}">${num}</a>
			</c:if>
		</c:forEach>

		<c:if test="${pageInfo.isLastPage}">
			<a
				href="${pageContext.request.contextPath}/supplies/findAll?cp=${pageInfo.pages}">下一页</a>
		</c:if>
		<c:if test="${!pageInfo.isLastPage}">
			<a
				href="${pageContext.request.contextPath}/supplies/findAll?cp=${pageInfo.pageNum+1}">下一页</a>
		</c:if>
		<a
			href="${pageContext.request.contextPath}/supplies/findAll?cp=${pageInfo.pages}">尾页</a>

	</div>

</body>
</html>