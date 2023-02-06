<%@page import="com.techblog.entities.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.techblog.helper.ConnectionProvider"%>
<%@page import="com.techblog.dao.PostDao"%>
<%@page import="com.techblog.entities.Message"%>
<%@page import="com.techblog.entities.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page errorPage="error_page.jsp"%>

<%
User user = (User) session.getAttribute("currentUser");
if (user == null) {
	response.sendRedirect("login.jsp");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" />

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
<link href="css/style.css" rel="stylesheet" type="text/css" />

<title>Insert title here</title>
</head>
<body>

	<!-- Navbar Open -->

	<nav class="navbar navbar-expand-lg navbar-dark primary-background">
		<a class="navbar-brand" href="index.jsp"> <span
			class="fa fa-asterisk"></span> Tech Blog
		</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link" href="#"><span
						class="fa fa-bell-o"></span> LearnCode With Durgesh <span
						class="sr-only">(current)</span></a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <span class="fa fa-check-square-o"></span>
						Categories
				</a> </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="#">Programming Language</a> <a
							class="dropdown-item" href="#">Project Implementation</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">Data Structure</a>
					</div></li>
				<li class="nav-item"><a class="nav-link" href="#"><span
						class="fa fa-address-card-o"></span> Contact</a></a></li>
				<li class="nav-item"><a class="nav-link" href="#"
					data-toggle="modal" data-target="#postModal"><span
						class="fa fa-asterisk"></span> Do Post</a></a></li>


			</ul>
			<ul class="navbar-nav mr-right">
				<!-- Modal Launcher -->
				<li class="nav-item"><a class="nav-link" href="#!"
					data-toggle="modal" data-target="#profileModal"><span
						class="fa fa-user-circle"></span> <%=user.getName()%></a></a></li>
				<li class="nav-item"><a class="nav-link" href="LogoutServlet"><span
						class="fa fa-user-plus"></span> Logout</a></a></li>
			</ul>

		</div>
	</nav>

	<!-- Navbar Closed -->

	<!-- Alert Message  -->

	<%
	Message message = (Message) session.getAttribute("message");
	if (message != null) {
	%>

	<div>
		<div class="alert <%=message.getCssClass()%>" role="alert">
			<%=message.getContent()%>
		</div>
	</div>

	<%
	session.removeAttribute("message");

	}
	%>
	<!-- End of Alert Message -->
	
	<!-- Main body  -->
		<main>
			<div class="container">
				<div class="row mt-4">
					<!-- First Row  -->
					<div class="col-md-4">
						<!-- Categories -->
						
						<div class="list-group">
  <a href="#" class="list-group-item list-group-item-action active" aria-current="true">
    All Posts
  </a>
  <%
  
  	PostDao dao = new PostDao(ConnectionProvider.getConnection());
    ArrayList<Category> list = dao.getAllCategories();
    for(Category c : list){
    	
  %>
   <a href="#" class="list-group-item list-group-item-action"><%= c.getName() %></a>
  <%
  	} 
  %>
  
  
</div>
					</div>
					<div class="col-md-8">
						<!-- Posts -->
					</div>
				</div>
			</div>
		</main>
	<!-- Main Body End -->


	<!-- Profile Modal -->
	<div class="modal fade" id="profileModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header primary-background text-white">
					<h5 class="modal-title " id="exampleModalLabel">TechBlog</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="container text-center">
						<img src="pics/<%=user.getProfile()%>" class="img-fluid" />
						<h5 class="modal-title " id="exampleModalLabel"><%=user.getName()%></h5>
					</div>
				</div>
				<div>
					<table class="table" id="profile-details">

						<tbody>
							<tr>
								<th scope="row">ID :</th>
								<td><%=user.getId()%></td>

							</tr>
							<tr>
								<th scope="row">Email :</th>
								<td><%=user.getEmail()%></td>

							</tr>
							<tr>
								<th scope="row">Gender :</th>
								<td><%=user.getGender()%></td>

							</tr>
							<tr>
								<th scope="row">Status :</th>
								<td><%=user.getAbout()%></td>

							</tr>
							<tr>
								<th scope="row">Registered on :</th>
								<td><%=user.getDateTime().toString()%></td>

							</tr>
						</tbody>
					</table>
				</div>
				<!-- Edit Profile  -->
				<div id="profile-edit" class="text-center" style="display: none">
					<h3 class="mt-3">Please Edit Carefully</h3>
					<form action="EditServlet" method="post"
						enctype="multipart/form-data">
						<table class="table" id="profile-details">

							<tbody>
								<tr>
									<td scope="row">ID :</td>
									<td><%=user.getId()%></td>

								</tr>
								<tr>
									<td scope="row">Email :</td>
									<td><input type="email" class="form-control" name="email"
										value=<%=user.getEmail()%> /></td>
								</tr>
								<tr>
									<td scope="row">Name :</td>
									<td><input type="text" class="form-control" name="name"
										value=<%=user.getName()%> /></td>
								</tr>
								<tr>
									<td scope="row">Password :</td>
									<td><input type="password" class="form-control"
										name="password" value=<%=user.getPassword()%> /></td>
								</tr>
								<tr>
									<td scope="row">Gender :</td>
									<td><%=user.getGender()%></td>
								</tr>
								<tr>
									<td scope="row">About :</td>
									<td><textarea class="form-control" name="about" rows="3"
											style="scroll: none;">
										<%=user.getAbout()%>
									</textarea></td>
								</tr>
								<tr>
									<td scope="row">New Profile :</td>
									<td><input type="file" class="form-control" name="profile" /></td>
								</tr>

							</tbody>
						</table>
						<div class="container text-center">
							<button type="submit" class="btn btn-outline-primary">Save</button>
						</div>
					</form>
				</div>


				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<button type="button" id="edit-profile-button"
						class="btn btn-primary">EDIT</button>
				</div>
			</div>
		</div>
	</div>


	<!-- End of Profile Modal -->




	<!-- Post Modal -->
	<div class="modal fade" id="postModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">

					<form id="add-post-form" action="AddPostServlet" method="post">
						<div class="form-group">
							<select class="form-control" name="cid">
								<option selected disabled>---- Select Category ----- </option>
								<% 
									// Here the list has came from the above categories
								    for(Category category : list){
								    	
								%>
								<option value=<%= category.getCid() %>><%= category.getName() %></option>
								
								<% } %>
							</select>
						</div>
						<div class="form-group">
							<input type="text" name="pTitle" placeholder="Enter post Title"
								class="form-control" />
						</div>
						<div class="form-group">
							<textarea name="pContent" class="form-control" style="height: 200px;" placeholder="Enter your content">
						</textarea>
						</div>
						<div class="form-group">
							<textarea name="pCode" class="form-control" style="height: 200px;" placeholder="Enter your program(if any )">
						</textarea>
						</div>
						<div class="form-group">
							<label>Select your pic ...</label>
							<br/>
							<input type="file" name="pic"/>
						</div>
						<div class="container text-center">
							<button type="submit" class="btn btn-outline-primary">Post</button>
						</div>
					</form>

				</div>
			</div>
		</div>
	</div>
	<!-- End of Post Modal  -->


	<!-- jQuery library -->
	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>

	<!-- Popper JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

	<!-- Latest compiled JavaScript -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

	<script
		src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
	<!-- Sweet Alert Library -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

	<script>
		$(document).ready(function() {
			let editStatus = false;
			$('#edit-profile-button').click(function() {
				if (editStatus == false) {
					$('#profile-edit').show();
					$('#profile-details').hide();
					editStatus = true;
					$(this).text("Back");
				} else {
					$('#profile-edit').hide();
					$('#profile-details').show();
					editStatus = false;
					$(this).text("Edit");
				}
			})
		})
	</script>
	<!-- Now Add POst Js  -->
	
	<script>
	
		$(document).ready(function() {
			<!-- This Function is called when form is submitted -->
			$('#add-post-form').on("submit", function (event){
				event.preventDefault();
				console.log("You have clicked on submit button");
				
				let form = new FormData(this);
				
				// now requesting to the server 
				
				$.ajax({
					url:"AddPostServlet",
					type:'POST',
					data : form,
					success:( function (data, textStatus, jqXHR){
						// success
						console.log(data,'done--->');
						if(data.trim() == 'done'){
							swal("Good job!","saved successfully","success");
						}else{
							swal("Error!!","Something went wrong try again...","error");
						}
					}),
					error:(function (jqXHR, textStatus, errorThrown){
						// error 
						swal("Error!!","Something went wrong try again...","error");

					}),
					processData: false,
					contentType: false
				})
				
			})
		})
	
	</script>
	
	
	
	
</body>
</html>