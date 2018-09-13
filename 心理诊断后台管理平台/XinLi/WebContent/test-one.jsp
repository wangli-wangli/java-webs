<%@page import="model.*"%>
<%@page import="dao.*"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body style="line-hight:50px">
<%
String err=(String)session.getAttribute("err");
if(err==null)  err="   ";
%>
   <form action="test-two.jsp" method="post" onsubmit="return check_login()">
	<div class="x-n/av">
		<span class="layui-breadcrumb"> <a><cite>首页</cite></a>>><a><cite>心理诊断测试</cite></a>
		</span> <a class="layui-btn layui-btn-small"
			style="line-height: 1.6em; margin-top: 3px; float: right"
			href="javascript:location.replace(location.href);" title="刷新"><i
			class="layui-icon" style="line-height: 30px">ဂ</i></a>
	</div>
	<span style="color:red"><%=err %></span>
	<section>
	<div>
		<ul>
			<%
				webDaoImpl webDao = new webDaoImpl();
				List<question> questions = webDao.load_question();
				int i = 1;
				for (question question : questions) {
			%>
			<li>
				<table width="90%">
					<tr>
						<th align="left" style="background:#BBF;margin-top:7px" colspan="4"><%=i%>.<%=question.getQuestion_type()%></th>
					</tr>
					<tr>
						<td colspan="4" style="margin-top:7px">&nbsp;&nbsp;&nbsp;&nbsp;<%=question.getQueston_name()%></td>
					</tr>
					<tr>
						<td  width="25%"><div style="background:#EEE;margin-left:15px;margin-right:15px;margin-top:7px"><input type="radio"
							 name="<%=question.getQuestion_type()%>" 
							 id="<%=i %>"
							value="<%=question.getAnswer1()%>"
							style="width: 20px; height: 20px; margin-right: 5px;" /><%=question.getAnswer1()%>
							</div></td>
						<td  width="25%"><div style="background:#EEE;margin-left:15px;margin-right:15px;"><input  type="radio"
						name="<%=question.getQuestion_type()%>" 
							id="<%=i %>"
							value="<%=question.getAnswer2()%>"
							style="width: 20px; height: 20px; margin-right: 5px;" /><%=question.getAnswer2()%></div></td>
						<td width="25%"><div style="background:#EEE;margin-left:15px;margin-right:15px;"><input type="radio"
							name="<%=question.getQuestion_type()%>"
							id="<%=i %>"
							value="<%=question.getAnswer3()%>"
							style="width: 20px; height: 20px; margin-right: 5px;" /><%=question.getAnswer3()%></div></td>
						<td  width="25%"><div style="background:#EEE;margin-left:15px;margin-right:15px;"><input  type="radio"
							 name="<%=question.getQuestion_type()%>" 
							id="<%=i %>"
							value="<%=question.getAnswer4()%>"
							style="width: 20px; height: 20px; margin-right: 5px;" /><%=question.getAnswer4()%></div></td>
					</tr>
				</table>
				<br/>
				
			</li>
			<%
				i++;
				}
			%>

		</ul>
	</div>
    <table width="90%"><tr><td align="center">
	<input
		type="submit" value="完成" style="background:green;width:100px;height:50px;">
	
	</td></tr></table>
</form>
</body>
</html>
