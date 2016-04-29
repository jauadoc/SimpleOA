<%
	String path = request.getContextPath();
	String uid = request.getParameter("uid");
 %>
 <!DOCTYPE html>
<html>
<head>
	<title></title>
<link href="<%=path %>/jics/css/jquery.mCustomScrollbar.css" rel="stylesheet" type="text/css" />
<script src="<%=path %>/jics/js/jquery.js"></script>
<script src="<%=path %>/jics/js/jquery-ui.min.js"></script>
<script src=".<%=path %>/jics/js/jquery.mousewheel.min.js"></script>
<script src="<%=path %>/jics/js/jquery.mCustomScrollbar.js"></script>
<script>
	$(document).ready(function(e){
		(function($){
			$(window).load(function(){
	            $(".test").mCustomScrollbar({
	            	theme:"dark"
	            });
	        });
	    })(jQuery);
	});
</script>

</script>
	<style type="text/css">
		.test{width: 200px;height: 60px;overflow: auto;}
	</style>
</head>
<body>
	<div>
		<div class="ddd">
			<input type="text" readonly="true"></input>
		</div>
		<br>
		<br>
		<br>
		<div class="test">
		风力可达撒娇反抗拉萨的距离看风景 
		风力可达撒娇反抗拉萨的距离看风景 
		风力可达撒娇反抗拉萨的距离看风景 
		风力可达撒娇反抗拉萨的距离看风景 
		风力可达撒娇反抗拉萨的距离看风景 
		风力可达撒娇反抗拉萨的距离看风景 
		风力可达撒娇反抗拉萨的距离看风景 
		风力可达撒娇反抗拉萨的距离看风景 
		风力可达撒娇反抗拉萨的距离看风景 
		风力可达撒娇反抗拉萨的距离看风景 
		风力可达撒娇反抗拉萨的距离看风景 
		风力可达撒娇反抗拉萨的距离看风景 
		风力可达撒娇反抗拉萨的距离看风景 
		风力可达撒娇反抗拉萨的距离看风景 
		</div>
	</div>


</body>
</html>