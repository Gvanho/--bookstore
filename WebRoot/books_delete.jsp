<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.bookstore.main.Book"%>
<jsp:useBean id="db" class="com.bookstore.db.DBHelper" scope="session"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>书籍删除处理页面</title>
    
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
    	String books_id = request.getParameter("id");
    	String sql = "delete from product where id=?";
    	String sq[] = {books_id};
    	db.update(sql, sq);
    	db.close();
    %>
    <script>alert('删除成功！');
 	window.location.href='manager.jsp';</script>
    
  </body>
</html>
