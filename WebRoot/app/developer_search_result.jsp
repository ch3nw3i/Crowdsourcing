<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"
	import="com.entity.*,java.util.*,com.dao.*,com.impl.*" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String keyword = request.getParameter("developer_keyword");
	//out.println(keyword);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link
			href="http://localhost:8080/Crowdsourcing/public/css/bootstrap.css"
			rel="stylesheet" type="text/css" />
		<title>开发者关键词：“<%=keyword%>” - 搜索结果</title>
	</head>
	<body>
		<jsp:include page="/app/component/header.jsp" />
		<h1 style="text-align: center">
			开发者名称：“<%=keyword%>” - 搜索结果
		</h1>
		<div class="container" align="center" id="body-main">
			<hr/>
			<%
				String name_keyword = request.getParameter("developer_keyword");
				DeveloperDAO dpDao = new DeveloperDAOImpl();
				List<Developer> dpList =  dpDao.findByDeveloperNameKeyword(name_keyword);
				for (Developer dp : dpList) {
			%>
			<div class="col-md-8" align="left">
				<!--  style="border: 1px solid gray" -->
				<hr>
				<h3>
					<a href="../app/project_detail.jsp?id=<%=dp.getId()%>"><%=dp.getRealName()%></a>
				</h3>
				<br />
				<label>
					姓名：<%=dp.getRealName()%>
				</label>
				<br />
				<label>
					城市：<%=dp.getCity()%>
				</label>
				<br />
				<label>
					简介：<%=dp.getSummary()%>
				</label>
				<hr>
			</div>
			<%
				}
				if (dpList.isEmpty()) {
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