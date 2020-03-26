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
		<title>项目大厅</title>
	</head>
	<body>
		<jsp:include page="/app/component/header.jsp" />
		<!-- 项目搜索div -->
		<div class="container" align="center" id="search-form-group">
			<h1>
				项目大厅
			</h1>
			<hr>
			<p class="text-center">
				项目搜索
			</p>
			<form class="form-inline"
				action="http://localhost:8080/Crowdsourcing/app/project_search_result.jsp"
				method="post">
				<input type="text" class="form-control" name="project_keyword"
					style="width: 40%" placeholder="请输入项目关键词" />
				<button type="submit" class="btn btn-success">
					搜索
				</button>
			</form>

		</div>
		<!-- 项目概览div -->
		<div class="container" align="center" id="body-main">
			<%
				ProjectDAO pjDao = new ProjectDAOImpl();
				List<Project> pjList = pjDao.getByRange(1, 10);
				for (Project pj : pjList) {
			%>
			<div class="col-md-8" align="left">
				<!--  style="border: 1px solid gray" -->
				<hr>
				<h3>
					<a href="http://localhost:8080/Crowdsourcing/app/project_detail.jsp?id=<%=pj.getId()%>">
						<%=pj.getTitle()%> </a>
				</h3>
				<br />
				<label>
					项目金额：<%=pj.getMoney()%>
				</label>
				<br />
				<label>
					项目简介：<%=pj.getSummary()%>
				</label>
				<br />
				<label>
					所需技能：<%=pj.getSkill()%>
				</label>
				<hr>
			</div>
			<%
				}
			%>
			<div class="col-md-4" align="left" style="border: 1px solid black">
				<h3>项目参与流程：</h3><br/>
				1、用户需要先进行“<a href="developer_auth.jsp">开发者认证</a>”<br/>
				2、在“<a href="project_hall.jsp">项目大厅</a>”点击开发者想要参与的项目<br/>
				3、进入项目详情页后，在详情页的底部点击“报名项目”按钮，即可完成报名。<br/>
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