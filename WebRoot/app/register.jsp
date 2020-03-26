<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page language="java" import="com.utils.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>用户注册</title>
		<link
			href="http://localhost:8080/Crowdsourcing/public/css/bootstrap.css"
			rel="stylesheet" type="text/css" />
	</head>
	<body>
		<jsp:include page="/app/component/header.jsp" />
		<br>
		<div class="container" id="body-main">
			<div class="col-md-2">

			</div>
			<div class="col-md-6">
				<h3>
					用户注册 - 光速众包
				</h3>
				<hr />
				<form action="user_register" method="post">
					<div class="form-group">
						<label>
							用户名
						</label>
						<input name="username" class="form-control" required />
					</div>
					<div class="form-group">
						<label>
							密码
						</label>
						<input id="password1" name="password" class="form-control"
							type="password" required />
					</div>
					<div class="form-group">
						<label>
							确认密码
						</label>
						<input id="password2" name="password_confirm" class="form-control"
							type="password" onkeyup='validate()' required />
						<span id="info"></span>
					</div>
					<div class="form-group">
						<label>
							昵称
						</label>
						<input name="nickname" class="form-control" type="text" required />
					</div>
					<input type="hidden" name="status" value="启用" />
					<input type="hidden" name="role" value="普通用户" />
					<div class="form-group">
						<label>
							密码找回问题
						</label>
						<input name="question" class="form-control" type="text" required />
					</div>
					<div class="form-group">
						<label>
							密码找回的答案
						</label>
						<input name="answer" class="form-control" type="text" required />
					</div>
					<input type="hidden" name="gmtCreate"
						value="<%=DateFormat.getDateTime()%>" />
					<input type="hidden" name="gmtModified"
						value="<%=DateFormat.getDateTime()%>" />
					<button type="submit" id="dosubmit" class="btn btn-success">
						注册
					</button>
				</form>
			</div>
		</div>
		<div class="col-md-2">

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