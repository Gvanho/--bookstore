<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>登陆</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    	<!--<script type="text/javascript">
    		function changing(){
    			document.getElementById('checkpic').src="image/checkcode.php?"+Math.random();
			}
    	</script>-->
  </head>
  <style type="text/css">  
    .row{
      top: 50%;
      margin-top: 0;
      transform: translateY(50%);
    }
    .modal-dialog{
        top: 50%;
        margin-top: 0;
      }
      .modal.fade .modal-dialog{
        transform: translateY(-75%);
      }
      .modal.in .modal-dialog{
        transform: translateY(-50%);
      }
  </style>
  <script type="text/javascript">
  
  </script>
  <body>
    <div class="container">
      <div class="row">
        <div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
          <h4 class="text-center">登录表单</h4>
          <form action="login_cope.jsp" method="post">
            <div class="form-group">
              <label for="stu_num" class="control-label col-sm-2">账号</label>
              <div class="col-sm-9">
                <input type="text" name="username" id="stu_num" class="form-control" required="required">
                <span class="glyphicon"></span>
              </div>
            </div>
            <div class="form-group">
              <label for="stu_pwd" class="control-label col-sm-2">密码</label>
              <div class="col-sm-9">
                <input type="password" name="password" id="stu_pwd" class="form-control" required="required">
                <span class="glyphicon"></span>
              </div>
            </div>         
            
            
            <div class="form-group col-sm-offset-3">
              <div class="col-sm-5">
                <button type="submit" name="submit" class="btn btn-primary btn-block">登录</button>
              </div>
              <div class="col-sm-5">
                <a class="btn btn-primary btn-block" href="register.jsp" role="button">注册</a>
              </div>
            <div class="form-group">  
              <div class="col-sm-3 col-sm-offset-7">
                <a href="index.jsp">返回首页</a>
              </div>
            </div>
            </div>
          </form>
        </div>       
      </div>     
    </div>
 

    
  
    <script src="js/jquery-3.2.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>

  </body>
</html>