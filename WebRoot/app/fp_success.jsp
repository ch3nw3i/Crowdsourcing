<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"
	import="com.entity.*,java.util.*,com.dao.*,com.impl.*"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>密码找回 - 光速众包</title>
		<link
			href="http://localhost:8080/Crowdsourcing/public/css/bootstrap.css"
			rel="stylesheet" type="text/css" />
	</head>
	<body>
		<jsp:include page="/app/component/header.jsp" />

		<div class="container" align="center" id="search-form-group">
		<form>
			<p>密码重置成功，请登录。</p>
		</form>
		</div>
		
		<jsp:include page="/app/component/footer.jsp" />
		<script type="text/javascript" src="/public/js/jquery-3.2.1.js">
</script>
		<script type="text/javascript" src="/public/js/bootstrap.js">
</script>
	</body>
</html>