<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<jsp:useBean id="db" class="com.bookstore.db.DBHelper" scope="session"/>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>我的订单</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
  </head>
  <style type="text/css">
    body,html{
      height: 100%;
      width: 100%;
    }
    #container{
      position: relative;
      min-height: 100%;
      width: 100%;
    }
    div.panel-footer{
      position: relative;
      text-align: center;
      background-color: #9cf;
      bottom: 0;
    }
   #AA div{
    position: relative;
    transform: translateX(20%);
   }
  </style>
  <body>
    <nav class="navbar navbar-default" id="navbar">
      <div class="container-fluid">
      <!-- Brand and toggle get grouped for better mobile display -->
      <div class="navbar-header">
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
          <span class="sr-only">Toggle navigation</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand glyphicon glyphicon-th" href="index.jsp">Book</a>
      </div>

      <!-- Collect the nav links, forms, and other content for toggling -->
      <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
        <ul class="nav navbar-nav">
          <li><a href="books_category.jsp?type=文学类">文学</a></li>
	        <li><a href="books_category.jsp?type=生活类">生活</a></li>
	         <li><a href="books_category.jsp?type=科学类">科学</a></li>
          <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">风格<span class="caret"></span></a>
            <ul class="dropdown-menu">
              <li><a href="#">小说</a></li>
              <li><a href="#">哲学</a></li>
              <li><a href="#">青春文学</a></li>
              <li role="separator" class="divider"></li>
              <li><a href="#">管理</a></li>
              <li role="separator" class="divider"></li>
              <li><a href="#">经济</a></li>
              <li><a href="#">成功励志</a></li>
              <li><a href="#">投资理财</a></li>
              <li><a href="#">亲子家教</a></li>
              <li role="separator" class="divider"></li>
              <li><a href="#">历史</a></li>
            </ul>
          </li>
        </ul>
        <form class="navbar-form navbar-left" method="POST" action="book_search_result.jsp">
	        <div class="form-group">
	          <input type="text" class="form-control" placeholder="请输入关键字" name="books_name_search">
          </div>
          <button type="submit" class="btn btn-default">搜索</button>
        </form>
        <ul class="nav navbar-nav navbar-right">
          <li><a class="glyphicon glyphicon-shopping-cart" href="docart.jsp">购物车</a></li>
	        <li><a href="my_order.jsp">我的订单</a></li>
          <li class="dropdown">
            <a href="#" class="dropdown-toggle glyphicon " data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
	          <%  if(session.getAttribute("username") == null){  %>
	          <img src="img/default.png" class="img-circle" style="width: 30px; height: 30px;">
	          &nbsp;<%=session.getAttribute("username") %>
	          <% } %>
	          <%
	          	String user = (String)session.getAttribute("username");
	    		String tsql = "select pic from user where username=?";
          		String tsq[] = {user};
          		ResultSet trs = db.query(tsql,tsq);
          		while(trs.next()){
	          %>
	          <% if(session.getAttribute("username") != null){ %>
	          <img src="img/<%=trs.getString("pic") %>" class="img-circle" style="width: 30px; height: 30px;">
	          &nbsp;<%=session.getAttribute("username") %>
	          <% }  } db.close(); %>
	          </a>
            <ul class="dropdown-menu">
	          	<% if(session.getAttribute("username") == null){ %>
	            <li><a href="login.jsp">登录</a></li>
	            <li><a href="register.jsp">注册</a></li>
	            <% } %>
	            <% if(session.getAttribute("username") != null && !session.getAttribute("username").equals("admin")){ %>
	           	<li><a href="${pageContext.request.contextPath}/Logout">注销</a></li>
	            <li><a href="my.jsp">用户中心</a></li>
	          	<% } %>
	          	<% if(session.getAttribute("username") != null && session.getAttribute("username").equals("admin")){ %>
	            <li><a href="${pageContext.request.contextPath}/Logout">注销</a></li>
	            <li><a href="manager.jsp">后台管理系统</a></li>
	            <% } %>
	        </ul>
          </li>
        </ul>
      </div><!-- /.navbar-collapse -->
      </div><!-- /.container-fluid -->
    </nav>
    <div class="container" id="container">
      <div class="row">
        <div class="col-md-1"></div>
        <div class="col-md-10">
          <div class="col-md">
          <img src="img/9357af2b9722e94.jpg" width="1200px" height="120px">
          </div>
          <h3>我的订单</h3><hr>
          <table border="1" class="table table-bordered table-hover">
                	<tr class="active">
              			<th>订单号</th>
              			<th>订单用户</th>
              			<th>收件人姓名</th>
              			<th>收件人地址</th>
              			<th>电话</th>
              			<th>购买时间</th>
              			<th>操作</th>
              		</tr>
                <% 
                	String username = (String)session.getAttribute("username");
                	String sql = "select id,user_id,receiverName,receiverAddress,receiverPhone,ordertime from orders where user_id=?";
                	String sq[] = {username};
            		ResultSet rs = db.query(sql,sq);
                    while(rs.next()){
                %>
                	<tr>
                		<td><%=rs.getString("id") %></td>
                		<td><%=rs.getString("user_id") %></td>
                		<td><%=rs.getString("receiverName") %></td>
                		<td><%=rs.getString("receiverAddress") %></td>
                		<td><%=rs.getString("receiverPhone") %></td>
                		<td><%=rs.getString("ordertime") %></td>
                		<td><a class="btn btn-danger" href="my_order_delete.jsp?id=<%=rs.getString("id") %>" role="button">删除</a></td>
                	</tr>
                	
                <% } db.close();  %>
                </table>
      </div>
    </div>
  </div>
    <div class="panel-footer">版权：JDXN YYRS     Gvanho</div>

    <script src="js/jquery-3.2.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
  </body>
</html>