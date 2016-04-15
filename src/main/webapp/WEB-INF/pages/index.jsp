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
	<script type="text/javascript" src="<%=path%>/jics/js/jquery.js"></script>
	
	<style type="text/css">
	</style>
	<!--[if lt IE 7]>
		<link rel="stylesheet" type="text/css" href="<%=path%>/jics/css/ie-plugin.css">
	<![endif]-->
	<title>数据管理系统</title>

<style>
	/*功能样式*/
	.clearfix:after{content: ".";display: block;clear: both;overflow: hidden;display: visibility:hidden;height: 0;display: none}
	.clearfix{zoom:1;}

	/*通用样式*/
	.split{border-bottom: 3px solid #0FDBD6;height:8px;content: ".";overflow: hidden;color: white;}
	.float-right{float: right;}
	.float-left{float: left;}
	/*布局样式*/
	html,body,.g-body{height: 100%;overflow: hidden;}
	.g-left{position: absolute;left: 0px;top:60px;bottom:30px;border-right: #666 solid 1px;width: 200px;background: #313B36;}
	.g-head{position: absolute;left:0px;top:0px;width: 100%; height:60px;border-bottom: #666 solid 1px;background: #0DAAA5;}
	.g-content{position: absolute;left: 200px;top: 60px;right: 0px;bottom: 30px;}
	.g-footer{position: absolute;left: 0px;bottom: 0px;border-top: #666 solid 1px;width: 100%;height: 30px;}

	/*头模块样式*/
	.m-head{width: 100%;height: 60px;display: table;vertical-align: top;}
	.m-head .sys-title{width:60%;height: 60px;line-height: 60px;font-size: 36px;margin-left: 20px;display: table-cell;}
	.m-head .sys-title .logo,.m-head .sys-title .title{display: inline-block;}
	.m-head .m-nav{display: table-cell;height: 60px;}
	.m-head .m-nav .dir{display: table-cell;border-top: solid #CBA 1px;border-left: solid #CBA 1px;border-right: solid #CBA 1px;width: 120px;color: #FFF;height: 60px;text-align: center;}
	.m-head .m-nav .check{background: #0A7E7C;}

	/*左模块样式*/
	.m-instro .u-info .head{border-radius:100%;width: 100px;height:100px;margin: 2% auto;border: solid 3px #DDD;overflow: hidden;}
	.m-instro .u-info .underHead{width: 60%;margin: 2% auto;border: solid 1px #666;overflow: hidden;text-align: center;color:#CCC;display: block;font-size: 16px;line-height: 16px;}
	.m-instro .u-info .job{width: 60%;margin: 2% auto;border: solid 1px #666;overflow: hidden;text-align: center;color:#CCC;display: block;font-size: 16px;line-height: 16px;}
	.m-instro .u-use .quickuse{border-bottom:solid 1px #555;margin-top: 2px;display: block;color:#CCC;}
	.m-instro .u-use{width:100%;margin:15px auto;font-size: 12px;line-height: 12px;text-align: center;}
	.oneSelect{display:inline-block;margin:2px 2px;}
	.m-layer{}
	/*右模块样式*/
	.g-content{background: #F1F1F1;display: table-cell;vertical-align: middle;}
	.g-content .data{width: 100%;height: 98%;margin-left: 3px;margin-top: 5px;margin-bottom: 1%;overflow: auto;background: white;}
	
	/*底模块样式*/
	.g-footer{background: #242525;color: white;text-align: center;}
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
//       			var data = {"functions":[{"name":"test","isChoose":"no"},{"name":"test1","isChoose":"no"},{"name":"test2","isChoose":"no"},{"name":"test3","isChoose":"no"},{"name":"test4","isChoose":"no"},{"name":"test41","isChoose":"no"},{"name":"test42","isChoose":"no"},{"name":"test421","isChoose":"no"}]};
      			var html = "";
      			for(var i=0;i<data.functions.length;i++){
      				if(data.functions[i].isChoose=="false" || data.functions[i].isChoose==false){
	      				html += data.functions[i].name+"<input type='checkbox' value='"+data.functions[i].name+"'></input></div>";
      				}else{
	      				html += data.functions[i].name+"<input type='checkbox' value='"+data.functions[i].name+"' checked></input></div>";
      				}
      			}
				$(".functionWindow").html(html);
			},
			//请求失败遇到异常触发
			error: function (xhr, errorInfo, ex) { 
      			alert("error");
				var data = {"functions":[{"name":"审批","isChoose":"no"},{"name":"审批","isChoose":"no"},{"name":"外出","isChoose":"yes"},{"name":"离职","isChoose":"no"},{"name":"请假","isChoose":"yes"},],"count":5};
      			var html = "";
      			for(var i=0;i<data.count;i++){
      				if(data.functions[i].isChoose=="no"){
	      				html += data.functions[i].name+"<input type='checkbox' value='"+data.functions[i].name+"'></input></div>";
      				}else{
	      				html += data.functions[i].name+"<input type='checkbox' value='"+data.functions[i].name+"' checked></input></div>";
      				}
      			}
				$(".functionWindow").html(html);
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
		inMessage.id = <%=uid %>
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
		   url: '/data/addQuickUse?date='+new Date().getTime(),
      	   type: 'post',
		   data: json,
		   contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		   //调小超时时间会引起异常
		   timeout: 3000,
      		//请求成功后触发
      		success: function (data) {
      			if(data.status=="success"){
      				alert(data.data);
      				hiddenWindow();
      			}else{
      				alert(data.data);
      			}
				getGlobalLeft();
			},
			//请求失败遇到异常触发
			error: function (xhr, errorInfo, ex) { 
				alert("数据请求异常");			
				alert(json);	
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
		
		var inMessage = new Object();
		inMessage.date = new Date().getTime();
		inMessage.data = "";
		inMessage.uid = <%=uid %>;
		var json = JSON.stringify(inMessage);
		
		$.ajax({
		   url: '/data/info?date='+new Date().getTime(),
      	   type: 'get',
		   data:json,
		   contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		   //调小超时时间会引起异常
		   timeout: 3000,
      		//请求成功后触发
      		success: function (data) {
				alert("success in left");
      			/*{"status":"success","data":{"head":"http://www.baidu.com/img/bd_logo1.png","name":"张三","job":"java软件工程师","quickuse":[{"name":"工作簿","href":"www.baidu.com"},{"name":"联系人","href":"3wb.com"}],"length":"2"},"date":"3902392"};*/
      			/*测试数据*/
      			var data = {"status":"success","data":{"head":"./jics/images/head.png","name":"张三","job":"java软件工程师","quickuse":[{"name":"工作簿","href":"www.baidu.com"},{"name":"联系人","href":"3wb.com"}],"length":"2"},"date":"3902392"};
      			$("#oa-head").html("<img src='"+data.data.head+"'/>");
      			$("#oa-name").html(data.data.name);
      			$("#oa-job").html(data.data.job);
      			$("#oa-out").html("退出登录");
      			var quicksHtml = "";
      			for(var i=0;i<data.data.length;i++){
      				quicksHtml += "<a href='"+data.data.quickuse[i].href+"' class='quickuse'>"+data.data.quickuse[i].name+"</a>";
      			}
      			quicksHtml +="<a href='javascript:void(0)' onclick='addMoreQuickuse()' class='quickuse'>+添加更多常用功能+</a>";
      			$("#oa-u-use").html(quicksHtml);
			},
			//请求失败遇到异常触发
			error: function (xhr, errorInfo, ex) { 
				alert("error in left");
// 				$("#oa-u-use").html("<div onclick='getGlobalLeft()' class='u-btn'>数据请求异常,重新获取</div>"); 



				/* 暂无接口实现，前端测试 =====================================*/
      			var data = {"status":"success","data":{"head":"./jics/images/head.png","name":"张三","job":"java软件工程师","quickuse":[{"name":"工作簿","href":"www.baidu.com"},{"name":"联系人","href":"3wb.com"}],"length":"2"},"date":"3902392"};
      			$("#oa-head").html("<img src='"+data.data.head+"'/>");
      			$("#oa-name").html(data.data.name);
      			$("#oa-job").html(data.data.job);
      			$("#oa-out").html("退出登录");
      			var quicksHtml = "";
      			for(var i=0;i<data.data.length;i++){
      				quicksHtml += "<a href='"+data.data.quickuse[i].href+"' class='quickuse'>"+data.data.quickuse[i].name+"</a>";
      			}
      			quicksHtml +="<a href='javascript:void(0)' onclick='addMoreQuickuse()' class='quickuse'>+添加更多常用功能+</a>";
      			$("#oa-u-use").html(quicksHtml);
				/* 暂无接口实现，前端测试 =====================================*/
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
		/*{directory:[{name:'首页',img:'3wb.com',href:'/goPage?pageName=index'},{name:'联系人',img:'3wb.com',href:'/goPage?pageName=person},{name:'工作',img:'3wb.com',href:'/goPage?pageName=work},{name:'消息',img:'3wb.com',href:'/goPage?pageName=message}],count:4}*/
		$.ajax({
		   url: '/data/system?date='+new Date().getTime(),
      	   type: 'get',
		   data:{},
		   contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		   //调小超时时间会引起异常
		   timeout: 3000,
      		//请求成功后触发
      		success: function (data) {
				alert("success in system");
      			/*测试数据*/

				/* 暂无接口实现，前端测试 =====================================*/
      			var data = {"status":"success","data":{"directory":[{"name":"首页","img":"./jics/images/home.png","href":"index"},{"name":"联系人","img":"./jics/images/friend.png","href":"person"},{"name":"工作","img":"./jics/images/work.png","href":"work"},{"name":"消息","img":"./jics/images/msg.png","href":"message"}],"logo":"./jics/images/logo.png"},"date":"3902392"};
      			/*从服务器获取首页目录信息*/
      			var dirs = data.data.directory;
      			var dirHtml = "";
      			for(var i=0;i<data.data.directory.length;i++){
      				dirHtml += "<a href='javascript:void(0)' onclick='goPage(\""+data.data.directory[i].href+"\")' class='dir check'><div><img src='"+data.data.directory[i].img+"'></div>"+data.data.directory[i].name+"</a>";
      			}
      			
      			$("#oa-m-nav").html(dirHtml);
      			$(".logo").html("<img src='"+data.data.logo+"'/>");
      			/*获取目录信息后，调用goPage函数，让中间Content请求index首页数据*/
      			/*这里也可以直接触发 目录div 下的第一个div的onclik，顺带还可以完成前端逻辑*/
      			goPage(data.data.directory[0].href);
				/* 暂无接口实现，前端测试 =====================================*/


			},
			//请求失败遇到异常触发
			error: function (xhr, errorInfo, ex) { 
				alert("error in system");


				/* 暂无接口实现，前端测试 =====================================*/
      			var data = {"status":"success","data":{"directory":[{"name":"首页","img":"./jics/images/home.png","href":"index"},{"name":"联系人","img":"./jics/images/friend.png","href":"person"},{"name":"工作","img":"./jics/images/work.png","href":"work"},{"name":"消息","img":"./jics/images/msg.png","href":"message"}],"logo":"./jics/images/logo.png"},"date":"3902392"};
      			/*从服务器获取首页目录信息*/
      			var dirs = data.data.directory;
      			var dirHtml = "";
      			for(var i=0;i<data.data.directory.length;i++){
      				dirHtml += "<a href='javascript:void(0)' onclick='goPage(\""+data.data.directory[i].href+"\")' class='dir check'><div><img src='"+data.data.directory[i].img+"'></div>"+data.data.directory[i].name+"</a>";
      			}
      			
      			$("#oa-m-nav").html(dirHtml);
      			$(".logo").html("<img src='"+data.data.logo+"'/>");
      			/*获取目录信息后，调用goPage函数，让中间Content请求index首页数据*/
      			/*这里也可以直接触发 目录div 下的第一个div的onclik，顺带还可以完成前端逻辑*/
      			goPage(data.data.directory[0].href);
				/* 暂无接口实现，前端测试 =====================================*/



			},
			beforeSend: function (xhr) {
				xhr.setRequestHeader('Content-Type', 'application/xml;charset=utf-8');
			},
			//是否异步发送
			async: true
		});
	/* end-4.系统信息获取业务逻辑-------------------------------------------------- */
	}
</script>
</head>
<body>

<div class="g-body">
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
		</div>
	</div>
	<div class="g-head">
		<div class="m-head">
			<div class="sys-title">
				<div class="logo"><img src="./logo.png"></div>
				<div class="title">Simple-OA</div>
			</div>
			<div class="m-nav clearfix" id="oa-m-nav">
				
				<a href="javascript:void(0)" class="dir check">
					<div><img src="./home.png"></div>
					首页
				</a>
				<a href="javascript:void(0)" class="dir">
					<div><img src="./msg.png"></div>
					消息
				</a>
				<a href="javascript:void(0)" class="dir">
					<div><img src="./work.png"></div>
					工作
				</a>
				<a href="javascript:void(0)" class="dir">
					<div><img src="./firend.png"></div>
					联系人
				</a>
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
</body>
</html>