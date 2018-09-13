<%@page import="model.*"%>
<%@page import="dao.*"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>心理网站</title>
<meta name="description"
	content="心理网是一个纯粹的心理学网站，我们拒绝枯燥、拒绝陈腐，将心理学通过有趣的、多媒体的方式分享给大家，通过心理游戏、心理测试、心理FM、问答、心理课程等方式帮助大家自我成长。">
<meta name="keywords"
	content="心理网，心理测试，壹心理，心理学,心理咨询,爱情测试,心理游戏，治愈系图片，心理课程">
<meta
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0"
	name="viewport">
<meta content="yes" name="apple-mobile-web-app-capable">
<meta content="black" name="apple-mobile-web-app-status-bar-style">
<meta content="telephone=no" name="format-detection">

<link rel="stylesheet" href="css/common.css">

</head>
<body>
<%
webDaoImpl webDao = new webDaoImpl();
%>
	<div id="main_body">
		<header class="s_header"> <nav> <span class="navt qq">心理</span>

		<span class="userspan"> </span> </nav> </header>
		<nav class="s_nav"> <section id="jt">
		<div id="nav">
			<ul>
				<li><a href="">轮播图片</a> <a href="">咨询师介绍</a> <a href="">中心活动</a>
					<a href="">关于我们</a> <a href="">心理阅读</a></li>
			</ul>
		</div>
		</section> </nav>
		
		
		
		<section class="s_moreread">
		<div class="module-t">
			<h3>
				<a href="liebiao.html">心理阅读</a>
			</h3>
			<a href="" class="more">更多»</a>
		</div>
		<div class="list_box">
			<%
				
				List<web> webs2 = webDao.load2("心理阅读");
				for (web web : webs2) {
			%>
			<dl>
				<a href="">
					<dt>
						<img src="../<%=web.getWeb_picture()%>" width="70" hight="70">
					</dt>
					<dd>
						<h3><%=web.getWeb_title()%></h3>
					</dd>
					<dd>
						<%=web.getWeb_character()%>
					</dd>
					<dd>
						<span>发表时间：<%=web.getWrite_time()%></span>
					</dd>
				</a>
			</dl>
			<%
				}
			%>

		</div>
		</section>
		
		
		<section class="s_moreread">
		<div class="module-t">
			<h3>
				<a href="liebiao.html">关于我们</a>
			</h3>
			<a href="" class="more">更多»</a>
		</div>
		<div class="list_box">
			<%
				
				List<web> webs3 = webDao.load2("关于我们");
				for (web web : webs3) {
			%>
			<table align="center" border="0" style="line-height:22px;font-size:16px;">
			 <tr><td align="left">|&nbsp;&nbsp;<b><%=web.getWeb_title() %><b></td></tr>
			 <tr><td align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=web.getWeb_character() %></td></tr>
			</table>
			<br/>
			<br/>
			
			<%
				}
			%>
        
		</div>
		</section>
		
		<section class="s_moreread">
		<div class="module-t">
			<h3>
				<a href="liebiao.html">中心活动</a>
			</h3>
			<a href="" class="more">更多»</a>
		</div>
		<div class="list_box">
			<%
				
				List<web> webs = webDao.load2("中心活动");
				for (web web : webs) {
			%>
			<table align="center" border="0" style="line-height:22px;font-size:16px;">
			 <tr><td align="left">【<%=web.getWeb_title() %>】</td></tr>
			 <tr><td align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=web.getWeb_character() %></td></tr>
			</table>
			<br/>
			<br/>
			
			<%
				}
			%>
        
		</div>
		</section>
		
		<section class="s_moreread">
		<div class="module-t">
			<h3>
				<a href="liebiao.html">轮播图片</a>
			</h3>
			<a href="" class="more">更多»</a>
		</div>
		<div class="list_box">
			<%
				
				List<web> webs4 = webDao.load2("轮播图片");
				for (web web : webs4) {
			%>
			<table align="center" border="0" style="line-height:22px;font-size:16px;" width="70%">
			 <tr><td align="center"><img src="../<%=web.getWeb_picture() %>" width="300" hight="300"></td></tr>
			 <tr><td align="center"><%=web.getWeb_character() %></td></tr>
			</table>
			<br/>
			<br/>
			
			<%
				}
			%>
        
		</div>
		</section>
		
		<section class="s_moreread">
		<div class="module-t">
			<h3>
				<a href="liebiao.html">咨询师介绍</a>
			</h3>
			<a href="" class="more">更多»</a>
		</div>
		<div class="list_box">
			<%
				
				List<web> webs5 = webDao.load2("咨询师介绍");
				for (web web : webs5) {
			%>
			<dl>
				<a href="">
					<dt>
						<img src="../<%=web.getWeb_picture()%>" width="100" hight="100">
					</dt>
					<dd>
						<h3><%=web.getWeb_title()%></h3>
					</dd>
					<dd>
						<%=web.getWeb_character()%>
					</dd>
					<dd>
						<span>发表时间：<%=web.getWrite_time()%></span>
					</dd>
				</a>
			</dl>
			<%
				}
			%>

		</div>
		</section>
		
		<div class="module module-margin tuijian">
	<div class="topic">
		<ul class="cont-list">
			
			
			<li>
				<span class="live-icon">推荐</span><a href="zhengwen.html">心理测试：探索真实的内心世界 </a>
				<br/>
				 <a href="Dangan-add.html">
                            <img src="img/xinli16.png" class="template-img">
                        </a>
			</li>
			
		</ul>
	</div>
