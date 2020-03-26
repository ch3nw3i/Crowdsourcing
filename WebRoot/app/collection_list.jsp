<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java" import="com.entity.Collection"%>
<%@ page language="java"
	import="com.entity.*,java.util.*,com.dao.*,com.impl.*,com.utils.*"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link
			href="http://localhost:8080/Crowdsourcing/public/css/bootstrap.css"
			rel="stylesheet" type="text/css" />
		<script
			src="http://localhost:8080/Crowdsourcing/public/js/jquery-3.2.1.js">
</script>
		<script
			src="http://localhost:8080/Crowdsourcing/public/js/bootstrap.js">
</script>

		<title>用户/开发者/项目收藏列表</title>
	</head>
	<body>
		<jsp:include page="/app/component/header.jsp" />
		<%
			CollectionDAO dao = new CollectionDAOImpl();
			UserDAO udao = new UserDAOImpl();
			ProjectDAO pjdao = new ProjectDAOImpl();
			int userId = Integer.parseInt(request.getParameter("userId"));
		%>
		<div class="container" align="center" id="body-main">
			<h2>
				收藏夹
			</h2>
			<div>
				<ul id="myTab" class="nav nav-tabs">
					<li class="active">
						<a href="#user_list" data-toggle="tab">收藏的用户/开发者列表</a>
					</li>
					<li>
						<a href="#project_list" data-toggle="tab">收藏的项目列表</a>
					</li>
				</ul>
			</div>
			<div id="myTabContent" class="col-md-12 container tab-content">
				<div class="tab-pane fade in active" id="user_list">
					<%
						List<Collection> userColList = dao.getCollectionListByUserId(
								userId, "user");
					%>
					<table class="table table-striped">
						<thead>
							<tr>
								<th colspan="4">
									收藏的用户/开发者列表
								</th>
							</tr>
							<tr>
								<th>
									用户id
								</th>
								<th>
									用户名
								</th>
								<th>
									用户角色
								</th>
								<th>
									操作
								</th>
							</tr>
						</thead>
						<tbody>
							<%
								if (!userColList.equals(null)) {
									for (Collection uCol : userColList) {
							%>

							<tr>
								<td><%=uCol.getCollectionId()%></td>
								<td>
									<%
										User u = udao.findById(uCol.getCollectionId());
												out.println(u.getNickname());
									%>
								</td>
								<td>
									<%
										String[] roleArr = StringDeal.splitString(u.getRole());
												boolean loginFlag = false;
												boolean devFlag = false;
												boolean reqFlag = false;
												for (int i = 0; i < roleArr.length; i++) {
													//if (i == roleArr.length - 1) {
													if (roleArr[i].equals("普通用户")) {
														loginFlag = true;
													}
													if (roleArr[i].equals("开发者")) {
														devFlag = true;
													}
													if (roleArr[i].equals("需求方")) {
														reqFlag = true;
													}
													//}
												}
												out
														.println("<span style=\"border: 1px solid #0033FF\">普通用户</span>");
												//}
												if (devFlag) {
													out
															.println("<span style=\"border: 1px solid #FF6600\">开发者</span>");
												}
												if (reqFlag) {
													out
															.println("<span style=\"border: 1px solid #9933FF\">需求方</span>");
												}
									%>
								</td>
								<td>
									<!-- <a href="/Crowdsourcing/app/developer_detail.jsp?id=">
									<input type="button" class="btn btn-info" value="查看" />
								</a> -->

									<form action="collection_delete" method="post">
										<input type="button" class="btn btn-primary"
												data-toggle="modal" data-target="#newsModal" value="发送消息" />
										<input type="hidden" name="id" value="<%=uCol.getId()%>" />
										<input type="submit" class="btn btn-danger" value="移除" />
									</form>
									<!-- 模态框（Modal） -->
									<div class="modal fade" id="newsModal" tabindex="-1" role="dialog"
										aria-labelledby="myModalLabel" aria-hidden="true">
										<div class="modal-dialog">
											<div class="modal-content">
											<form action="news_send" method="post">
												<div class="modal-header">
													<button type="button" class="close" data-dismiss="modal"
														aria-hidden="true">
														&times;
													</button>
													<h4 class="modal-title" id="myModalLabel">
														正在 向用户“<%=u.getNickname()%>”发送站内消息
													</h4>
												</div>
												<div class="modal-body">
													<textarea name="content" class="form-control" style="resize: none;" rows="5"></textarea>
													<input type="hidden" name="status" value="未读" />
													<input type="hidden" name="type" value="站内信" />
													<input type="hidden" name="fromUserId" value="<%=userId %>" />
													<input type="hidden" name="toUserId" value="<%=u.getId() %>" />
													<input type="hidden" name="gmtCreate" value="<%=DateFormat.getDateTime() %>" /> 
												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-default" data-dismiss="modal">
														取消
													</button>
													<button type="submit" class="btn btn-primary">
														发送消息
													</button>
												</div>
											</form>
											</div>
											<!-- /.modal-content -->
										</div>
										<!-- /.modal -->
									</div>
								</td>
							</tr>
							<%
								}
								} else {
									out
											.println("<tr><td colspan=\"4\"><font color=\"red\">暂未收藏任何用户</font></td></tr>");
								}
							%>
						</tbody>
					</table>
				</div>

				<div class="tab-pane fade" id="project_list">
					<%
						List<Collection> pjColList = dao.getCollectionListByUserId(userId,
								"project");
					%>
					<table class="table table-striped">
						<thead>
							<tr>
								<th colspan="4">
									收藏的项目列表
								</th>
							</tr>
							<tr>
								<th>
									项目id
								</th>
								<th>
									项目名
								</th>
								<th>
									操作
								</th>
							</tr>
						</thead>
						<tbody>
							<%
								if (!pjColList.equals(null)) {
									for (Collection pjCol : pjColList) {
							%>
							<tr>
								<td><%=pjCol.getCollectionId()%></td>
								<td>
									<%
										Project pj = pjdao.findById(pjCol.getCollectionId());
												out.println(pj.getTitle());
									%>
								</td>
								<td>
									<form action="collection_delete" method="post">
										<a
											href="/Crowdsourcing/app/project_detail.jsp?id=<%=pjCol.getCollectionId()%>">
											<input type="button" class="btn btn-info" value="查看" /> </a>
										<input type="hidden" name="id" value="<%=pjCol.getId()%>" />
										<input type="submit" class="btn btn-danger" value="移除" />
									</form>
								</td>
							</tr>
							<%
								}
								} else {
									out
											.println("<tr><td colspan=\"4\"><font color=\"red\">暂未收藏任何项目</font></td></tr>");
								}
							%>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		
		

		<jsp:include page="/app/component/footer.jsp" />
	</body>
</html>