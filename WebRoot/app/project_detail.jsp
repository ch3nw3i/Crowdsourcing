<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"
	import="com.entity.*,java.util.*,com.dao.*,com.impl.*,com.utils.*"%>
<%
	int id = Integer.parseInt(request.getParameter("id"));
	ProjectDAO pjDao = new ProjectDAOImpl();
	Project pj = pjDao.findById(id);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link
			href="http://localhost:8080/Crowdsourcing/public/css/bootstrap.css"
			rel="stylesheet" type="text/css" />
		<title><%=pj.getTitle()%> - 项目详情</title>
	</head>
	<body>

		<jsp:include page="/app/component/header.jsp" />
		<div class="container" align="center" id="body-main">
			<div class="col-md-8" align="left">
				<h1 style="text-align: center"><%=pj.getTitle()%></h1>
				<h2 style="text-align: right; color: blue">
					项目金额：￥<%=pj.getMoney()%>元
				</h2>
				<table class="table table-striped">
					<tbody>
						<tr>
							<td>
								项目名称
							</td>
							<td>
								<%=pj.getTitle()%>
							</td>
						</tr>

						<tr>
							<td>
								项目类型
							</td>
							<td>
								<%=pj.getType()%>
							</td>
						</tr>
						<tr>
							<td>
								项目周期
							</td>
							<td>
								<%=pj.getCycle()%>
							</td>
						</tr>
						<tr>
							<td>
								项目简介
							</td>
							<td>
								<textarea class="form-control" readonly="readonly"
									style="resize: none;" rows="10" name="cycle"><%=pj.getSummary()%></textarea>
							</td>
						</tr>
						<tr>
							<td>
								参考资料（URL）
							</td>
							<td>
								<%=pj.getReference()%>
							</td>
						</tr>
						<tr>
							<td>
								要求技能
							</td>
							<td>
								<%=pj.getSkill()%>
							</td>
						</tr>
						<tr>
							<td>
								其他要求
							</td>
							<td>
								<%=pj.getRequirement()%>
							</td>
						</tr>
						<tr>
							<td>
								是否驻场开发
							</td>
							<td>
								<%=pj.getIsSettled()%>
							</td>
						</tr>
						<tr>
							<td>
								驻场城市
							</td>
							<td>
								<%=pj.getCity()%>
							</td>
						</tr>
						<tr>
							<td>
								需求文档
							</td>
							<td>
								<%=pj.getRequirementDoc()%>
							</td>
						</tr>
						<tr>
							<td>
								项目状态
							</td>
							<td>
								<%=pj.getStatus()%>
							</td>
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
								boolean devFlag = false;
								boolean loginFlag = false;
								if (session.getAttribute("userRole") != null) {
									userRole = session.getAttribute("userRole").toString();
									String[] roleArr = StringDeal.splitString(userRole);
									for (int i = 0; i < roleArr.length; i++) {
										if (roleArr[i].equals("普通用户")) {
											loginFlag = true;
										}
										if (roleArr[i].equals("开发者")) {
											devFlag = true;
										}
									}
								}
								// 若用户已登录，则显示 收藏项目 按钮
								if (loginFlag) {
							%>
							<form action="collection_collect" method="post">
								<input type="hidden" name="userId" value="<%=userId %>" />
								<input type="hidden" name="collectionType" value="project" />
								<input type="hidden" name="collectionId" value="<%=pj.getId() %>" />
								<input type="hidden" name="gmtCreate" value="<%=DateFormat.getDateTime() %>" />
								<input type="submit" class="btn btn-success" value="收藏项目" /><br/>
							</form>
							<%
									// 若用户已登录，且 userRole 含有开发者，则允许报名项目
									if (devFlag) {
							%>
							<input type="button" class="btn btn-success" value="报名项目" /><br/>
							<%		
									// 若用户已登录，但 userRole 不含有开发者，则要求用户进行开发者认证
									} else {
							%>
							<font color="red">提示：您不是认证开发者，若想报名参与项目开发，请先进行</font>
							<a
								href="http://localhost:8080/Crowdsourcing/app/developer_auth.jsp">
								<input type="button" class="btn btn-success" value="开发者认证" /> </a>
							<%
									}
								// 若用户未登录，则提示先进行登录，才可使用 收藏项目
								} else {
							%>
							<font color="red">提示：收藏项目需要登录。</font><br />
							<%
								}
							%>
						</td>
					</tr>
				</table>
			</div>
			<div class="col-md-4">
				软件众包平台上的项目详情
			</div>
		</div>
		<jsp:include page="/app/component/footer.jsp" />
		<script type="text/javascript" src="/public/js/jquery-3.2.1.js">
</script>
		<script type="text/javascript" src="/public/js/bootstrap.js">
</script>
	</body>
</html>