<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java"
	import="com.entity.*,java.util.*,com.dao.*,com.impl.*,com.utils.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>项目管理 - 光速众包后台管理系统</title>
<link
	href="http://localhost:8080/Crowdsourcing/public/css/bootstrap.css"
	rel="stylesheet" type="text/css" />
</head>
<body>
	<jsp:include page="/admin/component/header.jsp" />
	
	<div class="container" align="center" id="body-main">
	<%
	String administrator = (String) session.getAttribute("administrator");
	String adminRole = (String) session.getAttribute("adminRole");
	int adminId = 0;
	if (session.getAttribute("adminId") != null) {
		adminId = Integer.valueOf(session.getAttribute("adminId").toString());
	}
	// 判断管理员是否登录
	if (administrator != null || adminId != 0) {
		ProjectDAO pjdao = new ProjectDAOImpl();
		List<Project> pjList = pjdao.showAllProject();
	%>
	<h1>项目管理</h1>
	<hr/>
	<table class="table table-striped">
		<thead>
			<tr>
				<th>项目ID</th>
				<th>项目名</th>
				<th>金额</th>
				<th>类型</th>
				<th>周期</th>
				<th>简介</th>
				<th>技能</th>
				<th>需求方id</th>
				<th>开发者id</th>
				<th>创建时间</th>
				<th>修改时间</th>
			</tr>
		</thead>
		<tbody>
		<% for (Project pj : pjList) { %>
			<tr>
				<td><%=pj.getId()%></td>
				<td><%=pj.getTitle()%></td>
				<td><%=pj.getMoney()%></td>
				<td><%=pj.getType()%></td>
				<td><%=pj.getCycle()%></td>
				<td><%=pj.getSummary()%></td>
				<td><%=pj.getSkill()%></td>
				<td><%=pj.getRequestorId()%></td>
				<td><%=pj.getDeveloperId()%></td>
				<td><%=pj.getGmtCreate()%></td>
				<td><%=pj.getGmtModified()%></td>
			</tr>
		<% } %>
		</tbody>
	</table>
	<%
	}
	%>
	</div>
	<jsp:include page="/admin/component/footer.jsp" />
</body>
</html>