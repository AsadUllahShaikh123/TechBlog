<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page isErrorPage ="true" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" />
	<link href="css/style.css" rel="stylesheet" type="text/css" />
	
<meta charset="ISO-8859-1">
<title>Sorry ! something went wrong</title>
</head>
<body>
	<div class="container text-center">
		<img src="img/error.png" class="img-fluid" />
		<h3 class="display-3">Sorry ! something went wrong</h3>
		<%= exception %>
		<a href="index.jsp" class="btn primary-background btn-lg text-white mt-3">Home</a>
	</div>
</body>
</html>