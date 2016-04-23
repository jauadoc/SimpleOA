<%@ page language="java" contentType="text/html; charset=UTF-8" import="com.sun.entity.PageUser"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	PageUser pageUser = (PageUser)request.getSession().getAttribute("pageUser");
	if(pageUser==null || pageUser==new PageUser()){
		request.getRequestDispatcher("/login.do").forward(request, response);
	}
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
	<link rel="stylesheet" type="text/css" href="<%=path%>/jics/css/basic-sun.css">
	<script type="text/javascript" src="<%=path%>/jics/js/jquery.js"></script>
	<script type="text/javascript" src="<%=path%>/jics/js/common.js"></script>
	
	<style type="text/css">
	</style>
	<!--[if lt IE 7]>
		<link rel="stylesheet" type="text/css" href="<%=path%>/jics/css/ie-plugin.css">
	<![endif]-->
	<title>Simple-OA</title>

<style>
	/*功能样式*/
	.clearfix:after{content: ".";display: block;clear: both;overflow: hidden;display: visibility:hidden;height: 0;display: none}
	.clearfix{zoom:1;}
	.hidden{display: none;visibility: hidden;}

	/*通用样式*/
	.split{border-bottom: 3px solid #0085B5;height:8px;content: ".";overflow: hidden;color: white;}
	.float-right{float: right;}
	.float-left{float: left;}
	/*布局样式*/
	html,body,.g-body{height: 100%;overflow: hidden;}
	.g-head{position: absolute;left:0px;top:0px;width: 100%; height:60px;border-bottom: #666 solid 1px;background: #58ACED;}
	.g-left{position: absolute;left: 0px;top:60px;bottom:30px;border-right: #666 solid 1px;width: 200px;z-index:999;background: #313B36;}
	.g-content{position: absolute;left: 200px;top: 60px;right: 0px;bottom: 30px;}
	.g-footer{position: absolute;left: 0px;bottom: 0px;border-top: #666 solid 1px;width: 100%;height: 30px;background: #242525;}
	.g-contentNoLeft{position: absolute;left: 0px;top: 60px;right: 0px;bottom: 30px;}
	
	/*头模块样式*/
	.m-head{width: 100%;height: 60px;display: table;vertical-align: top;}
	.m-head .sys-title{width:40%;height: 58px;line-height: 58px;font-size: 36px;margin-left: 20px;display: table-cell;vertical-align: middle;}
	.m-head .sys-title .logo,.m-head .sys-title .title{display: table-cell;}
	.m-head .m-nav{float:right;height: 60px;font-size:9px;overflow: hidden;display: table-cell;}
	.m-head .m-nav .dir{width: 120px;color: #FFF;height: 60px;text-align: center;cursor: pointer;padding: 0px;display: table-cell;}
	.check{background: #0085B5;}

	/*左模块样式*/
	.m-instro{overflow: hidden;}
	.m-instro .u-info .head{border-radius:100%;width: 100px;height:100px;margin: 2% auto;border: solid 3px #DDD;overflow: hidden;}
	.m-instro .u-info .underHead{width: 60%;margin: 2% auto;border: solid 1px #666;overflow: hidden;text-align: center;color:#CCC;display: block;font-size: 16px;line-height: 16px;}
	.m-instro .u-info .job{width: 60%;margin: 2% auto;border: solid 1px #666;overflow: hidden;text-align: center;color:#CCC;display: block;font-size: 16px;line-height: 16px;}
	.m-instro .u-use .quickuse{border-bottom:solid 1px #555;margin-top: 2px;display: block;color:#CCC;}
	.m-instro .u-use{width:100%;margin:15px auto;font-size: 12px;line-height: 12px;text-align: center;}
	.m-instro .oneSelect{display:inline-block;margin:2px 2px;}
	.m-layer{}
	#oa-head img{cursor:pointer;}
	
	.m-instro .hiddenLeft{position: absolute;top:50%;left:164px;border:solid 3px #DDD;float:right;font-size:20px;cursor: pointer;border-radius:4px;width: 24px;background: #DDD;color:#333;}
	.left-open{position: absolute;top:50%;left:-10px;border:solid 3px #333;float:right;font-size:20px;z-index:998;cursor: pointer;border-radius:4px;width: 24px;background: #333;color:#DDD;}
	/*右模块样式*/
	.g-content{display: table-cell;vertical-align: middle;}
	.g-content .data{width: 100%;height: 98%;margin-left: 3px;margin-top: 5px;margin-bottom: 1%;overflow: auto;}
	
	/*底模块样式*/
	.g-footer{color: white;text-align: center;}
	
	/*  */
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
</style>
<script type="text/javascript">
/*注释搜索索引 如下*/
/*1.======================   -------为需要按注释修改或按业务修改的代码*/
/*2.测试数据             --------------测试用的数据*/
	<%
		int uid = -1;
		if(pageUser!=null && pageUser!=new PageUser()){
			uid = pageUser.getId();
		}
	%>
	$().ready(function(){
		/*获取左侧个人信息*/
		getGlobalLeft();
		getGlobalSystem();
	});
	/* 1.快捷方式业务逻辑---------------------------------------- */
	/* 关闭弹窗 */
	function hiddenWindow(){
		$(".m-layer").removeClass("m-layer-show");
	}
	/* 显示弹窗，并请求功能数据 */
	function addMoreQuickuse(){
		$("#m-apply").addClass("m-layer-show");
		var inMessage = new Object();
		inMessage.date = new Date().getTime();
		inMessage.data = "";
		inMessage.uid = <%=uid %>;
		var json = JSON.stringify(inMessage);
		$.ajax({
		   url: '<%=path %>/data/getFunction.do?date='+ new Date().getTime(),
      	   type: 'post',
		   data:{data:json},
		   contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		   //调小超时时间会引起异常
		   timeout: 3000,
      		//请求成功后触发
      		success: function (data) {
      			/*$("#data").html(data);*/
      			data = JSON.parse(data);
      			var html = "";
      			for(var i=0;i<data.functions.length;i++){
      				if(data.functions[i].isChoose=="false" || data.functions[i].isChoose==false){
	      				html += data.functions[i].name+"<input type='checkbox' value='"+data.functions[i].fid+"'></input></div>";
      				}else{
	      				html += data.functions[i].name+"<input type='checkbox' value='"+data.functions[i].fid+"' checked></input></div>";
      				}
      			}
				$(".functionWindow").html(html);
			},
			//请求失败遇到异常触发
			error: function (xhr, errorInfo, ex) { 
				showMsg("功能获取失败", "error");
			},
			beforeSend: function (xhr) {
				xhr.setRequestHeader('Content-Type', 'application/xml;charset=utf-8');
			},
			//是否异步发送
			async: true
		});
	}
	/*提交添加的快捷连接*/
	//inMessage：{"id":1,"date":1460705461999,"data":[{"func":"外出"},{"func":"请假"}]}
	function subAddMore(){
		/* 获取前端信息整合为json字符串 */
		var jsonObj = new Object();
		var inputs = $(".functionWindow").children("input");
		var inMessage = new Object();
		inMessage.date = new Date().getTime();
		inMessage.data = [];
		inMessage.uid = <%=uid %>
		jsonObj.func = "";
		var mark = 0;
		for(var i=0;i<inputs.length;i++){
			if($(inputs[i]).is(':checked')){
				jsonObj = new Object();
				jsonObj.func = $(inputs[i]).val();
				inMessage.data[mark] = jsonObj;
				mark++;
			}
		}
		var json = JSON.stringify(inMessage);
		/* json发送到服务器 */
		$.ajax({
		   url: '<%=path %>/data/addQuickUse.do?date='+new Date().getTime(),
      	   type: 'post',
		   data: {data:json},
		   contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		   //调小超时时间会引起异常
		   timeout: 3000,
      		//请求成功后触发
      		success: function (data) {
      			data = JSON.parse(data);
      			if(data.status=="success"){
					showMsg("修改成功", "success",1.5);
      				hiddenWindow();
      			}else{
					showMsg(data.data, "error");
      			}
				getGlobalLeft();
			},
			//请求失败遇到异常触发
			error: function (xhr, errorInfo, ex) { 
				showMsg("快捷方式修改失败，请重新提交", "error");		
			},
			beforeSend: function (xhr) {
				xhr.setRequestHeader('Content-Type', 'application/xml;charset=utf-8');
			},
			//是否异步发送
			async: true
		});
	}
	/* end-1.快捷方式业务逻辑---------------------------------------- */
	
	/* 2.页面目录转跳页面业务逻辑--------------------------------------- */
	/*content转跳至xx页面函数*/
	//goPage没有遵循inMessage格式，因为前后端都写完，暂且不改。
	function goPage(pageUrl){
		$.ajax({
		   url: '<%=path%>/goPage.do?date='+new Date().getTime(),
      	   type: 'get',
		   data:{uid:<%=uid %>,pageUrl:pageUrl},
		   contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		   //调小超时时间会引起异常
		   timeout: 3000,
      		//请求成功后触发
      		success: function (data) {
      			$("#data").html(data);
      			/*如果是index页面，需要初始化一下日历空间*/		
      			CalendarHandler.initialize();
			},
			//请求失败遇到异常触发
			error: function (xhr, errorInfo, ex) { 
				
			},
			beforeSend: function (xhr) {
				xhr.setRequestHeader('Content-Type', 'application/xml;charset=utf-8');
			},
			//是否异步发送
			async: true
		});
	}
	/* end-2.页面目录转跳页面业务逻辑--------------------------------------- */

	/* 3.左侧个人信息获取业务逻辑------------------------------------------- */
	/*获取 个人信息 -left*/
	function getGlobalLeft(){
		$.ajax({
		   url: '<%=path %>/data/getUserInfo.do?date='+new Date().getTime(),
      	   type: 'get',
		   data:{uid:<%=uid %>},
		   contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		   //调小超时时间会引起异常
		   timeout: 3000,
      		//请求成功后触发
      		success: function (data) {
      			data = JSON.parse(data);
				/* 暂无接口实现，前端测试 =====================================*/
      			$("#oa-head").html("<img src='"+data.data.head+"' onclick='oa_userInfo(\"<%=uid %>\")'/>");
      			$("#oa-name").html(data.data.name);
      			$("#oa-job").html(data.data.job);
      			$("#oa-out").html("退出登录");
      			var quicksHtml = "";
      			for(var i=0;i<data.data.quickuse.length;i++){
      				quicksHtml += "<a href='javascript:void(0)'  onclick='goPage(\""+data.data.quickuse[i].href+"\")'  class='quickuse'><div onclick='chooseFunction()'>"+data.data.quickuse[i].name+"</div></a>";
      			}
      			quicksHtml +="<a href='javascript:void(0)' onclick='addMoreQuickuse()' class='quickuse'>+常用功能管理+</a>";
      			$("#oa-u-use").html(quicksHtml);
				/* 暂无接口实现，前端测试 =====================================*/
			},
			//请求失败遇到异常触发
			error: function (xhr, errorInfo, ex) { 
				showMsg("个人信息获取失败", "error");
			},
			beforeSend: function (xhr) {
				xhr.setRequestHeader('Content-Type', 'application/xml;charset=utf-8');
			},
			//是否异步发送
			async: true
		});
	}
	/* end-3.左侧个人信息获取业务逻辑------------------------------------------- */

	/* 4.系统信息获取业务逻辑-------------------------------------------------- */
	/*获取 系统信息(系统名称，右侧目录信息)-right*/
	function getGlobalSystem(){
		$.ajax({
		   url: '<%=path %>/data/getSystem.do?date='+new Date().getTime(),
      	   type: 'post',
		   data:{},
		   contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		   //调小超时时间会引起异常
		   timeout: 3000,
      		//请求成功后触发
      		success: function (data) {
      			data = JSON.parse(data);
				/* 暂无接口实现，前端测试 =====================================*/
//       			var data = {"status":"success","data":{"directory":[{"name":"首页","img":"jics/images/home.png","href":"index"},{"name":"联系人","img":"jics/images/friend.png","href":"friend"},{"name":"工作","img":"jics/images/work.png","href":"work"},{"name":"消息","img":"jics/images/msg.png","href":"message"}],"logo":"jics/images/logo.png"},"date":"3902392"};
      			/*从服务器获取首页目录信息*/
      			var dirs = data.data.directory;
      			var dirHtml = "";
      			for(var i=0;i<data.data.directory.length;i++){
      				dirHtml += "<div onclick='goPage(\""+data.data.directory[i].href+"\")' class='dir sun-border-elegance' data-href='"+data.data.directory[i].href+"'><div onclick='chooseThis(this)'><div><img src='<%=path%>/"+data.data.directory[i].img+"'></div>"+data.data.directory[i].name+"</div></div>";
      			}
      			
      			$("#oa-m-nav").html(dirHtml);
//       			$(".logo").html("<img src='"+data.data.logo+"'/>");
      			/*获取目录信息后，调用goPage函数，让中间Content请求index首页数据*/
      			/*这里也可以直接触发 目录div 下的第一个div的onclik，顺带还可以完成前端逻辑*/
      			var nav_as = $("#oa-m-nav").children(".dir");
				$(nav_as[0]).addClass("check");
      			goPage(data.data.directory[0].href);
			},
			//请求失败遇到异常触发
			error: function (xhr, errorInfo, ex) { 
				showMsg("个人信息获取失败", "error");
			},
			beforeSend: function (xhr) {
				xhr.setRequestHeader('Content-Type', 'application/xml;charset=utf-8');
			},
			//是否异步发送
			async: true
		});
	}
	/* end-4.系统信息获取业务逻辑-------------------------------------------------- */
	function chooseThis(node){
		var nav_as = $("#oa-m-nav").children(".dir");
		for(var i=0;i<nav_as.length;i++){
			$(nav_as[i]).removeClass("check");
			
		}
		$(node).parent().addClass("check");
	}
	function chooseFunction(){
		
	}
	function hiddenLeft(){
		$(".g-left").addClass("hidden");
		$(".g-content").addClass("g-contentNoLeft");
		$(".g-contentNoLeft").removeClass("g-content");
		$(".left-open").removeClass("hidden");
      	CalendarHandler.initialize();
		
	}
	function showLeft(){
		$(".g-left").removeClass("hidden");
		$(".g-contentNoLeft").addClass("g-content");
		$(".g-content").removeClass("g-contentNoLeft");
		$(".left-open").addClass("hidden");
      	CalendarHandler.initialize();
	}
	
	function oa_userInfo(uid){
		var dirs = $(".m-nav").children(".dir");
		for(var i=0;i<dirs.length;i++){
			var goToPage = $(dirs[i]).attr("data-href");
			if("userInfo"==goToPage){
				chooseThis($(dirs[i]).children("div"));
			}
		}
		goPage("userInfo");
	}
</script>
</head>
<body>

<div class="g-body">
	<div class="left-open hidden sun-border-elegance" onclick="showLeft()">→</div>
	<div class="g-left">
		<div class="m-instro">
			<div class="u-info">
				<div class="head" id="oa-head">&nbsp</div>
				<div class="job underHead" id="oa-job">&nbsp</div>
				<div class="name underHead" id="oa-name">&nbsp</div>
				<a href="<%=path %>/logout.do" class="out underHead" id="oa-out">&nbsp</a>
			</div>
			<div class="split"></div>
			<div class="u-use" id="oa-u-use">
				<a href="javascript:void(0)" class="quickuse">&nbsp</a>
				<a href="javascript:void(0)" class="quickuse">&nbsp</a>
				<a href="javascript:void(0)" class="quickuse">&nbsp</a>
				<a href="javascript:void(0)" class="quickuse">&nbsp</a>
			</div>
			<div class="hiddenLeft sun-border-elegance" onclick="hiddenLeft()">←</div>
		</div>
	</div>
	<div class="g-head">
		<div class="m-head">
			<div class="sys-title">
				<div class="logo"><img src="./jics/images/logo.png"></div>
				<div class="title">专注，务实</div>
			</div>
			<div class="m-nav clearfix" id="oa-m-nav">
				
			</div>
		</div>		
	</div>
	<div class="g-content">
		<div class="data" id="data">
			<!-- 点击首页，消息，工作，联系人等返回的数据格式 -->
			
			<!-- 数据返回结束 -->
		</div>
		<div class="m-layer" id="m-apply">
		    <table class="lytable"><tbody><tr><td class="lytd">
		    <div class="lywrap">
			    <div class="lytt"><h2 class="u-tt">请选择要添加的快捷方式</h2><span class="lyclose" onclick="hiddenWindow()">×</span></div>
			    <div class="lyct">
			        <div class="functionWindow">
						<div class="oneSelect">
							&nbsp
						</div>
			        </div>
			    </div>
			    <div class="lybt">
			        <div class="lyother">
			            <p></p>
			        </div>
			        <div class="lybtns">
			            <button type="button" class="u-btn" onclick="subAddMore()">确定</button>
			            <button type="button" class="u-btn u-btn-c4" onclick="hiddenWindow()">取消</button>
			        </div>
			    </div>
		    </div></td></tr></tbody></table>
		</div>
	</div>
	<div class="g-footer">
		京ICP证150335号/京公网安备11010802009977 Copyright © 2003-2016 MEISHIJ CO.,LTD.
	</div>
</div>
<div class="g-notice hidden">
    <table class="lytable"><tbody><tr><td class="lytd">
    <div class="lywrap" id="g-notice-content">
    </div></td></tr></tbody></table>
</div>

</body>
</html>