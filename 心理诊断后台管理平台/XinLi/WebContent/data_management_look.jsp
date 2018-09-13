<%@page import="dao.*"%>
<%@page import="model.*"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>数据管理-查看</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="format-detection" content="telephone=no">
<link rel="stylesheet" href="./css/x-admin.css" media="all">
</head>

<body>
	<%
String id= request.getParameter("result_id");
int result_id=Integer.parseInt(id);
resultDaoImpl resultDao=new resultDaoImpl();
result result=resultDao.load(result_id);

%>
	<div class="x-body">
		<form class="layui-form layui-form-pane">
			<div class="layui-form-item">
				<label for="username" class="layui-form-label"> 编号 </label>
				<div class="layui-input-inline">
					<input type="text" required lay-verify="required"
						autocomplete="off" value="1" disabled=""
						value="<%=result.getResult_id()%>" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label"> 用户名 </label>
				<div class="layui-input-inline">
					<input type="text" value="<%=result.getPatient_name()%>"
						class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label for="username" class="layui-form-label"> 测试类型 </label>
				<div class="layui-input-inline">
					<input type="text" required lay-verify="required"
						autocomplete="off" value="<%=result.getQuestion_type() %>"
						class="layui-input">
				</div>
			</div>
			<div class="layui-form-item layui-form-text">
				<label for="content" class="layui-form-label"> 测试题目 </label>
				<div class="layui-input-block">
					<input type="text" required lay-verify="required"
						autocomplete="off" value="<%=result.getQuestion() %>"
						class="layui-input">
				</div>
			</div>
			<div class="layui-form-item layui-form-text">
				<label for="content" class="layui-form-label"> 测试答案 </label>
				<div class="layui-input-block">
					<input type="text" required lay-verify="required"
						autocomplete="off" value="<%=result.getAnswer() %>"
						class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label for="username" class="layui-form-label"> 测试时间 </label>
				<div class="layui-input-inline">
					<input type="text" required lay-verify="required"
						autocomplete="off" value="<%=result.getWrite_time() %>"
						class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label for="username" class="layui-form-label"> 处理状态 </label>
				<div class="layui-input-inline">
					<input type="text" required lay-verify="required"
						autocomplete="off" value="已查看" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<button class="layui-btn">返回</button>
			</div>

		</form>
	</div>
	<script src="./lib/layui/layui.js" charset="utf-8">
		
	</script>
	<script src="./js/x-layui.js" charset="utf-8">
		
	</script>
</body>
</html>