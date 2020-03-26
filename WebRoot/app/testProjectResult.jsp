<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="com.entity.*,java.util.*,com.dao.*,com.impl.*"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String keyword = request.getParameter("project_keyword");
	String[] cityList = request.getParameterValues("city[]");
	String[] appTypeList = request.getParameterValues("appType[]");
	String[] skillList = request.getParameterValues("skill[]");
	//out.println(keyword);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
项目名关键词：<%=keyword %>
<br/>
城市：<%
for(int i=0; i < cityList.length; i++){
	out.println(cityList[i] + "&nbsp");
}
%>
<br/>
应用类型：<%
for(int i=0; i < appTypeList.length; i++){
	out.println(appTypeList[i] + "&nbsp");
}
%>
<br/>
技能：<%
for(int i=0; i < skillList.length; i++){
	out.println(skillList[i] + "&nbsp");
}
%>
</body>
</html>