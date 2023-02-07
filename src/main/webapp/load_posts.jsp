<%@page import="com.techblog.entities.Post"%>
<%@page import="java.util.List"%>
<%@page import="com.techblog.helper.ConnectionProvider"%>
<%@page import="com.techblog.dao.PostDao"%>

<div class="row">
	<%
	PostDao dao = new PostDao(ConnectionProvider.getConnection());
	int cid = Integer.parseInt(request.getParameter("cid"));
	List<Post> posts = null;
	if (cid == 0) {
		posts = dao.getAllPosts();
	} else {
		posts = dao.getPostByCatId(cid);
	}
	if (posts.size() == 0) {
		out.println("<h3 class= 'display-3 text-center'>There is nothing to show in this category");
		return;
	}
	for (Post p : posts) {
	%>
	<div class="col-md-6 mt-2">
		<div class="card">
			<img class="card-img-top" src="blog_pics/<%=p.getpPic()%>"
				alt="Card img cap" />
			<div class="card-body">
				<b><%=p.getpTitle()%></b>
				<p><%=p.getpContent()%></p>
			</div>
			<div class="card-footer text-center primary-background">
				<a href="#!" class="btn btn-outline-light btn-sm"><i class="fa fa-thumbs-o-up"></i><span>10</span></a>
				<a href="show_blog_page.jsp?post_id=<%=p.getPid() %>" class="btn btn-outline-light btn-sm">Read More ...</a>
				<a href="#!" class="btn btn-outline-light btn-sm"><i class="fa fa-commenting-o"></i><span>20</span></a>
				
			</div>
		</div>
	</div>
	<%
	}
	%>

</div>

