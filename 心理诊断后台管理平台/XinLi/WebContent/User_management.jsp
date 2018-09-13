<%@page import="dao.*"%>
<%@page import="model.*"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>用户管理</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="format-detection" content="telephone=no">
<link rel="stylesheet" href="./css/x-admin.css" media="all">
<link rel="stylesheet" href="css/pag.css" media="all">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
UserDaoImpl userDao=new UserDaoImpl();
List<User> users;
//查询条件
String seek[]=new String[1];//搜索条件
seek[0]=request.getParameter("user_type2");
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
count=userDao.load_couts();
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
	users=userDao.load_users(limit, pages);
}else{
	users=userDao.load_users(seek, limit, pages);
}

User loginUser=(User)session.getAttribute("login_user");

%>
<div class="x-nav">
		<span class="layui-breadcrumb"> <a><cite>首页</cite></a> <a><cite>用户管理</cite></a>
		</span> <a class="layui-btn layui-btn-small"
			style="line-height: 1.6em; margin-top: 3px; float: right"
			href="javascript:location.replace(location.href);" title="刷新"><i
			class="layui-icon" style="line-height: 30px">ဂ</i></a>
	</div>
	<div class="x-body">
		<form class="layui-form x-center" action="User_management.jsp" style="width: 500px" method="post">
			<div class="layui-form-pane">
				<div class="layui-form-item">
					<div class="layui-input-inline" style="width: 400px">
						<input type="text" name="user_type2" placeholder="输入用户角色"
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
		<form  action="User_management.jsp" id="Myform" method="post">
		<div class="tools">
			<ul class="toolbar">
			<%
			if(loginUser.getUser_type().equals("超级管理员")){
			%>
				<li><span><img src="images/t03.png" /></span>
			<input type="submit" onclick="delete_do()" value="批量删除" style="background-color:transparent;border: 0px solid transparent;margin-top:7px;" ></li>
			<%} %>
				<li
					onclick="user_management_add('添加用户','user_management_add.jsp','600','500')"><span><img
						src="images/t01.png" /></span>添加</li>
				
			</ul>
			<span class="x-right" style="line-height: 25px">共有数据：<%=count %> 条</span>
			</xblock>
		</div>
		<table class="tablelist">
			<thead>
				<tr>
					<th><input onclick="selectAll()" type="checkbox"
						name="controlAll" style="" id="controlAll"></th>
					<th>ID</th>
					<th>用户名</th>
					<th>密码</th>
					<th>用户角色</th>
					<th>性别</th>
					<th>注册时间</th>
					<th>状态</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<%
		
	    for(User user:users){
	    
		%>
			<tr>
				<td><input type="checkbox" value="<%=user.getUser_id()%>" name="selected"></td>
				<td><%=user.getUser_id()%></td>
				<td><%=user.getUsername()%></td>
				<td><%=user.getPassword() %></td>
				<td><%=user.getUser_type()%></td>
				<td><%=user.getSex() %></td>
				<td><%=user.getWrite_time() %></td>
				<td><button class="sp">已启用</button></td>
				<td>
				<%
				if((user.getUser_type().equals("超级管理员"))&&(loginUser.getUser_type().equals("管理员"))){
				%><% 
				}
				else{	
				%>
				<span
				onclick="user_management_password('修改密码','user_management_password.jsp','600','400','<%=user.getUser_id()%>')"/><span><img
					src="images/t02.png" /></span>修改密码</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			
			<span><img src="images/07.png" /></span>
			<input type="submit" onclick="delete_do2(<%=user.getUser_id() %>)" value="删除" style="background-color:transparent;border: 0px solid transparent;margin-top:7px;" >		
			<% }%>
			</td>
			</tr>
			<%} %>
			</tbody>
		</table>
		</form>
		<table border="0" align="center" >
                <tr>
                    <td>第<%=pages%>页 共<%=totalpages%>页 <a href="User_management.jsp?pages=1">首页</a></td>
                    <td><a href="User_management.jsp?pages=<%=(pages<1)?pages:(pages-1) %>"> 上一页</a></td>
                    <td><a href="User_management.jsp?pages=<%=(pages>=totalpages)?totalpages:(pages+1)%>"> 下一页</a></td>
                    <td><a href="User_management.jsp?pages=<%=totalpages%>">最后一页</a></td>
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
              lement = layui.element();//面包导航
              laypage = layui.laypage;//分页
              layer = layui.layer;//弹出层

            });
            
            /*密码-修改*/
            function user_management_password(title,url,w,h,id){
            	url=url+"?user_id="+id;//在url中写入id参数，向下个页面传递参数
                x_admin_show(title,url,w,h);  
            }

             /*用户-添加*/
            function user_management_add(title,url,w,h){
                x_admin_show(title,url,w,h);
            }
            /*用户-查看*/
            function user_management_show(title,url,id,w,h){
                x_admin_show(title,url,w,h);
            }

             /*用户-停用*/
            function member_stop(obj,id){
                layer.confirm('确认要停用吗？',function(index){
                    //发异步把用户状态进行更改
                    $(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="member_start(this,id)" href="javascript:;" title="启用"><i class="layui-icon">&#xe62f;</i></a>');
                    $(obj).parents("tr").find(".td-status").html('<button class="sp3">已停用</button>');
                    $(obj).remove();
                    layer.msg('已停用!',{icon: 5,time:1000});
                });
            }

            /*用户-启用*/
            function member_start(obj,id){
                layer.confirm('确认要启用吗？',function(index){
                    //发异步把用户状态进行更改
                    $(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="member_stop(this,id)" href="javascript:;" title="停用"><i class="layui-icon">&#xe601;</i></a>');
                    $(obj).parents("tr").find(".td-status").html('<button class="sp">已启用</button>');
                    $(obj).remove();
                    layer.msg('已启用!',{icon: 6,time:1000});
                });
            }
          
            /*添加*/
            function home_add(title,url,w,h){
                x_admin_show(title,url,w,h);
            }
           
            // 用户-编辑
            function user_management_edit (title,url,w,h,id) {
            	url=url+"?user_id="+id;//在url中写入id参数，向下个页面传递参数
                x_admin_show(title,url,w,h); 
              
            }
            function delete_do()//点击删除按钮时，跳转页面
            { 
           
            var form=document.getElementById("Myform");
            form.action="user-management-delete.do";
            form.submit();
          /*   alert("删除成功！"); */
            }
            function delete_do2(id)//点击删除按钮时，跳转页面
            { 
            
            var form=document.getElementById("Myform");
            form.action="user-management-delete2.do?user_id="+id;
            form.submit();
            /* alert("删除成功！"); */
            }
           
	$('.tablelist tbody tr:odd').addClass('odd');
            </script>
</body>
</html>