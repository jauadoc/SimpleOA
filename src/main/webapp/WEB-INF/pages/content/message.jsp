<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="com.sun.entity.PageUser" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String uid = request.getParameter("uid");
	PageUser pageUser = (PageUser)request.getSession().getAttribute("pageUser");
 %>

	<meta name="viewport" content="width=device0width,initial-scale=1.0,user-scalable=no">

			<link rel="stylesheet" type="text/css" href="<%=path%>/jics/css/plugin.css">
			<style type="text/css">
				/* 布局样式 */
				.msg-content{width:99%;height: 99%;border: none;}
				.msg-content .left{float:left;width:10%;margin-left:4%;margin-top:2%;border:solid 1px #0085B5;border-right:none;}
				.msg-content .right{float:left;width:70%;margin-top:2%;border:solid 1px #0085B5;}
				
				.msg-from{display: block;}
				
				.msg-title{background: #58ACED;margin-top:0px;height:30px;}
				.msg-title .msg-unit-content{margin-top:0px;}
				.msg-unit{border-bottom: 1px dashed #0085B5;margin-top:3px;margin-bottom:3px;}
				.msg-unit-content{width: 100%;}
				.msg-unit-content div{float:left;}
				.msg-from{float:none;}
				
				
/* 				.msg-unit-content-unit{border-left: dashed 1px black;} */
				.msg-unit-content{overflow:hidden;height: 60px;font: 16px;line-height: 16px;margin-top:5px;margin-left:3px;}
				.msg-unit-content-checkbox{width: 9%;}
				.msg-unit-content-user{width: 14%;cursor: pointer;color:#0000CC;}
				.msg-unit-content-title{width: 14%;cursor: pointer;}
				.msg-unit-content-content{width: 39%;overflow: hidden;text-overflow:elipsis;white-space: nowrap;cursor: pointer;}
				.msg-unit-content-date{width: 19%;}
				.msg-function{height:30px;}
				
				.msg-kind{border-left:none;border-right:none;font-size:20px;margin-top:5px;margin-bottom:5px;margin-left:5px;line-height: 20px;cursor: pointer;text-align: center;border-color:#58ACED;pandding:0px;}
				.check-msg{background: #0085B5;}
				
				.msg-title .msg-unit-content div{cursor: default;color:#333;}
				.msg-bold{font-weight:bold;}
				
				
				
				
				
				
				/* 翻页器 */
				.m-page{margin:10px 0 0;text-align:center;line-height:32px;font-size:0;letter-spacing:-0.307em;*letter-spacing:normal;*word-spacing:-1px;word-wrap:normal;white-space:nowrap;color:#999;}
				.m-page a,.m-page i{display:inline-block;*display:inline;*zoom:1;vertical-align:top;padding:0 12px;margin-left:-1px;border:1px solid #ddd;font-size:12px;letter-spacing:normal;word-spacing:normal;background:#fff;}
				.m-page a,.m-page a:hover{text-decoration:none;color:#39c;}
				.m-page a.first{margin-left:0;}
				.m-page a.last{margin-right:0;}
				.m-page a .pagearr{font-weight:bold;font-family:\5b8b\4f53;vertical-align:top;*vertical-align:middle;}
				.m-page a.pageprv .pagearr{margin-right:3px;}
				.m-page a.pagenxt .pagearr{margin-left:3px;}
				.m-page a:hover{background:#f5f5f5;}
				.m-page a:active{background:#f0f0f0;}
				.m-page a.z-crt,.m-page a.z-crt:hover,.m-page a.z-crt:active{cursor:default;color:#999;background:#f5f5f5;}
				.m-page a.z-dis,.m-page a.z-dis:hover,.m-page a.z-dis:active{cursor:default;color:#ccc;background:#fff;}
				/* 居左 */
				.m-page-lt{text-align:left;}
				/* 居右 */
				.m-page-rt{text-align:right;}
				/* 较小 */
				.m-page-sm{line-height:22px;}
				.m-page-sm a,.m-page-sm i{padding:0 8px;}
				/* 分离 */
				.m-page-sr a,.m-page-sr i{margin:0 3px;}
				.m-page-sr i{border:0;}
			</style>
			<script type="text/javascript">
				$().ready(function(){
					getMessage("message");
				});
				function  getMessage(kind){
					$("input[type='checkbox']").is(':checked');
					var messageKind = "";
					if(kind == "message"){
						messageKind = "1003";
					}else{
						messageKind = "1004";
					}
					var inMessage = new Object();
					inMessage.date = new Date().getTime();
					inMessage.data = messageKind;
					inMessage.uid = <%=uid %>;
					var json = JSON.stringify(inMessage);
					var url = '/m_message/getMessage.do?date=' + new Date().getTime();
					$.ajax({
					   url: '<%=path %>'+url,
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
			      			if(data.data.length<1){
			      				html += "<div class='msg-unit msg-content-detail'>暂无消息</div></div>";
			      			}else{
				      			for(var i=0;i<data.data.length;i++){
				      				var date = new Date(data.data[i].date);
				      				var year=date.getFullYear();
									var day=date.getDate();
									var month=+date.getMonth()+1;
									var dateStr = year+"-"+month+"-"+day;
									if(data.data[i].is_read==102){
					      				html += "<div><div class='msg-unit msg-bold'><div class='msg-unit-content'><div class='msg-unit-content-checkbox msg-unit-content-unit'><input type='checkbox' name='id' value='"+data.data[i].id+"' onclick='checkChoose()'/></div><div class='msg-unit-content-user msg-unit-content-unit'><div class='msg-from' onclick='showUser("+data.data[i].sender+")'>"+data.data[i].sender_name+"</div></div><div class='msg-unit-content-title msg-unit-content-unit' onclick='showMsgDetail(this)'>"+data.data[i].title+"</div><div class='msg-unit-content-content msg-unit-content-unit' onclick='showMsgDetail(this)'>"+data.data[i].content+"</div><div class='msg-unit-content-date msg-unit-content-unit' onclick='showMsgDetail(this)'>"+dateStr+"</div></div></div><div class='msg-unit msg-content-detail hidden'>"+data.data[i].content+"</div></div>";
									}else{
					      				html += "<div><div class='msg-unit'><div class='msg-unit-content'><div class='msg-unit-content-checkbox msg-unit-content-unit'><input type='checkbox' name='id' value='"+data.data[i].id+"' onclick='checkChoose()'/></div><div class='msg-unit-content-user msg-unit-content-unit'><div class='msg-from' onclick='showUser("+data.data[i].sender+")'>"+data.data[i].sender_name+"</div></div><div class='msg-unit-content-title msg-unit-content-unit' onclick='showMsgDetail(this)'>"+data.data[i].title+"</div><div class='msg-unit-content-content msg-unit-content-unit' onclick='showMsgDetail(this)'>"+data.data[i].content+"</div><div class='msg-unit-content-date msg-unit-content-unit' onclick='showMsgDetail(this)'>"+dateStr+"</div></div></div><div class='msg-unit msg-content-detail hidden'>"+data.data[i].content+"</div></div>";
									}
				      			}
			      			}
			      			html+="<input type='hidden' id='message-type' value='"+kind+"'>";
			      			$("#msg-data").html(html);
						},
						//请求失败遇到异常触发
						error: function (xhr, errorInfo, ex) { 
							showMsg("消息信息请求失败","error");
						},
						beforeSend: function (xhr) {
							xhr.setRequestHeader('Content-Type', 'application/xml;charset=utf-8');
						},
						//是否异步发送
						async: true
					});
				}
				function deleteMessage(){
					//获取前端选中数据
					var checkboxs = $("input[name='id']");
					var messageIds = "";
					for(var i=0;i<checkboxs.length;i++){
						if($(checkboxs[i]).is(":checked")){
							messageIds += $(checkboxs[i]).val() + ",";
						}
					}
					messageIds = messageIds.substring(0, messageIds.length-1);
					
					//拼接json请求数据库
					var inMessage = new Object();
					inMessage.date = new Date().getTime();
					inMessage.data = messageIds;
					inMessage.uid = <%=uid %>;
					var json = JSON.stringify(inMessage);
					var url = '/m_message/deleteMessage.do?date=' + new Date().getTime();
					$.ajax({
					   url: '<%=path %>'+url,
			      	   type: 'post',
					   data:{data:json},
					   contentType: "application/x-www-form-urlencoded; charset=UTF-8",
					   //调小超时时间会引起异常
					    timeout: 3000,
			      		//请求成功后触发
			      		success: function (data) {
			      			showMsg("删除成功","success");
			      			var kind = $("#message-type").val();
			      			getMessage(kind);
			      			$("#msg-delete").addClass("hidden");
						},
						//请求失败遇到异常触发
						error: function (xhr, errorInfo, ex) { 
							showMsg("删除失败，请重新尝试","error");
						},
						beforeSend: function (xhr) {
							xhr.setRequestHeader('Content-Type', 'application/xml;charset=utf-8');
						},
						//是否异步发送
						async: true
					});
				}
				
				var mark =0;
				function msg_chooseAll(){
					if(mark%2==0){
						$("input[name='id']").attr("checked",true);  
					}else{
						$("input[name='id']").attr("checked",false);  
					}
					mark++;
					checkChoose();
				}
				function checkChoose(){
					//点击全选，反选时
					var checkboxs = $("input[name='id']");
					var mark = 0;
					var markAllChoose = true;
					var markAllUnChoose = true;
					for(var i=0;i<checkboxs.length;i++){
						if($(checkboxs[i]).is(":checked")){
							mark ++;
							markAllUnChoose = false;
						}else{
							markAllChoose = false;
						}
					}
					if(markAllChoose){
						$("#chooseAll").attr("checked",true);
					}else{
						$("#chooseAll").attr("checked",false);
					}
					if(markAllUnChoose){
						$("#chooseAll").attr("checked",false);
					}
					
					//删除按钮是否显示
					if(mark>0){
						$(".msg-function").removeClass("hidden");
					}else{
						$(".msg-function").addClass("hidden");
					}
					mark = 0;
				}
				//显示消息详细content
				function showMsgDetail(node){
					var detail = $(node).parent().parent().parent().children(".msg-content-detail");
					var val=$(detail).attr("class");//这里获取class值
					var classes=val.split(" ");
					for(var i=0;i<classes.length;i++){
						//显示content
						if(classes[i]=="hidden"){
							//显示content
							$(detail).removeClass("hidden");
							
							//显示的同时，请求服务器，将该信息的is_read改为101，即已读
							var mid = $(node).parent().children(".msg-unit-content-checkbox").children("input").val();
							var inMessage = new Object();
							inMessage.date = new Date().getTime();
							inMessage.data = mid;
							inMessage.uid = <%=uid %>;
							var json = JSON.stringify(inMessage);
							var url = '/m_message/setMessageIsRead.do?date=' + new Date().getTime();
							$.ajax({
							   url: '<%=path %>'+url,
					      	   type: 'post',
							   data:{data:json},
							   contentType: "application/x-www-form-urlencoded; charset=UTF-8",
							   //调小超时时间会引起异常
							    timeout: 3000,
					      		//请求成功后触发
					      		success: function (data) {
					      			 $(node).parent().parent().removeClass("msg-bold");
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
							break;
						}else{
							$(detail).addClass("hidden");
						}
					}
					
				}
				function showUser(uid){
					alert(uid);
				}
				function changeBack(node){
					var kinds = $(node).parent().parent().children(".msg-kind");
					for(var i=0;i<kinds.length;i++){
						$(kinds[i]).removeClass("check-msg");
					}
					$(node).parent().addClass("check-msg");
				}
			</script>
			<div class="msg-content">
				<div class="left sun-border-elegance">
					<div>
						<div class="msg-kind check-msg  sun-border-elegance" onclick="getMessage('message')"><div onclick="changeBack(this)">消息</div></div>
						<div class="msg-kind  sun-border-elegance" onclick="getMessage('systemMessage')"><div onclick="changeBack(this)">系统消息</div></div>
					</div>
				</div>
				<div class="right sun-border-elegance">
					<!-- 2.邮件unit-model,未来集成邮件功能的模块显示，参考qq邮箱样式 -->
					<!-- 1.消息unit-model -->
					<div class="msg-title sun-border-elegance">
						<div class="msg-unit-content">
							<div class="msg-unit-content-checkbox msg-unit-content-unit"><input type="checkbox" value="msg-id" onchange="msg_chooseAll()" id="chooseAll"/></div>
							<div class="msg-unit-content-user msg-unit-content-unit">
								<div class="msg-from"></div>
								<div class="msg-from">发件人</div>
							</div>
							<div class="msg-unit-content-title msg-unit-content-unit">消息名</div>
							<div class="msg-unit-content-content msg-unit-content-unit">消息内容</div>
							<div class="msg-unit-content-date msg-unit-content-unit">消息时间</div>
						</div>
					</div>

					<div id="msg-data">
					
					</div>
					<div class="msg-unit msg-function hidden" id="msg-delete">
						<div class="msg-unit-content msg-function">
							<div class="msg-unit-content-checkbox msg-unit-content-unit">&nbsp</div>
							<div class="msg-unit-content-user msg-unit-content-unit">&nbsp
							</div>
							<div class="msg-unit-content-title msg-unit-content-unit">&nbsp
							</div>
							<div class="msg-unit-content-content msg-unit-content-unit">&nbsp</div>
							<div class="msg-unit-content-date msg-unit-content-unit"><div class="u-btn" onclick="deleteMessage()">删除</div> </div>
						</div>
					</div>
<!-- 				<div class="m-page m-page-sr m-page-sm"> -->
<!-- 				    <a href="#" class="first pageprv z-dis"><span class="pagearr">&lt;</span>上一页</a> -->
<!-- 				    <a href="#">1</a> -->
<!-- 				    <a href="#" class="z-crt">2</a> -->
<!-- 				    <a href="#">3</a> -->
<!-- 				    <a href="#">4</a> -->
<!-- 				    <i>...</i> -->
<!-- 				    <a href="#">10</a> -->
<!-- 				    <a href="#" class="last pagenxt">下一页<span class="pagearr">&gt;</span></a> -->
<!-- 				</div> -->
				</div>
				
			</div>
			

