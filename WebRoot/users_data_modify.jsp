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
    
    <title>用户修改资料提交页面</title>
    
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
    	String gender = request.getParameter("gender");
    	String email = request.getParameter("email");
    	String tel = request.getParameter("tel");
    	String introduce = request.getParameter("introduce");
    	
    	username = new String(username.getBytes("ISO-8859-1"),"utf-8");
       	gender = new String(gender.getBytes("ISO-8859-1"),"utf-8");
       	email = new String(email.getBytes("ISO-8859-1"),"utf-8");
       	tel = new String(tel.getBytes("ISO-8859-1"),"utf-8");
       	introduce = new String(introduce.getBytes("ISO-8859-1"),"utf-8");
       	
       	String sql = "update user set gender=?,email=?,telephone=?,introduce=? where username=?";
       	String sq[] = {gender,email,tel,introduce,username};
       	db.update(sql,sq);
       	db.close();
    %>
    <script type="text/javascript">
     	alert('修改成功！');
     	window.location.href='my.jsp';
     </script>
  </body>
</html>
