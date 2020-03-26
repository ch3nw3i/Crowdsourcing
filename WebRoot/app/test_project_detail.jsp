<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String username = (String) session.getAttribute("username");
	String userRole = (String) session.getAttribute("userRole");
	int userId = 0;
	if (session.getAttribute("userId") != null) {
		userId = Integer.valueOf(session.getAttribute("userId").toString());
	}
%>
<%
	if (username == null) {
		out.println("username 为空。");
	} else {
		out.println("username : " + username);
	}
	out.print("<br >");
	
	if (userRole == null) {
		out.println("userRole 为空。");
	} else {
		out.println("userRole : " + userRole);
	}
	out.print("<br >");
	
	if (userId == 0) {
		out.println("userId 为空。");
	} else {
		out.println("userId : " + userId);
	}
	out.print("<br >");
%>
</body>
</html>