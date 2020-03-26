<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page language="java"
	import="com.utils.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>开发者认证 - 光速众包</title>
		<link
			href="http://localhost:8080/Crowdsourcing/public/css/bootstrap.css"
			rel="stylesheet" type="text/css" />
	</head>
	<body>
		<jsp:include page="/app/component/header.jsp" />
		<div class="container" align="center" id="search-form-group">
			<div class="col-md-8" align="center">
				<form action="developer_auth_submit" method="post">
				<table class="table table-striped">
					<tbody>
						<tr>
							<td>
								真实姓名
							</td>
							<td>
								<%
									int userId = (Integer)session.getAttribute("userId");
								%>
								<input type="hidden" name="userId" value="<%=userId %>"/>
								<input type="text" class="form-control" name="realName" />
							</td>
						</tr>

						<tr>
							<td>
								性别
							</td>
							<td>
								<input type="radio" name="gender" value="男" checked="checked" />男
								<input type="radio" name="gender" value="女" />女
							</td>
						</tr>
						<tr>
							<td>
								所在城市
							</td>
							<td>
								<input type="text" name="city" class="form-control" />
							</td>
						</tr>
						<tr>
							<td>
								个人简介
							</td>
							<td>
								<textarea class="form-control" style="resize: none;" rows="10"
									name="summary"></textarea>
							</td>
						</tr>
						<tr>
							<td>
								工作经验
							</td>
							<td>
								<textarea class="form-control" style="resize: none;" rows="10"
									name="workingExperience"></textarea>
							</td>
						</tr>
						<tr>
							<td>
								项目经验
							</td>
							<td>
								<textarea class="form-control" style="resize: none;" rows="10"
									name="projectExperience"></textarea>
							</td>
						</tr>
						<tr>
							<td>
								期望项目类型
							</td>
							<td>
								<input type="text" name="expectionWork" class="form-control" />
							</td>
						</tr>
						<tr>
							<td>
								技能列表
							</td>
							<td>
								<input type="text" name="skill" class="form-control" />
							</td>
						</tr>
						<tr>
							<td colspan="2" align="center">
								<input type="hidden" name="status" value="待审核" />
								<input type="hidden" name="gmtCreate" value="<%=DateFormat.getDateTime() %>" />
								<input type="hidden" name="gmtModified" value="<%=DateFormat.getDateTime() %>" />
								<input type="submit" class="btn btn-success" value="提交认证"/>
							</td>
						</tr>
					</tbody>
				</table>
				</form>
			</div>
		</div>
		<jsp:include page="/app/component/footer.jsp" />
		<script type="text/javascript" src="/public/js/jquery-3.2.1.js">
</script>
		<script type="text/javascript" src="/public/js/bootstrap.js">
</script>
	</body>
</html>