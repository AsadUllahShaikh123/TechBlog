<%@page import="com.techblog.entities.Post"%>
<%@page import="java.util.List"%>
<%@page import="com.techblog.helper.ConnectionProvider"%>
<%@page import="com.techblog.dao.PostDao"%>

<div class="row">
<%

	PostDao dao = new PostDao(ConnectionProvider.getConnection());
	int cid = Integer.parseInt(request.getParameter("cid"));
	List<Post> posts = null;
	if(cid == 0 ){
		posts = dao.getAllPosts();
	}
	else {
		posts = dao.getPostByCatId(cid);
	}
	if(posts.size()==0){
		out.println("<h3 class= 'display-3 text-center'>There is nothing to show in this category");
		return;
	}
	for(Post p : posts ){
			
%>
	<div class="col-md-6 mt-2">	
		<div class="card">
			<img class="card-img-top" src="blog_pics/<%=p.getpPic() %>" alt="Card img cap" />
			<div class="card-body">
			<b><%= p.getpTitle() %></b>
			<p><%= p.getpContent() %></p>
			<pre class="scroll:none"><%= p.getpCode() %></pre>
			</div>
		</div>
	</div>
<%
	}
%>
		
</div>
	
