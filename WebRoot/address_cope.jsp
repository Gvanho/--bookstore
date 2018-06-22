<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<jsp:useBean id="db1" class="com.bookstore.db.DBHelper" scope="session"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>提交地址处理</title>
    
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
    	//String product_id = (String)session.getAttribute("books_id");
    	//String nums = (String)session.getAttribute("nums");
    	String username = (String)session.getAttribute("username");
    	Object time = System.currentTimeMillis();
    	Object date = new Date();
    	String orderdate = date.toString();
    	String orderid = time.toString();
    	session.setAttribute("orderid", orderid);
    	String recname = request.getParameter("g_name");
    	String address = request.getParameter("g_address");
    	String tel = request.getParameter("g_tel");
    	
    	recname=new String(recname.getBytes("ISO-8859-1"),"utf-8");
    	address=new String(address.getBytes("ISO-8859-1"),"utf-8");
    	tel=new String(tel.getBytes("ISO-8859-1"),"utf-8");
    	
    	String sql1 = "insert into orders(id,receiverAddress,receiverName,receiverPhone,ordertime,user_id) values(?,?,?,?,?,?)";
    	String sq1[] = {orderid,address,recname,tel,orderdate,username};
    	//String sql2 = "insert into orderitem(order_id,product_id,buynum) values(?,?,?)"; 
    	//String sq2[] =  {orderid,product_id,nums};
    	db1.update(sql1, sq1);
    	//db1.update(sql2, sq2);
    	db1.close();
    	
  	%>
    <script type="text/javascript">alert('提交成功！');</script>
    <% 
    	response.sendRedirect("order_success.jsp");
    %>
  </body>
</html>
