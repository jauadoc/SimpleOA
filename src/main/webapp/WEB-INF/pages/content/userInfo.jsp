<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="com.sun.entity.PageUser" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String uid = request.getParameter("uid");
	PageUser pageUser = (PageUser)request.getSession().getAttribute("pageUser");
 %>
			
	<meta name="viewport" content="width=device0width,initial-scale=1.0,user-scalable=no">
			
			<style type="text/css">
				.person{position: absolute;top: 5px;left: 3px;width: 100%;height: 100%;overflow: auto;}
				.information{width: 90%;margin:0 auto;font:22px;line-height: 22px;}
				.userInfo-split{border-bottom: 1px dashed #0085B5;height:8px;content: ".";overflow: hidden;color: white;width: 70%;margin:0 auto;}
				
				/* col通用样式 */
				.col{overflow: hidden;}
				.col .col-unit{display: inline-block;width: 46%;height: 30px;font-size: 16px;}
				.info-head div{display: inline-block;}
				.col .title{width: 14%;margin-left:25%;text-align: right;margin-right: 7%;}
				.userInfo-row{margin-top:1%;}
				
				.col .submit{margin-right: 5%;width: 35px;}
				.col .reset{margin-left: 5%;width: 35px;}
				.col .uhead{width: 80px;height: 80px;border:solid 1px black;}
				.headinfo{height: 90px;}
				.col .btn{height: 20px;}
				.sun-input-default{height: 20px;width: 50%;}
				.sun-input-default:hover{border: solid 1px #0085B5;}
			</style>
			<div class="person">
				<div class="information">
					<br>
					个人信息
					<div class="split"></div>
					<!-- 这里所有的title写上指定id用来辨识数据库对应id -->
					<div class="userInfo-row">
						<div class="col headinfo">
							<div class="title col-unit">头像:</div>
							<div class="info col-unit info-head">
								<div class="uhead">&nbsp</div>
								<div>
									<input type="file" name="nickname">
								</div>
							</div>
						</div>
						<div class="userInfo-split"></div>
					</div>
					<div class="userInfo-row">
						<div class="col">
							<div class="title col-unit" id="name">姓名:</div>
							<div class="info col-unit">
								<input type="text" name="nickname" class="sun-input-default sun-input-disable" disabled="disabled" value="孙新">
									提示信息
							</div>
						</div>
						<div class="userInfo-split"></div>
					</div>
					<div class="userInfo-row">
						<div class="col">
							<div class="title col-unit">部门:</div>
							<div class="info col-unit">
								<input type="text" name="nickname" class="sun-input-default">
									提示信息
							</div>
						</div>
						<div class="userInfo-split"></div>
					</div>
					<div class="userInfo-row">
						<div class="col">
							<div class="title col-unit">职位:</div>
							<div class="info col-unit">
								<input type="text" name="nickname" class="sun-input-default">
									提示信息
							</div>
						</div>
						<div class="userInfo-split"></div>
					</div>
					<div class="userInfo-row">
						<div class="col">
							<div class="title col-unit">生日:</div>
							<div class="info col-unit">
								<input type="text" name="nickname" class="sun-input-default">
									提示信息
							</div>
						</div>
						<div class="userInfo-split"></div>
					</div>
					<div class="userInfo-row">
						<div class="col">
							<div class="title col-unit">移动电话:</div>
							<div class="info col-unit">
								<input type="text" name="nickname" class="sun-input-default">
									提示信息
							</div>
						</div>
						<div class="userInfo-split"></div>
					</div>
					<div class="userInfo-row">
						<div class="col">
							<div class="title col-unit" id="name">分机号:</div>
							<div class="info col-unit">
								<input type="text" name="nickname" class="sun-input-default">
									提示信息
							</div>
						</div>
						<div class="userInfo-split"></div>
					</div>
					<div class="userInfo-row">
						<div class="col">
							<div class="title col-unit">邮箱:</div>
							<div class="info col-unit">
								<input type="text" name="nickname" class="sun-input-default">
									提示信息
							</div>
						</div>
						<div class="userInfo-split"></div>
					</div>
					<div class="userInfo-row">
						<div class="col">
							<div class="title col-unit">&nbsp</div>
							<div class="info col-unit">
								<button type="button" class="sun-button-blue">保存</button>
								<button type="reset" class="sun-button-blue">重置</button>
							</div>
						</div>
						<div class="userInfo-split"></div>
					</div>
				</div>
			</div>