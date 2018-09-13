<%@page import="dao.*"%>
<%@page import="model.*"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>数据统计</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="format-detection" content="telephone=no">
<link rel="stylesheet" href="./css/x-admin.css" media="all">
<link rel="stylesheet" href="css/pag.css" media="all">
<!--饼状图开始-->
<script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
<script type="text/javascript" src="js/jsapi.js"></script>
<script type="text/javascript" src="js/corechart.js"></script>
<script type="text/javascript" src="js/jquery.gvChart-1.0.1.min.js"></script>
<script type="text/javascript" src="js/jquery.ba-resize.min.js"></script>

<script type="text/javascript">
	gvChartInit();
	$(document).ready(function() {
		$('#myTable5').gvChart({
			chartType : 'PieChart',
			gvSettings : {
				vAxis : {
					title : 'No of players'
				},
				hAxis : {
					title : 'Month'
				},
				width : 600,
				height : 350
			}
		});
	});

	function selectAll() {
		var checklist = document.getElementsByName("selected");
		if (document.getElementById("controlAll").checked) {
			for (var i = 0; i < checklist.length; i++) {
				checklist[i].checked = 1;
			}
		} else {
			for (var j = 0; j < checklist.length; j++) {
				checklist[j].checked = 0;
			}
		}
	}
</script>

<script type="text/javascript">
	gvChartInit();
	$(document).ready(function() {
		$('#myTable1').gvChart({
			chartType : 'PieChart',
			gvSettings : {
				vAxis : {
					title : 'No of players'
				},
				hAxis : {
					title : 'Month'
				},
				width : 600,
				height : 350
			}
		});
	});
</script>
<!--结束-->

</head>
<body>
	<div class="x-nav">
		<span class="layui-breadcrumb"> <a><cite>首页</cite></a> <a><cite>数据管理</cite></a>
			<a><cite>数据统计</cite></a>
		</span> <a class="layui-btn layui-btn-small"
			style="line-height: 1.6em; margin-top: 3px; float: right"
			href="javascript:location.replace(location.href);" title="刷新"><i
			class="layui-icon" style="line-height: 30px">ဂ</i></a>
	</div>
	<div class="x-body">

		<form action="shujutongji.jsp" style="width: 85%" method="post">

			<div class="layui-form-pane">
				<div class="layui-form-item">
					<div class="layui-input-inline" style="width: 200px">
						<select name="question_type" class="layui-input">
							<option value=""></option>
							<%
								resultDaoImpl resultDao = new resultDaoImpl();
								webDaoImpl webDao = new webDaoImpl();
								List<question> questions = webDao.load_question();
								for (question question : questions) {
								String type=question.getQuestion_type();
							%>
							<option value="<%=type%>"><%=type%></option>
							<%
								}
							%>
						</select>
					</div>
					<div class="layui-input-inline" style="width: 80px">
						<button class="layui-btn" lay-submit="" lay-filter="*">搜索</button>
					</div>
				</div>
			</div>
		</form>
		<!--内容-->
	</div>
	<br />
	<br />
	<br />
	<script src="./lib/layui/layui.js" charset="utf-8"></script>
	<script src="./js/x-layui.js" charset="utf-8"></script>
	<script>
		layui.use([ 'laydate', 'element', 'laypage', 'layer' ], function() {
			$ = layui.jquery;//jquery
			lement = layui.element();//面包导航
			laypage = layui.laypage;//分页
			layer = layui.layer;//弹出层
		});
		//查看
		function person_look(title, url, id, w, h) {
			x_admin_show(title, url, w, h);
		}
	</script>
	<!--饼状图开始-->
	<div style="width: 100%; margin: 0 auto;">
		<%
			String type1 = request.getParameter("question_type");
			if (type1 != null) {
				List<String> answers = resultDao.load_Answers(type1);
				int i = 0, he = 0;
				int count[] = new int[answers.size()];
				for (String answer : answers) {
					count[i] = resultDao.load_AnswerCounts(type1, answer);
					he = he + count[i];
					i++;
				}
				String question=resultDao.load_Question(type1);
		%>
		<div class="layui-form-item">
				<label class="layui-form-label">问题 </label>
				<div class="layui-input-inline">
					<%=question %>
				</div>
			</div>
		<table id='myTable5'>
			<caption>答案比例</caption>

			<thead>
				<tr>
					<th></th>
					<%
						for (String answer : answers) {
					%>
					<th><%=answer%></th>
					<%
						}
					%>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th><%=he%></th>
					<%
						for (int j = 0; j < count.length; j++) {
					%>
					<td><%=count[j]%></td>
					<%
						}
					%>
				</tr>
			</tbody>
		</table>
		<%
			}
		%>

	</div>

	<!--结束-->
	<br />
	<br />
</body>
</html>