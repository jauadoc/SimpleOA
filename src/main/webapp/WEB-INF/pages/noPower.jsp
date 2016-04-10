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
		<link rel="shortcut icon" type="image/x-icon" href="<%=path %>/web/images/webLogo/logo.png" media="screen" />
	<link rel="stylesheet" type="text/css" href="<%=path %>/web/css/reset.css">
	<title></title>
	<style type="text/css">
		/*背景图地址*/
		body{background: url(./images/bg.jpg);}
		.g-tishi{width: 1000px;margin:50px auto;}
		.title{font-size:40px;}
		.content{font-size:20px;margin:10px 0px;}
	</style>
	
</head>
<body>
	
	<div class="g-tishi">
		<div class="title">权限错误！</div>
		<div class="content">非常抱歉，您暂无权限访问此页面</div>
		<div>
			<a href="<%=path %>/web/login.jsp">返回登录页面</a>
			&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
			<a href="<%=path %>/web/index.jsp">返回首页</a>
		</div>
<!-- 		<br><br> -->
<!-- 		<div> -->
<!-- 			<a href="logout.jsp">退出登录</a> -->
<!-- 		</div> -->
	</div>
</body>
</html>