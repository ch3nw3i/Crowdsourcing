<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"
	import="com.entity.*,java.util.*,com.dao.*,com.impl.*"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link
			href="http://localhost:8080/Crowdsourcing/public/css/bootstrap.css"
			rel="stylesheet" type="text/css" />
		<title>开发者大厅</title>
	</head>
	<body>
		<jsp:include page="/app/component/header.jsp" />
		<!-- 项目搜索div -->
		<div class="container" align="center" id="search-form-group">
			<h1>
				开发者大厅
			</h1>
			<hr>
			<p class="text-center">
				开发者搜索
			</p>
			<form class="form-inline"
				action="http://localhost:8080/Crowdsourcing/app/developer_search_result.jsp"
				method="post">
				<input type="text" class="form-control" name="developer_keyword"
						style="width: 40%" placeholder="请输入开发者关键词" />
				<button type="submit" class="btn btn-success">
					搜索
				</button>
			</form>
		</div>

		<!-- 开发者概览div -->
		<div class="container" align="center" id="body-main">
			<%
				DeveloperDAO dpDao = new DeveloperDAOImpl();
				List<Developer> dpList = dpDao.getByRange(1, 10);
				for (Developer dp : dpList) {
			%>
			<div class="col-md-8" align="left">
				<!--  style="border: 1px solid gray" -->
				<hr>
				<h3>
					<a
						href="/Crowdsourcing/app/developer_detail.jsp?id=<%=dp.getId()%>">
						<%=dp.getRealName()%> </a>
				</h3>
				<br />
				<label>
					城市：<%=dp.getCity()%>
				</label>
				<br />
				<label>
					开发者简介：<%=dp.getSummary()%>
				</label>
				<br />
				<label>
					技能列表：<%=dp.getSkill()%>
				</label>
				<hr>
			</div>
			<%
				}
			%>
			<div class="col-md-4" align="left" style="border: 1px solid black">
				<h3><a href="developer_hall.jsp">开发者大厅</a></h3>
				用户通过“<a href="developer_auth.jsp">开发者认证</a>”后，会在这里显示。<br/>
				也可以通过“开发者大厅”页面上部的“搜索框”进行查找。<br/>
				<br/>
			</div>
		</div>
		<jsp:include page="/app/component/footer.jsp" />
		<script type="text/javascript" src="/public/js/jquery-3.2.1.js">
</script>
		<script type="text/javascript" src="/public/js/bootstrap.js">
</script>
	</body>
</html>