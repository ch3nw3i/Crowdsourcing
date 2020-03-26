<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"
	import="com.entity.*,java.util.*,com.dao.*,com.impl.*,com.utils.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>系统管理 - 光速众包后台管理系统</title>
		<link
			href="http://localhost:8080/Crowdsourcing/public/css/bootstrap.css"
			rel="stylesheet" type="text/css" />
		<script
			src="http://localhost:8080/Crowdsourcing/public/js/jquery-3.2.1.js">
</script>
		<script
			src="http://localhost:8080/Crowdsourcing/public/js/bootstrap.js">
</script>
	</head>
	<body>
		<jsp:include page="/admin/component/header.jsp" />
		<%
			String administrator = (String) session
					.getAttribute("administrator");
			String adminRole = (String) session.getAttribute("adminRole");
			int adminId = 0;
			if (session.getAttribute("adminId") != null) {
				adminId = Integer.valueOf(session.getAttribute("adminId")
						.toString());
			}
			// 判断管理员是否登录
			if (administrator != null || adminId != 0) {
				UserDAO udao = new UserDAOImpl();
				List<User> userList = udao.showAllUser();

				ProjectDAO pjdao = new ProjectDAOImpl();
				List<Project> pjList = pjdao.showAllProject();

				AdministratorDAO adminDao = new AdministratorDAOImpl();
				List<Administrator> adminList = adminDao.showAllAdministrator();

				AppTypeDAO atDao = new AppTypeDAOImpl();
				List<AppType> atList = atDao.getAllAppType();

				SkillDAO skillDao = new SkillDAOImpl();
				List<Skill> skillList = skillDao.getAllSkill();

				DeveloperDAO devdao = new DeveloperDAOImpl();
				List<Developer> devList = devdao.showAllDeveloper();
		%>
		<div class="container" align="center" id="function_button">
			<ul id="myTab" class="nav nav-tabs">
				<li class="active">
					<a href="#user_manage" data-toggle="tab">用户管理</a>
				</li>
				<li>
					<a href="#developer_manage" data-toggle="tab">开发者管理</a>
				</li>
				<li>
					<a href="#project_manage" data-toggle="tab">项目管理</a>
				</li>
				<li>
					<a href="#administrator_manage" data-toggle="tab">管理员管理</a>
				</li>

				<li class="dropdown">
					<a href="#system_manage" id="myTabDrop1" class="dropdown-toggle"
						data-toggle="dropdown">系统管理 <b class="caret"></b> </a>
					<ul class="dropdown-menu" role="menu" aria-labelledby="myTabDrop1">
						<li>
							<a href="#apptype_manage" tabindex="-1" data-toggle="tab">应用类型</a>
						</li>
						<li>
							<a href="#skill_manage" tabindex="-1" data-toggle="tab">技能</a>
						</li>
					</ul>
				</li>
			</ul>
		</div>
		<div id="myTabContent" class="container tab-content">
			<!-- 用户管理 -->
			<div class="tab-pane fade in active" id="user_manage">
				<h1>
					用户管理
				</h1>
				<hr />
				<table class="table table-striped">
					<thead>
						<tr>
							<th>
								ID
							</th>
							<th>
								用户名
							</th>
							<th>
								昵称
							</th>
							<th>
								状态
							</th>
							<th>
								角色
							</th>
							<th>
								创建时间
							</th>
							<th>
								修改时间
							</th>
							<td>
								操作
							</td>
						</tr>
					</thead>
					<tbody>
						<%
							for (User user : userList) {
						%>
						<form action="user_set_status" method="post">
						<tr>
							<td><%=user.getId()%></td>
							<td><%=user.getUsername()%></td>
							<td><%=user.getNickname()%></td>
							<td><%=user.getStatus()%></td>
							<td><%=user.getRole()%></td>
							<td><%=user.getGmtCreate()%></td>
							<td><%=user.getGmtModified()%></td>
							<td>
								<input type="hidden" name="id" value="<%=user.getId()%>" />
								<%
									// 若当前状态为启用，则显示禁用按钮，status设为禁用
											if (user.getStatus().equals("启用")) {
								%>
								<input type="hidden" name="status" value="禁用" />
								<font color="red"><input type="submit" value="禁用" /> </font>
								<%
									// 若当前状态为 禁用，则显示启用按钮，status设为 启用
											} else if (user.getStatus().equals("禁用")) {
								%>
								<input type="hidden" name="status" value="启用" />
								<font color="green"><input type="submit" value="启用" /> </font>
								<%
									}
								%>
							</td>
						</tr>
						</form>
						<%
							}
						%>
					</tbody>
				</table>
			</div>

			<!-- 开发者管理 -->
			<div class="tab-pane fade" id="developer_manage">
				<h1>
					开发者管理
				</h1>
				<hr />
				<table class="table table-striped">
					<thead>
						<tr>
							<th>
								ID
							</th>
							<th>
								用户id
							</th>
							<th>
								真实姓名
							</th>
							<th>
								性别
							</th>
							<th>
								城市
							</th>
							<th>
								技能
							</th>
							<th>
								状态
							</th>
							<th>
								创建时间
							</th>
							<th>
								修改时间
							</th>
							<th>
								操作
							</th>
						</tr>
					</thead>
					<tbody>
						<%
							for (Developer dev : devList) {
						%>
						<form action="developer_set_status" method="post">
						<tr>
							<td><%=dev.getId()%></td>
							<td><%=dev.getUserId()%></td>
							<td><%=dev.getRealName()%></td>
							<td><%=dev.getGender()%></td>
							<td><%=dev.getCity()%></td>
							<td><%=dev.getSkill()%></td>
							<td><%=dev.getStatus()%></td>
							<td><%=dev.getGmtCreate()%></td>
							<td><%=dev.getGmtModified()%></td>
							<td>
								<input type="hidden" name="id" value="<%=dev.getId()%>" />
								<%
									// 若当前状态为启用，则显示禁用按钮，status设为禁用
									if (dev.getStatus().equals("启用")) {
								%>
								<input type="hidden" name="status" value="禁用" />
								<font color="red"><input type="submit" value="禁用" /> </font>
								<%
									// 若当前状态为 禁用，则显示启用按钮，status设为 启用
									} else if (dev.getStatus().equals("禁用")) {
								%>
								<input type="hidden" name="status" value="启用" />
								<font color="green"><input type="submit" value="启用" /> </font>
								<%
									} else if (dev.getStatus().equals("待审核")) {
								%>
								<input type="hidden" value="启用" />
								<input type="submit" value="通过认证" />
								<%
									}
								%>
							</td>
						</tr>
						</form>
						<%
							}
						%>
					</tbody>
				</table>
			</div>

			<!-- 项目管理 -->
			<div class="tab-pane fade" id="project_manage">
				<h1>
					项目管理
				</h1>
				<hr />
				<table class="table table-striped">
					<thead>
						<tr>
							<th>
								ID
							</th>
							<th>
								项目名
							</th>
							<th>
								金额
							</th>
							<th>
								状态
							</th>
							<th>
								类型
							</th>
							<th>
								周期
							</th>
							<th>
								简介
							</th>
							<th>
								技能
							</th>
							<th>
								需求方id
							</th>
							<th>
								开发者id
							</th>
							<th>
								创建时间
							</th>
							<th>
								修改时间
							</th>
							<th>
								操作
							</th>
						</tr>
					</thead>
					<tbody>
						<%
							for (Project pj : pjList) {
						%>
						<form action="project_approve" method="post">
						<tr>
							<td><%=pj.getId()%></td>
							<td><%=pj.getTitle()%></td>
							<td><%=pj.getMoney()%></td>
							<td><font color="red"><%=pj.getStatus()%></font></td>
							<td><%=pj.getType()%></td>
							<td><%=pj.getCycle()%></td>
							<td><%=pj.getSummary()%></td>
							<td><%=pj.getSkill()%></td>
							<td><%=pj.getRequestorId()%></td>
							<td><%=pj.getDeveloperId()%></td>
							<td><%=pj.getGmtCreate()%></td>
							<td><%=pj.getGmtModified()%></td>
							<td>
								<input type="hidden" name="id" value="<%=pj.getId()%>" />
								<%  if (pj.getStatus().equals("待审核")) { %>
								<input type="hidden" name="id" value="<%=pj.getId()%>" />
								<input type="hidden" name="status" value="招募中" />
								<font color="red"><input type="submit" value="通过审核" /> </font>
								<%  } else { %>
								<a
									href="/Crowdsourcing/app/project_detail.jsp?id=<%=pj.getId()%>"><input
										type="button" value="查看项目详情" /> </a>
								<%  } %>
							</td>
						</tr>
						</form>
						<%
							}
						%>
					</tbody>
				</table>
			</div>

			<!-- 管理员管理 -->
			<div class="tab-pane fade" id="administrator_manage">
				<h1>
					管理员管理
				</h1>
				<hr />
				<input type="button" class="btn btn-primary" data-toggle="modal"
					data-target="#newAdminModal" value="创建新管理员" />
				<hr />
				<table class="table table-striped">
					<thead>
						<tr>
							<th>
								ID
							</th>
							<th>
								账号
							</th>
							<th>
								姓名
							</th>
							<th>
								角色
							</th>
							<th>
								手机
							</th>
							<th>
								邮箱
							</th>
							<th>
								职责
							</th>
							<th>
								创建时间
							</th>
							<th>
								修改时间
							</th>
							<th>
								操作
							</th>
						</tr>
					</thead>
					<tbody>
						<%
							for (Administrator admin : adminList) {
						%>
						<tr>
							<td><%=admin.getId()%></td>
							<td><%=admin.getAdministrator()%></td>
							<td><%=admin.getName()%></td>
							<td><%=admin.getRole()%></td>
							<td><%=admin.getTelephone()%></td>
							<td><%=admin.getEmail()%></td>
							<td><%=admin.getDuty()%></td>
							<td><%=admin.getGmtCreate()%></td>
							<td><%=admin.getGmtModified()%></td>
							<td>
							<form action="admin_delete" method="post">
								<input type="hidden" name="id" value="<%=admin.getId() %>" />
								<input type="submit" class="btn btn-danger" value="删除" />
							</form>
							</td>
						</tr>
						<%
							}
						%>
					</tbody>
				</table>
				<hr />
				<font color="red">说明：</font>管理员角色的数字1、2、3、4分别表示系统管理员、项目管理员、客服人员
			</div>

			<!-- 系统管理 >>> 应用类型管理 -->
			<div class="tab-pane fade" id="apptype_manage">
				<h1>
					系统管理&nbsp;>>>&nbsp;应用类型管理
				</h1>
				<hr />
				<table class="table table-striped">
					<thead>
						<tr>
							<th>
								ID
							</th>
							<th>
								应用类型
							</th>
						</tr>
					</thead>
					<tbody>
						<%
							for (AppType at : atList) {
						%>
						<tr>
							<td><%=at.getId()%></td>
							<td><%=at.getAppType()%></td>
						</tr>
						<%
							}
						%>
					</tbody>
				</table>
			</div>

			<!-- 系统管理 >>> 技能类型管理 -->
			<div class="tab-pane fade" id="skill_manage">
				<h1>
					系统管理&nbsp;>>>&nbsp;技能类型管理
				</h1>
				<hr />
				<table class="table table-striped">
					<thead>
						<tr>
							<th>
								ID
							</th>
							<th>
								应用类型
							</th>
						</tr>
					</thead>
					<tbody>
						<%
							for (Skill skill : skillList) {
						%>
						<tr>
							<td><%=skill.getId()%></td>
							<td><%=skill.getSkill()%></td>
						</tr>
						<%
							}
						%>
					</tbody>
				</table>
			</div>
		</div>
		
		<!-- 创建管理员 模态框 -->
		<div class="modal fade" id="newAdminModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<form action="admin_add" method="post">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">
								&times;
							</button>
							<h4 class="modal-title" id="myModalLabel">
								正在创建新的管理员
							</h4>
						</div>
						<div class="modal-body">
							<table class="table table-striped">
								<tr>
									<td colspan="2">
										创建新管理员
									</td>
								</tr>
								<tr>
									<td>
										账号
									</td>
									<td>
										<input type="text" name="administrator" class="form-control"
											required />
									</td>
								</tr>
								<tr>
									<td>
										密码
									</td>
									<td>
										<input type="password" name="password" class="form-control"
											required />
									</td>
								</tr>
								<tr>
									<td>
										名字
									</td>
									<td>
										<input type="text" name="name" class="form-control" required />
									</td>
								</tr>
								<tr>
									<td>
										角色
									</td>
									<td>
										<select name="role" class="form-control">
											<option value="1">
												系统管理员
											</option>
											<option value="2">
												项目管理员
											</option>
											<option value="3">
												用户管理员
											</option>
											<option value="4">
												客服人员
											</option>
										</select>
									</td>
								</tr>
								<tr>
									<td>
										Tel
									</td>
									<td>
										<input type="text" name="telephone" class="form-control" />
									</td>
								</tr>
								<tr>
									<td>
										E-mail
									</td>
									<td>
										<input type="text" name="email" class="form-control" />
									</td>
								</tr>
								<tr>
									<td>
										职责
									</td>
									<td>
										<input type="text" name="duty" class="form-control" />
										<input type="hidden" nam="gmtCreate"
											value="<%=DateFormat.getDateTime()%>" />
									</td>
								</tr>
							</table>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">
								取消
							</button>
							<button type="submit" class="btn btn-primary">
								创建
							</button>
						</div>
					</form>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal -->
		</div>
		<%
			}
		%>
		<jsp:include page="/admin/component/footer.jsp" />
	</body>
</html>