<%@page import="com.techblog.entities.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page errorPage="error_page.jsp" %>

<%
	User user = (User) session.getAttribute("currentUser");
	if(user == null){
		response.sendRedirect("login.jsp");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%= user.getName() %>
	<%= user.getEmail() %>
	<%= user.getAbout() %>
</body>
</html>