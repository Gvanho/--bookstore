<%@page import="com.google.common.collect.Multiset.Entry"%>
<%@page import="com.bookstore.main.CartItem"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="com.bookstore.main.BookServiceTemp"%>
<%@page import="com.bookstore.main.Book"%>
<%@ page language="java" import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="db" class="com.bookstore.db.DBHelper" />
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>购物车</title>
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
    .numinput{
		text-align: center;
		position: relative;  /* 父容器相对定位 */
		overflow: hidden;  /* 溢出隐藏 */
		width: 40px;
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
		
			
						
<table width="100%" align="center" border="1px" class="table table-bordered table-hover">
    <tr>
        <th>书本编号</th>
        <th>书本名称</th>
        <th>书本单价</th>
        <th>书本数量</th>
        <th>书本小计</th>
    </tr>
    <%	
    	try{
        //1:将添加到购物车里面的物品显示出来
         Map<Integer,CartItem> map=(Map<Integer,CartItem>)session.getAttribute("cart");
        //2:将购物车里面的内容遍历出来
        double count=0;//显示出总价格
        for(Map.Entry<Integer,CartItem> entry : map.entrySet()){
            //计算出每一样的书籍一共花了多少钱
            double prices=entry.getValue().getBook().getPrice() * entry.getValue().getNumber();    
            //计算出一共花了多少钱
            count+=prices;
    %>
    <tr align="center">
        <td><%=entry.getKey() %></td>
        <td><a href="dobook.jsp?id=<%=entry.getKey() %>" style="text-decoration: none"><%=entry.getValue().getBook().getBooks_name() %></a></td>
        <td><%=entry.getValue().getBook().getPrice() %></td>
        <td><%=entry.getValue().getNumber() %></td>
        <td>￥<%=entry.getValue().getBook().getPrice() * entry.getValue().getNumber()%></td>
        
    </tr>
    <% 
    /* Integer bookid = entry.getKey();
    Integer num = entry.getValue().getNumber();
    String books_id = bookid.toString();
    String nums = num.toString();
    session.setAttribute("books_id", books_id);
    session.setAttribute("nums", nums); */
        } 
    	
    %>
    <tr>
        <td colspan="4" align="right">价格总计</td>
        <td>￥<%=count %></td>
    </tr>
    <% }catch(Exception e){
    	
    }    	%>
    
</table>
<% if(session.getAttribute("username") != null && session.getAttribute("cart") != null){ %>
<div class="col-md-10 col-md-offset-10"><a class="btn btn-primary" href="users_address.jsp" role="button">提交订单</a>
<a class="btn btn-danger" href="docart_delete.jsp?cart1" role="button">清空购物车</a></div> 
<% } %> 

</body>
</html>


