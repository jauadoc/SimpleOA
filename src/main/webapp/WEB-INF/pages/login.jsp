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
	<meta name="viewport" content="width=device0width,initial-scale=1.0,user-scalable=no">
	<meta name="theme-color" content="#2932e1">
	<link rel="shortcut icon" type="image/x-icon" href="<%=path%>/jics/images/webLogo/logo.png" media="screen" />
	<link rel="stylesheet" type="text/css" href="<%=path%>/jics/css/reset.css">
	<link rel="stylesheet" type="text/css" href="<%=path%>/jics/css/plugin.css">
	<link rel="stylesheet" type="text/css" href="<%=path%>/jics/css/basic-sun.css">
	<script type="text/javascript" src="<%=path%>/jics/js/jquery.js"></script>
	<script type="text/javascript" src="<%=path%>/jics/js/common.js"></script>
	<!--[if lt IE 8]>
		<link rel="stylesheet" type="text/css" href="<%=path%>/jics/css/ie-plugin.css">
		<style>
			.login{background:#505E5D;}
		</style>
	<![endif]-->
	<!--[if IE 8]>
		<style>
			.login{background:#505E5D;}
		</style>
	<![endif]-->
	<title>请登录</title>

<style>
	body{background: url(<%=path%>/jics/images/bg.png);font-size: 14px;}
	.login{width: 600px;height: 300px;background: rgba(49,59,54,0.8);margin: 0 auto;margin-top:10%;border-radius:15px;}
	.content{position: relative;top: 30%;}
	.unit{width: 80%;margin: 10px auto;}
	.left,.right{display: inline-block;width: 46%;height: 20px;color: white;}
	.left{width: 35%;}
	.left{text-align: right;}
	.left a{color: white;}
	.toast .left,.toast .right{font-size: 8px;line-height: 8px;color: white;}
	.hidden{display: none;visibility: hidden;position: relative;top: 10px;color: white;}
	.no:hover .hidden{display: block;visibility: visible;z-index: 9999;}



	/* 提示信息框  */
	.g-notice,.g-notice .lymask{top:0;left:0;width:100%;height:100%;}
	.g-notice{position:fixed;_position:absolute;z-index:999;}
	.g-notice .lytable{table-layout:fixed;width:100%;height:100%;}
	.g-notice .lytd{width:100%;height:100%;vertical-align:middle;}
	.g-notice .lywrap{position:relative;width:400px;margin:0 auto;background:white;height:30px;middle;text-align: center;vertical-align: middle;line-height: 30px;}
	.g-notice-success{border:5px solid #49c43b;border-radius:5px;}
	.g-notice-error{border:5px solid #EA4335;border-radius:5px;}
	.g-notice-up{margin-top:-3px;}
	.g-notice-down{margin-top:3px;}
	.inputNode{height: 20px;width: 80%;}
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
				var markSuccess = false;
				if(/^[\u4e00-\u9fa5]+$/.test($('#uname').val())){
					 alert("用户名不应该是汉字");
					 $('#uname').focus();
				}
				if(/^[0-9].*?$/.test($('#uname').val())){
					 alert("用户名不能以数字开头");
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
							var status = data.status;
							if(status=="success"){
// 								showMsg(data.data,"success");
								location.href="index.do";
							}else {
								showMsg(data.data,"error",1);
								$(".login-btnbox").removeClass("hidden");
								$(".login-notice").addClass("hidden");
								showMsg("用户名或密码错误","error");
							}
							markSuccess = true;
						},
						error:function(data){
							showMsg("登录失败","success");
							$(".login-btnbox").removeClass("hidden");
							$(".login-notice").addClass("hidden");
						},
						beforeSend: function (xhr) {
							markSuccess = false;
							$(".login-btnbox").addClass("hidden");
							$(".login-notice").removeClass("hidden");
							$(".login-notice").html("正在验证....");
							var mark = 0;
							var step = function(){
								if(mark>=30){
									offAnimation();
								}else{
									mark ++;
								}
							}
							var offAnimation = function() {
								clearInterval(intervalId);
								$(".login-btnbox").removeClass("hidden");
								$(".login-notice").addClass("hidden");
								if(!markSuccess){
									showMsg("登录请求超时，请重新尝试","error");
								}
							}
							// 设置定时器，触发的间隔为10毫秒
							var intervalId = setInterval(step, 100);
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
						<input type="text" class="sun-input-default inputNode" id="uname" name="uname" placeholder="请输入用户名" value="sunxin"></input>
					</div>
				</div>
				<div class="unit">
					<div class="left">
						密码:
					</div>
					<div class="right">
						<input type="password" class="sun-input-default inputNode" id="pwd" name="pwd" placeholder="请输入密码" value="123"></input>
					</div>
				</div>
				<div class="unit">
					<div class="left">
					</div>
					<div class="right">
						<div class="login-btnbox">
							<input type="button" class="sun-button-blue" id="submit_btn" value="登录"></input>
							<input type="reset" class="sun-button-blue" value="重置"></input>
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

	<div class="g-notice hidden ">
	    <table class="lytable "><tbody><tr><td class="lytd">
	    <div class="lywrap" id="g-notice-content">
	    </div></td></tr></tbody></table>
	</div>
</body>
</html>