<%@page import="dao.*"%>
<%@page import="model.*"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户管理-修改密码</title>
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
	if (document.getElementById("old_password").value.length == 0) {
		alert("旧密码不能为空");
		document.getElementById("old_password").focus();
		return false;
	} else if (document.getElementById("new_password").value.length == 0) {
		alert("新密码不能为空");
		document.getElementById("new_password").focus();
		return false;
	}
	else if (document.getElementById("re_password").value.length == 0) {
		alert("确认密码不能为空");
		document.getElementById("re_password").focus();
		return false;
	}
	else if(document.getElementById("re_password").value!=document.getElementById("new_password").value)
	{
		alert("密码与确认密码不一致");
		document.getElementById("new_password").focus();
		return false;
		
	}
	else
	{
		return true;
	}

}</script>
</head>
<body>
<%
String id= request.getParameter("user_id");
int user_id=Integer.parseInt(id);
UserDaoImpl userDao=new UserDaoImpl();
User user=userDao.load(user_id);
%>
	<div class="x-body">
		<form class="layui-form" action="user-password.do" method="post" onsubmit="return check_login()">
		<input type="hidden" name="user_id" value="<%=id %>"/>
			<div class="layui-form-item">
				<label class="layui-form-label"> 用户名 </label>
				<div class="layui-input-inline">
					<input type="text" id="user_name" name="user_name" disabled=""
						value="<%=user.getUsername() %>" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label"> <span class="x-red">*</span>旧密码
				</label>
				<div class="layui-input-inline">
					<input type="password" id="old_password" name="old_password"
						class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label"> <span cla  ss="x-red">*</span>新密码
				</label>
				<div class="layui-input-inline">
					<input type="password" id="new_password" name="new_password"
						class="layui-input">
				</div>
				<div class="layui-form-mid layui-word-aux">6到16个字符</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label"> <span class="x-red">*</span>确认密码
				</label>
				<div class="layui-input-inline">
					<input type="password" id="re_password" name="re_password"
						class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label"> </label>
				<input type="submit" value="确定修改" class="layui-btn">
			</div>
		</form>
	</div>
	<script src="./lib/layui/layui.js" charset="utf-8">
        </script>
	<script src="./js/x-layui.js" charset="utf-8">
        </script>
</body>

</html>