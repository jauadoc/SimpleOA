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
				.user-nick{width: 60%;vertical-align:middle;}
				.msg .sun-border-elegance{border-color:#58ACED;}
				.msg{background: #EEE;}
				.msg-inner{background: #FFF;}
				
				.msg-seach{margin:0 auto;width: 98%;}
				.msg-seach input{width: 70%;}
				.msg-seach .sun-button-blue{font-size: 12px;line-height: 12px;width: 10%;height: 12px;display: inline;}
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
				});
			
				function showUser(node){
					var user = $(node).children("div").children("input").val();
					alert(user);
				}
				
				function msg_seach_friend(){
					var friends = $(".msg-inner").children(".frd-unit");
					for(var i=0;i<friends.length;i++){
						$(friends[i]).removeClass("sun-notice-light");
					}
					var friend = "."+$("#msg-seach-input").val();
					$(".msg").mCustomScrollbar("scrollTo",friend); 
					$(friend).addClass("sun-notice-light");
				}
				document.onkeydown = function(e){
					if(!e) e = window.event;
					if((e.keyCode || e.which) == 13){
						msg_seach_friend();
					}
				}
							
			</script>
			<div class="work-body">
			
				<div class="left">
					<div class="msg">
					<div class="msg-seach sun-border-default">
						<input type="text" class="sun-input-default" id="msg-seach-input">
						<span class="sun-button-blue" onclick="msg_seach_friend()" >S</span>
					
					</div>
						<div class="msg-inner sun-border-default">
							<!-- data start  -->							
								<div class="frd-unit sun-border-elegance" onclick="showUser(this)">
								<div>
									<div>
										<div class="user-head user-sketch">
											头像
											头像
											头像
										</div>
										<div class="user-nick user-sketch">
											昵称
										</div>
									</div>
									<input type="hidden" value="1" />
								</div>
							</div>
						
							
							<div class="frd-unit sun-border-elegance" onclick="showUser(this)">
								<div>
									<div>
										<div class="user-head user-sketch">
											头像
										</div>
										<div class="user-nick user-sketch">
											昵称
										</div>
									</div>
									<input type="hidden" value="1" />
								</div>
							</div>
						
							
							<div class="frd-unit sun-border-elegance" onclick="showUser(this)">
								<div>
									<div>
										<div class="user-head user-sketch">
											头像
										</div>
										<div class="user-nick user-sketch">
											昵称
										</div>
									</div>
									<input type="hidden" value="1" />
								</div>
							</div>
						
							
							<div class="frd-unit sun-border-elegance" onclick="showUser(this)">
								<div>
									<div>
										<div class="user-head user-sketch">
											头像
										</div>
										<div class="user-nick user-sketch">
											昵称
										</div>
									</div>
									<input type="hidden" value="1" />
								</div>
							</div>
						
							
							<div class="frd-unit sun-border-elegance" onclick="showUser(this)">
								<div>
									<div>
										<div class="user-head user-sketch">
											头像
										</div>
										<div class="user-nick user-sketch">
											昵称
										</div>
									</div>
									<input type="hidden" value="1" />
								</div>
							</div>
						
							
							<div class="frd-unit sun-border-elegance" onclick="showUser(this)">
								<div>
									<div>
										<div class="user-head user-sketch">
											头像
										</div>
										<div class="user-nick user-sketch">
											昵称
										</div>
									</div>
									<input type="hidden" value="1" />
								</div>
							</div>
						
							
							<div class="frd-unit sun-border-elegance" onclick="showUser(this)">
								<div>
									<div>
										<div class="user-head user-sketch">
											头像
										</div>
										<div class="user-nick user-sketch">
											昵称
										</div>
									</div>
									<input type="hidden" value="1" />
								</div>
							</div>
						
							
							<div class="frd-unit sun-border-elegance" onclick="showUser(this)">
								<div>
									<div>
										<div class="user-head user-sketch">
											头像
										</div>
										<div class="user-nick user-sketch">
											昵称
										</div>
									</div>
									<input type="hidden" value="1" />
								</div>
							</div>
						
							
							<div class="frd-unit sun-border-elegance" onclick="showUser(this)">
								<div>
									<div>
										<div class="user-head user-sketch">
											头像
										</div>
										<div class="user-nick user-sketch">
											昵称
										</div>
									</div>
									<input type="hidden" value="1" />
								</div>
							</div>
						
							
							<div class="frd-unit sun-border-elegance" onclick="showUser(this)">
								<div>
									<div>
										<div class="user-head user-sketch">
											头像
										</div>
										<div class="user-nick user-sketch">
											昵称
										</div>
									</div>
									<input type="hidden" value="1" />
								</div>
							</div>
						
							
							<div class="frd-unit sun-border-elegance" onclick="showUser(this)">
								<div>
									<div>
										<div class="user-head user-sketch">
											头像
										</div>
										<div class="user-nick user-sketch">
											昵称
										</div>
									</div>
									<input type="hidden" value="1" />
								</div>
							</div>
						
							
							<div class="frd-unit sun-border-elegance" onclick="showUser(this)">
								<div>
									<div>
										<div class="user-head user-sketch">
											头像
										</div>
										<div class="user-nick user-sketch">
											昵称
										</div>
									</div>
									<input type="hidden" value="1" />
								</div>
							</div>
						
							
							<div class="frd-unit sun-border-elegance" onclick="showUser(this)">
								<div>
									<div>
										<div class="user-head user-sketch">
											头像
										</div>
										<div class="user-nick user-sketch">
											昵称
										</div>
									</div>
									<input type="hidden" value="1" />
								</div>
							</div>
						
							
							<div class="frd-unit sun-border-elegance" onclick="showUser(this)">
								<div>
									<div>
										<div class="user-head user-sketch">
											头像
										</div>
										<div class="user-nick user-sketch">
											昵称
										</div>
									</div>
									<input type="hidden" value="1" />
								</div>
							</div>
						
							
							<div class="frd-unit sun-border-elegance" onclick="showUser(this)">
								<div>
									<div>
										<div class="user-head user-sketch">
											头像
										</div>
										<div class="user-nick user-sketch">
											昵称
										</div>
									</div>
									<input type="hidden" value="1" />
								</div>
							</div>
						
							
							<div class="frd-unit sun-border-elegance" onclick="showUser(this)">
								<div>
									<div>
										<div class="user-head user-sketch">
											头像
										</div>
										<div class="user-nick user-sketch">
											昵称
										</div>
									</div>
									<input type="hidden" value="1" />
								</div>
							</div>
						
							
							<div class="frd-unit sun-border-elegance" onclick="showUser(this)">
								<div>
									<div>
										<div class="user-head user-sketch">
											头像
										</div>
										<div class="user-nick user-sketch">
											昵称
										</div>
									</div>
									<input type="hidden" value="1" />
								</div>
							</div>
						
							
							<div class="frd-unit sun-border-elegance" onclick="showUser(this)">
								<div>
									<div>
										<div class="user-head user-sketch">
											头像
										</div>
										<div class="user-nick user-sketch">
											昵称
										</div>
									</div>
									<input type="hidden" value="1" />
								</div>
							</div>
						
							
							<div class="frd-unit sun-border-elegance" onclick="showUser(this)">
								<div>
									<div>
										<div class="user-head user-sketch">
											头像
										</div>
										<div class="user-nick user-sketch">
											昵称
										</div>
									</div>
									<input type="hidden" value="1" />
								</div>
							</div>
						
							
							<div class="frd-unit sun-border-elegance" onclick="showUser(this)">
								<div>
									<div>
										<div class="user-head user-sketch">
											头像
										</div>
										<div class="user-nick user-sketch">
											昵称
										</div>
									</div>
									<input type="hidden" value="1" />
								</div>
							</div>
						
							
							<div class="frd-unit sun-border-elegance" onclick="showUser(this)">
								<div>
									<div>
										<div class="user-head user-sketch">
											头像
										</div>
										<div class="user-nick user-sketch">
											昵称
										</div>
									</div>
									<input type="hidden" value="1" />
								</div>
							</div>
						
							
							<div class="frd-unit sun-border-elegance" onclick="showUser(this)">
								<div>
									<div>
										<div class="user-head user-sketch">
											头像
										</div>
										<div class="user-nick user-sketch">
											昵称
										</div>
									</div>
									<input type="hidden" value="1" />
								</div>
							</div>
						
							
							<div class="frd-unit sun-border-elegance" onclick="showUser(this)">
								<div>
									<div>
										<div class="user-head user-sketch">
											头像
										</div>
										<div class="user-nick user-sketch">
											昵称
										</div>
									</div>
									<input type="hidden" value="1" />
								</div>
							</div>
						
							
							<div class="frd-unit sun-border-elegance" onclick="showUser(this)">
								<div>
									<div>
										<div class="user-head user-sketch">
											头像
										</div>
										<div class="user-nick user-sketch">
											昵称
										</div>
									</div>
									<input type="hidden" value="1" />
								</div>
							</div>
						
							
							<div class="frd-unit sun-border-elegance" onclick="showUser(this)">
								<div>
									<div>
										<div class="user-head user-sketch">
											头像
										</div>
										<div class="user-nick user-sketch">
											昵称
										</div>
									</div>
									<input type="hidden" value="1" />
								</div>
							</div>
						
							
							<div class="frd-unit sun-border-elegance" onclick="showUser(this)">
								<div>
									<div>
										<div class="user-head user-sketch">
											头像
										</div>
										<div class="user-nick user-sketch">
											昵称
										</div>
									</div>
									<input type="hidden" value="1" />
								</div>
							</div>
						
							
							<div class="frd-unit sun-border-elegance 华雄" onclick="showUser(this)">
								<div>
									<div>
										<div class="user-head user-sketch">
											头像
										</div>
										<div class="user-nick user-sketch">
											昵称
										</div>
									</div>
									<input type="hidden" value="1" />
								</div>
							</div>
						
							
							<div class="frd-unit sun-border-elegance zhangsan" onclick="showUser(this)">
								<div>
									<div>
										<div class="user-head user-sketch">
											头像
										</div>
										<div class="user-nick user-sketch">
											昵称
										</div>
									</div>
									<input type="hidden" value="1" />
								</div>
							</div>
						
							<div class="frd-unit sun-border-elegance test" onclick="showUser(this)" >
								<div>
									<div>
										<div class="user-head user-sketch">
											头不像
										</div>
										<div class="user-nick user-sketch">
											昵称
										</div>
									</div>
									<input type="hidden" value="1" />
								</div>
							</div>
						
							
							
							
							
							<!-- data end -->
						
						</div>
					</div>
				</div>
				<div class="right">
					<div class="detail">
						<div>
							<div class="user-data-online">
								<div class="user-data-title">头像</div>
								<div class="user-data-content">头像图片</div>
							</div>
							<div class="user-data-online">
								<div class="user-data-title">姓名</div>
								<div class="user-data-content">用户姓名</div>
							</div>
							<div class="user-data-online">
								<div class="user-data-title">邮箱</div>
								<div class="user-data-content">用户邮箱</div>
							</div>
							<div class="user-data-online">
								<div class="user-data-title">头像</div>
								<div class="user-data-content">
									头像图片头像图片
									头像图片头像图片
									头像图片头像图片
									头像图片头像图片
									头像图片头像图片
									头像图片头像图片
									头像图片头像图片
									头像图片头像图片
									头像图片头像图片
									头像图片头像图片
									头像图片头像图片
									头像图片头像图片
									头像图片头像图片
									头像图片头像图片
									头像图片头像图片
									头像图片头像图片
									头像图片头像图片
									头像图片头像图片
									头像图片头像图片
									头像图片头像图片
								</div>
							</div>
							
						</div>

					</div>
				</div>
			</div>
