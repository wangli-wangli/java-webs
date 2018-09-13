<%@page import="model.patient"%>
<%@page import="dao.*"%>
<%@page import="model.User"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户查看</title>
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
<div class="x-body">
<%
String id= request.getParameter("patient_id");
int patient_id=Integer.parseInt(id);
patientDaoImpl patientDao=new patientDaoImpl();
patient patient=patientDao.load(patient_id);
%>
            <input type="hidden" name="patient_id" value="<%=id %>"/>
			<div class="layui-form-item">
				<label for="L_title" class="layui-form-label"> 姓名 </label>
				<div class="layui-input-block">
					<input type="text" id="patient_name" name="patient_name" required
						lay-verify="patient_name" value="<%=patient.getPatient_name() %>" autocomplete="off"
						class="layui-input">
				</div>
			</div>

			<div class="layui-form-item">
				<label for="L_title" class="layui-form-label"> 性别 </label>
				<div class="layui-input-block">
					<input type="text" id="patient_sex" name="patient_sex" required
						lay-verify="patient_sex" value="<%=patient.getPatient_sex()%>" autocomplete="off"
						class="layui-input">
				</div>
			</div>

			<div class="layui-form-item">
				<label for="L_title" class="layui-form-label"> 籍贯 </label>
				<div class="layui-input-block">
					<input type="text" id="patient_home" name="patient_home" required
						lay-verify="patient_home" value="<%=patient.getPatient_home() %>" autocomplete="off"
						class="layui-input">
				</div>
			</div>

			<div class="layui-form-item">
				<label for="L_title" class="layui-form-label"> 年龄 </label>
				<div class="layui-input-block">
					<input type="text" id="patient_age" name="patient_age" required
						lay-verify="patient_age" value="<%=patient.getPatient_age() %>" autocomplete="off"
						class="layui-input">
				</div>
			</div>

			<div class="layui-form-item">
				<label for="L_title" class="layui-form-label"> 文化程度 </label>
				<div class="layui-input-block">
					<input type="text" id="patient_education" name="patient_education" required
						lay-verify="patient_education" value="<%=patient.getPatient_education() %>" autocomplete="off"
						class="layui-input">
				</div>
			</div>

			<div class="layui-form-item">
				<label for="L_title" class="layui-form-label"> 宗教信仰 </label>
				<div class="layui-input-block">
					<input type="text" id="patient_believe" name="patient_believe" required
						lay-verify="patient_believe" value="<%=patient.getPatient_believe() %>" autocomplete="off"
						class="layui-input">
				</div>
			</div>

			<div class="layui-form-item">
				<label for="L_title" class="layui-form-label"> 联系电话 </label>
				<div class="layui-input-block">
					<input type="text" id="patient_phone" name="patient_phone" required
						lay-verify="patient_phone" value="<%=patient.getPatient_phone() %>" autocomplete="off"
						class="layui-input">
				</div>
			</div>
			
	</div>
	<script src="./lib/layui/layui.js" charset="utf-8">
        </script>
	<script src="./js/x-layui.js" charset="utf-8">
        </script>
	<script>
            layui.use(['form','layer','layedit'], function(){
                $ = layui.jquery;
              var form = layui.form()
              ,layer = layui.layer
              ,layedit = layui.layedit;
            });
        </script>
</body>
</html>