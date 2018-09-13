
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
	} else{
		return true;
	}

}</script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>心理诊断登录界面</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="js/jquery2.js"></script>
<script src="js/cloud.js" type="text/javascript"></script>
<script language="javascript" src="js/js.js"></script>
</head>
<body
	style="background-color: #1c77ac; background-image: url(images/light.png) background-repeat:no-repeat; background-position: center top; overflow: hidden;">
	<div id="mainBody">
		<div id="cloud1" class="cloud"></div>
		<div id="cloud2" class="cloud"></div>
	</div>
	<%
   String loginError=(String)session.getAttribute("error");
   if(loginError==null){
	   loginError=" ";
   }
%>
	<div class="logintop">
		<span>欢迎登录心理诊断后台</span>
	</div>
	<div class="loginbody">
		<span class="systemlogo"></span>
		<div class="loginbox">
			<form action="login.jsp" method="post"
				onsubmit="return check_login()">
				<ul>
					<li><input name="user_name" type="text" class="loginuser"
						value="用户名" id="user_name" onclick="JavaScript:this.value=''" /></li>
					<li><input name="password" type="text" class="loginpwd"
						value="密码" id="password" onclick="JavaScript:this.value=''" />
						<div style="color: red; font-size: 12px;">
							<%=loginError %></div></li>
					<li><input name="" type="" class="loginy" placeholder="输入验证码" /><label><img
							src="images/images.jpg" /></label></li>
					<li><input type="submit" name="Submit" class="loginbtn"
						value="登录" /></li>
				</ul>
			</form>
		</div>
	</div>



</body>
</html>