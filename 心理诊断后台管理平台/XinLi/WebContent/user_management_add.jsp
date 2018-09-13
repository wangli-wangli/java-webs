<%@page import="dao.*"%>
<%@page import="model.*"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户管理-添加</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="format-detection" content="telephone=no">
<link rel="stylesheet" href="./css/x-admin.css" media="all">
<script type="text/javascript">
function check_login() {
	if (document.getElementById("user_name").value.length == 0) {
		alert("用户名不能为空");
		document.getElementById("user_name").focus();
		return false;
	} else if (document.getElementById("password").value.length == 0) {
		alert("密码不能为空");
		document.getElementById("password").focus();
		return false;
	} else if(document.getElementById("password").value!=document.getElementById("password2").value)
	{
		alert("密码与确认密码不一致");
		document.getElementById("password").focus();
		return false;
		
	}
	else
	{
		return true;
	}

}</script>
</head>

<body>
	<div class="x-body">
	<form action="user-management-add.do" method="post" onsubmit="return check_login()">
		<table class="layui-table">
			<tbody>
				<tr>
					<td><span class="x-red">*</span>用户姓名</td>
					<td><input type="text" id="user_name" name="user_name"
						class="layui-input"></td>
				</tr>
				<tr>
					<td>性别</td>
					<td><select lay-verify="required" name="user_sex" id="user_sex"
						class="layui-input">
							<option value="男">男</option>
							<option value="女">女</option>
					</select></td>
				</tr>
				<tr>
					<td>密码</td>
					<td><input type="password" id="password" name="password"
						class="layui-input"><div class="layui-form-mid layui-word-aux">6到16个字符</div></td>
				</tr>
				<tr>
				
					<td>确认密码</td>
					<td><input type="password"  id="password2"
						class="layui-input"></td>
					
				</tr>
				<tr>
					<td>用户角色</td>
					<td colspan="3"><select lay-verify="required" name="user_type" id="user_type"
						class="layui-input">
							<option value=""></option>
							<option value="管理员">管理员</option>
							<%
							User loginUser=(User)session.getAttribute("login_user");
							if(loginUser.getUser_type().equals("超级管理员"))
							{
							%>
							<option value="超级管理员">超级管理员</option>
							<%} %>
					</select></td>
				</tr>
				<tr>
					<td colspan="6" align="right">
					<input type="submit" value="增加" class="layui-btn">
						</td>
				</tr>
			</tbody>
			
		</table>
		</form>
		
	</div>
	<script src="./lib/layui/layui.js" charset="utf-8">
        </script>
	<script src="./js/x-layui.js" charset="utf-8">
        </script>
</body>

</html>