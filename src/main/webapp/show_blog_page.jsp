<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.tech.blog.entities.*"%>
<%@page import="java.util.*"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.*"%>
<%@page import="java.text.*"%>

<%@page errorPage="error_page.jsp"%>
<%
User user = (User) session.getAttribute("currentUser");
if (user == null) {
	response.sendRedirect("login_page.jsp");

}
%>

<%
int postId = Integer.parseInt(request.getParameter("post_id"));
PostDao d = new PostDao(ConnectionProvider.getConn());
Post p = d.getPostByPostId(postId);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%=p.getpTitle()%>|| TechBlog by Learn Code with Momen</title>

<!-- css -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/mystyle.css" type="text/css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
	integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<style type="text/css">
.banner-background {
	clip-path: polygon(30% 0%, 70% 0%, 100% 0%, 100% 91%, 63% 100%, 22% 91%, 0% 99%, 0
		0);
}

.post-title {
	font-weight: 100;
	font-size: 30px;
}

.post-content {
	font-weight: 100;
	font-size: 25px;
}

.post-date {
	font-style: italic;
	font-weight: bold;
}

.post-user-info {
	font-size: 20px;
	font-weight: 300;
}

.row-user {
	border: 1px solid #e2e2e2;
	padding-top: 15px;
}
</style>
<div id="fb-root"></div>
<script async defer crossorigin="anonymous"
	src="https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v19.0"
	nonce="9ei7uYMG"></script>