</div>
		<footer class="footer">
		<div>
			<p>
				<a href="#">留言</a> | <a href="#">登录</a> |<a href="#">客户端下载</a>
			</p>
		</div>
		</footer>

		<div id="favtip" style="display: none; left: 549px;">
			<a id="closetip" href="javascript:void(0);" style=""><span></span></a>
		</div>
		<div id="gotop" class="gotop" style="display: none">
			<img src="img/gotop.png" width="100%" height="100%" align="middle">
		</div>

	</div>
	<script src="js/jquery-2.0.0.min.js"></script>
	<script src="js/touchslider_min.js"></script>
	<script type="text/javascript">
		for (n = 1; n < 2; n++) {
			var page = 'pagenavi' + n;
			var mslide = 'slider' + n;
			var mtitle = 'emtitle' + n;
			arrdiv = 'arrdiv' + n;
			var as = document.getElementById(page).getElementsByTagName('a');
			var tt = new TouchSlider({
				id : mslide,
				'auto' : '-1',
				fx : 'ease-out',
				direction : 'left',
				speed : 300,
				timeout : 2000,
				'before' : function(index) {
					var as = document.getElementById(this.page)
							.getElementsByTagName('a');
					as[this.p].className = '';
					as[index].className = 'active';
					this.p = index;
				}
			});
			tt.page = page;
			tt.p = 0;
			for (var i = 0; i < as.length; i++) {
				(function() {
					var j = i;
					as[j].tt = tt;
					as[j].onclick = function() {
						this.tt.slide(j);
						return false;
					}
				})();
			}
		}
		$('#closetip').click(function() {
			$('#favtip').hide();
		})
		function hideGoTop() {
			var top = document.body.scrollTop;
			if (top > 250) {
				$('#gotop').show();
			} else {
				$('#gotop').hide();
			}
		}
		window.onscroll = hideGoTop;
		$('#gotop').click(function() {
			document.body.scrollTop = 0;
		});
		var dwidth = $('body').width();
		$('#favtip').css('left', (dwidth - 210) / 2);
		var ua = navigator.userAgent;
		if (/iPhone|iPad/g.test(ua) && ua.indexOf('Safari') > 0) {
			$('#favtip').show();
			window.setTimeout("$('#favtip').hide();", 6000);
		}
	</script>

</body>
</html>