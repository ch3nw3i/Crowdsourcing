<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"
	import="com.entity.*,java.util.*,com.dao.*,com.impl.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link
			href="http://localhost:8080/Crowdsourcing/public/css/bootstrap.css"
			rel="stylesheet" type="text/css" />
		<title>光速众包-后台管理系统</title>
	</head>
	<body>
		<hr />
		<div class="container" align="center" id="body-main">
			<div class="col-md-12" align="center">
				<!-- <form class="form-inline" action="admin_login" method="post"> -->
				<form class="form-inline" action="admin_login" method="post">
					<div class="form-group">
						<div>
							<image
								src="http://localhost:8080/Crowdsourcing/public/image/logo-admin.png" />
						</div>
						<div>
							<h3>[ <a href="http://localhost:8080/Crowdsourcing/app/project_hall.jsp">返回前台首页</a> ]</h3>
							<h2>
								[ 管理员登录 ]
							</h2>
						</div>
						<hr />
						<label>
							请输入管理员账号与密码：
						</label>
						<label class="sr-only">
							用户名
						</label>
						<input type="text" class="form-control" name="administrator"
							placeholder="管理员账号">
						<label class="sr-only">
							密码
						</label>
						<input type="password" class="form-control" name="password"
							placeholder="登录密码">
						<button type="submit" class="btn btn-success">
							登录
						</button>
					</div>
				</form>
			</div>
		</div>
		<jsp:include page="/admin/component/footer.jsp" />
		<script type="text/javascript" src="/public/js/jquery-3.2.1.js">
</script>
		<script type="text/javascript" src="/public/js/bootstrap.js">
</script>
	</body>
</html>