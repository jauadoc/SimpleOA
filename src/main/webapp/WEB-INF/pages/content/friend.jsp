<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="com.sun.entity.PageUser" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String uid = request.getParameter("uid");
	PageUser pageUser = (PageUser)request.getSession().getAttribute("pageUser");
 %>
<!--
查找好友方法：
	1.老方法： 利用滚动条自带函数来定位搜索好友，然后需要给好友的user-data-online 添加好友名称及姓的class
	2.前端遍历所有.user-data-online，如果对应div的昵称中包含 搜索关键字 ，则将该div removeClass("hidden")，否则则addClass("hidden")，如果搜索框为空，则全部removeClass("hidden")
  -->
	<meta name="viewport" content="width=device0width,initial-scale=1.0,user-scalable=no">

			<style type="text/css">
				/*.right{position: absolute;left: 70%;top: 5px;}*/
				.work-body{}
				.left{float: left;width: 30%;}
				.right{margin-left: 30%;}
				.left .msg{border:solid 3px #0085B5;margin:5px auto;width: 60%;height: 450px;overflow: auto;border-radius:8px;padding:8px;}
				.right .detail{border:solid 2px #0085B5;width: 80%;height:450px;overflow: auto;border-radius:4px;padding:4px;}
				
				.detail{width: 100%;margin-top:5px;}
				.user-data-online{margin:2%;width: 96%;border-bottom:dashed 1px #0085B5;}
				.user-data-online div{display: inline-block;}
				.user-data-title{width: 20%;margin-left:3%;}
				.user-data-content{width: 70%;}
				
				
				.frd-unit{margin:3px;border:solid 1px #616B66;cursor:pointer;}
				.user-sketch{display: inline-block;}
				.user-head{width: 30%;}
				.user-nick{width: 60%;vertical-align:middle;text-align: center;}
				.msg .sun-border-elegance{border-color:#58ACED;}
				.msg{background: #EEE;}
				.msg-inner{background: #FFF;}
				
				.msg-seach{margin:0 auto;width: 98%;}
				.msg-seach input{width: 70%;}
				.msg-seach .sun-button-blue{font-size: 12px;line-height: 12px;width: 10%;height: 12px;display: inline;}
				
				#friend-head{width:80px;height:80px;border:solid 1px black;overflow: hidden;}
				.friendlist-head{width:30px;height: 30px;border:solid 1px black;overflow: hidden;}
			</style>
			<!-- 滚动条插件。如果所有放在该处，会导致切换页面数据请求异常，虽然未找到原因，暂且这样处理。 -->
			<script src="<%=path %>/jics/js/jquery.mousewheel.min.js"></script>
			<script src="<%=path %>/jics/js/jquery.mCustomScrollbar.js"></script>
			<script type="text/javascript">
				
				$(document).ready(function(e){
					(function($){
				            $(".msg").mCustomScrollbar({
				            	 theme:"dark"
				            });
				    })(jQuery);
				    getFriend();
				});
			
				function showUser(node){
					var user = $(node).children("div").children("input").val();
					getFriendInfo(user);
				}
				
// 				function msg_seach_friend(){
// 					var friends = $(".msg-inner").children(".frd-unit");
// 					for(var i=0;i<friends.length;i++){
// 						$(friends[i]).removeClass("sun-notice-light");
// 					}
// 					var friend = "."+$("#msg-seach-input").val();
// 					$(".msg").mCustomScrollbar("scrollTo",friend); 
// 					$(friend).addClass("sun-notice-light");
// 				}
				function msg_seach_friend(){
					var friendname = $("#msg-seach-input").val();
					var friends = $(".msg-inner");
					for(var i=0;i<friends.length;i++){
						var content = $(friends[i]).html();
						if(content.indexOf(friendname)>0){
							$(friends[i]).removeClass("hidden");
						}else{
							$(friends[i]).addClass("hidden");
						}
						if(friendname=="" || friendname==null){
							$(friends[i]).removeClass("hidden");
						}
					}
				}
				document.onkeydown = function(e){
					if(!e) e = window.event;
					if((e.keyCode || e.which) == 13){
						msg_seach_friend();
					}
				}

				/* 获取联系人信息  */
				function getFriend(){
					var inMessage = new Object();
					inMessage.date = new Date().getTime();
					inMessage.uid = <%=uid %>;
					var json = JSON.stringify(inMessage);
					var url = '/m_friend/getFriend.do?date=' + new Date().getTime();
					$.ajax({
					   url: '<%=path %>'+url,
			      	   type: 'get',
					   data:{data:json},
					   contentType: "application/x-www-form-urlencoded; charset=UTF-8",
					    timeout: 3000,
			      		success: function (data) {
// 							data = {"status":"success","data":[{"uid":"1","head":"xx.png","name":"张三"},{"uid":"2","head":"xx.png","name":"李四"}],"date":"1465785341711"};
			      			data = JSON.parse(data);
			      			var html = "";
			      			var firends = data.data;
			      			for(var i=0;i<firends.length;i++){
			      				html += "<div class='msg-inner sun-border-default'><div class='frd-unit sun-border-elegance' onclick='showUser(this)'><div><div><div class='user-head user-sketch friendlist-head'><img src='"+firends[i].head+"' class='friendlist-head'/></div><div class='user-nick user-sketch'>"+firends[i].name+"</div></div><input type='hidden' value='"+firends[i].uid+"' /></div></div></div>";
			      			}
			      			$("#friend-firends").html(html);
						},
						error: function (xhr, errorInfo, ex) { 
							showMsg("联系人信息获取失败","error",0.5);
// 							data = {"status":"success","data":[{"uid":"1","head":"xx.png","name":"张三"},{"uid":"2","head":"xx.png","name":"李四"}],"date":"1465785341711"};
// 							data = {"status":"success","data":[{"uid":"1","head":"xx.png","name":"张4三"},{"uid":"2","head":"xx.png","name":"张3三"},{"uid":"","head":"xx.png","name":"张2三"},{"uid":"3","head":"xx.png","name":"张1三"}],"date":"1465785341711"};
// 			      			data = JSON.parse(data);
// 			      			var html = "";
// 			      			var firends = data.data;
// 			      			for(var i=0;i<firends.length;i++){
// 			      				html += "<div class='msg-inner sun-border-default'><div class='frd-unit sun-border-elegance' onclick='showUser(this)'><div><div><div class='user-head user-sketch'><img src='"+firends[i].head+"'/></div><div class='user-nick user-sketch'>"+firends[i].name+"</div></div><input type='hidden' value='"+firends[i].uid+"' /></div></div></div>";
// 			      			}
// 			      			$("#friend-firends").html(html);
						},
						beforeSend: function (xhr) {
							xhr.setRequestHeader('Content-Type', 'application/xml;charset=utf-8');
						},
						async: true
					});
				}	
				/*  */
				function getFriendInfo(fid){
					$(".detail").html("<div><div class='user-data-online'><div class='user-data-title'>头像</div><div class='user-data-content'id='friend-head'></div></div><div class='user-data-online'><div class='user-data-title'>姓名</div><div class='user-data-content'id='friend-name'></div></div><div class='user-data-online'><div class='user-data-title'>性别</div><div class='user-data-content'id='friend-gender'></div></div><div class='user-data-online'><div class='user-data-title'>生日</div><div class='user-data-content'id='friend-birthday'></div></div><div class='user-data-online'><div class='user-data-title'>部门</div><div class='user-data-content'id='friend-department'></div></div><div class='user-data-online'><div class='user-data-title'>职位</div><div class='user-data-content'id='friend-job'></div></div><div class='user-data-online'><div class='user-data-title'>邮箱</div><div class='user-data-content'id='friend-email'></div></div><div class='user-data-online'><div class='user-data-title'>分机号</div><div class='user-data-content'id='friend-tel_phone'></div></div><div class='user-data-online'><div class='user-data-title'>移动电话</div><div class='user-data-content'id='friend-mobile_phone'></div></div></div> ");
					var inMessage = new Object();
					inMessage.date = new Date().getTime();
					inMessage.uid = <%=uid %>;
					inMessage.data = fid;
					var json = JSON.stringify(inMessage);
					var url = '/m_friend/getFriendInfo.do?date=' + new Date().getTime();
					$.ajax({
					   url: '<%=path %>'+url,
			      	   type: 'get',
					   data:{data:json},
					   contentType: "application/x-www-form-urlencoded; charset=UTF-8",
					    timeout: 3000,
			      		success: function (data) {
// 							data = {"status":"success","data":[{"name":"张三","birthday":"2016年6月22日 14","tel_phone":"1313111111","job":"软件工程师"}],"date":"1465785341711"};
			      			data = JSON.parse(data);
			      			var html = "";
			      			var friendInfo = data.data[0];
			      			$("#friend-head").html("<img src='"+friendInfo.head+"'/>");
			      			$("#friend-name").html(friendInfo.name);
			      			$("#friend-gender").html(friendInfo.gender);
			      			$("#friend-birthday").html(friendInfo.birthday);
			      			$("#friend-department").html(friendInfo.department);
			      			$("#friend-job").html(friendInfo.job);
			      			$("#friend-email").html(friendInfo.email);
			      			$("#friend-tel_phone").html(friendInfo.tel_phone);
			      			$("#friend-mobile_phone").html(friendInfo.mobile_phone);
						},
						error: function (xhr, errorInfo, ex) { 
							showMsg("联系人详细信息获取失败","error");
// 							data = {"status":"success","data":[{"name":"张三","birthday":"2016年6月22日 14","tel_phone":"8100-103","gender":"男","department":"技术部","email":"abc@qq.com","mobile_phone":"12312312311","job":"软件工程师"}],"date":"1465785341711"};
// 			      			data = JSON.parse(data);
// 			      			var html = "";
// 			      			var friendInfo = data.data[0];
// 			      			$("#friend-head").html("<img src='"+friendInfo.head+"'/>");
// 			      			$("#friend-name").html(friendInfo.name);
// 			      			$("#friend-gender").html(friendInfo.gender);
// 			      			$("#friend-birthday").html(friendInfo.birthday);
// 			      			$("#friend-department").html(friendInfo.department);
// 			      			$("#friend-job").html(friendInfo.job);
// 			      			$("#friend-eamil").html(friendInfo.eamil);
// 			      			$("#friend-tel_phone").html(friendInfo.tel_phone);
// 			      			$("#friend-mobile_phone").html(friendInfo.mobile_phone);
						},
						beforeSend: function (xhr) {
							xhr.setRequestHeader('Content-Type', 'application/xml;charset=utf-8');
						},
						async: true
					});
				}	
			</script>
			<div class="work-body">
			
				<div class="left">
					<div class="msg">
					<div class="msg-seach sun-border-default">
						<input type="text" class="sun-input-default" id="msg-seach-input">
						<span class="sun-button-blue" onclick="msg_seach_friend()" >S</span>
					
					</div>
						<!-- data start  -->							
						<div id="friend-firends">
<!-- 							<div class="msg-inner sun-border-default"><div class="frd-unit sun-border-elegance" onclick="showUser(this)"><div><div><div class="user-head user-sketch"><img src="www.baidu.com"/></div><div class="user-nick user-sketch">昵称</div></div><input type="hidden" value="1" /></div></div></div> -->
<!-- 							<div class="msg-inner sun-border-default"><div class="frd-unit sun-border-elegance" onclick="showUser(this)"><div><div><div class="user-head user-sketch"><img src="www.baidu.com"/></div><div class="user-nick user-sketch">昵称</div></div><input type="hidden" value="1" /></div></div></div> -->
<!-- 							<div class="msg-inner sun-border-default"><div class="frd-unit sun-border-elegance" onclick="showUser(this)"><div><div><div class="user-head user-sketch"><img src="www.baidu.com"/></div><div class="user-nick user-sketch">昵称</div></div><input type="hidden" value="1" /></div></div></div> -->
						</div>
						<!-- data end -->
					</div>
				</div>
				<div class="right">
					<div class="detail">
<!-- 						<div> -->
<!-- 							<div class="user-data-online"> -->
<!-- 								<div class="user-data-title">头像</div> -->
<!-- 								<div class="user-data-content" id="friend-head"></div> -->
<!-- 							</div> -->
<!-- 							<div class="user-data-online"> -->
<!-- 								<div class="user-data-title">姓名</div> -->
<!-- 								<div class="user-data-content" id="friend-name"></div> -->
<!-- 							</div> -->
<!-- 							<div class="user-data-online"> -->
<!-- 								<div class="user-data-title">性别</div> -->
<!-- 								<div class="user-data-content" id="friend-gender"></div> -->
<!-- 							</div> -->
<!-- 							<div class="user-data-online"> -->
<!-- 								<div class="user-data-title">生日</div> -->
<!-- 								<div class="user-data-content" id="friend-birthday"></div> -->
<!-- 							</div> -->
<!-- 							<div class="user-data-online"> -->
<!-- 								<div class="user-data-title">部门</div> -->
<!-- 								<div class="user-data-content" id="friend-department"></div> -->
<!-- 							</div> -->
<!-- 							<div class="user-data-online"> -->
<!-- 								<div class="user-data-title">职位</div> -->
<!-- 								<div class="user-data-content" id="friend-job"></div> -->
<!-- 							</div> -->
<!-- 							<div class="user-data-online"> -->
<!-- 								<div class="user-data-title">邮箱</div> -->
<!-- 								<div class="user-data-content" id="friend-email"></div> -->
<!-- 							</div> -->
<!-- 							<div class="user-data-online"> -->
<!-- 								<div class="user-data-title">分机号</div> -->
<!-- 								<div class="user-data-content" id="friend-tel_phone"></div> -->
<!-- 							</div> -->
<!-- 							<div class="user-data-online"> -->
<!-- 								<div class="user-data-title">移动电话</div> -->
<!-- 								<div class="user-data-content" id="friend-mobile_phone"></div> -->
<!-- 							</div> -->
<!-- 						</div> -->
					</div>
				</div>
			</div>
