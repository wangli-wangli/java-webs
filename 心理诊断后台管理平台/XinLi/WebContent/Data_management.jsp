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
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="format-detection" content="telephone=no">
<link rel="stylesheet" href="./css/x-admin.css" media="all">
<link rel="stylesheet" href="css/pag.css" media="all">

</head>
<body>
	<%
		resultDaoImpl resultDao = new resultDaoImpl();
		List<result> results;
		//分页
		int pages = 0; //待显示页面
		int count = 0; //总条数
		int totalpages = 0; //总页数
		int limit = 10; //每页显示记录条数 
		count = resultDao.load_couts();
		//由记录总数除以每页记录数得出总页数
		totalpages = (int) Math.ceil(count / (limit * 1.0));
		//获取跳页时传进来的当前页面参数
		String strPage = request.getParameter("pages");
		//判断当前页面参数的合法性并处理非法页号（为空则显示第一页，小于0则显示第一页，大于总页数则显示最后一页）
		if (strPage == null) {
			pages = 1;
		} else {
			try {
				pages = java.lang.Integer.parseInt(strPage);
			} catch (Exception e) {
				pages = 1;
			}

			if (pages < 1) {
				pages = 1;
			}

			if (pages > totalpages) {
				pages = totalpages;
			}
		}
		results = resultDao.load_results(limit, pages);
	%>
	<div class="x-nav">
		<span class="layui-breadcrumb"> <a><cite>首页</cite></a> <a><cite>数据管理</cite></a>
		</span> <a class="layui-btn layui-btn-small"
			style="line-height: 1.6em; margin-top: 3px; float: right"
			href="javascript:location.replace(location.href);" title="刷新"><i
			class="layui-icon" style="line-height: 30px">ဂ</i></a>
	</div>
	
	<div class="x-body">
		<form  action="Data_management.jsp" style="width: 85%" method="post" id="Myform">
			
			<div class="tools">
				<ul class="toolbar">
					<li><span><img src="images/t03.png" /></span> <input
						type="submit" onclick="delete_do()" value="批量删除"
						style="background-color: transparent; border: 0px solid transparent; margin-top: 7px;">
					</li>
					<li><span><img src="images/t09.png" /></span><input
						type="submit" onclick="daochu_do()" value="批量导出"
						style="background-color: transparent; border: 0px solid transparent; margin-top: 7px;">
					</li>
				</ul>
				<span class="x-right" style="line-height: 25px">共有数据：<%=count%>
					条
				</span>
			</div>
			
			<table class="tablelist" id="result_data">
				<thead>
					<tr>
						<th><input onclick="selectAll()" type="checkbox"
					name="controlAll" style="" id="controlAll"></th>
						<th>编号</th>
						<th>用户名</th>
						<th >测试类型</th>
						<th>测试时间</th>
						<th>处理状态</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody id="x-link">
					<%
						for (result result : results) {
							
					%>
					<tr>
						<td><input type="checkbox" value="<%=result.getResult_id()%>"
							name="selected"></td>
						<td><%=result.getResult_id()%></td>
						<td><%=result.getPatient_name()%></td>
						<td><%=result.getQuestion_type()%></td>
						<td><%=result.getWrite_time()%></td>
						<td>
							<%
								if (result.getStatus().equals("1")) {
							%>
							<button class="sp">正常</button> <%
 	} else {
 %>
							<button class="sp2">异常</button> <%
 	}
 %>
						</td>
						<td><span
							onclick="user_management_look('用户查看','data_management_look.jsp','600','500','<%=result.getResult_id()%>')" /><span><img
								src="images/t06.png" /></span>查看</span></td>
					</tr>
					<%
						}
					%>
				</tbody>
			</table>
			<!-- 页数目录 -->
			<table border="0" align="center">
				<tr>
					<td>第<%=pages%>页 共<%=totalpages%>页 <a href="Data_management.jsp?pages=1">首页</a></td>
					<td><a href="Data_management.jsp?pages=<%=(pages < 1) ? pages : (pages - 1)%>">
							上一页</a></td>
					<td><a
						href="Data_management.jsp?pages=<%=(pages >= totalpages) ? totalpages : (pages + 1)%>">
							下一页</a></td>
					<td><a href="Data_management.jsp?pages=<%=totalpages%>">最后一页</a></td>
					<td>转到第:<input type="text" name="page" size="8">页<input
						type="submit" value="GO" name="cndok"></td>
				</tr>
			</table>

		</form>
	</div>
	<br />
	<br />
	<br />
	<script src="./lib/layui/layui.js" charset="utf-8"></script>
	<script src="./js/x-layui.js" charset="utf-8"></script>

	<script src="js/jquery2.js" charset="utf-8"></script>
	<script src="js/js.js" charset="utf-8"></script>
	<script>
		layui.use([ 'element', 'laypage', 'layer', 'form' ], function() {
			$ = layui.jquery;//jquery
			lement = layui.element();//面包导航
			laypage = layui.laypage;//分页
			layer = layui.layer;//弹出层
			form = layui.form();//弹出层
		});
		// 编辑
		
		function user_management_look(title, url,  w, h,id){
			url=url+"?result_id="+id;//在url中写入id参数，向下个页面传递参数
			x_admin_show(title, url, w, h);
		}
		 function delete_do()//点击删除按钮时，跳转页面
         {
        
         var form=document.getElementById("Myform");
         form.action="Data-management-delete.do";
         form.submit();
         alert("删除成功！");
         }
		 function daochu_do()//点击删除按钮时，跳转页面
         {
        
         var form=document.getElementById("Myform");
         form.action="Data-management-daochu.do";
         form.submit();
         alert("excel文件已导出到桌面！");
         }
	</script>
	<script type="text/javascript">
		$('.tablelist tbody tr:odd').addClass('odd');
	</script>
</body>
</html>