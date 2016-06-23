<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="com.sun.entity.PageUser" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String uid = request.getParameter("uid");
	PageUser pageUser = (PageUser)request.getSession().getAttribute("pageUser");
 %>
			
<link rel="stylesheet" type="text/css" href="<%=path%>/jics/css/plugin.css">
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
				.toast-error{color:red;}
			</style>
			
			<script type="text/javascript">
				$().ready(function() {
					getUserInfo();
				});
				function getUserInfo(){
					var inMessage = new Object();
					inMessage.date = new Date().getTime();
					inMessage.uid = <%=uid %>;
					var json = JSON.stringify(inMessage);
					var url = '/m_userInfo/getUserInfo.do?date=' + new Date().getTime();
					$.ajax({
					   url: '<%=path %>'+url,
			      	   type: 'get',
					   data:{data:json},
					   contentType: "application/x-www-form-urlencoded; charset=UTF-8",
					    timeout: 3000,
			      		success: function (data) {
// 							data = {"status":"success","data":[{"show":"头像","key":"head","value":"www.baidu.com","modify":"show"},{"show":"ee","key":"job","value":"ee","modify":"show"},{"show":"dd","key":"dd","value":"dd","modify":"show"}],"date":"1465785341711"};
			      			data = JSON.parse(data);
			      			var html = "";
		      				userData = data.data;
		      				var key = userData.key;
			      			for(var i=0;i<userData.length;i++){
								userOneData = userData[i];
			      				if(userOneData.modify=="show"){
			      					if(userOneData.key=="head"){
			      						$(".uhead").html("<img  src='"+userOneData.value+"'class='uhead' />");
			      					}else{
					      				html+="<div class='userInfo-row'><div class='col'><div class='title col-unit'>"+userOneData.show+"<input type='hidden' value='"+userOneData.key+"' />:</div><div class='info col-unit'><input type='text' name='nickname' class='sun-input-default' value='"+userOneData.value+"'><div class='toast'></div></div></div><div class='userInfo-split'></div></div>";
			      					}
			      				}else{
				      				html+="<div class='userInfo-row'><div class='col'><div class='title col-unit'>"+userOneData.show+"<input type='hidden' value='"+userOneData.key+"' />:</div><div class='info col-unit'><input type='text' name='nickname' class='sun-input-default sun-input-disable' disabled='disabled' value='"+userOneData.value+"'><div class='toast'></div></div></div><div class='userInfo-split'></div></div>";
			      				}
			      			}
			      			$("#personInfo").html(html);
						},
						error: function (xhr, errorInfo, ex) { 
							showMsg("个人信息获取失败","error");
						},
						beforeSend: function (xhr) {
							xhr.setRequestHeader('Content-Type', 'application/xml;charset=utf-8');
						},
						async: true
					});
				}
				function saveUserInfo(){
					var rows = $(".userInfo-row");
					var data = "";
					for(var i=1;i<rows.size()-1;i++){
						var title = $(rows[i]).children(".col").children(".title").children("input");
						var info = $(rows[i]).children(".col").children(".info").children("input");
						if($(info).attr("disabled")!="disabled"){
							data += $(title).val()+":"+$(info).val()+",";
						}
					}
					data = data.substring(0,data.length-1);
					var inMessage = new Object();
					inMessage.date = new Date().getTime();
					inMessage.data = data;
					inMessage.uid = <%=uid %>;
					var json = JSON.stringify(inMessage);
					var url = '/m_userInfo/subUserInfo.do?date=' + new Date().getTime();
					$.ajax({
					   url: '<%=path %>'+url,
			      	   type: 'post',
					   data:{data:json},
					   contentType: "application/x-www-form-urlencoded; charset=UTF-8",
					   //调小超时时间会引起异常
					    timeout: 3000,
			      		//请求成功后触发
			      		success: function (data) {
			      			data = JSON.parse(data);
							var status = data.status;
							if(status=="success"){
								showMsg("个人信息保存成功","success");
							}else{
								showMsg("个人信息保存失败","error");
							}
							getGlobalLeft();
						},
						//请求失败遇到异常触发
						error: function (xhr, errorInfo, ex) { 
							showMsg("个人信息保存失败","error");
						},
						beforeSend: function (xhr) {
							xhr.setRequestHeader('Content-Type', 'application/xml;charset=utf-8');
						},
						//是否异步发送
						async: true
					});
				}
				
				/*头像文件本地上传*/
				var image = '';
				function selectImage(file) {
					if (!file.files || !file.files[0]) {
						return;
					}
					var reader = new FileReader();
					reader.onload = function(evt) {
						document.getElementById('image').src = evt.target.result;
						image = evt.target.result;
					}
					reader.readAsDataURL(file.files[0]);
					uploadimage();
				}
				/*头像文件上传服务器  */
				function uploadImage() {
					$.ajax({
						type : 'POST',
						url : 'ajax/uploadimage',
						data : {
							image : image
						},
						async : false,
						dataType : 'json',
						success : function(data) {
							if (data.success) {
								showMsg("头像上传成功","success");
							} else {
								showMsg("头像上传失败","error");
							}
						},
						error : function(err) {
							showMsg("头像上传失败","error");
						}
					});
				}
			</script>
			<div class="person">
				<div class="information">
					<br>
					个人信息
					<div class="split"></div>
					<!-- 这里所有的title写上指定id用来辨识数据库对应id -->
					<div class="userInfo-row">
						<div class="col headinfo">
							<div class="title col-unit">
								头像:
							</div>
							<div class="info col-unit info-head">
								<div class="uhead">
									<img id="image" src="" class="uhead" />
								</div>
								<div>
									<input type="file" onchange="selectImage(this);" />
								</div>
							</div>
						</div>
						<div class="userInfo-split"></div>
					</div>
					<div class="personInfo" id="personInfo">
	<!-- 					<div class="userInfo-row"> -->
	<!-- 						<div class="col"> -->
	<!-- 							<div class="title col-unit">部门:</div> -->
	<!-- 							<div class="info col-unit"> -->
	<!-- 								<input type="text" name="nickname" class="sun-input-default"> -->
	<!-- 								<div class="toast"></div> -->
	<!-- 							</div> -->
	<!-- 						</div> -->
	<!-- 						<div class="userInfo-split"></div> -->
	<!-- 					</div> -->

					</div>
					<div class="userInfo-row">
						<div class="col">
							<div class="title col-unit">&nbsp</div>
							<div class="info col-unit">
								<button type="button" class="sun-button-blue" id="userInfo-save" onclick="saveUserInfo()">保存</button>
								<button type="reset" class="sun-button-blue" onclick="getUserInfo">重置</button>
							</div>
						</div>
						<div class="userInfo-split"></div>
					</div>
				</div>
			</div>