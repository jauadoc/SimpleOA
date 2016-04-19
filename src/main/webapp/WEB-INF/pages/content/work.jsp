<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="com.sun.entity.PageUser,com.sun.utils.ColorUtil" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String uid = request.getParameter("uid");
 %>
<!-- <html> -->
<!-- 	<head> -->
<!-- 		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> -->
<!-- 		<meta http-equiv="content-type" content="text/html;charset=utf-8"> -->
<!-- 		<title>Html日历插件</title> -->
		<style type="text/css">
			.work-content{width:99%;height: 99%;border: none;}
/* 			.work{background:#C0DEED;} */
/* 			.work{position: absolute;top: 5px;left: 3px;width: 100%;height: 100%;overflow: auto;} */
			.choose{width: 23%;height:20%;float: left;border: solid 1px black;margin: 1% 3px;display: block;border-radius: 20px;}
			.choose .icon{float:left;width:20%;height:100%;}
			.choose .title{float:left;width:70%;height:100%;margin-top:10%;margin-bottom:10%;text-align: center;vertical-align: middle;}
			<%
				for(int i=0;i<100;i++){
			%>
					.c-<%=i%>{background: rgb(<%=ColorUtil.getWarmRandomColor()%>);}	
			<%
				}
			%>
		
			
		</style>
		<script type="text/javascript">
			$().ready(function(){
				getFunction();
			});

			function setWorkColor(){
				var chooses = $(".choose");
				for(var i=0;i<chooses.length;i++){
					var classColor = "c-"+i;
					$(chooses[i]).addClass(classColor.toString());
				}
			}
			function getFunction(){
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
		      				html += "<a href='javascript:void(0)' onclick='goPage(\""+data.functions[i].href+"\")' class='choose'><div class='icon'><img src='<%=path %>/"+data.functions[i].icon+"'></div><div class='title'>"+data.functions[i].name+"</div>\</a>";
		      			}
						$(".work").html(html);
						setWorkColor();
					},
					//请求失败遇到异常触发
					error: function (xhr, errorInfo, ex) { 
						alert("error");
					},
					beforeSend: function (xhr) {
						xhr.setRequestHeader('Content-Type', 'application/xml;charset=utf-8');
					},
					//是否异步发送
					async: true
				});
			}
		</script>
<!-- 	</head> -->
<!-- 	<body> -->
		<div class="work-content">
			<div class="work">
				
			</div>
		</div>
<!-- 	</body> -->
<!-- </html> -->