<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link
			href="http://localhost:8080/Crowdsourcing/public/css/bootstrap.css"
			rel="stylesheet" type="text/css" />
		<script
			src="http://localhost:8080/Crowdsourcing/public/js/jquery-3.2.1.js">
</script>
		<script
			src="http://localhost:8080/Crowdsourcing/public/js/bootstrap.js">
</script>
		<script type="text/javascript">
		var i = 6;
		function shownum() {
			i = i - 1;
			document.getElementById("time").innerHTML=i+"秒后自动跳转登陆界面";
		setTimeout('shownum()',1000); } 
		</script>
		<meta http-equiv="refresh" content="5;url=project_hall.jsp">
		<title>注册成功</title>
	</head>
	<body onload="shownum()">
		<jsp:include page="/app/component/header.jsp" />

		<div class="container" align="center">
			注册成功，3秒后页面将会跳转到首页。
			<br />
			<a href="project_hall.jsp">直接跳转</a>
		</div>
		<jsp:include page="/app/component/footer.jsp" />
	</body>
</html>