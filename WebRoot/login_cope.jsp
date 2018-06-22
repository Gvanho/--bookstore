<%@page import="javassist.bytecode.stackmap.BasicBlock.Catch"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<jsp:useBean id="db" class="com.bookstore.db.DBHelper" />
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'login_cope.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <%
    String username = request.getParameter("username");
	String password = request.getParameter("password");
	
	
	username=new String(username.getBytes("ISO-8859-1"),"utf-8");
   	password=new String(password.getBytes("ISO-8859-1"),"utf-8");
   	
   	
   	String sql = "select username,password,role from user where username=? and password=?";
   	String sq[] = {username,password};
   	ResultSet rs = db.query(sql, sq);
	if(!rs.next()){
	%>
	<script type="text/javascript">alert('用户名或密码错误！');</script>
	<% 
		response.sendRedirect("login.jsp");
	}else{
		if(rs.getString("username").equals("admin") && rs.getString("role").equals("admin")){
			session.setAttribute("username", username);
	%>
			<script type="text/javascript">alert('欢迎您，管理员！');window.location.href='manager.jsp';</script>		
	<% 
		}else{
			session.setAttribute("username", username);
	%>	
			<script type="text/javascript">alert('登陆成功！');window.location.href='index.jsp';</script>
	<% 
		}
	}
		
	%>
	

  </body>
</html>
