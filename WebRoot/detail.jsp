<%@page import="com.bookstore.main.Book"%>
<%@ page language="java" import="java.util.*"%>
<%@ page language="java" import="java.sql.*"%>
<jsp:useBean id="db" class="com.bookstore.db.DBHelper" />
<%@ page language="java" contentType="text/html; charset=UTF-8"
%>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>商品详情</title>
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
		width: 150px;
	}
    .num{
		width: 50px;
		border-width: 1px 0;
		font: 14px Arial;  /* 使输入框的字体与动画元素的字体一样，达到重合效果 */
	}
    .num-span{  /* 动画元素的类，样式设计成与输入框重合并对齐 */
		position: absolute;
		left: 24px;
		width: 50px;
		height: 40px;  /* 两行：20px*2 */
		border: 1px solid transparent;
		border-width: 1px 0;
		padding: 1px;
		font: 14px Arial;  /* 与.num的字体一样 */
		line-height: 20px;
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

<%
Book book=(Book)session.getAttribute("book");
%>
<div class="container" id="container">
      <div class="row">
        <div class="col-md-3"><img src="img/<%=book.getImgurl() %>" style="width: 400px;height: 300px;" class="img-thumbnail" alt="Responsive image"></div>
        <div class="col-md-9">
          
          <form action="cart.jsp" method="post">
          <div class="col-md-7 col-md-offset-2" id="AA">
            <div class="">
            	<h2><font color="#FF4400"><b>书籍名称：<%=book.getBooks_name() %></b></font></h2>
              	<h2><font color="#FF4400"><b>价格：￥<%=book.getPrice() %></b></font></h2>
              	<h2><font color="#FF4400"><b>类别：<%=book.getCatagory() %></b></font></h2>
              	<h2><font color="#FF4400"><b>库存：<%=book.getPnum() %></b></font></h2>
              	<h2><font color="#FF4400"><b>数量：</b></font></h2>
             <div class="numinput">
				<a class="decrease btn btn-default" href="javascript:void(0);">-</a>
				<input class="num" type="text" name="num" value="1">
				<a class="increase btn btn-default" href="javascript:void(0);">+</a>
			</div>
            </div><br/><br/><br/>
            <!-- <a class="btn btn-primary" href="cart.jsp" role="button">添加到购物车</a> -->
            <input type="submit" class="btn btn-primary" value="添加到购物车"> 
            <a class="btn btn-default" href="index.jsp" role="button">返回首页</a>
            </form>
          </div>
          
        <div class="col-md-1"></div>
      </div>
    </div>

  </div>
<div style="text-align:right;font-size:36px;">

    
</div>
</body>
</html>
<script>
	$(document).ready(function(){
		

		// 数量递增、递减
		$('.numinput a').on('click',function(){
			// 如果有动画正在进行，则取消点击
			if($(this).siblings(':animated').length > 0){ 
				return false;
			}
			var num = $(this).siblings('.num').val();
			if( $(this).is('.decrease') && num > 1 ){
				num--;
				move('down', num, $(this).parent());  // 调用动画函数
			}else if( $(this).is('.increase') && num < 10 ){
				num++;
				move('up', num, $(this).parent());
			}
			calc();
		});

		/**
		 * 增减动画
		 * @param  {String} direction 移动方向：'up'和'down'
		 * @param  {Number} toNumber  动画结束时输入框的数字
		 * @param  {jQuery Object} cur_input 当前输入框
		 */
		function move( direction, toNumber, cur_input ){
			var spanContent,  // 临时的动画元素的内容
				from,		  // 开始位置
				to;			  // 结束位置
			if(direction == 'up'){  // 向上移动
				spanContent = (toNumber-1) + '<br>' + toNumber;  // 动画元素的内容
				from = '0px';
				to = '-=20';
			}else if(direction == 'down'){
				spanContent = toNumber + '<br>' + (toNumber+1);
				from = '-20px';
				to = '+=20';
			}
			cur_input.children('.num').css('color','transparent');  // 动画开始前，先把输入框文字颜色设为透明
			$('<span>')                  // 生成动画元素
				.html(spanContent)       // 填充内容
				.addClass('num-span')    // 添加样式
				.css('top', from)        // 设置开始位置
				.appendTo(cur_input)     // 把生成好的元素加入文档
				.animate({               // 动画
					top: to              // 设置top样式终态
				},function(){
					$(this).remove();    // 动画结束后把动画元素自身移除
					cur_input.children('.num').val(toNumber).css('color','');  // 输入框文字颜色恢复原来的颜色
				});
		}

		// 计算总数、总价
		function calc(){
			var count = 0;  // 总数
			var sum = 0;    // 小计
			var total = 0;  // 总价

			var items = $('.item');
			for(var i=0; i<items.length; i++){
				var item = items.eq(i);  // 每一项
				var price = item.find('.price').text();
				var num = item.find('.num').val() - 0;
				sum = price * num;
				item.find('.sum').text(sum.toFixed(1));  // 四舍五入到小数点后两位
				count += num;
				total += sum;

			}
			$('.count').text(count);
			$('.total').text("￥"+total.toFixed(1));
			
		}

		
		// 检测用户手动输入的数量
		$('.num')
			.on('keypress',function(e){
				if(e.which < 48 || e.which > 57){  // 如果不是数字
					e.preventDefault();
				}
			})
			.on('change',function(){
				var value = $(this).val();
				if(value < 1){
					$(this).val(1);
				}else if(value > 10){
					$(this).val(10);
				}else{
					$(this).val(value - 0);  // 可去除数字前面多余的0
				}
				calc();
			});

	});
</script>