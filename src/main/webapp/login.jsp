<%@page import="com.techblog.entities.Message"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<style>
main {
	clip-path: polygon(50% 0%, 100% 0, 100% 95%, 74% 98%, 25% 100%, 0 97%, 0 0);
}
</style>
<title>Insert title here</title>
</head>
<body>

	<!-- Navbar -->

	<%@include file="navbar.jsp"%>

	<main class="d-flex align-items-center primary-background"
		style="height: 75vh">
		<div class="container">
			<div class="row">
				<div class="col-md-4 offset-md-4">
					<div class="card">
						<div class="card-header primary-background text-white text-center">
							<span class="fa fa-user-plus fa-3x"></span> <br />
							<p>Login here</p>
						</div>

						<%
							Message message = (Message) session.getAttribute("message");
							if(message != null){
								
						%>

						<div>
							<div class="alert <%=message.getCssClass() %>" role="alert">
								<%= message.getContent() %>
							</div>
						</div>
						
						<%
							session.removeAttribute("message");
						
							}
						%>

						<div class="card-body">
							<form action="loginServlet" method="post">
								<div class="form-group">
									<label for="exampleInputEmail1">Email address</label> <input
										type="email" required name="email" class="form-control"
										id="exampleInputEmail1" aria-describedby="emailHelp"
										placeholder="Enter email"> <small id="emailHelp"
										class="form-text text-muted">We'll never share your
										email with anyone else.</small>
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1">Password</label> <input
										type="password" required name="password" class="form-control"
										id="exampleInputPassword1" placeholder="Password">
								</div>
								<div class="container text-center">
									<button type="submit" class="btn btn-primary">Submit</button>
								</div>

							</form>
						</div>
					</div>
				</div>
			</div>
		</div>

	</main>


	<!-- jQuery library -->
	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>

	<!-- Popper JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

	<!-- Latest compiled JavaScript -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>