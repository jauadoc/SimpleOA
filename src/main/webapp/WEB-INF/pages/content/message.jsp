<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="com.sun.entity.PageUser" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String uid = request.getParameter("uid");
	PageUser pageUser = (PageUser)request.getSession().getAttribute("pageUser");
 %>


			<link rel="stylesheet" type="text/css" href="<%=path%>/jics/css/plugin.css">
			<style type="text/css">
				/* 布局样式 */
				.msg-content{width:99%;height: 99%;border: none;}
				.msg-content .left{float:left;width:20%;margin-left:2%;margin-top:2%;border:solid 1px #0085B5;border-right:none;}
				.msg-content .right{float:left;width:70%;margin-top:2%;border:solid 1px #0085B5;}
				
				.msg-from{display: block;}
				
				.msg-title{background: #58ACED;margin-top:0px;height:30px;}
				.msg-title .msg-unit-content{margin-top:0px;}
				.msg-unit{height:55px;border-bottom: 1px dashed #0085B5;margin-top:3px;margin-bottom:3px;}
				.msg-unit-content{width: 100%;height:50px;}
				.msg-unit-content div{float:left;}
				.msg-from{float:none;}
				
/* 				.msg-unit-content-unit{border-left: dashed 1px black;} */
				.msg-unit-content{overflow:hidden;height: 60px;font: 16px;line-height: 16px;margin-top:5px;margin-left:3px;}
				.msg-unit-content-checkbox{width: 9%;}
				.msg-unit-content-user{width: 14%;}
				.msg-unit-content-title{width: 14%;}
				.msg-unit-content-content{width: 39%;}
				.msg-unit-content-date{width: 19%;}
				.msg-function{height:30px;}
				
				.msg-kind{border-bottom:dashed 1px #313B36;padding-top:15px;padding-bottom:5px;font-size:20px;line-height: 20px;cursor: pointer;text-align: center;}
				.check-msg{background: #0085B5;}
				
				
				
				
				
				
				
				
				
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
				function  getMessage(kind){
					$("input[type='checkbox']").is(':checked') 
					if(kind=="message"){
						var inMessage = new Object();
						inMessage.date = new Date().getTime();
						inMessage.data = "";
						inMessage.uid = <%=uid %>;
						var json = JSON.stringify(inMessage);
						$.ajax({
						   url: '<%=path %>/data/getMessage.do?date='+ new Date().getTime(),
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
				      				
				      			}
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
					}else if(kind=="systemMessage"){
						alert("syse");
					}
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
					var checkboxs = $("input[name='id']");
					var mark = 0;
					for(var i=0;i<checkboxs.length;i++){
						if($(checkboxs[i]).is(":checked")){
							mark ++;
						}
					}
					if(mark>0){
						$(".msg-function").removeClass("hidden");
					}else{
						$(".msg-function").addClass("hidden");
					}
					mark = 0;
				}
			</script>
			<div class="msg-content">
				<div class="left">
					<div>
						<div class="msg-kind check-msg" onclick="getMessage('message')">消息</div>
						<div class="msg-kind">邮件</div>
						<div class="msg-kind" onclick="getMessage('systemMessage')">系统消息</div>
					</div>
				</div>
				<div class="right">
					<!-- 2.邮件unit-model,未来集成邮件功能的模块显示，参考qq邮箱样式 -->
					<!-- 1.消息unit-model -->
					<div class="msg-title">
						<div class="msg-unit-content">
							<div class="msg-unit-content-checkbox msg-unit-content-unit"><input type="checkbox" value="msg-id" onchange="msg_chooseAll()"/>全选</div>
							<div class="msg-unit-content-user msg-unit-content-unit">
								<div class="msg-from"></div>
								<div class="msg-from">发件人</div>
							</div>
							<div class="msg-unit-content-title msg-unit-content-unit">消息名</div>
							<div class="msg-unit-content-content msg-unit-content-unit">消息内容</div>
							<div class="msg-unit-content-date msg-unit-content-unit">消息时间</div>
						</div>
						<div class="msg-split"></div>
					</div>
					<div class="msg-unit">
						<div class="msg-unit-content">
							<div class="msg-unit-content-checkbox msg-unit-content-unit"><input type="checkbox" name="id" value="msg-id" onclick="checkChoose()"/></div>
							<div class="msg-unit-content-user msg-unit-content-unit">
								<div class="msg-from"><img src="./jics/images/index.png" /></div>
								<div class="msg-from">发件人</div>
							</div>
							<div class="msg-unit-content-title msg-unit-content-unit">这是个消息啊</div>
							<div class="msg-unit-content-content msg-unit-content-unit">我他喜娃他</div>
							<div class="msg-unit-content-date msg-unit-content-unit">2016年4月19日 </div>
						</div>
						<div class="msg-split"></div>
					</div>
					<div class="msg-unit">
						<div class="msg-unit-content">
							<div class="msg-unit-content-checkbox msg-unit-content-unit"><input type="checkbox" name="id" value="msg-id" onclick="checkChoose()"/></div>
							<div class="msg-unit-content-user msg-unit-content-unit">
								<div class="msg-from"><img src="./jics/images/index.png" /></div>
								<div class="msg-from">发件人</div>
							</div>
							<div class="msg-unit-content-title msg-unit-content-unit">这是个消息啊</div>
							<div class="msg-unit-content-content msg-unit-content-unit">我他喜娃他</div>
							<div class="msg-unit-content-date msg-unit-content-unit">2016年4月19日 </div>
						</div>
						<div class="msg-split"></div>
					</div>
					<div class="msg-unit">
						<div class="msg-unit-content">
							<div class="msg-unit-content-checkbox msg-unit-content-unit"><input type="checkbox" name="id" value="msg-id" onclick="checkChoose()"/></div>
							<div class="msg-unit-content-user msg-unit-content-unit">
								<div class="msg-from"><img src="./jics/images/index.png" /></div>
								<div class="msg-from">发件人</div>
							</div>
							<div class="msg-unit-content-title msg-unit-content-unit">这是个消息啊</div>
							<div class="msg-unit-content-content msg-unit-content-unit">我他喜娃他</div>
							<div class="msg-unit-content-date msg-unit-content-unit">2016年4月19日 </div>
						</div>
						<div class="msg-split"></div>
					</div>
					<div class="msg-unit">
						<div class="msg-unit-content">
							<div class="msg-unit-content-checkbox msg-unit-content-unit"><input type="checkbox" name="id" value="msg-id" onclick="checkChoose()"/></div>
							<div class="msg-unit-content-user msg-unit-content-unit">
								<div class="msg-from"><img src="./jics/images/index.png" /></div>
								<div class="msg-from">发件人</div>
							</div>
							<div class="msg-unit-content-title msg-unit-content-unit">这是个消息啊</div>
							<div class="msg-unit-content-content msg-unit-content-unit">我他喜娃他</div>
							<div class="msg-unit-content-date msg-unit-content-unit">2016年4月19日 </div>
						</div>
						<div class="msg-split"></div>
					</div>
					<div class="msg-unit">
						<div class="msg-unit-content">
							<div class="msg-unit-content-checkbox msg-unit-content-unit"><input type="checkbox" name="id" value="msg-id" onclick="checkChoose()"/></div>
							<div class="msg-unit-content-user msg-unit-content-unit">
								<div class="msg-from"><img src="./jics/images/index.png" /></div>
								<div class="msg-from">发件人</div>
							</div>
							<div class="msg-unit-content-title msg-unit-content-unit">这是个消息啊</div>
							<div class="msg-unit-content-content msg-unit-content-unit">我他喜娃他</div>
							<div class="msg-unit-content-date msg-unit-content-unit">2016年4月19日 </div>
						</div>
						<div class="msg-split"></div>
					</div>					
					<div class="msg-unit msg-function hidden">
						<div class="msg-unit-content msg-function">
							<div class="msg-unit-content-checkbox msg-unit-content-unit">&nbsp</div>
							<div class="msg-unit-content-user msg-unit-content-unit">&nbsp
							</div>
							<div class="msg-unit-content-title msg-unit-content-unit">&nbsp</div>
							<div class="msg-unit-content-content msg-unit-content-unit">&nbsp</div>
							<div class="msg-unit-content-date msg-unit-content-unit"><div class="u-btn">删除</div> </div>
						</div>
						<div class="msg-split"></div>
					</div>
					
				<div class="m-page m-page-sr m-page-sm">
				    <a href="#" class="first pageprv z-dis"><span class="pagearr">&lt;</span>上一页</a>
				    <a href="#">1</a>
				    <a href="#" class="z-crt">2</a>
				    <a href="#">3</a>
				    <a href="#">4</a>
				    <i>...</i>
				    <a href="#">10</a>
				    <a href="#" class="last pagenxt">下一页<span class="pagearr">&gt;</span></a>
				</div>
				</div>
				
			</div>
			

