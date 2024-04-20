<%@page import="com.tech.blog.entities.*"%>
<%@page import="java.util.*"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.*"%>
<div class="row">
	<%
	User uuu = (User) session.getAttribute("currentUser");
	Thread.sleep(1000);
	PostDao d = new PostDao(ConnectionProvider.getConn());

	int cid = Integer.parseInt(request.getParameter("cid"));
	List<Post> list = null;
	if (cid == 0) {
		list = d.getAllPosts();
	} else {
		list = d.getPostByCId(cid);
	}
	if (list.size() == 0) {
		out.println("<h3 class='display-3 text-center'>No Post in this category..</h3>");
		return;
	}
	for (Post p : list) {
	%>
	<div class="col-md-6 mt-2">
		<div class="card">
			<%
			if (p.getpPic() != null && !p.getpPic().isEmpty()) {
			%>
			      <img src="blog_pics/<%= p.getpPic() %>" class="card-img-top" alt="..." style="height: 200px; width: 100%;"><%
			} else {
			%>
			<!-- Placeholder image or alternative content when no image available -->
			<div class="card-img-top"
				style="background-color: lightgray; height: 200px;"></div>
			<%
			}
			%>
			<div class="card-body">
				<p>
					<b><%=p.getpTitle()%></b>
				</p>
				<!-- Limit content to two lines -->
				<p
					style="overflow: hidden; text-overflow: ellipsis; display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical;">
					<b><%=p.getpContent()%></b>
				</p>
			</div>
			<div class="card-footer primary-background text-center">
				<%
				LikeDao ld = new LikeDao(ConnectionProvider.getConn());
				%>
				<a href="show_blog_page.jsp?post_id=<%=p.getPid()%>"
					class="btn btn-outline-light btn-sm">Read More...</a> <a href="#!"
					onclick="doLike(<%=p.getPid()%>, <%=uuu.getId()%>); initializeLikeCounter(<%=p.getPid()%>);"
					class="btn btn-outline-light btn-sm" id="likeButton">
					<p style="display: inline">Liked</p> <i
					class="fa-regular fa-thumbs-up"></i> <span class="like-counter"></span>
				</a> <a href="#!" class="btn btn-outline-light btn-sm"> <i
					class="fa-regular fa-comment-dots"></i> <span>20</span>
				</a>
			</div>
		</div>
	</div>
	<%
	}
	%>
</div>
