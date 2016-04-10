<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	String uid = (String)session.getAttribute("uid");
// 	if(uid==null || uid==""){
// 		request.getRequestDispatcher("/login.do").forward(request, response);
// 	}
	
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
	<style type="text/css">
	</style>
	<title>数据管理系统</title>

<style>
	/*功能样式*/
	.clearfix:after{content: ".";display: block;clear: both;overflow: hidden;display: visibility:hidden;height: 0;display: none}
	.clearfix{zoom:1;}

	/*通用样式*/
	.split{border-bottom: 3px solid #0FDBD6;height:8px;content: ".";overflow: hidden;color: white;}

	/*布局样式*/
	html,body,.g-body{height: 100%;overflow: hidden;}
	.g-left{position: absolute;left: 0px;top:60px;bottom:30px;border-right: #666 solid 1px;width: 200px;background: #313B36;}
	.g-head{position: absolute;left:0px;top:0px;width: 100%; height:60px;border-bottom: #666 solid 1px;background: #0DAAA5;}
	.g-content{position: absolute;left: 200px;top: 60px;right: 0px;bottom: 30px;}
	.g-footer{position: absolute;left: 0px;bottom: 0px;border-top: #666 solid 1px;width: 100%;height: 30px;}

	/*头模块样式*/
	.m-head{width: 100%;height: 100%;display: inline-block;}
	.m-head .sys-title{height: 40px;line-height: 40px;font-size: 36px;margin-left: 20px;display: inline-block;}
	.m-head .sys-title .logo,.m-head .sys-title .title{display: inline-block;}
	.m-head .m-nav{float: right;display: inline-block;height: 60px;}
	.m-head .m-nav .dir{display: table-cell;border-top: solid #CBA 1px;border-left: solid #CBA 1px;width: 120px;color: #FFF;height: 60px;text-align: center;}
	.m-head .m-nav .check{background: #0A7E7C;}

	/*左模块样式*/
	.m-instro .u-info .head{border-radius:100%;width: 100px;height:100px;margin: 2% auto;border: solid 3px #DDD;overflow: hidden;}
	.m-instro .u-info .name{width: 60%;margin: 2% auto;border: solid 1px #666;overflow: hidden;text-align: center;color:#CCC;display: block;font-size: 16px;line-height: 16px;}
	.m-instro .u-use .quickuse{border-bottom:solid 1px #555;margin-top: 2px;display: block;color:#CCC;}
	.m-instro .u-use{width:100%;margin:15px auto;font-size: 12px;line-height: 12px;text-align: center;}
	
	/*右模块样式*/
	.g-content{background: #F1F1F1;display: table-cell;vertical-align: middle;}
	.g-content .data{width: 100%;height: 98%;margin-left: 3px;margin-top: 5px;margin-bottom: 1%;overflow: auto;background: white;}
	
	/*底模块样式*/
	.g-footer{background: #242525;color: white;text-align: center;}
</style>
<script type="text/javascript">
	
</script>
</head>
<body>

<div class="g-body">
	<div class="g-left">
		<div class="m-instro">
			<div class="u-info">
				<div class="head"><img src="<%=path%>/jics/images/head.jpg"></div>
				<div class="name">你好</div>
				<a href="javascript:void(0)" class="name">退出</a>
			</div>
			<div class="split"></div>
			<div class="u-use">
				<a href="javascript:void(0)" class="quickuse">工作簿</a>
				<a href="javascript:void(0)" class="quickuse">联系人</a>
				<a href="javascript:void(0)" class="quickuse">请假申请</a>
				<a href="javascript:void(0)" class="quickuse">+</a>
			</div>
		</div>
	</div>
	<div class="g-head">
		<div class="m-head">
			<div class="sys-title">
				<div class="logo"><img src="<%=path%>/jics/images/logo.png"></div>
				<div class="title">专注于企业协同办公</div>
			</div>
			<div class="m-nav clearfix">
				
				<a href="javascript:void(0)" class="dir check">
					<div><img src="<%=path%>/jics/images/home.png"></div>
					首页
				</a>
				<a href="javascript:void(0)" class="dir">
					<div><img src="<%=path%>/jics/images/msg.png"></div>
					消息
				</a>
				<a href="javascript:void(0)" class="dir">
					<div><img src="<%=path%>/jics/images/work.png"></div>
					工作
				</a>
				<a href="javascript:void(0)" class="dir">
					<div><img src="<%=path%>/jics/images/firend.png"></div>
					联系人
				</a>
			</div>
		</div>		
	</div>
	<div class="g-content">
		<div class="data">
			<!-- 点击首页，消息，工作，联系人等返回的数据格式 -->
			
			
			<!-- 这里正式版本发布时采用前端发送ajax请求获取的方式处理，是的页面先加载框架，再加载内容，增强用户体验。 -->
			<!-- 这里正式版本发布时采用前端发送ajax请求获取的方式处理，是的页面先加载框架，再加载内容，增强用户体验。 -->
			<!-- 这里正式版本发布时采用前端发送ajax请求获取的方式处理，是的页面先加载框架，再加载内容，增强用户体验。 -->
			<!-- 这里正式版本发布时采用前端发送ajax请求获取的方式处理，是的页面先加载框架，再加载内容，增强用户体验。 -->
			
			
			
			<style type="text/css">
				/*第一种，左侧可以调节，右侧固定。   ====该种适合用于消息查看，联系人信息查看。*/
				/*.right{position: absolute;left: 70%;top: 5px;}*/
				/*第二种，普通的中分布局，类似百度那种*/
				.left{float: left;width: 70%;}
				.right{margin-left: 70%;}
				.right .notice{width: 80%;border: solid black 1px;margin-top: 20px;margin-left:10%;}
				.calenderDiv{position: absolute;top: 5px;left: 3px;right: 30%;float: left;}
			</style>
			<div class="left">
				<div class="calenderDiv">
					<html>
					<head>
					<meta charset="utf-8">
					<meta name="keywords" content="Html日历插件" />
					<meta name="description" content="Html日历插件" />
					<title>Html日历插件</title>
					<style type="text/css">
					body {
						background-color: #efefef;
					}
					#CalendarMain {
						width: 680px;
						height: 460px;
						border: 1px solid #ccc;
						margin-top: 10px;
						margin-left: 10px;
					}
					#title {
						width: 100%;
						height: 30px;
						background-color: #b9121b;
					}
					.selectBtn {
						font-weight: 900;
						font-size: 15px;
						color: #fff;
						cursor: pointer;
						text-decoration: none;
						padding: 7px 10px 6px 10px;
					}
					.selectBtn:hover {
						background-color: #1d953f;
					}
					.selectYear {
						float: left;
						margin-left: 50px;
						position: absolute;
					}
					.selectMonth {
						float: left;
						margin-left: 120px;
						position: absolute;
					}
					.month {
						float: left;
						position: absolute;
					}
					.nextMonth {
						float: right;
					}
					.currentDay {
						float: right;
					}
					#context {
						background-color: #fff;
						width: 100%;
					}
					.week {
						width: 100%;
						height: 30px;
					}
					.week>h3 {
						float: left;
						color: #808080;
						text-align: center;
						margin: 0;
						padding: 0;
						margin-top: 5px;
						font-size: 16px;
					}
					.dayItem {
						float: left;
					}
					.lastItem {
						color: #d1c7b7 !important;
					}
					.item {
						color: #333;
						float: left;
						text-align: center;
						cursor: pointer;
						margin: 0;
						font-family: "微软雅黑";
						font-size: 13px;
					}
					.item:hover {
						color: #b9121b;
					}
					.currentItem>a {
						background-color: #b9121b;
						width: 25px;
						line-height: 25px;
						float: left;
						-webkit-border-radius: 50%;
						-moz-border-radius: 50%;
						border-radius: 50%;
						color: #fff;
					}
					#foots {
						width: 100%;
						height: 35px;
						background-color: #fff;
						border-top: 1px solid #ccc;
						margin-top: -1px;
					}
					#footNow {
						float: left;
						margin: 6px 0 0 5px;
						color: #009ad6;
						font-family: "微软雅黑";
					}
					#Container {
						overflow: hidden;
						float: left;
					}
					#center {
						width: 100%;
						overflow: hidden;
					}
					#centerMain {
						width: 300%;
						margin-left: -100%;
					}
					#selectYearDiv {
						float: left;
						background-color: #fff;
					}
					#selectYearDiv>div {
						float: left;
						text-align: center;
						font-family: "微软雅黑";
						font-size: 16px;
						border: 1px solid #ccc;
						margin-left: -1px;
						margin-top: -1px;
						cursor: pointer;
						color: #909090;
					}
					.currentYearSd, .currentMontSd {
						color: #ff4400 !important;
					}
					#selectMonthDiv {
						float: left;
						background-color: #fff;
					}
					#selectMonthDiv>div {
						color: #909090;
						float: left;
						text-align: center;
						font-family: "微软雅黑";
						font-size: 16px;
						border: 1px solid #ccc;
						margin-left: -1px;
						margin-top: -1px;
						cursor: pointer;
					}
					#selectYearDiv>div:hover, #selectMonthDiv>div:hover {
						background-color: #efefef;
					}
					#centerCalendarMain {
						float: left;
					}
					/**/
					/**/
					.onwork{background: url(<%=path%>/jics/images/right.png) no-repeat;}
					.workdays{float: right;}
					.showDateDetail{z-index: 9999999;position: absolute;top: 30%;left: 10%;right: 50%;background: rgba(111,111,111,0.5);}
					.hidden{display: none;visibility: hidden;}
					</style>
					</head>
					<body>
					<div id="CalendarMain">
					  <div id="title"> <a class="selectBtn month" href="javascript:" onclick="CalendarHandler.CalculateLastMonthDays();"><</a><a class="selectBtn selectYear" href="javascript:" onClick="CalendarHandler.CreateSelectYear(CalendarHandler.showYearStart);">2014年</a><a class="selectBtn selectMonth" onClick="CalendarHandler.CreateSelectMonth()">6月</a> <a class="selectBtn nextMonth" href="javascript:" onClick="CalendarHandler.CalculateNextMonthDays();">></a><a class="selectBtn currentDay" href="javascript:" onClick="CalendarHandler.CreateCurrentCalendar(0,0,0);">今天</a></div>
					  <div id="context">
					    <div class="week">
					      <h3> 一 </h3>
					      <h3> 二 </h3>
					      <h3> 三 </h3>
					      <h3> 四 </h3>
					      <h3> 五 </h3>
					      <h3> 六 </h3>
					      <h3> 日 </h3>
					    </div>
					    <div id="center">
					      <div id="centerMain">
					        <div id="selectYearDiv"></div>
					        <div id="centerCalendarMain">
					          <div id="Container"></div>
					        </div>
					        <div id="selectMonthDiv"></div>
					      </div>
					    </div>
					    <div id="foots">
					    	<a id="footNow">00:00:00</a>
					    </div>
					    <!-- 工作统计 -->
				    	<div id="workdays">&nbsp本月已工作：</div>
				    	<div id="restdays">&nbsp本月请假共计：</div>
					  </div>
					</div>
					</body>
					<script type="text/javascript" src="http://www.pengyaou.com/jquery-1.4.min.js"></script>
					<script type="text/javascript">
							function showDetail(node){
								var a = $(node).children("a").html();
								alert(a);
							}
							$(document).ready(function(e) {
								CalendarHandler.initialize();
							});

							var CalendarHandler = {
								currentYear: 0,
								currentMonth: 0,
								isRunning: false,
								showYearStart:2009,
								tag:0,
								initialize: function() {
									$calendarItem = this.CreateCalendar(0, 0, 0);
									$("#Container").append($calendarItem);

									$("#context").css("height", $("#CalendarMain").height() - 65 + "px");
									$("#center").css("height", $("#context").height() - 30 + "px");
									$("#selectYearDiv").css("height", $("#context").height() - 30 + "px").css("width", $("#context").width() + "px");
									$("#selectMonthDiv").css("height", $("#context").height() - 30 + "px").css("width", $("#context").width() + "px");
									$("#centerCalendarMain").css("height", $("#context").height() - 30 + "px").css("width", $("#context").width() + "px");

									$calendarItem.css("height", $("#context").height() - 30 + "px"); //.css("visibility","hidden");
									$("#Container").css("height", "0px").css("width", "0px").css("margin-left", $("#context").width() / 2 + "px").css("margin-top", ($("#context").height() - 30) / 2 + "px");
									$("#Container").animate({
										width: $("#context").width() + "px",
										height: ($("#context").height() - 30) * 2 + "px",
										marginLeft: "0px",
										marginTop: "0px"
									}, 300, function() {
										$calendarItem.css("visibility", "visible");
									});
									$(".dayItem").css("width", $("#context").width() + "px");
									var itemPaddintTop = $(".dayItem").height() / 6;
									$(".item").css({
										"width": $(".week").width() / 7 + "px",
										"line-height": itemPaddintTop + "px",
										"height": itemPaddintTop + "px"
									});
									$(".currentItem>a").css("margin-left", ($(".item").width() - 25) / 2 + "px").css("margin-top", ($(".item").height() - 25) / 2 + "px");
									$(".week>h3").css("width", $(".week").width() / 7 + "px");
									this.RunningTime();
								},
								CreateSelectYear: function(showYearStart) {
									CalendarHandler.showYearStart=showYearStart;
									$(".currentDay").show();
									$("#selectYearDiv").children().remove();
									var yearindex = 0;
									for (var i = showYearStart; i < showYearStart+12; i++) {
										yearindex++;
										if(i==showYearStart){
											$last=$("<div>往前</div>");
											$("#selectYearDiv").append($last);
											$last.click(function(){
												CalendarHandler.CreateSelectYear(CalendarHandler.showYearStart-10);
											});
											continue;
										}
										if(i==showYearStart+11){
											$next=$("<div>往后</div>");
											$("#selectYearDiv").append($next);
											$next.click(function(){
												CalendarHandler.CreateSelectYear(CalendarHandler.showYearStart+10);
											});
											continue;
										}
										
										if (i == this.currentYear) {
											$yearItem=$("<div class=\"currentYearSd\" id=\"" + yearindex + "\">" + i + "</div>")
										
										}
										else{
											 $yearItem=$("<div id=\"" + yearindex + "\">" + i + "</div>");
										}
										$("#selectYearDiv").append($yearItem);
										$yearItem.click(function(){
											$calendarItem=CalendarHandler.CreateCalendar(Number($(this).html()),1,1);
											$("#Container").append($calendarItem);
											CalendarHandler.CSS()
										    CalendarHandler.isRunning = true;
										    $($("#Container").find(".dayItem")[0]).animate({
											height: "0px"
										    }, 300, function() {
											$(this).remove();
											CalendarHandler.isRunning = false;
										    });
											$("#centerMain").animate({
											marginLeft: -$("#center").width() + "px"
										}, 500);
										});
										if (yearindex == 1 || yearindex == 5 || yearindex == 9) $("#selectYearDiv").find("#" + yearindex).css("border-left-color", "#fff");
										if (yearindex == 4 || yearindex == 8 || yearindex == 12) $("#selectYearDiv").find("#" + yearindex).css("border-right-color", "#fff");
										
									}
									$("#selectYearDiv>div").css("width", ($("#center").width() - 4) / 4 + "px").css("line-height", ($("#center").height() - 4) / 3 + "px");
									$("#centerMain").animate({
										marginLeft: "0px"
									}, 300);
								},
								CreateSelectMonth: function() {
									$(".currentDay").show();
									$("#selectMonthDiv").children().remove();
									for (var i = 1; i < 13; i++) {
										if (i == this.currentMonth) $monthItem=$("<div class=\"currentMontSd\" id=\"" + i + "\">" + i + "月</div>");
										else  $monthItem=$("<div id=\"" + i + "\">" + i + "月</div>");
										$("#selectMonthDiv").append($monthItem);
										$monthItem.click(function(){
											$calendarItem=CalendarHandler.CreateCalendar(CalendarHandler.currentYear,Number($(this).attr("id")),1);
											$("#Container").append($calendarItem);
											CalendarHandler.CSS()
										    CalendarHandler.isRunning = true;
										    $($("#Container").find(".dayItem")[0]).animate({
											height: "0px"
										    }, 300, function() {
											$(this).remove();
											CalendarHandler.isRunning = false;
										    });
											$("#centerMain").animate({
											marginLeft: -$("#center").width() + "px"
										}, 500);
										});
										if (i == 1 || i == 5 || i == 9) $("#selectMonthDiv").find("#" + i).css("border-left-color", "#fff");
										if (i == 4 || i == 8 || i == 12) $("#selectMonthDiv").find("#" + i).css("border-right-color", "#fff");
									}
									$("#selectMonthDiv>div").css("width", ($("#center").width() - 4) / 4 + "px").css("line-height", ($("#center").height() - 4) / 3 + "px");
									$("#centerMain").animate({
										marginLeft: -$("#center").width() * 2 + "px"
									}, 300);
								},
								IsRuiYear: function(aDate) {
									return (0 == aDate % 4 && (aDate % 100 != 0 || aDate % 400 == 0));
								},
								CalculateWeek: function(y, m, d) {
									var arr = "7123456".split("");
									with(document.all) {
										var vYear = parseInt(y, 10);
										var vMonth = parseInt(m, 10);		
										var vDay = parseInt(d, 10);
									}
									var week =arr[new Date(y,m-1,vDay).getDay()];
									return week;
								},
								CalculateMonthDays: function(m, y) {
									var mDay = 0;
									if (m == 0 || m == 1 || m == 3 || m == 5 || m == 7 || m == 8 || m == 10 || m == 12) {
										mDay = 31;
									} else {
										if (m == 2) {
											//判断是否为芮年
											var isRn = this.IsRuiYear(y);
											if (isRn == true) {
												mDay = 29;
											} else {
												mDay = 28;
											}
										} else {
											mDay = 30;
										}
									}
									return mDay;
								},
								CreateCalendar: function(y, m, d) {
									$dayItem = $("<div class=\"dayItem\"></div>");
									//获取当前月份的天数
									var nowDate = new Date();
									if(y==nowDate.getFullYear()&&m==nowDate.getMonth()+1||(y==0&&m==0))
									$(".currentDay").hide();
									var nowYear = y == 0 ? nowDate.getFullYear() : y;
									this.currentYear = nowYear;
									var nowMonth = m == 0 ? nowDate.getMonth() + 1 : m;
									this.currentMonth = nowMonth;
									var nowDay = d == 0 ? nowDate.getDate() : d;
									$(".selectYear").html(nowYear + "年");
									$(".selectMonth").html(nowMonth + "月");
									var nowDaysNub = this.CalculateMonthDays(nowMonth, nowYear);
									//获取当月第一天是星期几
									//var weekDate = new Date(nowYear+"-"+nowMonth+"-"+1);
									//alert(weekDate.getDay());
									var nowWeek = parseInt(this.CalculateWeek(nowYear, nowMonth, 1));
									//nowWeek=weekDate.getDay()==0?7:weekDate.getDay();
									//var nowWeek=weekDate.getDay();
									//获取上个月的天数
									var lastMonthDaysNub = this.CalculateMonthDays((nowMonth - 1), nowYear);

									if (nowWeek != 0) {
										//生成上月剩下的日期
										for (var i = (lastMonthDaysNub - (nowWeek - 1)); i < lastMonthDaysNub; i++) {
											$dayItem.append("<div class=\"item lastItem\"><a>" + (i + 1) + "</a></div>");
										}
									}

									//考勤信息，这里ajax请求考勤表，然后获取当月考勤信息，写入前端。
									//ajax请求本月上班日期，以及本月工作多少日。用于统计。
									$.ajax();
									alert(nowMonth+"月");
									//生成当月的日期
									for (var i = 0; i < nowDaysNub; i++) {
										var work = true;
										var workdays = 0;
										if(work){
											if (i == (nowDay - 1)){
												$dayItem.append("<div class=\"onwork item currentItem\" onClick=\"showDetail(this)\"><a>" + (i + 1) + "</a></div>");
											}else{
												$dayItem.append("<div class=\"onwork item\" onClick=\"showDetail(this)\"><a>" + (i + 1) + "</a></div>");
											}
										}else{
											if (i == (nowDay - 1)){
												$dayItem.append("<div class=\"item currentItem\" onClick=\"showDetail(this)\"><a>" + (i + 1) + "</a></div>");
											}else{
												$dayItem.append("<div class=\"item\" onClick=\"showDetail(this)\"><a>" + (i + 1) + "</a></div>");
											}
										}
									}


									//获取总共已经生成的天数
									var hasCreateDaysNub = nowWeek + nowDaysNub;
									//如果小于42，往下个月推算
									if (hasCreateDaysNub < 42) {
										for (var i = 0; i <= (42 - hasCreateDaysNub); i++) {
											$dayItem.append("<div class=\"item lastItem\"><a>" + (i + 1) + "</a></div>");
										}
									}

									return $dayItem;
								},
								CSS: function() {
									var itemPaddintTop = $(".dayItem").height() / 6;
									$(".item").css({
										"width": $(".week").width() / 7 + "px",
										"line-height": itemPaddintTop + "px",
										"height": itemPaddintTop + "px"
									});
									$(".currentItem>a").css("margin-left", ($(".item").width() - 25) / 2 + "px").css("margin-top", ($(".item").height() - 25) / 2 + "px");
								},
								CalculateNextMonthDays: function() {
									if (this.isRunning == false) {
										$(".currentDay").show();
										var m = this.currentMonth == 12 ? 1 : this.currentMonth + 1;
										var y = this.currentMonth == 12 ? (this.currentYear + 1) : this.currentYear;
										var d = 0;
										var nowDate = new Date();
										if (y == nowDate.getFullYear() && m == nowDate.getMonth() + 1) d = nowDate.getDate();
										else d = 1;
										$calendarItem = this.CreateCalendar(y, m, d);
										$("#Container").append($calendarItem);

										this.CSS();
										this.isRunning = true;
										$($("#Container").find(".dayItem")[0]).animate({
											height: "0px"
										}, 300, function() {
											$(this).remove();
											CalendarHandler.isRunning = false;
										});
									}
								},
								CalculateLastMonthDays: function() {
									if (this.isRunning == false) {
										$(".currentDay").show();
										var nowDate = new Date();					
										var m = this.currentMonth == 1 ? 12 : this.currentMonth - 1;
										var y = this.currentMonth == 1 ? (this.currentYear - 1) : this.currentYear;
										var d = 0;
										
										if (y == nowDate.getFullYear() && m == nowDate.getMonth() + 1) d = nowDate.getDate();
										else d = 1;
										$calendarItem = this.CreateCalendar(y, m, d);
										$("#Container").append($calendarItem);
										var itemPaddintTop = $(".dayItem").height() / 6;
										this.CSS();
										this.isRunning = true;
										$($("#Container").find(".dayItem")[0]).animate({
											height: "0px"
										}, 300, function() {
											$(this).remove();
											CalendarHandler.isRunning = false;
										});
									}
								},
								CreateCurrentCalendar: function() {
									if (this.isRunning == false) {
										$(".currentDay").hide();
										$calendarItem = this.CreateCalendar(0, 0, 0);
										$("#Container").append($calendarItem);
										this.isRunning = true;
										$($("#Container").find(".dayItem")[0]).animate({
											height: "0px"
										}, 300, function() {
											$(this).remove();
											CalendarHandler.isRunning = false;
										});
										this.CSS();
										$("#centerMain").animate({
											marginLeft: -$("#center").width() + "px"
										}, 500);
									}
								},
								RunningTime: function() {
									var mTiming = setInterval(function() {
										var nowDate = new Date();
										var h=nowDate.getHours()<10?"0"+nowDate.getHours():nowDate.getHours();
										var m=nowDate.getMinutes()<10?"0"+nowDate.getMinutes():nowDate.getMinutes();
										var s=nowDate.getSeconds()<10?"0"+nowDate.getSeconds():nowDate.getSeconds();
										var nowTime = h + ":" + m + ":" + s;
										$("#footNow").html(nowTime);
									}, 1000);

								}
								
							}
							</script>

					<!--[if IE 7]>
					   <style type="text/css">
								.menuItem{ margin-left:-130px; } 
							</style>
					    <![endif]-->

					</html>
				</div>
			</div>
			<div class="right">
				公告
				<div class="split"></div>
				<div class="annoucement notice clearfix">
					--2016年4月2日 
					<div>各位员工好</div>
				</div>
				<div class="annoucement notice clearfix">
					--2016年4月2日 
					<div>各位员工好</div>
				</div>
				<div class="annoucement notice clearfix">
					--2016年4月2日 
					<div>各位员工好</div>
				</div>
				新闻
				<div class="split"></div>
				<div class="news notice clearfix">
					--2016年4月2日 
					<div>今天天气不错</div>
				</div>
				<div class="news notice clearfix">
					--2016年4月2日 
					<div>今天天气不错</div>
				</div>
				<div class="news notice clearfix">
					--2016年4月2日 
					<div>今天天气不错</div>
				</div>
				<div class="news notice clearfix">
					--2016年4月2日 
					<div>今天天气不错</div>
				</div>
			</div>
			<div class="showDateDetail">
				<div class="permision datedetail">
					<div>任务：</div>
					<div>
						<div>1</div>
						<div>2</div>
						<div>3</div>
					</div>
				</div>
				<div class="plan datedetail">
					<div>计划安排：</div>
					<div>
						<div>1</div>
						<div>2</div>
						<div>3</div>
					</div>
				</div>
			</div>
			<!-- 数据返回结束 -->
		</div>
	</div>
	<div class="g-footer">
		京ICP证150335号/京公网安备11010802009977 Copyright © 2003-2016 MEISHIJ CO.,LTD.
	</div>
</div>
</body>
</html>
