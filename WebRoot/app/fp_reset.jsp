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
			<form action="password_reset" method="post">
				<%
					String fp_username = (String) session.getAttribute("fp_username");
				%>
				<h3>
					3、重置密码
				</h3>
				<table class="table table-striped">
					<tbody>
						<tr>
							<td>
								用户名：<%=fp_username%></td>
							<td>
								<input type="hidden" name="username" value="<%=fp_username%>"
									required />
							</td>
						</tr>
						<tr>
							<td>
								新密码
							</td>
							<td>
								<input type="password" id="password1" class="form-control"
									name="password" required />
							</td>
						</tr>
						<tr>
							<td>
								重复新密码 
							</td>
							<td>
								<input type="password" id="password2" class="form-control"
									name="password_repeat" onkeyup='validate()' required />
								<span id="info"></span>
							</td>
						</tr>
						<tr>
							<td colspan="2" align="center">
								<input type="submit" id="dosubmit" class="btn btn-success"
									value="重置">
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
		<script>
function validate() {
	var pwd1 = document.getElementById("password1").value;
	var pwd2 = document.getElementById("password2").value;
	if (pwd1 == pwd2) {
		document.getElementById("info").innerHTML = "<font color='gray'>输入正确</font>";
		document.getElementById("dosubmit").disabled = false;
	} else {
		document.getElementById("info").innerHTML = "<font color='red'>两次密码不相同</font>";
		document.getElementById("dosubmit").disabled = true;
	}
}
</script>
	</body>
</html>