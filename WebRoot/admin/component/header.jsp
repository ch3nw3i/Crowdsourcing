<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<header>
<nav class="navbar navbar-default navbar-static-top">
<div class="container">
	<div class="navbar-header">
		<a class="navbar-brand"
			href="http://localhost:8080/Crowdsourcing/admin/login.jsp"> <img
				alt="Logo"
				src="http://localhost:8080/Crowdsourcing/public/image/logo-admin.png">
		</a>
	</div>
	<ul class="nav nav-tabs" style="padding-top: 40px;">
	
		<li role="presentation" class="navbar-right" id="login">
		<%
		String administrator = (String) session.getAttribute("administrator");
		String adminRole = (String) session.getAttribute("adminRole");
		int adminId = 0;
		if (session.getAttribute("adminId") != null) {
			adminId = Integer.valueOf(session.getAttribute("adminId").toString());
		}
		if (administrator == null || adminId == 0) {
		%>
			<div>
				<form class="form-inline" action="admin_login" method="post">
					<div class="form-group">
						<label class="sr-only">
							用户名
						</label>
						<input type="text" class="form-control" name="administrator"
							placeholder="管理员账号">
						<!-- 
					</div>
					<div class="form-group">
					 -->
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
			<%
				} else {
			%>
			<div>
				<form class="form-inline" action="admin_logout" method="post">
					当前用户：<label><%=administrator%>&nbsp;</label>
					<button type="submit" style="background-color: #FF6600">注销</button><br/>
					用户角色：<span style="border: 1px solid #9933FF">
					<%
					if (adminRole.equals("SystemManage")) {
						out.println("系统管理员");
					} else if (adminRole.equals("ProjectManage")) {
						out.println("项目管理员");
					} else if (adminRole.equals("UserManage")) {
						out.println("用户管理员");
					} else if (adminRole.equals("CustomerServiceStaff")) {
						out.println("客服人员");
					}
					%>
					</span>
				</form>
			</div>
			<%
				}
			%>
		</li>
	</ul>
</div>
</nav>
</header>