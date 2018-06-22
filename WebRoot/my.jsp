<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page language="java" import="java.sql.*"%>
<jsp:useBean id="db" class="com.bookstore.db.DBHelper" />
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>个人中心</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <script src="js/jquery-3.1.1.js" type="text/javascript" charset="utf-8"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
  </head>
  <style type="text/css">
    #myTabContent{
      padding-top: 50px;
      padding-left: 50px;
    }
    .form-group{
      margin: 30px;
    }
    #add > p{
    font-weight: bold;
    padding-top: 30px;
    font-size: 20px;
    }
    .mybtn{
    width:80px;
    height:25px;
    display:inline-block;
    background-color:rgb(91,183,91);
    border:1px solid rgb(91,183,91);
    border-radius:3px;
    color:white;
    font-size:14px;
    font-family:微软雅黑;
    cursor:pointer;
    text-align:center;
    vertical-align: center;
    box-shadow:0px 0px 1px 1px rgb(91,160,91);
    }
.mybtn:hover{
    background-color:rgb(91,160,91);
    border-color:rgb(91,160,91);
    color:white;
    text-decoration:none;
    }   
.myinp{
    width:100px;
    height:30px;
    display:inline-block;
    border:1px solid rgb(209,232,250);
    border-radius:2px;
    }
    #mybutton{
    margin-left:10px;
    }
