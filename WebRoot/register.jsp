<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>注册</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
  </head>
  <style type="text/css">  
    .row{
      top: 50%;
      margin-top: 0;
      transform: translateY(30%);
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
      .spa{
				height: 36px;
				line-height: 36px;
				width: 204px;
				display: inline-block;
				float: left;
				font-size: 12px;
				color: #BD362F;
				text-indent: 10px;
				margin-top: 10px;
				}
      
  </style>
  <body>
    <div class="container">
      <div class="row">
        <div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
          <h4 class="text-center">注册</h4>
          <form action="register_cope.jsp" method="post" class="form1" id="form1">
            <div class="form-group">
              <label for="stu_num" class="control-label col-sm-2">账号</label>
              <div class="col-sm-9">
                <input type="text" name="username" id="username" class="form-control" placeholder="6~16位字母数字组合" required="required">
                <span class="spa spa1"></span>
              </div>
            </div>
            <div class="form-group">
              <label for="stu_pwd" class="control-label col-sm-2">密码</label>
              <div class="col-sm-9">
                <input type="password" name="password" id="password" class="form-control" placeholder="输入6-16个字母数字复合字符密码" required="required">
                <span class="spa spa2"></span>
              </div>
            </div> 
            <div class="form-group">
              <label for="restu_pwd" class="control-label col-sm-2">确认密码</label>
              <div class="col-sm-9">
                <input type="password" name="passwordcheck" id="passwordcheck" class="form-control" placeholder="输入6-16个字母数字复合字符密码" required="required">
                <span class="spa spa3"></span>
              </div>
            </div> 
              <div class="form-group">
              <label for="email" class="control-label col-sm-2">邮箱</label>
              <div class="col-sm-9">
                <input type="text" name="email" id="email" class="form-control" placeholder="输入邮箱" required="required">
                <span class="spa spa4"></span>
              </div>
            </div> 
             <div class="form-group">
              <label for="address" class="control-label col-sm-2">电话</label>
              <div class="col-sm-9">
                <input type="text" name="tel" id="tel" class="form-control" placeholder="输入电话" required="required">
                <span class="spa spa5"></span>
              </div>
            </div> 
             <div class="form-group">
              <label for="phone" class="control-label col-sm-2">用户简介</label>
              <div class="col-sm-9">
                <input type="text" name="introduce" id="introduce" class="form-control" placeholder="输入用户简介">
                <span class="spa spa6"></span>
              </div>
            </div> 
            <div class="form-group col-sm-offset-3">
              <div class="">
                <div class="col-sm-5">
                  <button type="submit" name="submit" id="sub" class="btn btn-primary btn-block" data-toggle="modal" data-target="#myModal">注册</button>
                </div>
                <div class="col-sm-5">
                  <button type="reset" class="btn btn-primary btn-block">重置</button>
                </div>
                <a href="index.jsp">返回首页</a>
              </div>
            </div>
          </form>
        </div>       
      </div>     
    </div>

  
    <script src="js/jquery-3.2.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    
    <script type="text/javascript">
    window.onload=function(){
		$("#username").focus();
	}
/************************  失焦判断  **********************************/
	$("input").blur(function(){
		$(".spa").css("color","#BD362F");
		if($(this).is("#username")){             //姓名判断
			var na=/^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,16}$/;
			if($("#username").val()!=""){
				if(!(na.test($("#username").val()))){
					$(".spa1").text("请输入6~16位字母数字组合");
					$(this).css("border","1px solid #BD362F");
					return false;
				}else if(na){
					$(".spa1").text("√");
					$(".spa1").css("color","#2E8B57");
					$(".spa1").css("font-weight","thick");
					$(this).css("border","1px solid #2E8B57");
					return true;
				}
			}else{
				$(".spa1").text("");
			}
		}
		if($(this).is("#password")){             //密码判断
			var pd=/^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,16}$/;
			if($("#username").val()!=""){
				if(!(pd.test($("#password").val()))){
					$(".spa2").text("请输入6~16位字母数字组合");
					$(this).css("border","1px solid #BD362F");
					return false;
				}else if(pd){
					$(".spa2").text("√");
					$(".spa2").css("color","#2E8B57");
					$(".spa2").css("font-weight","thick");
					$(this).css("border","1px solid #2E8B57");
					return true;
				}
			}else{
				$(".spa2").text("");
			}
		}
		if($(this).is("#passwordcheck")){             //确认密码
			//var na="^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,16}$";
			if($("#passwordcheck").val()!=""){
				if($("#passwordcheck").val() != $("#password").val()){
					$(".spa3").text("两次输入密码不一致！");
					$(this).css("border","1px solid #BD362F");
					return false;
				}else{
					$(".spa3").text("√");
					$(".spa3").css("color","#2E8B57");
					$(".spa3").css("font-weight","thick");
					$(this).css("border","1px solid #2E8B57");
					return true;
				}
			}else{
				$(".spa3").text("");
			}
		}
		if($(this).is("#email")){             //邮件判断
			var em=/^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/;
			if($("#email").val()!=""){
				if(!(em.test($("#email").val()))){
					$(".spa4").text("请输入正确的邮箱格式！");
					$(this).css("border","1px solid #BD362F");
					return false;
				}else if(em){
					$(".spa4").text("√");
					$(".spa4").css("color","#2E8B57");
					$(".spa4").css("font-weight","thick");
					$(this).css("border","1px solid #2E8B57");
					return true;
				}
			}else{
				$(".spa4").text("");
			}
		}
		
		if($(this).is("#tel")){            //手机号判断
			var ph=/^1[3|5|7|8|][0-9]{9}$/;
			if($("#tel").val()!=""){
			if(!(ph.test($("#tel").val()))){
				$(".spa5").text("请输入正确手机号!");
				$(this).css("border","1px solid #BD362F");
				return false;
			}else if(ph){
				$(".spa5").text("√");
				$(".spa5").css("color","#2E8B57");
				$(".spa5").css("font-weight","thick");
				$(this).css("border","1px solid #2E8B57");
				return true;
			}
			}else{
				$(".spa5").text("");
			}
		}
		
		/* if($(this).is("#useraddress")){            //用户简介判断
			var ad=/^(?=.*?[\u4E00-\u9FA5])[\dA-Za-z\u4E00-\u9FA5]{8,32}/;
			if($("#useraddress").val()!=""){
			if(!(ad.test($("#useraddress").val()))){
				$(".spa3").text("请输入正确地址");
				$(this).css("border","1px solid #BD362F")
				return false;
			}else if(ad){
				$(".spa3").text("");
				return true;
			}
			}else{
				$(".spa3").text("");
			}
		} */
	});
