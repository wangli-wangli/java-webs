
<%@page import="Util.UserException"%>
<%@page import="dao.UserDaoImpl"%>
<%@page import="model.User"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
    //获取客户端传递过来的参数
    String user_name=request.getParameter("user_name");
    String password=request.getParameter("password");
    UserDaoImpl userDao=new UserDaoImpl();
    try{ 	
    User user=userDao.load_username(user_name);
    session.setAttribute("login_user", user);
 
    boolean is=false;
   if(user==null)   
   {
	   is=false;
   }
   else{
	   if(password.equals(user.getPassword()))
	   {
		   is=true;
		   
	   } 
   }
   if(is==false)
   {
	   session.setAttribute("error", "密码或用户名错误");
	   %>
<<jsp:forward page="login_input.jsp"></jsp:forward>
<%
	   
   }  
    }catch(UserException e){
    	//验证出错
    	request.setAttribute("loginError", e.getMessage());
    %>
<<jsp:forward page="login_input.jsp"></jsp:forward>
<%
    }
    %>
无错！
<%
    response.sendRedirect("index.html");
%>