<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"
	import="com.entity.*,java.util.*,com.dao.*,com.impl.*"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String keyword = request.getParameter("project_keyword");
	//out.println(keyword);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link
			href="http://localhost:8080/Crowdsourcing/public/css/bootstrap.css"
			rel="stylesheet" type="text/css" />
		<title>项目名关键词：“<%=keyword%>” - 搜索结果</title>
	</head>
	<body>
		<jsp:include page="/app/component/header.jsp" />
		<h1 style="text-align: center">
			项目名关键词：“<%=keyword%>” - 搜索结果
		</h1>
		<div class="container" align="center" id="body-main">
		<hr/>
			<%
				String title_keyword = request.getParameter("project_keyword");
				ProjectDAO pjDao = new ProjectDAOImpl();
				List<Project> pjList =  pjDao.findByProjectTitleKeyword(title_keyword);
				for (Project pj : pjList) {
			%>
			<div class="col-md-8" align="left">
				<!--  style="border: 1px solid gray" -->
				<hr>
				<h3>
					<a href="../app/project_detail.jsp?id=<%=pj.getId()%>"><%=pj.getTitle()%></a>
				</h3>
				<br />
				<label>
					项目金额<%=pj.getMoney()%>
				</label>
				<br />
				<label>
					项目简介<%=pj.getSummary()%>
				</label>
				<br />
				<label>
					所需技能列表<%=pj.getSkill()%>
				</label>
				<hr>
			</div>
			<%
				}if (pjList.isEmpty()) {
			%>
			<div class="col-md-8" align="left">
				<font color="red">搜索结果为空</font>
			</div>
			<%
				} 
			%>
			<div class="col-md-4">
				123
			</div>
		</div>
		<jsp:include page="/app/component/footer.jsp" />
		<script type="text/javascript" src="/public/js/jquery-3.2.1.js">
</script>
		<script type="text/javascript" src="/public/js/bootstrap.js">
</script>
	</body>
</html>