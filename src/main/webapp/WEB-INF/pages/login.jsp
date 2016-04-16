<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta http-equiv="content-type" content="text/html;charset=utf-8">
	<meta content="always" name="referrer">
	<meta name="theme-color" content="#2932e1">
	<link rel="shortcut icon" type="image/x-icon" href="<%=path%>/jics/images/webLogo/logo.png" media="screen" />
	<link rel="stylesheet" type="text/css" href="<%=path%>/jics/css/reset.css">
	<link rel="stylesheet" type="text/css" href="<%=path%>/jics/css/plugin.css">
	<script type="text/javascript" src="<%=path%>/jics/js/jquery.js"></script>
	</style>
	<!--[if lt IE 7]>
		<link rel="stylesheet" type="text/css" href="<%=path%>/jics/css/ie-plugin.css">
	<![endif]-->
	<title>请登录</title>

<style>
	body{background: url(<%=path%>/jics/images/bg.png);font-size: 14px;}
	.login{width: 600px;height: 300px;background: rgba(49,59,54,0.8);margin: 0 auto;margin-top:120px;border-radius:15px;}
	.content{position: relative;top: 30%;}
	.unit{width: 80%;margin: 10px auto;}
	.left,.right{display: inline-block;width: 46%;height: 20px;color: white;}
	.left{width: 35%;}
	.left{text-align: right;}
	.left a{color: white;}
	.toast .left,.toast .right{font-size: 8px;line-height: 8px;color: white;}
	.hidden{display: none;visibility: hidden;position: relative;top: 10px;color: white;}
	.no:hover .hidden{display: block;visibility: visible;z-index: 9999;}

</style>
<script type="text/javascript">
		document.onkeydown = function(e){
			if(!e) e = window.event;
			if((e.keyCode || e.which) == 13){
				var obtnLogin=document.getElementById("submit_btn")
				obtnLogin.focus();
			}
		}

  	$(function(){
			//提交表单
			$('#submit_btn').click(function(){
				//var myReg = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;//邮箱正则
				var myReg = /^[a-zA-z][a-zA-Z0-9_]{2,9}$/; //邮件正则
				if(/^[\u4e00-\u9fa5]+$/.test($('#uname').val())){
					 alert("用户名不应该是汉字");
					 $('#uname').focus();
				}
				if($('#uname').val().length<3){
					 alert("用户名长度不正确");
					 $('#uname').focus();
				}
				if($('#uname').val() == ''){
// 					show_err_msg('用户名还没填呢！');	
					 alert("用户名不能为空");
					$('#uname').focus();
				}else if(!myReg.test($('#uname').val())){
// 					show_err_msg('您的用户名格式错咯！');
					$('#uname').focus();
				}else if($('#pwd').val() == ''){
// 					show_err_msg('密码还没填呢！');
					 alert("还没有写密码");
					$('#pwd').focus();
				}else{
					//ajax提交表单，#login_form为表单的ID。 如：$('#login_form').ajaxSubmit(function(data) { ... });
// 					show_msg("正在登录...");
					var uname = $("#uname").val();
					var pwd = $("#pwd").val();
					$.ajax({
						url:"<%=path%>/check.do",//默认是form action,
						async: false,
		                type: "POST",
		                datatype: "json",
						data:{
							uname:uname,
							pwd:pwd
						},
						success: function (data) {
							data = JSON.parse(data);
							$(".login-btnbox").removeClass("hidden");
							$(".login-notice").addClass("hidden");
							var status = data.status;
							alert(data.data);
							if(status=="success"){
								location.href="index.do";
							}
						},
						error:function(data){
							$(".login-btnbox").removeClass("hidden");
							$(".login-notice").addClass("hidden");
						},
						beforeSend: function (xhr) {
							$(".login-btnbox").addClass("hidden");
							$(".login-notice").html("正在验证....");
						}
					});
				}
			});
		});
		
</script>
</head>
<body>
	<div class="login">
		<div class="content">
			<form action="check.do" method="post">		
				<div class="unit">
					<div class="left">
						用户名:
					</div>
					<div class="right">
						<input type="text" class="u-ipt" id="uname" name="uname" placeholder="请输入用户名" value="sun"></input>
					</div>
				</div>
				<div class="unit">
					<div class="left">
						密码:
					</div>
					<div class="right">
						<input type="password" class="u-ipt" id="pwd" name="pwd" placeholder="请输入密码" value="123"></input>
					</div>
				</div>
				<div class="unit">
					<div class="left">
					</div>
					<div class="right">
						<div class="login-btnbox">
							<input type="button" class="u-btn" id="submit_btn" value="登录"></input>
							<input type="reset" class="u-btn" value="重置"></input>
						</div>
						<div class="login-notice">
							
						</div>
					</div>
				</div>
				<div class="unit toast">
					<div class="left">
						<span>
							<a href="#">忘记密码</a>		
						</span>
					</div>
					<div class="right">
						<span class=" no">
							&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp没有帐号？
							<span class="hidden">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp请联系你的主管申请帐号</span>
						</span>
					</div>
				</div>
				<div class="unit toast">
					<div class="left">
					</div>
					<div class="right">
						&nbsp
					</div>
				</div>
			<form>
		</div>
	</div>

</div>
</body>
</html>