#myimg{
    width:164px;
    height:164px;
    }
  </style>
  <body>
    <div class="container">
      <div class="row">
        <div class="col-md-1"></div>
        <div class="col-md-10">
          <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
              <li class=""><a href="index.jsp">首页 <span class="sr-only">(current)</span></a></li>
              <li><a href="#"><%=session.getAttribute("username") %></a></li>
              <li><a href="${pageContext.request.contextPath}/Logout">退出</a></li>  
            </ul>
      </div><!-- /.navbar-collapse -->
          <div class="col-md-2">
            <p><b>个人空间</b></p>
            <ul id="myTab" class="nav nav-tabs nav-stacked">
                <li class="active"><a href="#add" data-toggle="tab">个人信息</a></li>
                <li><a href="#update" data-toggle="tab">完善个人资料</a></li>
                <li><a href="#delete" data-toggle="tab">修改头像</a></li>
                <li><a href="#order" data-toggle="tab">#</a></li>
               <li><a href="#data" data-toggle="tab">#</a></li>
               <li><a href="#prove" data-toggle="tab">#</a></li>
               <li><a href="#password" data-toggle="tab">#</a></li>
               <li><a href="#user_group" data-toggle="tab">#</a></li>
            </ul>
          </div>
          <div class="col-md-10">       
            <div id="myTabContent" class="tab-content">
              <div class="tab-pane fade in active" id="add">
                <%
                	String user = (String)session.getAttribute("username");
                	String sql = "select * from user where username=?";
                	String sq[] = {user};
                	ResultSet rs = db.query(sql,sq);
                	while(rs.next()){
                %>
                <p>头像：&nbsp;&nbsp;&nbsp;<img src="img/<%=rs.getString("pic") %>" class="img-circle" style="width: 80px; height: 80px;"></p>
                <p>用户名/账号：<%=rs.getString("username") %></p>
                <p>性别：<%=rs.getString("gender") %></p>
                <p>邮箱：<%=rs.getString("email") %></p>
                <p>电话：<%=rs.getString("telephone") %></p>
                <p>用户简介：<%=rs.getString("introduce") %></p>
                <p>注册时间：<%=rs.getString("registTime") %></p>
                <% } db.close(); %>
              </div>
              <div class="tab-pane fade " id="update">
                <%
                	String sql1 = "select * from user where username=?";
                	String sq1[] = {user};
            		ResultSet rs1 = db.query(sql1,sq1);
            		while(rs1.next()){
                %> 
                <form action="users_data_modify.jsp" method="post" class="form-horizontal">
                	<div class="form-group">
                		<label class="col-sm-2 control-label">用户名/账号：</label>
                		<div class="col-sm-10">
                			<input type="text" name="username" value="<%=rs1.getString("username") %>" class="form-control" readonly>
                		</div>
                	</div>
                	<div class="form-group">
                		<label class="col-sm-2 control-label">性别：</label>
                		<div class="col-sm-10 radio">
                			<input type="radio" name="gender" value="男" checked>男&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                			<input type="radio" name="gender" value="女">女
                		</div>
                	</div>
                	<div class="form-group">
                		<label class="col-sm-2 control-label">邮箱：</label>
                		<div class="col-sm-10">
                			<input type="text" name="email" value="<%=rs1.getString("email") %>" class="form-control">
                		</div>
                	</div>
                	<div class="form-group">
                		<label class="col-sm-2 control-label">手机号码：</label>
                		<div class="col-sm-10">
                			<input type="text" name="tel" value="<%=rs1.getString("telephone") %>" class="form-control">
                		</div>
                	</div>
                	<div class="form-group">
                		<label class="col-sm-2 control-label">用户简介：</label>
                		<div class="col-sm-10">
                			<input type="text" name="introduce" value="<%=rs1.getString("introduce") %>" class="form-control">
                		</div>
                	</div>
                	<input type="submit" name="submit" value="提交修改" class="btn btn-primary">
                </form>
                               
              <% } db.close(); %>
              </div>
              <div class="tab-pane fade" id="delete">
              	<%
              		String sql2 = "select pic from user where username=?";
              		String sq2[] = {user};
              		ResultSet rs2 = db.query(sql2,sq2);
              		while(rs2.next()){
              	%>
              	<div class="col-md-6">
              		<h2 style="font-weight: boid">你目前的头像：</h2>
              		<img src="img/<%=rs2.getString("pic") %>" class="img-thumbnail" id="img">
              	</div>
              	<% } db.close(); %>
              	
              	<div class="col-md-6">
              	<form action="users_pic_modify.jsp" method="post">        		
            		<h2 style="font-weight: boid">你替换后的头像：</h2>
   					<div>
   					<!--input[button] 触发 file click事件-->
   					<input type="button" value="选择文件" id="mybutton" class="mybtn"  onclick="Id('file').click();" />
   					<!--file 隐藏起来  触发onchange事件-->
   					<input type="file" name="file" accept="image/png,image/jpg,image/jpeg"  id="file" onchange="changeToop(); document.getElementById('path').value=this.value" style="display:none;" required />
   					<input type="text" class="col-md-3" name="imagepath" id="path" class="form-control" style="width: 210px;" >
   					</div>  
   				<!--图片展示区域-->
   					<div style="float:left;">
       					<!--设置默认图片-->
       					<img id="myimg" src="img/404.png"/>
   					</div>					
    				<input type="submit" value="提交修改" class="btn btn-primary col-md-offset-3" style="margin-top: 20px;">
    			</form>
              	</div>
              </div>
              <div class="tab-pane fade" id="order">
                
              </div>
              <div class="tab-pane fade" id="data">
                <p>data</p>
              </div>
              <div class="tab-pane fade" id="prove">
                <p>prove</p>
              </div>
              <div class="tab-pane fade" id="password">
                <p>password</p>
              </div>
              <div class="tab-pane fade" id="user_group">
                <p>user_grou</p>
              </div>
          </div>
          </div>
        </div>
        <div class="col-md-1"></div>
      </div>
    </div>


    
   
    <script>
  //定义id选择器
    function Id(id){
    return document.getElementById(id);
    }
    function changeToop(){
        var file = Id("file");
        if(file.value==''){
            //设置默认图片
        Id("myimg").src='404.png';
        }else{
            preImg("file","myimg");
        }
    }
    //获取input[file]图片的url Important
    function getFileUrl(fileId) { 
        var url; 
        var file = Id(fileId);
        var agent = navigator.userAgent;
        if (agent.indexOf("MSIE")>=1) {
        url = file.value; 
        } else if(agent.indexOf("Firefox")>0) { 
        url = window.URL.createObjectURL(file.files.item(0)); 
        } else if(agent.indexOf("Chrome")>0) {
        url = window.URL.createObjectURL(file.files.item(0)); 
        } 
        return url; 
    } 
    //读取图片后预览
    function preImg(fileId,imgId) { 
    var imgPre =Id(imgId);
    imgPre.src = getFileUrl(fileId); 
    } 
    </script>
  </body>
</html>