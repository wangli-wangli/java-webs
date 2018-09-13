
<%@page import="dao.*"%>
<%@page import="model.*"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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

</head>
<body>
<%
patientDaoImpl patientDao=new patientDaoImpl();
List<patient> patients;
//查询条件
String seek[]=new String[3];//搜索条件
seek[0]=request.getParameter("patient_name");
seek[1]=request.getParameter("patient_age");
seek[2]=request.getParameter("patient_home");
boolean is=false;
if(seek==null){
	is=false;
}else{
	for(int i=0;i<3;i++){
		if(seek[i]!=null){
		 if(!(seek[i].equals(""))){
			is=true;
		 }
		}
	}
}
//分页
int pages=0;            //待显示页面
int count=0;            //总条数
int totalpages=0;        //总页数
int limit=10;            //每页显示记录条数 
count=patientDao.load_couts();
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
	   patients=patientDao.load_patients(limit, pages);
}else{
	patients=patientDao.seek_patients(seek, limit, pages);
}
%>
<div class="x-nav">
	<span class="layui-breadcrumb"> <a><cite>首页</cite></a> <a><cite>档案管理</cite></a>
	</span> <a class="layui-btn layui-btn-small"
		style="line-height: 1.6em; margin-top: 3px; float: right"
		href="javascript:location.replace(location.href);" title="刷新"><i
		class="layui-icon" style="line-height: 30px">ဂ</i></a>
</div>
<div class="x-body"><!-- 搜索 -->
	<form class="layui-form x-center" action="Dangan.jsp" style="width: 85%" method="post">
		<div class="layui-form-pane">
			<div class="layui-form-item">
				<label class="layui-form-label">姓名</label>
				<div class="layui-input-inline" style="width: 100px">
					<input type="text" name="patient_name" placeholder="姓名" autocomplete="off"
						class="layui-input">
				</div>
				<label class="layui-form-label">年龄</label>
				<div class="layui-input-inline" style="width: 100px">
					<input type="text" name="patient_age" placeholder="年龄" autocomplete="off"
						class="layui-input">
				</div>
				<label class="layui-form-label">籍贯</label>
				<div class="layui-input-inline" style="width: 150px">
					<input type="text" name="patient_home" placeholder="籍贯"
						autocomplete="off" class="layui-input">
				</div>
				<div class="layui-input-inline" style="width: 80px">
					<button class="layui-btn" lay-submit="" lay-filter="*">搜索</button>
				</div>
			</div>
		</div>
	</form>
    <form id="Myform" name="Myform" action="Dangan.jsp" method="post" onSubmit="return checknum()">
	<div class="tools">
		<ul class="toolbar">
			<li> <span><img src="images/t03.png" /></span>
			<input type="submit" onclick="delete_do()" value="批量删除" style="background-color:transparent;border: 0px solid transparent;margin-top:7px;" > </li>
			<li onclick="user_management_add('添加用户','Dangan-add.html','1000','400')"><span><img
					src="images/t01.png" /></span>添加</li>	
		</ul>
		<span class="x-right" style="line-height: 25px">共有数据：<%=count %> 条</span>
		</xblock>
	</div>
	<table class="tablelist" id="patient_data">
		<thead>
			<tr>
				<th><input onclick="selectAll()" type="checkbox"
					name="controlAll" style="" id="controlAll"></th>
			    <th>姓名</th>
				<th>性别</th>
				<th>籍贯</th>
				<th>年龄</th>
				<th>文化程度</th>
				<th>宗教信仰</th>
				<th>联系电话</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
		<%
		
	    for(patient patient:patients){
		%>
			<tr>
				<td><input type="checkbox" value="<%=patient.getPatient_id()%>" name="selected"></td>
				<td><%=patient.getPatient_name() %></td>
				<td><%=patient.getPatient_sex()%></td>
				<td><%=patient.getPatient_home() %></td>
				<td><%=patient.getPatient_age() %></td>
				<td><%=patient.getPatient_education() %></td>
				<td><%=patient.getPatient_believe() %></td>
				<td><%=patient.getPatient_phone() %></td>
				<td><span
				onclick="user_management_edit('用户编辑','Dangan-edit.jsp','600','500','<%=patient.getPatient_id()%>')"/><span><img
					src="images/t02.png" /></span>编辑</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					
			<span
				onclick="user_management_show('用户查看','Dangan-look.jsp','600','500','<%=patient.getPatient_id()%>')"/><span><img
					src="images/t06.png" /></span>查看</span></td>
			</tr>
			<%} %>
		</tbody>
	</table>
	<!-- 页数目录 -->
    <table border="0" align="center">
                <tr>
                    <td>第<%=pages%>页 共<%=totalpages%>页 <a href="Dangan.jsp?pages=1">首页</a></td>
                    <td><a href="Dangan.jsp?pages=<%=(pages<1)?pages:(pages-1) %>"> 上一页</a></td>
                    <td><a href="Dangan.jsp?pages=<%=(pages>=totalpages)?totalpages:(pages+1)%>"> 下一页</a></td>
                    <td><a href="Dangan.jsp?pages=<%=totalpages%>">最后一页</a></td>
                    <td>转到第:<input type="text" name="page" size="8">页<input type="submit" value="GO" name="cndok"></td>
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
            layui.use(['laydate','element','laypage','layer'], function(){
                $ = layui.jquery;
              lement = layui.element();//面包导航
              laypage = layui.laypage;//分页
              layer = layui.layer;//弹出层

            });
             /*用户-添加*/
            function user_management_add(title,url,w,h){
            	 
                x_admin_show(title,url,w,h);
            }
            /*用户-查看*/
            function user_management_show(title,url,w,h,id){
            	url=url+"?patient_id="+id;//在url中写入id参数，向下个页面传递参数
                x_admin_show(title,url,w,h);
            }
            // 用户-编辑
            function user_management_edit (title,url,w,h,id) {
            	url=url+"?patient_id="+id;//在url中写入id参数，向下个页面传递参数
                x_admin_show(title,url,w,h); 
              
            }
            function delete_do()//点击删除按钮时，跳转页面
            {
           
            var form=document.getElementById("Myform");
            form.action="Dangan-delete.do";
            form.submit();
            alert("删除成功！");
            }
            </script>
<script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	</script>

</body>
</html>