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
	</style>
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

</script>
</head>
<body>
	<div class="login">
		<div class="content">
			<form action="check.do">		
				<div class="unit">
					<div class="left">
						用户名:
					</div>
					<div class="right">
						<input type="text" class="u-ipt" name="uname"></input>
					</div>
				</div>
				<div class="unit">
					<div class="left">
						密码:
					</div>
					<div class="right">
						<input type="password" class="u-ipt" name="pwd"></input>
					</div>
				</div>
				<div class="unit">
					<div class="left">
					</div>
					<div class="right">
						<input type="submit" class="u-btn" value="登录"></input>
						<input type="reset" class="u-btn" value="重置"></input>
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