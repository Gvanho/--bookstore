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
    
    <title>用户修改头像处理页面</title>
    
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
    	
    	String username = (String)session.getAttribute("username");
    	String pic = request.getParameter("imagepath");
    	String pic1 = pic.substring(12);
    	
    	username = new String(username.getBytes("ISO-8859-1"),"utf-8");
    	pic = new String(pic.getBytes("ISO-8859-1"),"utf-8");
    	
    	String sql = "update user set pic=? where username=?";
    	String sq[] = {pic1,username};
    	db.update(sql,sq);
    	db.close();
    	
    %>
    <script type="text/javascript">
     	alert('修改成功！');
     	window.location.href='my.jsp';
     </script>
  </body>
</html>
