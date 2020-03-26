<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	未设置管理员角色<br/>
	测试<br/>
	<%
	String administrator = (String) session.getAttribute("administrator");
	String password = (String) session.getAttribute("password");
	String role = (String) session.getAttribute("role");
	%>
	<%=administrator %><br/>
	<%=password %><br/>
	<%=role %>
</body>
</html>