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
	main{
clip-path: polygon(50% 0%, 100% 0, 100% 95%, 74% 98%, 25% 100%, 0 97%, 0 0);
		}
	
</style>
<title>Insert title here</title>
</head>
<body>

	<%@include file="navbar.jsp"%>
	<main class="d-flex align-items-center primary-background p-5" style="padding-bottom: 80px;">
		<div class="container">
			<div class="row">
				<div class="col-md-6 offset-md-3">
					<div class="card">
						<div class="card-header primary-background text-white text-center">
							<span class="fa fa-user-plus fa-3x"></span> <br />
							<p>Register here</p>
						</div>
						<div class="card-body">
							<form action="registerServlet" method="post">
								<div class="form-group">
									<label for="user_name">User Name</label> <input type="text"
										class="form-control" id="user_name" name="name"
										aria-describedby="emailHelp" placeholder="Enter name">

								</div>
								<div class="form-group">
									<label for="exampleInputEmail1">Email address</label> <input
										type="email" class="form-control" id="exampleInputEmail1" name="email"
										aria-describedby="emailHelp" placeholder="Enter email">
									<small id="emailHelp" class="form-text text-muted">We'll
										never share your email with anyone else.</small>
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1">Password</label> <input
										type="password" name="password" class="form-control"
										id="exampleInputPassword1" placeholder="Password">
								</div>
								<div class="form-group">
									<label for="gender">Select Gender</label> <br /> <input
										type="radio" id="gender" name="gender" value="male"/>Male <input
										type="radio" id="gender" name="gender" value="female"/>Female
								</div>
								<div class="form-group">
									<textarea name="about" class="form-control" rows="5"
										placeholder="Enter something about yourself"></textarea>
								</div>
								<div class="form-check">
									<input type="checkbox" class="form-check-input"
										id="exampleCheck1" name="check"> <label class="form-check-label"
										for="exampleCheck1">agree terms and conditions</label>
								</div>
								<br />
								<button type="submit" class="btn btn-primary">Submit</button>
							</form>
						</div>

					</div>
				</div>
			</div>
		</div>

	</main>
	
	script
		src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>

	<!-- Popper JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

	<!-- Latest compiled JavaScript -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
	<script>
		
	</script>
	
</body>
</html>