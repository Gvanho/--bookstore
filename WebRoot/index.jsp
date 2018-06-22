<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@page import="com.bookstore.main.*"%>
<%@page import="java.util.List"%>
<%@ page language="java" import="java.sql.*"%>
<jsp:useBean id="db" class="com.bookstore.db.DBHelper" />

<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>首页</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <script src="js/jquery-3.2.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
  </head>
  <style type="text/css">
  	#carousel{
  		border-width: all;
  		max-height: 100px;
  	}
  	#carousel-inner{
  		border-width: all;
  		max-height: 100px;
  	}
  	#navbar{
  		background: #9cf;
  	}
  	h3.page-header{
  		color: #00c;
  	}
  	div.panel-footer{
  		text-align: center;
			background-color: #9cf;
  	}
  	#yhzx{
  		color: #00c;
  	}
  	#nav{
  		list-style:none;
  		text-align: center;
  		margin-top: auto;
  	}
  	#p,#left{
  		text-align: center;
  	}
  	#myNav{
  		position:fixed;
  	}
  	ul.nav-tabs li.active a:hover{
        color: #fff;
        background: #0088cc;
        border: 1px solid #0088cc;
    }
    ul#nav li{
    	margin-top: 10px;
    }
    .col-lg-3 p{
    	font-size: 25px;
    	color: #FF4400;
    }
    
    .col-lg-3 a{
    	font-size: 25px;
    	color: #FF4400;
    	text-decoration: none;
    }
    .col-lg-3 a:hover{
    	color: #0088cc;
    }
  </style>
  <body data-spy="scroll" data-target="#myScrollspy">
  <!-- 导航栏 -->
  <div class="">
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
	        <button type="submit" name="submit_search" class="btn btn-default">搜索</button>
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
	

		<!-- container_middle -->
		<div id="container">
			<div class="row">
				<div class="col-lg-1" id="row_left"></div>
				<div class="col-lg-10">
					<!-- 轮播图 -->
					<div id="carousel-id" class="carousel slide" data-ride="carousel" data-interval="1500">
						<ol class="carousel-indicators hidden">
							<li data-target="#carousel-id" data-slide-to="0" class="active"></li>
							<li data-target="#carousel-id" data-slide-to="1" class=""></li>
							<li data-target="#carousel-id" data-slide-to="2" class=""></li>
							<li data-target="#carousel-id" data-slide-to="3" class=""></li>
							<li data-target="#carousel-id" data-slide-to="4" class=""></li>
						</ol>
						<div class="carousel-inner">
							<div class="item active">
								<img data-src="slide" alt="First slide" src="img/0.jpg">
								<div class="container">
									<div class="carousel-caption">
										<h1></h1>
										<p></p>	
									</div>
								</div>
							</div>
							<div class="item">
								<img data-src="slide" alt="Second slide" src="img/1.jpg">
								<div class="container">
									<div class="carousel-caption">
										<h1></h1>
										<p></p>
									</div>
								</div>
							</div>
							<div class="item">
								<img data-src="slide" alt="Third slide" src="img/2.jpg">
								<div class="container">
									<div class="carousel-caption">
										<h1></h1>
										<p></p>	
									</div>
								</div>
							</div>
							<div class="item">
								<img data-src="slide" alt="fourth slide" src="img/1.jpg">
								<div class="container">
									<div class="carousel-caption">
										<h1></h1>
										<p></p>
									</div>
								</div>
							</div>
							<div class="item">
								<img data-src="slide" alt="fivth slide" src="img/1.jpg">
								<div class="container">
									<div class="carousel-caption">
										<h1></h1>
										<p></p>
									</div>
								</div>
							</div>
						</div>
						<a class="left carousel-control" href="#carousel-id" data-slide="prev"></a>
						<a class="right carousel-control" href="#carousel-id" data-slide="next"></a>
					</div>
					<!-- 轮播图 -->
			
					<!-- 书本 -->
					<div class="" id="book">	
						<div class="row">
							<h3 class="" id="section-1">新书上架</h3><hr>
							<%
   							
    							String sql = "select * from product limit 0,4";
    							ResultSet rs = db.query(sql);
    							while(rs.next()){
							%>
  								<div class="col-sm-6 col-md-3">
    								<div class="thumbnail">
      									<img src="img/<%=rs.getString("imgurl") %>" alt="">
      									<div class="caption">      										
        									<h3><%=rs.getString("name") %></h3>
        									<p>价格：￥<%=rs.getString("price") %></p>
        									<p><a href="dobook.jsp?id=<%=rs.getString("id") %>" class="btn btn-primary" role="button">查看详情</a></p>
      									</div>
    								</div>
  								</div>
							<% } db.close();%>
						</div>
						<div class="row">
							<h3 class="" id="section-2">今日推荐</h3><hr>
								<%
   							
    							String sql1 = "select * from product LIMIT 7,4";
    							ResultSet rs1 = db.query(sql1);
    							while(rs1.next()){
							%>
  								<div class="col-sm-6 col-md-3">
    								<div class="thumbnail">
      									<img src="img/<%=rs1.getString("imgurl") %>" alt="">
      									<div class="caption">      										
        									<h3><%=rs1.getString("name") %></h3>
        									<p>价格：￥<%=rs1.getString("price") %></p>
        									<p><a href="dobook.jsp?id=<%=rs1.getString("id") %>" class="btn btn-primary" role="button">查看详情</a></p>
      									</div>
    								</div>
  								</div>
							<% } db.close();%>
							
						</div>
						<div class="row" id="section-3">
							<h3 class="">独家特供</h3><hr>
							<%
   							
    							String sql2 = "select * from product LIMIT 11,4";
    							ResultSet rs2 = db.query(sql2);
    							while(rs2.next()){
							%>
  								<div class="col-sm-6 col-md-3">
    								<div class="thumbnail">
      									<img src="img/<%=rs2.getString("imgurl") %>" alt="">
      									<div class="caption">      										
        									<h3><%=rs2.getString("name") %></h3>
        									<p>价格：￥<%=rs2.getString("price") %></p>
        									<p><a href="dobook.jsp?id=<%=rs2.getString("id") %>" class="btn btn-primary" role="button">查看详情</a></p>
      									</div>
    								</div>
  								</div>
							<% } db.close();%>
						</div>
						<div class="row" id="section-4">
							<h3 class="">免费试读</h3><hr>
							<%
   							
    							String sql3 = "select * from product limit 15,4";
    							ResultSet rs3 = db.query(sql3);
    							while(rs3.next()){
							%>
  								<div class="col-sm-6 col-md-3">
    								<div class="thumbnail">
      									<img src="img/<%=rs3.getString("imgurl") %>" alt="">
      									<div class="caption">      										
        									<h3><%=rs3.getString("name") %></h3>
        									<p>价格：￥<%=rs3.getString("price") %></p>
        									<p><a href="dobook.jsp?id=<%=rs3.getString("id") %>" class="btn btn-primary" role="button">查看详情</a></p>
      									</div>
    								</div>
  								</div>
							<% } db.close();%>
						</div>
						<div class="row" id="section-5">
							<h3 class="">热门书籍</h3><hr>
							<%
   							
    							String sql4 = "select * from product limit 19,4";
    							ResultSet rs4 = db.query(sql4);
    							while(rs4.next()){
							%>
  								<div class="col-sm-6 col-md-3">
    								<div class="thumbnail">
      									<img src="img/<%=rs4.getString("imgurl") %>" alt="">
      									<div class="caption">      										
        									<h3><%=rs4.getString("name") %></h3>
        									<p>价格：￥<%=rs4.getString("price") %></p>
        									<p><a href="dobook.jsp?id=<%=rs4.getString("id") %>" class="btn btn-primary" role="button">查看详情</a></p>
      									</div>
    								</div>
  								</div>
							<% } db.close();%>
						</div>
						<div class="row" id="section-6">
							<h3 class="">电子书</h3><hr>
							<%
   							
    							String sql5 = "select * from product limit 23,4";
    							ResultSet rs5 = db.query(sql5);
    							while(rs5.next()){
							%>
  								<div class="col-sm-6 col-md-3">
    								<div class="thumbnail">
      									<img src="img/<%=rs5.getString("imgurl") %>" alt="">
      									<div class="caption">      										
        									<h3><%=rs5.getString("name") %></h3>
        									<p>价格：￥<%=rs5.getString("price") %></p>
        									<p><a href="dobook.jsp?id=<%=rs5.getString("id") %>" class="btn btn-primary" role="button">查看详情</a></p>
      									</div>
    								</div>
  								</div>
							<% } db.close();%>
						</div>
						<div class="row" id="section-7">
							<h3 class="">本期推销</h3><hr>
							<%
   							
    							String sql6 = "select * from product limit 5,4";
    							ResultSet rs6 = db.query(sql6);
    							while(rs6.next()){
							%>
  								<div class="col-sm-6 col-md-3">
    								<div class="thumbnail">
      									<img src="img/<%=rs6.getString("imgurl") %>" alt="">
      									<div class="caption">      										
        									<h3><%=rs6.getString("name") %></h3>
        									<p>价格：￥<%=rs6.getString("price") %></p>
        									<p><a href="dobook.jsp?id=<%=rs6.getString("id") %>" class="btn btn-primary" role="button">查看详情</a></p>
      									</div>
    								</div>
  								</div>
							<% } db.close();%>
						</div>
						<div class="row" id="section-8">
							<h3 class="">网络文学</h3><hr>
							<%
   							
    							String sql7 = "select * from product limit 6,4";
    							ResultSet rs7 = db.query(sql7);
    							while(rs7.next()){
							%>
  								<div class="col-sm-6 col-md-3">
    								<div class="thumbnail">
      									<img src="img/<%=rs7.getString("imgurl") %>" alt="">
      									<div class="caption">      										
        									<h3><%=rs7.getString("name") %></h3>
        									<p>价格：￥<%=rs7.getString("price") %></p>
        									<p><a href="dobook.jsp?id=<%=rs7.getString("id") %>" class="btn btn-primary" role="button">查看详情</a></p>
      									</div>
    								</div>
  								</div>
							<% } db.close();%>
						</div>
					</div><!-- 书本 -->
				</div><!-- col-9 -->
				<div class="col-lg-1" id="myScrollspy">
				 <ul class="nav nav-tabs nav-stacked" id="myNav">
              <li class="active"><a href="#section-1">新书上架</a></li>
              <li><a href="#section-2">今日推荐</a></li>
              <li><a href="#section-3">独家特供</a></li>
              <li><a href="#section-4">免费试读</a></li>
              <li><a href="#section-5">热门书籍</a></li>
              <li><a href="#section-6">电子书</a></li>
              <li><a href="#section-7">本期推销</a></li>
              <li><a href="#section-8">网络文学</a></li>
              <li><a href="javascript:window.scrollTo( 0, 0 );" >返回顶层</li>
          </ul>
				</div>
			</div><!-- row -->
			<div class="panel-footer">版权：JDXN YYRS</div>
		</div><!-- container_middle -->
	</div><!-- container -->
    
  </body>
</html>