<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"
	import="com.entity.*,java.util.*,com.dao.*,com.impl.*,com.utils.*"%>
<%
	int id = Integer.parseInt(request.getParameter("id"));
	DeveloperDAO dpDao = new DeveloperDAOImpl();
	Developer dp = dpDao.findById(id);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link
			href="http://localhost:8080/Crowdsourcing/public/css/bootstrap.css"
			rel="stylesheet" type="text/css" />
		<title><%=dp.getRealName()%> - 开发者详情</title>
	</head>
	<body>

		<jsp:include page="/app/component/header.jsp" />
		<div class="container" align="center" id="body-main">
			<div class="col-md-8" align="left">
				<!--  style="border: 1px solid gray" -->
				<h1 style="text-align: center">
					<%=dp.getRealName()%>
				</h1>
				<br />
				<table class="table table-striped">
					<tbody>
						<tr>
							<td>
								性别
							</td>
							<td><%=dp.getGender()%></td>
						</tr>
						<tr>
							<td>
								城市
							</td>
							<td><%=dp.getCity()%></td>
						</tr>
						<tr>
							<td>
								技能列表
							</td>
							<td><%=dp.getSkill()%></td>
						</tr>
						<tr>
							<td>
								开发者简介
							</td>
							<td><textarea class="form-control" readonly="readonly"
									style="resize: none;" rows="5" name="summary"><%=dp.getSummary()%></textarea></td>
						</tr>
						<tr>
							<td>
								工作经验
							</td>
							<td><textarea class="form-control" readonly="readonly"
									style="resize: none;" rows="5" name="workingExperience"><%=dp.getWorkingExperience()%></textarea></td>
						</tr>
						<tr>
							<td>
								项目经验
							</td>
							<td><textarea class="form-control" readonly="readonly"
									style="resize: none;" rows="5" name="projectExperience"><%=dp.getProjectExperience()%></textarea></td>
						</tr>
						<tr>
							<td>
								期望工作
							</td>
							<td><%=dp.getExpectionWork()%></td>
						</tr>
					</tbody>
					<tr>
						<td colspan="2" align="center">
							<%
								String userRole = null;
								int userId = 0;
								if (session.getAttribute("userId") != null) {
									userId = Integer.valueOf(session.getAttribute("userId").toString());
								}
								boolean loginFlag = false;
								if (session.getAttribute("userRole") != null) {
									userRole = session.getAttribute("userRole").toString();
									String[] roleArr = StringDeal.splitString(userRole);
									for (int i = 0; i < roleArr.length; i++) {
										if (roleArr[i].equals("普通用户")) {
											loginFlag = true;
										}
									}
								}
								// 若用户已登录，则显示 收藏项目 按钮
								if (loginFlag) {
							%>
							<form action="collection_collect" method="post">
								<input type="hidden" name="userId" value="<%=userId %>" />
								<input type="hidden" name="collectionType" value="user" />
								<input type="hidden" name="collectionId" value="<%=dp.getId() %>" />
								<input type="hidden" name="gmtCreate" value="<%=DateFormat.getDateTime() %>" />
								<input type="submit" class="btn btn-success" value="收藏开发者" />
							</form>
							<br />
							<%
									// 若用户未登录，则提示先进行登录，才可使用 收藏项目
								} else {
							%>
							<font color="red">提示：收藏开发者需要登录。</font>
							<br />
							<%
								}
							%>
						</td>
					</tr>
				</table>
			</div>
			<div class="col-md-4">
				软件众包平台上的开发者详情
			</div>
		</div>
		<jsp:include page="/app/component/footer.jsp" />
		<script type="text/javascript" src="/public/js/jquery-3.2.1.js">
</script>
		<script type="text/javascript" src="/public/js/bootstrap.js">
</script>
	</body>
</html>