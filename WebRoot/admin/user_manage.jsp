<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"
	import="com.entity.*,java.util.*,com.dao.*,com.impl.*,com.utils.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link
			href="http://localhost:8080/Crowdsourcing/public/css/bootstrap.css"
			rel="stylesheet" type="text/css" />
		<title>用户管理 - 光速众包后台管理系统</title>
	</head>
	<body>
		<jsp:include page="/admin/component/header.jsp" />
		<%
			String administrator = (String) session
					.getAttribute("administrator");
			String adminRole = (String) session.getAttribute("adminRole");
			int adminId = 0;
			if (session.getAttribute("adminId") != null) {
				adminId = Integer.valueOf(session.getAttribute("adminId")
						.toString());
			}
			// 判断管理员是否登录
			if (administrator != null || adminId != 0) {
				UserDAO udao = new UserDAOImpl();
				List<User> userList = udao.showAllUser();
				
				DeveloperDAO devdao = new DeveloperDAOImpl();
				List<Developer> devList = devdao.showAllDeveloper();
		%>
		<div class="container" align="center" id="function_button">
			<ul id="myTab" class="nav nav-tabs">
				<li class="active"><a href="#user_manage" data-toggle="tab">用户管理</a></li>
				<li><a href="#developer_manage" data-toggle="tab">开发者管理</a></li>
			</ul>
		</div>

		<div id="myTabContent" class="container tab-content">
			<!-- 用户管理 -->
			<div class="tab-pane fade in active" id="user_manage">
				<h1>
					用户管理
				</h1>
				<hr />
				<table class="table table-striped">
					<thead>
						<tr>
							<th>
								ID
							</th>
							<th>
								用户名
							</th>
							<th>
								昵称
							</th>
							<th>
								状态
							</th>
							<th>
								角色
							</th>
							<th>
								创建时间
							</th>
							<th>
								修改时间
							</th>
						</tr>
					</thead>
					<tbody>
						<%
							for (User user : userList) {
						%>
						<tr>
							<td><%=user.getId()%></td>
							<td><%=user.getUsername()%></td>
							<td><%=user.getNickname()%></td>
							<td><%=user.getStatus()%></td>
							<td><%=user.getRole()%></td>
							<td><%=user.getGmtCreate()%></td>
							<td><%=user.getGmtModified()%></td>
						</tr>
						<%
							}
						%>
					</tbody>
				</table>
			</div>
			
			<!-- 开发者管理 -->
			<div class="tab-pane fade" id="developer_manage">
				<h1>
					开发者管理
				</h1>
				<hr />
				<table class="table table-striped">
					<thead>
						<tr>
							<th>
								ID
							</th>
							<th>
								用户id
							</th>
							<th>
								真实姓名
							</th>
							<th>
								性别
							</th>
							<th>
								城市
							</th>
							<th>
								技能
							</th>
							<th>
								状态
							</th>
							<th>
								创建时间
							</th>
							<th>
								修改时间
							</th>
						</tr>
					</thead>
					<tbody>
						<%
							for (Developer dev : devList) {
						%>
						<tr>
							<td><%=dev.getId()%></td>
							<td><%=dev.getUserId()%></td>
							<td><%=dev.getRealName()%></td>
							<td><%=dev.getGender()%></td>
							<td><%=dev.getCity()%></td>
							<td><%=dev.getSkill() %></td>
							<td><%=dev.getStatus()%></td>
							<td><%=dev.getGmtCreate()%></td>
							<td><%=dev.getGmtModified()%></td>
						</tr>
						<%
							}
						%>
					</tbody>
				</table>
			</div>
			<%
				}
			%>
		</div>
		<jsp:include page="/admin/component/footer.jsp" />
	</body>
</html>