<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page language="java"
	import="com.entity.*,java.util.*,com.dao.*,com.impl.*,com.utils.*"%>
<script src="http://localhost:8080/Crowdsourcing/public/js/jquery-3.2.1.js"></script>
<script src="http://localhost:8080/Crowdsourcing/public/js/bootstrap.js"></script>
<header>
<nav class="navbar navbar-default navbar-static-top">
<div class="container">
	<div class="navbar-header">
		<a class="navbar-brand"
			href="http://localhost:8080/Crowdsourcing/index.jsp"> <img
				alt="Logo"
				src="http://localhost:8080/Crowdsourcing/public/image/logo.png">
		</a>
	</div>
	<%
	
	String username = (String) session.getAttribute("username");
	int userId = 0;
	if (session.getAttribute("userId") != null) {
		userId = Integer.valueOf(session.getAttribute("userId")
				.toString());
	}
	%>
	<ul class="nav nav-tabs" style="padding-top: 40px;">
		<li role="presentation" id="project_hall">
			<a href="http://localhost:8080/Crowdsourcing/app/project_hall.jsp">项目大厅</a>
		</li>
		<li role="presentation" id="developer_hall">
			<a href="http://localhost:8080/Crowdsourcing/app/developer_hall.jsp">开发者大厅</a>
		</li>
		<li role="presentation" id="person_center">
			<a href="http://localhost:8080/Crowdsourcing/app/person_center.jsp">个人中心</a>
		</li>
		<li>
		<%
			if (username == null) {
		%>
			<a href="http://localhost:8080/Crowdsourcing/app/register.jsp">
				<font color="red">注册 </font></a>
		<%} %>
		</li>
		<li role="presentation" class="navbar-right" id="login">
			<%
				if (username == null) {
			%>
			<div>
				<form class="form-inline" action="user_login" method="post">
					<div class="form-group">
						<label class="sr-only">
							用户名
						</label>
						<input type="text" class="form-control" name="username"
							placeholder="用户名" missingMessage="请输入用户名" required>
						<!-- 
					</div>
					<div class="form-group">
					 -->
						<label class="sr-only">
							密码
						</label>
						<input type="password" class="form-control" name="password"
							placeholder="登录密码" required>
						<button type="submit" class="btn btn-success">
							登录
						</button>
					</div>
				</form>
			</div>
			<%
				} else {
					UserDAO udao = new UserDAOImpl();
					User u = udao.findByUsername(username);
					String[] roleArr = StringDeal.splitString(u.getRole());
					boolean loginFlag = false;
					boolean devFlag = false;
					boolean reqFlag = false;
					for (int i = 0; i < roleArr.length; i++) {
						//if (i == roleArr.length - 1) {
						if (roleArr[i].equals("普通用户")) {
							loginFlag = true;
						} 
						if (roleArr[i].equals("开发者")) {
							devFlag = true;
						}
						if (roleArr[i].equals("需求方")) {
							reqFlag = true;
						}
						//}
					}
			%>
			<div style="text-align: center">
				<form class="form-inline" action="user_logout" method="post">
					<label>当前用户：</label>
					<%=username%>&nbsp;
					<button type="submit" style="background-color: #FF9966;">注销登录</button>
					<br />
					<label>用户角色：</label>
					<%
						//if (loginFlag) {
							out.println("<span style=\"border: 1px solid #0033FF\">普通用户</span>");
							//}
							if (devFlag) {
								out.println("<span style=\"border: 1px solid #FF6600\">开发者</span>");
							}
							if (reqFlag) {
								out.println("<span style=\"border: 1px solid #9933FF\">需求方</span>");
							}
					%>
					<br />
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