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
    
    <title>注册处理页面</title>
    
	<meta charset="utf-8">
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
    	Object date = new Date();
    	String regdate = date.toString();
    	String username = request.getParameter("username");
    	String password = request.getParameter("password");
    	//String gender = request.getParameter("gender");
    	String email = request.getParameter("email");
    	String telephone = request.getParameter("tel");
    	String introduce = request.getParameter("introduce");
    	
    	username=new String(username.getBytes("ISO-8859-1"),"utf-8");
       	password=new String(password.getBytes("ISO-8859-1"),"utf-8");
       	email=new String(email.getBytes("ISO-8859-1"),"utf-8");
       	telephone=new String(telephone.getBytes("ISO-8859-1"),"utf-8");
       	introduce = new String(introduce.getBytes("ISO-8859-1"),"utf-8");
       	      	     	
    	
       	String sql = "insert into user(username,password,email,telephone,introduce,registTime) values(?,?,?,?,?,?)";
    	String sq[] = {username,password,email,telephone,introduce,regdate};
    	db.update(sql,sq);
    	db.close();
     %>
     <script type="text/javascript">
     	alert('注册成功！');
     	window.location.href='login.jsp';
     </script>
     
  </body>
</html>
