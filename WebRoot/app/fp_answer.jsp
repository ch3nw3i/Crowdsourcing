<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"
	import="com.entity.*,java.util.*,com.dao.*,com.impl.*"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>密码找回 - 光速众包</title>
		<link
			href="http://localhost:8080/Crowdsourcing/public/css/bootstrap.css"
			rel="stylesheet" type="text/css" />
	</head>
	<body>
		<br>
		<br>
		<br><jsp:include page="/app/component/header.jsp" />

		<div class="container" align="center" id="search-form-group">
			<%
				String fp_username = (String) session.getAttribute("fp_username");
				if (fp_username != "") {
					UserDAO udao = new UserDAOImpl();
					User user = udao.findByUsername(fp_username);
			%>
			<form action="user_anwser">
				<h3>
					2、回答密码找回问题的答案
				</h3>
				<table class="table table-striped">
					<tbody>
						<tr>
							<td colspan="2">
								当前正在找回用户：
								<%=fp_username%>
								的密码
							</td>
						</tr>
						<tr>
							<td>
								密码找回问题为
							</td>
							<td><%=user.getQuestion()%></td>
						</tr>
						<tr>
							<td>
								答案
							</td>
							<td>
								<input type="text" class="form-control" name="answer" />
							</td>
						</tr>
						<tr>
							<td colspan="2" align="center">
								<input type="hidden" name="username" value="<%=fp_username%>" />
								<input type="submit" class="btn btn-success" value="提交答案">
							</td>
						</tr>
					</tbody>
				</table>
			</form>
			<%
				}
			%>
		</div>

		<jsp:include page="/app/component/footer.jsp" />
		<script type="text/javascript" src="/public/js/jquery-3.2.1.js">
</script>
		<script type="text/javascript" src="/public/js/bootstrap.js">
</script>
	</body>
</html>