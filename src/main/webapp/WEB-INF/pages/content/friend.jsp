<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="com.sun.entity.PageUser" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String uid = request.getParameter("uid");
	PageUser pageUser = (PageUser)request.getSession().getAttribute("pageUser");
 %>


			<style type="text/css">
				/*.right{position: absolute;left: 70%;top: 5px;}*/
				.work-body{}
				.left{float: left;width: 30%;}
				.right{margin-left: 30%;}
				.left .msg{border:solid 3px #0085B5;margin:0 auto;width: 60%;height: 500px;overflow: auto;border-radius:8px;padding:8px;}
				.right .detail{border:solid 2px #0085B5;width: 80%;height:550px;overflow: auto;border-radius:4px;padding:4px;}
				
				.detail{width: 100%;}
				.user-data-online{margin:2%;width: 96%;border-bottom:dashed 1px #0085B5;}
				.user-data-online div{display: inline-block;}
				.user-data-title{width: 20%;margin-left:3%;}
				.user-data-content{width: 70%;}
				
				
				.frd-unit{margin:3px;border:solid 1px #616B66;height:60px;cursor:pointer;}
				.user-sketch{display: inline-block;}
				.user-head{width: 30%;}
				.user-nick{width: 60%;vertical-align:middle;line-height:60px;}
				.msg .sun-border-elegance{border-color:#58ACED;}
				.msg{background: #58ACED;}
				.msg-inner{background: #FFF;}
			</style>
			<script type="text/javascript">
				function showUser(node){
					var user = $(node).children("div").children("input").val();
					alert(user);
				}
			</script>
			<div class="work-body">
			
				<div class="left">
					<div class="msg">
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