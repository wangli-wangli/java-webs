<%@page import="model.*"%>
<%@page import="dao.*"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>首页</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="format-detection" content="telephone=no">
<link rel="stylesheet" href="./css/x-admin.css" media="all">
<link rel="stylesheet" href="css/pag.css" media="all">
<link rel="stylesheet" href="css/pag.css" media="all">

</head>
<body>
<%
webDaoImpl webDao=new webDaoImpl();
List<web> webs;
//查询条件
String seek[]=new String[1];//搜索条件
seek[0]=request.getParameter("web_character");
boolean is=false;
if(seek[0]==null){
	is=false;
}else{
		 if(!(seek[0].equals(""))){
			is=true;
		 }		
}
//分页
int pages=0;            //待显示页面
int count=0;            //总条数
int totalpages=0;        //总页数
int limit=10;            //每页显示记录条数 
count=webDao.load_couts();
//由记录总数除以每页记录数得出总页数
totalpages = (int)Math.ceil(count/(limit*1.0));
//获取跳页时传进来的当前页面参数
String strPage = request.getParameter("pages");
//判断当前页面参数的合法性并处理非法页号（为空则显示第一页，小于0则显示第一页，大于总页数则显示最后一页）
if (strPage == null) { 
    pages = 1;
} else {
    try{
        pages = java.lang.Integer.parseInt(strPage);
    }catch(Exception e){
        pages = 1;
    }
    
    if (pages < 1){
        pages = 1;
    }
    
    if (pages > totalpages){
        pages = totalpages;
    }                            
}

if(is==false){//没输入搜索条件
	webs=webDao.load_webs(limit, pages);
}else{
	webs=webDao.seek_webs(seek, limit, pages);
}
%>
<div class="x-nav">
		<span class="layui-breadcrumb"> <a><cite>首页</cite></a> <a><cite>网站信息管理</cite></a>
			<a><cite>首页</cite></a>
		</span> <a class="layui-btn layui-btn-small"
			style="line-height: 1.6em; margin-top: 3px; float: right"
			href="javascript:location.replace(location.href);" title="刷新"><i
			class="layui-icon" style="line-height: 30px">ဂ</i></a>
	</div>
	<div class="x-body">
		<form class="layui-form x-center" action="" style="width: 500px" method="post">
			<div class="layui-form-pane">
				<div class="layui-form-item">
					<div class="layui-input-inline" style="width: 400px">
						<input type="text" name="web_character" placeholder="输入内容关键字或模块"
							autocomplete="off" class="layui-input">
					</div>
					
					<div class="layui-input-inline" style="width: 80px">
						<button class="layui-btn" lay-submit="" lay-filter="sreach">
							<i class="layui-icon">&#xe615;</i>
						</button>
					</div>
				</div>
			</div>
		</form>
		 <form id="Myform" name="Myform" action="Home.jsp" method="post" onSubmit="return checknum()">
		<div class="tools">
			<ul class="toolbar">
				<li><span><img src="images/t03.png" /></span>
			<input type="submit" onclick="delete_do()" value="批量删除" style="background-color:transparent;border: 0px solid transparent;margin-top:7px;" ></li>
				<li onclick="home_add('添加用户','home_add.html','600','500')"><span><img
						src="images/t01.png" /></span>添加</li>
			</ul>
			<span class="x-right" style="line-height: 25px">共<%=count %>条数据</span>
			</xblock>
		</div>
		<table class="tablelist">
			<thead>
				<tr>
					<th width="5%"><input onclick="selectAll()" type="checkbox"
						name="controlAll" style="" id="controlAll"></th>
					<th width="5%">序号</th>
					<th width="9%">模块</th>
					<th width="5%">标题</th>
					<th width="8%">图片</th>
					<th width="9%">上传时间</th>
					<th width="30%">内容</th>
					<th width="9%">显示状态</th>
					<th width="20%">操作</th>
				</tr>
			</thead>
			<tbody id="x-img">
				<%
		
	    for(web web:webs){
		%>
			<tr>
				<td><input type="checkbox" value="<%=web.getWeb_id()%>" name="selected"></td>
				<td><%=web.getWeb_id() %></td>
				<td><%=web.getWeb_type()%></td>
				<td><%=web.getWeb_title() %></td>
				<td><img src="<%=web.getWeb_picture() %>" height="50" width="50"/></td>
				<td><%=web.getWrite_time() %></td>
				<td><%=web.getWeb_character() %></td>
				<td> <button class="sp">已上传</button></td>
				<td><span
				onclick="user_management_edit('用户编辑','home_edit.jsp','600','500','<%=web.getWeb_id()%>')"/><span><img
					src="images/t02.png" /></span>编辑</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			
			<span><img src="images/07.png" /></span>
			<input type="submit" onclick="delete_do2(<%=web.getWeb_id() %>)" value="删除" style="background-color:transparent;border: 0px solid transparent;margin-top:7px;" >		
			</td>
			</tr>
			<%} %>
			</tbody>
		</table>
		<!-- 页数目录 -->
    <table border="0" align="center" >
                <tr>
                    <td>第<%=pages%>页 共<%=totalpages%>页 <a href="Home.jsp?pages=1">首页</a></td>
                    <td><a href="Home.jsp?pages=<%=(pages<1)?pages:(pages-1) %>"> 上一页</a></td>
                    <td><a href="Home.jsp?pages=<%=(pages>=totalpages)?totalpages:(pages+1)%>"> 下一页</a></td>
                    <td><a href="Home.jsp?pages=<%=totalpages%>">最后一页</a></td>
                    <td>转到第:<input type="text" name="page" size="8">页<input type="submit" value="GO" name="cndok"></td>
                </tr>
    </table> 
	</div>
	<br />
	<br />
	<br />
	<script src="./lib/layui/layui.js" charset="utf-8"></script>
	<script src="./js/x-layui.js" charset="utf-8"></script>
	<script src="js/jquery2.js" charset="utf-8"></script>
	<script src="js/js.js" charset="utf-8"></script>
	<script>
            layui.use(['laydate','element','laypage','layer'], function(){
                $ = layui.jquery;//jquery
              laydate = layui.laydate;//日期插件
              lement = layui.element();//面包导航
              laypage = layui.laypage;//分页
              layer = layui.layer;//弹出层
            });

            
             /*添加*/
            function home_add(title,url,w,h){
                x_admin_show(title,url,w,h);
            }
           
            // 用户-编辑
            function user_management_edit (title,url,w,h,id) {
            	url=url+"?web_id="+id;//在url中写入id参数，向下个页面传递参数
                x_admin_show(title,url,w,h); 
              
            }
            function delete_do()//点击删除按钮时，跳转页面
            { 
            var form=document.getElementById("Myform");
            form.action="home-delete.do";
            form.submit();
            alert("删除成功！");
            }
            function delete_do2(id)//点击删除按钮时，跳转页面
            { 
            var form=document.getElementById("Myform");
            form.action="home-delete2.do?web_id="+id;
            form.submit();
            alert("删除成功！");
            }
			$('.tablelist tbody tr:odd').addClass('odd');
            </script>

</body>
</html>