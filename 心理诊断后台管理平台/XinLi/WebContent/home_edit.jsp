<%@page import="model.*"%>
<%@page import="dao.*"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<<meta charset="utf-8">
<title>首页-编辑</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="format-detection" content="telephone=no">
<link rel="stylesheet" href="./css/x-admin.css" media="all">
<script type="text/javascript">//选择文件后能够快速出现图片
function changeValue() {
	document.getElementById('picture').src =document.getElementById('web_picture').value; 	
}
setInterval(synchronize,100);//1000是1秒刷新一次。
</script>
</head>
<body>
<%

String id= request.getParameter("web_id");
int web_id=Integer.parseInt(id);
webDaoImpl webDao=new webDaoImpl();
web web=webDao.load(web_id);
%>
<div class="x-body">
		<form class="layui-form" action="home-edit.do" method="post">
		<input type="hidden" name="web_id" value="<%=web_id %>">
			<div class="layui-form-item">
				<label for="link" class="layui-form-label"> <span
					class="x-red">*</span>标题
				</label>
				<div class="layui-input-inline">
					<input type="text" id="web_title" name="web_title"  value="<%=web.getWeb_title() %>class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label for="link" class="layui-form-label"> <span
					class="x-red">*</span>上传时间
				</label>
				<div class="layui-input-inline">
					<input type="Date" id="write_time" name="write_time" class="layui-input" value="<%web.getWrite_time();%>" >
				</div>
			</div>

		<div class="layui-form-item">
				<label for="link" class="layui-form-label"> <span
					class="x-red">*</span>图片路径
				</label>
				<div class="layui-input-inline">
				     <input type="text" id="web_picture" name="web_picture" value="<%=web.getWeb_picture() %>" onchange="changeValue()"  />
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">图片 </label>
				 <img id="picture" src="<%=web.getWeb_picture() %>"  height="100" width="100">
			</div>
			<div class="layui-form-item">
				<label for="desc" class="layui-form-label"> <span
					class="x-red">*</span>文字信息
				</label>
				<div class="layui-input-inline">
					<textarea id="L_content" name="web_character" placeholder="简介"
						class="layui-textarea fly-editor" style="height: 260px;"><%=web.getWeb_character() %></textarea>
				</div>
				<div class="layui-form-mid layui-word-aux">
					<span class="x-red">*</span>
				</div>
			</div>
			<div class="layui-form-item">
				<label for="L_repass" class="layui-form-label"> </label>
				<button class="layui-btn">完成</button>
			</div>
		</form>
	</div>
	<script src="./lib/layui/layui.js" charset="utf-8">
        </script>
	<script src="./js/x-layui.js" charset="utf-8">
        </script>
	<script>
            layui.use(['form','layer','upload'], function(){
                $ = layui.jquery;
              var form = layui.form()
              ,layer = layui.layer;
            });
        </script>
</body>
</html>