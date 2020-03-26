<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"
	import="com.entity.*,java.util.*,com.dao.*,com.impl.*,com.utils.*"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link
			href="http://localhost:8080/Crowdsourcing/public/css/bootstrap.css"
			rel="stylesheet" type="text/css" />
		<script src="http://localhost:8080/Crowdsourcing/public/js/jquery-3.2.1.js"></script>
		<script src="http://localhost:8080/Crowdsourcing/public/js/bootstrap.js"></script>
		<title>个人中心 - 光速众包</title>
	</head>
	<body>
		<jsp:include page="/app/component/header.jsp" />
		<%
			String username = (String) session.getAttribute("username");
			int userId = 0;
			if (session.getAttribute("userId") != null) {
				userId = Integer.valueOf(session.getAttribute("userId")
						.toString());
			}
			// 1  判断用户是否登录，未登录情况
			if (username == null || userId == 0) {
		%>
		<div class="container" align="center" id="body-main">
			<div>
				请先
				<font color="red">登录</font>后再进行操作。
				<br />
				如果你没有账号，可以点击上方的“
				<font color="red">注册</font>”按钮，在线注册。
				<br />
				如果你忘记了登录密码，可以点击下方的“
				<font color="red">密码找回</font>”按钮，根据提示重置密码。
				<br />
			</div>
			<hr />
			<a href="http://localhost:8080/Crowdsourcing/app/fp_username.jsp">
				<input type="button" class="btn btn-success" value="密码找回" /> </a>
		</div>


		<% // 2  若用户已登录，显示个人资料
			} else {
		%>
		<div class="container" align="center" id="body-main">
			<%
				UserDAO udao = new UserDAOImpl();
				User u = udao.findByUsername(username);
				boolean loginFlag = false;
				boolean devFlag = false;
				boolean reqFlag = false;
			%>

			<!-- 用户基本资料 -->
			<div class="col-md-6">
				<form action="user_update" method="post">
					<table class="table table-striped">
						<thead>
							<tr>
								<th colspan="2">
									用户基本资料
								</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>
									当前用户
								</td>
								<td><%=username%></td>
							</tr>
							<tr>
								<td>
									昵称
								</td>
								<td>
									<%=u.getNickname()%>
								</td>
							</tr>
							<!-- <tr>
								<td>
									头像
								</td>
								<td>
									<s:form action="login" method="post" enctype="multipart/form-data">
										<s:file name="img" label="头像" />
										<s:submit value="上传" />
									</s:form>
								</td>
							</tr> -->
							<tr>
								<td>
									角色
								</td>
								<td>
						<%
							String[] roleArr = StringDeal.splitString(u.getRole());
							for (int i = 0; i < roleArr.length; i++) {
								if (i == roleArr.length - 1) {
									out.print(roleArr[i]);
									break;
								}
								out.print(roleArr[i] + "、");
							}
						%>
								</td>
							</tr>
						</tbody>
						<!-- <tr>
							<td colspan="2" align="center">
								<input type="hidden" name="id" value="<%//=userId %>" />
								<input type="submit" class="btn btn-info" value="修改个人资料" /> 
							</td>
						</tr> -->
					</table>
				</form>
			</div>
			
			<div class="col-md-6">
				<ul id="myTab" class="nav nav-tabs">
					<li class="active"><a href="#news_receive" data-toggle="tab">消息收件箱</a></li>
					<li><a href="#news_sended" data-toggle="tab">已发送消息</a></li>
					<li>
						<a href="http://localhost:8080/Crowdsourcing/app/collection_list.jsp?userId=<%=userId %>">
							<input type="button" class="btn btn-success" value="查看收藏夹" />
						</a>
					</li>
				</ul>
			</div>
			<% NewsDAO newsDao = new NewsDAOImpl(); %>
			<div id="myTabContent" class="col-md-6 container tab-content">
				<div class="tab-pane fade" id="news_sended">
					<%
						List<News> sendNewsList = newsDao.getNewsByFromUserId(userId);
					%>
					<table class="table table-striped">
						<thead>
							<tr>
								<th colspan="4">
									我发送的站内消息
								</th>
							</tr>
							<tr>
								<th>
									接收人
								</th>
								<th>
									内容
								</th>
								<th>
									类型
								</th>
								<th>
									发送时间
								</th>
							</tr>
						</thead>
						<tbody>
							<%
								for (News news : sendNewsList) {
							%>
							<tr>
								<td><%=udao.findById(news.getToUserId()).getNickname()%></td>
								<td><%=news.getContent()%></td>
								<td><%=news.getType()%></td>
								<td><%=news.getGmtCreate()%></td>
							</tr>
							<%
								}
							%>
						</tbody>
					</table>
				</div>
				<div class="tab-pane fade in active" id="news_receive">
					<%
						List<News> receiveNewsList = newsDao.getNewsByToUserId(userId);
					%>
					<table class="table table-striped">
						<thead>
							<tr>
								<th colspan="4">
									我收到的站内消息
								</th>
							</tr>
							<tr>
								<th>
									发送人
								</th>
								<th>
									内容
								</th>
								<th>
									类型
								</th>
								<th>
									发送时间
								</th>
								<th>
									状态
								</th>
								<th>
									操作
								</th>
							</tr>
						</thead>
						<tbody>
							<%
							if (receiveNewsList != null) {
								for (News news : receiveNewsList) {
							%>
							
							<tr>
							<form action="news_set_status" method="post">
								<td><%=udao.findById(news.getFromUserId())
									.getNickname()%></td>
								<td><font color="blue"><%=news.getContent()%></font></td>
								<td><%=news.getType()%></td>
								<td><%=news.getGmtCreate()%></td>
									<%
									if (news.getStatus().equals("未读")) {
									%>
										<td><font color="red">未读</font></td>
										<td>
											<input type="hidden" name="id" value="<%=news.getId() %>" />
											<input type="hidden" name="status" value="已读" />
											<font color="red"><input type="submit" value="设为已读" /></font>
										</td>
									<%		
									} else if (news.getStatus().equals("已读")){
									%>
										<td><font color="orange">已读</font></td>
										<td>
											<input type="hidden" name="id" value="<%=news.getId() %>" />
											<input type="hidden" name="status" value="未读" />
											<font color="orange"><input type="submit" value="设为未读" /></font>
										</td>
									<%} %>
							</form>
							</tr>
							<%
								}
							}
							%>
						</tbody>
					</table>
				</div>
			</div>

			<!-- 我收到的站内消息 -->
			<div class="col-md-6">
				<br />
				
				<br />
			</div>
		</div>

			<%  // 设置用户角色 标识
				for (int i = 0; i < roleArr.length; i++) {
					if (roleArr[i].equals("开发者")) {
						devFlag = true;
					}
					if (roleArr[i].equals("需求方")) {
						reqFlag = true;
					}
				}
				ProjectDAO pjDao = new ProjectDAOImpl();
				// 2.1  判断用户是否为开发者
				if (devFlag) {
			%>
		<!-- 我参与的项目【开发者】 -->
		<div class="container" align="center" id="body-main">
			<div class="col-md-12">
				<hr />
				<table class="table table-striped">
					<thead>
						<tr>
							<th colspan="7">
								我参与的项目【开发者】
							</th>
						</tr>
						<tr>
							<th>
								项目ID
							</th>
							<th>
								项目名
							</th>
							<th>
								金额
							</th>
							<th>
								类型
							</th>
							<th>
								需求方
							</th>
							<th>
								状态
							</th>
							<th>
								操作
							</th>
						</tr>
					</thead>
					<tbody>
					<%
					List<Project> pjList = pjDao.findByDeveloperId(userId);
					if (!pjList.equals(null)) {
						for (Project pj : pjList) {
					%>
						<tr>
							<td><%=pj.getId()%></td>
							<td><%=pj.getTitle()%></td>
							<td><%=pj.getMoney()%></td>
							<td><%=pj.getType()%></td>
							<td><%=pj.getRequestorId()%></td>
							<td><%=pj.getStatus()%></td>
							<td>
								<input type="button" class="btn btn-success" value="提交成果" />
							</td>
						</tr>
					<%
						}
					} else {
					%>
						<tr>
							<td colspan="6">
								<font color="red">尚未参与项目</font>
							</td>
						</tr>
					<%
					}
					%>
					</tbody>
				</table>
				<hr />
			</div>
		</div>
			<%
				// 2.2 若用户不是开发者，提示进行开发者认证
				} else {
			%>
		<!-- 提示：开发者认证 -->
		<div class="container" align="center" id="body-main">
			<div class="col-md-12">
				<table class="table table-striped">
					<thead>
						<tr>
							<th colspan="7">
								参与的项目【开发者】
							</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>
								尚未成为认证开发者
							</td>
							<td>
								<a href="developer_auth.jsp"><input type="button" class="btn btn-success"
										value="开发者认证" />
								</a>
							</td>
						</tr>
						<tr>
							<td>
								成为开发者后可以参与项目
							</td>
							<td>
								<a href="project_hall.jsp"> <input type="button" class="btn btn-info"
										value="去项目大厅逛逛" /> </a>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<hr />
			<%
				}
				// 2.3 判断用户是否为需求方
				if (reqFlag) {
					List<Project> pjList = pjDao.findByRequestorId(userId);
			%>
		<!-- 发布的项目【需求方】 -->
		<div class="container" align="center" id="body-main">
			<div class="col-md-12">
				<table class="table table-striped">
					<thead>
						<tr>
							<th>
								发布的项目【需求方】
							</th>
						</tr>
						<tr>
							<th>
								项目ID
							</th>
							<th>
								项目名
							</th>
							<th>
								金额
							</th>
							<th>
								类型
							</th>
							<th>
								需求方
							</th>
							<th>
								状态
							</th>
							<th>
								操作
							</th>
						</tr>
					</thead>
					<tbody>
						<%
							if (!pjList.equals(null)) {
								for (Project pj : pjList) {
						%>
						<tr>
							<td><%=pj.getId()%></td>
							<td><%=pj.getTitle()%></td>
							<td><%=pj.getMoney()%></td>
							<td><%=pj.getType()%></td>
							<td><%=pj.getRequestorId()%></td>
							<td><%=pj.getStatus()%></td>
							<td>
								<input type="button" class="btn btn-success" value="项目管理" />
							</td>
						</tr>
						<%
							}
						} else {
						%>
						<tr>
							<td colspan="6">
								<font color="red">尚未发布项目</font>
							</td>
						</tr>
						<%
						}
						%>
					</tbody>
				</table>
			</div>
		</div>
			<%
				}
			} // 判断是否登录的结束标记
			%>

		<jsp:include page="/app/component/footer.jsp" />
		<script type="text/javascript" src="public/js/jquery-3.2.1.js">
</script>
		<script type="text/javascript" src="public/js/bootstrap.js">
</script>
	</body>
</html>