<%@page import="com.techblog.entities.Post"%>
<%@page import="java.util.List"%>
<%@page import="com.techblog.helper.ConnectionProvider"%>
<%@page import="com.techblog.dao.PostDao"%>

<div class="row">
<%

	PostDao dao = new PostDao(ConnectionProvider.getConnection());
	List<Post> posts = dao.getAllPosts();
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
	
