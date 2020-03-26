<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"
	import="com.utils.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>项目发布 - 光速众包</title>
		<link
			href="http://localhost:8080/Crowdsourcing/public/css/bootstrap.css"
			rel="stylesheet" type="text/css" />
	</head>
	<body>

		<jsp:include page="/app/component/header.jsp" />
		<!-- 项目搜索div -->
		<div class="container" align="center" id="search-form-group">
			<div class="col-md-8">
				<form action="project_publish">
					<table class="table table-striped">
						<tr>
							<td colspan="2" align="center">项目发布</td>
						</tr>
						<tbody>
							<tr>
								<td>
									项目名称
								</td>
								<td><input class="form-control" type="text" name="title" /></td>
							</tr>
							<tr>
								<td>
									项目金额
								</td>
								<td>
									<label class="sr-only" for="exampleInputAmount">项目金额</label>
								    <div class="input-group">
								    	<div class="input-group-addon">￥</div>
								    		<input type="text" class="form-control" id="exampleInputAmount" placeholder="Amount">
								    	<div class="input-group-addon">元</div>
								    </div>
								</td>
							</tr>
							<tr>
								<td>
									项目类型
								</td>
								<td>
									<input class="form-control" type="text" name="type" />
								</td>
							</tr>
							<tr>
								<td>
									项目周期
								</td>
								<td>
									<input class="form-control" type="text" name="cycle" />
								</td>
							</tr>
							<tr>
								<td>
									项目简介
								</td>
								<td>
									<textarea class="form-control" style="resize:none;" rows="10" name="cycle" > </textarea>
								</td>
							</tr>
							<tr>
								<td>
									参考资料（URL）
								</td>
								<td>
									<input class="form-control" type="text" name="reference" />
								</td>
							</tr>
							<tr>
								<td>
									要求技能
								</td>
								<td>
									<input class="form-control" type="text" name="skill" />
								</td>
							</tr>
							<tr>
								<td>
									其他要求
								</td>
								<td>
									<input class="form-control" type="text" name="requirement" />
								</td>
							</tr>
							<tr>
								<td>
									是否驻场开发
								</td>
								<td>
									<input class="form-control" type="text" name="isSettled" />
								</td>
							</tr>
							<tr>
								<td>
									驻场城市
								</td>
								<td>
									<input class="form-control" type="text" name="city" />
								</td>
							</tr>
							<tr>
								<td>
									需求文档
								</td>
								<td>
									<input class="form-control" type="text" name="requirementDoc" />
								</td>
							</tr>
							<tr>
								<td>
									项目状态
								</td>
								<td>
									<input class="form-control" type="text" name="status" />
								</td>
							</tr>
						</tbody>
						<tr>
							<td colspan="2" align="center">
								<input type="hidden" name="gmtCreate" value="<%=DateFormat.getDateTime() %>" />
								<input type="hidden" name="gmtModified" value="<%=DateFormat.getDateTime() %>" />
								<input type="button" class="btn btn-success" value="发布项目" />
							</td>
						</tr>
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