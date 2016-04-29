<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
  	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta http-equiv="content-type" content="text/html;charset=utf-8">
	<meta content="always" name="referrer">
	<meta name="viewport" content="width=device0width,initial-scale=1.0,user-scalable=no">
    <title>没有找到指定文件</title>
	<style type="text/css">
	/*-webkit-animation等带-webkit-前缀的为webkit内核浏览器识别，其他为ie9以上及firefox识别*/
	.m-demo{position:absolute;top:50%;left:50%;width:400px;height:400px;margin:-200px;perspective:1000px;cursor:default;}
	.m-demo .box{position:absolute;width:100%;height:100%;transform-style:preserve-3d;-webkit-animation:rotate 5s 0s linear infinite both;}
	.m-demo .box>div{position:absolute;width:100%;height:100%;box-sizing:border-box;border:2px solid rgba(0,0,0,0);background:rgba(0,0,0,0);border-color:rgba(0,0,0,0.8);transition:1s linear;text-align:center;line-height:400px;font-size:40px;}
	.m-demo .box .top{-webkit-animation:top 0s 0s linear both;animation:top 0s 0s linear both;}
	.m-demo .box .bottom{-webkit-animation:bottom 0s 0s linear both;animation:bottom 0s 0s linear both;}
	.m-demo .box .left{-webkit-animation:left 0s 0s linear both;animation:left 0s 0s linear both;}
	.m-demo .box .right{-webkit-animation:right 0s 0s linear both;animation:right 0s 0s linear both;}
	.m-demo .box .back{-webkit-animation:back 0s 0s linear both;animation:back 0s 0s linear both;}
	.m-demo .box .front{-webkit-animation:front 0s 0s linear both;animation:front 0s 0s linear both;}
	.m-demo:hover .box>div{border-color:rgba(0,0,0,0);color:#fff;}
	.m-demo:hover .box .top{background:rgba(255,255,0,0.8);}
	.m-demo:hover .box .bottom{background:rgba(0,255,0,0.8);}
	.m-demo:hover .box .left{background:rgba(0,255,255,0.8);}
	.m-demo:hover .box .right{background:rgba(0,0,255,0.8);}
	.m-demo:hover .box .front{background:rgba(255,0,255,0.8);}
	.m-demo:hover .box .back{background:rgba(255,0,0,0.8);}
	.m-demo{-webkit-animation:round 10s 0s linear both;animation:round 10s 0s linear infinite both;}
	@-webkit-keyframes round{
	    0%{-webkit-transform:translate(0);}
	    25%{-webkit-transform:translate(-80%);}
	    50%{-webkit-transform:translate(0);}
	    75%{-webkit-transform:translate(80%);}
	    100%{-webkit-transform:translate(0);}
	}
	@-webkit-keyframes rotate{
	    100%{-webkit-transform:rotate3d(1,1,1,360deg);}
	}
	@-webkit-keyframes top{
	    100%{-webkit-transform:rotateX(90deg) translateZ(200px);}
	}
	@-webkit-keyframes bottom{
	    100%{-webkit-transform:rotateX(-90deg) translateZ(200px);}
	}
	@-webkit-keyframes left{
	    100%{-webkit-transform:rotateY(-90deg) translateZ(200px);}
	}
	@-webkit-keyframes right{
	    100%{-webkit-transform:rotateY(90deg) translateZ(200px);}
	}
	@-webkit-keyframes front{
	    100%{-webkit-transform:translateZ(200px);}
	}
	@-webkit-keyframes back{
	    100%{-webkit-transform:rotateY(180deg) translateZ(200px);}
	}
	
	/*ie9 firefox*/
	@keyframes round{
	    0%{transform:translate(0);}
	    25%{transform:translate(-80%);}
	    50%{transform:translate(0);}
	    75%{transform:translate(80%);}
	    100%{transform:translate(0);}
	}
	@keyframes rotate{
	    100%{transform:rotate3d(1,1,1,360deg);}
	}
	@keyframes top{
	    100%{transform:rotateX(90deg) translateZ(200px);}
	}
	@keyframes bottom{
	    100%{transform:rotateX(-90deg) translateZ(200px);}
	}
	@keyframes left{
	    100%{transform:rotateY(-90deg) translateZ(200px);}
	}
	@keyframes right{
	    100%{transform:rotateY(90deg) translateZ(200px);}
	}
	@keyframes front{
	    100%{transform:translateZ(200px);}
	}
	@keyframes back{
	    100%{transform:rotateY(180deg) translateZ(200px);}
	}
	
	body{background: url(<%=path%>/jics/images/bg.png);}
	.notice{display:none;visibility:hidden;}
	</style>
	<!--[if lt IE 9]>
		<style type="text/css">
			.m-demo{display:none;visibility:hidden;}
			body{background:url(<%=path%>/jics/images/404.gif);width:320px;height:262px;margin:100px 300px;}
		</style>
	<![endif]-->
</head>
<body>
<div class="m-demo">
    <div class="box">
        <div class="top">404</div>
        <div class="bottom">请确认地址是否正确</div>
        <div class="left">(＞﹏＜)</div>
        <div class="right">你要找的页面不存在</div>
        <div class="front">404</div>
        <div class="back">404</div>
    </div>
</div>

</body>
</html>
</html>