</head>
<body>
	<!-- start of navbar -->
	<nav class="navbar navbar-expand-lg navbar-dark primary-background">
		<a class="navbar-brand" href="index.jsp"><i
			class="fa-solid fa-asterisk mr-1"></i>Tech Blog</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link"
					href="profile.jsp"><i class="fa-regular fa-bell mr-1"></i>Learn
						Code with Momen <span class="sr-only">(current)</span> </a></li>

				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"><i class="fa-solid fa-list mr-1"></i></i>Categories
				</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="#">Programming Language</a> <a
							class="dropdown-item" href="#">Project Implementation</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">Data Structure</a>
					</div></li>
				<li class="nav-item"><a class="nav-link" href="#"><i
						class="fa-regular fa-address-card mr-1"></i> Contect</a></li>

				<li class="nav-item"><a class="nav-link" href="#"
					data-toggle="modal" data-target="#add-post-modal"><i
						class="fa-solid fa-asterisk mr-1"></i>Do Post</a></li>


			</ul>
			<ul class="navbar-nav mr-right">
				<li class="nav-item"><a class="nav-link" href="#!"
					data-toggle="modal" data-target="#profile-modal"><i
						class="fa-solid fa-circle-user mr-1"></i><%=user.getName()%> </a></li>
				<li class="nav-item"><a class="nav-link" href="LogoutServlet">
						<i class="fa-solid fa-user-plus mr-1"></i>Logout
				</a></li>
			</ul>
		</div>
	</nav>
	<!-- end of navbar -->




	<!-- main content of body -->
	<div class="container">
		<div class="row my-4">
			<div class="col-md-8 offset-md-2">
				<div class="card">
					<div class="card-header">
						<h4 class="post-title"><%=p.getpTitle()%></h4>

					</div>

					<div class="card-body">

						<img src="blog_pics/<%=p.getpPic()%>" class="card-img-top my-2"
							alt="...">
						<div class="row my-3 row-user">

							<div class="col-md-8 ">
								<p class="post-user-info">

									<%
									UserDao udao = new UserDao(ConnectionProvider.getConn());
									%>
									<a href="#"><%=udao.getUserByUserId(p.getUserId()).getName()%></a>
									has posted
								</p>
							</div>
							<div class="col-md-4">
								<p class="post-date"><%=DateFormat.getDateTimeInstance().format(p.getpDate())%></p>

							</div>
						</div>

						<p class="post-content"><%=p.getpContent()%></p>

						<br> <br>
						<div class="post-code">
							<pre><%=p.getpCode()%></pre>
						</div>
					</div>
					<div class="card-footer primary-background">

						<%
						LikeDao ld = new LikeDao(ConnectionProvider.getConn());
						%>
						<a href="#!" onclick="doLike(<%=p.getPid()%>,<%=user.getId()%>)"
							class="btn btn-outline-light btn-sm" id="likeButton"><p style="display : inline">Liked</p> <i
							class="fa-regular fa-thumbs-up"></i> <span class="like-counter"></span>
						</a> <a href="#!" class="btn btn-outline-light btn-sm"><i
							class="fa-regular fa-comment-dots"></i><span>20</span></i></a>

					</div>

					<div class="card-footer">

						<div class="fb-comments"
							data-href="http://localhost:8081/TechBlog/show_blog_page.jsp?post_id=4"
							data-width="" data-numposts="5"></div>
					</div>

				</div>
			</div>
		</div>
	</div>

	<!--end of main content of body -->

	<!-- start profile modal -->
	<!-- Button trigger modal -->

	<!-- Modal -->
	<div class="modal fade" id="profile-modal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header primary-background text-white text-center">
					<h5 class="modal-title" id="exampleModalLabel">TechBlog</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="container text-center">

						<img alt="default" src="./pics/<%=user.getProfile()%>"
							style="border-radius: 50%; max-width: 150px;"></img>

						<h5 class="modal-title mt-3" id="exampleModalLabel"><%=user.getName()%></h5>

						<!-- details -->
						<div id="profile-details">
							<table class="table">

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
										<th scope="row">About :</th>
										<td><%=user.getAbout()%></td>
									</tr>

									<tr>
										<th scope="row">Registered on :</th>
										<td><%=user.getDateTime()%></td>
									</tr>
								</tbody>
							</table>
						</div>

						<!-- profile edit -->
						<div id="profile-edit" style="display: none;">
							<h2 class="mt-2">Please Edit Carefully</h2>
							<form action="EditServlet" method="post"
								enctype="multipart/form-data">
								<table class="table">

									<tbody>
										<tr>
											<th scope="row">ID :</th>
											<td><%=user.getId()%></td>
										</tr>

										<tr>
											<th scope="row">Email :</th>
											<td><input type="email" class="form-control"
												name="user_email" value=<%=user.getEmail()%> /></td>
										</tr>
										<tr>
											<th scope="row">Name :</th>
											<td><input type="text" class="form-control"
												name="user_name" value=<%=user.getName()%> /></td>
										</tr>
										<tr>
											<th scope="row">Password :</th>
											<td><input type="password" class="form-control"
												name="user_password" value=<%=user.getPassword()%> /></td>
										</tr>

										<tr>
											<th scope="row">Gender :</th>
											<td><%=user.getGender()%></td>
										</tr>

										<tr>
											<th scope="row">About :</th>
											<td><textarea rows="3" cols="" class="form-control"
													name="user_about">
											<%=user.getAbout()%>
											</textarea></td>
										</tr>

										<tr>
											<th>New Profile:</th>
											<td><input type="file" name="profile-image"
												class="form-control"></td>
										</tr>
									</tbody>
								</table>


								<div class="container">
									<button type="submit" class="btn btn-outline-primary">Save</button>
								</div>
							</form>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<button id="edit-profile-button" type="button"
						class="btn btn-primary">Edit</button>
				</div>
			</div>
		</div>
	</div>

	<!-- end profile modal -->

	<!-- start post modal -->
	<!-- Button trigger modal -->


	<!-- Modal -->
	<div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Provide the
						post details..</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form id="add-post-form" action="AddPostServlet" method="post">
						<div class="form-group">
							<div class="form-group">
								<select class="form-control" name="cid">

									<option selected disabled>---Select Category---</option>
									<%
									PostDao postd = new PostDao(ConnectionProvider.getConn());
									ArrayList<Category> list = postd.getAllCategories();
									for (Category c : list) {
									%>
									<option value="<%=c.getCid()%>"><%=c.getName()%></option>

									<%
									}
									%>

								</select>
							</div>

							<input name="pTitle" type="text" placeholder="Enter post Title"
								class="form-control" />

						</div>
						<div class="form-group">

							<textarea name="pContent" rows="" cols=""
								placeholder="Enter your Content" class="form-control"
								style="height: 200px;"></textarea>


						</div>
						<div class="form-group">

							<textarea name="pCode" rows="" cols=""
								placeholder="Enter your Program (if any)" class="form-control"
								style="height: 200px;"></textarea>


						</div>
						<div class="form-group">

							<label>Select your pic..</label> <br> <input name="pic"
								type="file" class="form-control" />

						</div>
						<div class="container text-center">
							<button type="submit" class="btn btn-outline-primary">Post</button>
						</div>

					</form>

				</div>

			</div>
		</div>
	</div>

	<!-- end post modal -->


	<!-- Javascripts -->
	<script src="https://code.jquery.com/jquery-3.7.1.min.js"
		integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
	<script type="text/javascript" src="js/myjavascript.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"
		integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA=="
		crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script type="text/javascript">
		$(document).ready(function() {

			let editStatus = false;

			$('#edit-profile-button').click(function() {
				if (editStatus == false) {

					$('#profile-details').hide();

					$('#profile-edit').show();

					editStatus = true;

					$(this).text("Back")
				} else {
					$('#profile-details').show();

					$('#profile-edit').hide();

					editStatus = false;
					$(this).text("Edit")
				}

			})
		})
	</script>

	<!-- now add post js -->
	<script type="text/javascript">
		$(document)
				.ready(
						function(e) {
							$("#add-post-form")
									.on(
											"submit",
											function(event) {
												// this code gets called when form is submitted...
												event.preventDefault();
												console.log("you have clicked");
												let form = new FormData(this);
												// now requesting to server
												$
														.ajax({
															url : "AddPostServlet",
															type : 'POST',
															data : form,
															success : function(
																	data,
																	textStatus,
																	jqXHR) {
																// success..
																console
																		.log(data);
																if (data.trim() == 'done') {
																	swal(
																			"Good job!",
																			"Saved successfully",
																			"success")
																			.then(
																					function() {
																						// Handle redirect or other actions if needed
																					});
																} else {
																	swal(
																			"Error!",
																			"Something went wrong, please try again...",
																			"error");
																}
															},
															error : function(
																	jqXHR,
																	textStatus,
																	errorThrown) {
																// error..
																swal(
																		"Error!",
																		"Something went wrong, please try again...",
																		"error");
															},
															processData : false,
															contentType : false
														});
											});
						});
	</script>
	<!-- loading post using ajax -->
	<script>
		function getPosts(cid, temp) {
			$("#loader").show();
			$("#post-container").hide();
			$(".c-link").removeClass('active');
			$.ajax({
				url : "load_post.jsp",
				data : {
					cid : cid
				}, // corrected parameter name
				success : function(data, textStatus, jqXHR) {
					//console.log(data);
					$("#loader").hide();
					$("#post-container").show();
					$("#post-container").html(data);
					$(temp).addClass('active');
				},
				error : function(jqXHR, textStatus, errorThrown) {
					console.error("Error:", errorThrown);
				}
			});
		}
		$(document).ready(function(e) {
			let allPostRef = $('.c-link')[0];
			getPosts(0, allPostRef);
		});
	</script>


	<!-- like fatch -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		$(document).ready(function() {
			var postId =
	<%=p.getPid()%>
		; // This gets the value of p.getPid() from Java and inserts it into the JavaScript code

			// Function to send AJAX request
			function sendLikeCountRequest() {
				$.ajax({
					type : "GET",
					url : "LikeCountServlet",
					data : {
						postId : postId
					},
					success : function(response) {
						$(".like-counter").text(response); // Update the like counter with the received response
					},
					error : function(xhr, status, error) {
						console.error(xhr.responseText);
					}
				});
			}

			// Initial request when the page is ready
			sendLikeCountRequest();

			// Event listener for like button click
			$(document).on("click", "#likeButton", function() {
				sendLikeCountRequest();
			});

			// Additional event listeners
			// Event listener for page load
			$(window).on("load", function() {
				sendLikeCountRequest();
			});

			// Event listener for other actions on the page
			// Example: clicking another button
			$(document).on("click", "#otherButton", function() {
				// Perform some action
				// Then, update the like count
				sendLikeCountRequest();
			});

		});
	</script>



</body>
</html>