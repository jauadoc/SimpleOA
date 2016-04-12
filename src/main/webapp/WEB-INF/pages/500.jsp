<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>	
  	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta http-equiv="content-type" content="text/html;charset=utf-8">
	<meta content="always" name="referrer">
	<meta name="theme-color" content="#2932e1">
    <base href="<%=basePath%>">
    <title>●﹏●服务器异常</title>
	<style type="text/css">
		body{background: url(<%=path%>/jics/images/bg.png);}
		.m-demo{width: 966px;margin: 100px auto;}
		.five{background: url(<%=path%>/jics/images/500.png);width: 1000px;height: 300px;}
		.title div{display: inline-block;}
		.title{width: 1000px;}
		.center{width: 300px;margin: 0 auto;}
		.center a{color: red;}
	</style>
	
</head>
<body>
<div class="m-demo">
    <div class="boxd">
    	&nbsp
    </div>
    <div class="title">
    	<div class="five">&nbsp</div>
    	<div class="center">
    		<a href="index.do">返回首页</a>
    	</div>
    </div>

</div>

</body>
</html>
</html>
