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
		<form action="user_question" method="post">
			<h3>1、输入要找回密码的用户名</h3>
			<table class="table table-striped">
				<tbody>
					<tr>
						<td>用户名</td>
						<td><input type="text" class="form-control" name="username"/></td>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<input type="submit" class="btn btn-success" value="找回密码" />
						</td>
					</tr>
				</tbody>
			</table>
		</form>
		</div>
		
		<jsp:include page="/app/component/footer.jsp" />
		<script type="text/javascript" src="/public/js/jquery-3.2.1.js">
</script>
		<script type="text/javascript" src="/public/js/bootstrap.js">
</script>
	</body>
</html>