/********************** 聚焦提示 ************************/	
	/* $("input").focus(function(){
		if($(this).is("#username")){
			$(".spa1").text("2-4个汉字").css("color","#aaa");
			$(this).css("border","1px solid #aaa");
		}
		if($(this).is("#userphone")){
			$(".spa2").text("11位手机号码").css("color","#aaa");
			$(this).css("border","1px solid #aaa");
		}
		if($(this).is("#useraddress")){
			$(".spa3").text("最少8个字符（汉字、字母和数字）").css("color","#aaa");
			$(this).css("border","1px solid #aaa");
		}
	}); */
/*********************** 提交验证 ***************************/
	$("#sub").click(function(){
		var na=/^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,16}$/;   //账号正则
		var pd=/^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,16}$/;    //密码正则
		if(na.test($("#username").val())&&ph.test($("#password").val())){
			return true;
		}else{
			if($("#username").val()==""){
				$(".spa1").text('请你填写用户名');
			}
			if($("#password").val()==""){
				$(".spa2").text('请你填写密码');
			}
			if($("#password").val()==""){
				$(".spa3").text('请你确认密码');
			}
			if($("#email").val()==""){
				$(".spa4").text('请你填写邮箱');
			}
			if($("#tel").val()==""){
				$(".spa5").text('请你填写手机号');
			} 
			
			return false;
		}
	});

    </script>
    
  </body>
</html>