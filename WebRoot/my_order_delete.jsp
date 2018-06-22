<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<jsp:useBean id="db" class="com.bookstore.db.DBHelper" scope="session"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>我的订单删除处理页面</title>
    
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
    	String orders_id = request.getParameter("id");
    	String sql = "delete from orders where id=?";
    	String sq[] = {orders_id};
    	db.update(sql, sq);
    	db.close();
    %>
    <script>alert('删除成功！');
 	window.location.href='my_order.jsp';</script>
  </body>
</html>
