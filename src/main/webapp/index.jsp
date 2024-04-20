<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.tech.blog.helper.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TechBlog</title>

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
</style>

</head>
<body>
	<!-- navbar -->
	<%@ include file="normal_navbar.jsp"%>


	<!-- banner -->

	<div class="container-fluid p-0 m-0">

		<div class="jumbotron primary-background text-white banner-background">
			<div class="container">
				<h3 class="display-3">Welcome to TechBlog</h3>

				<p>Welcome to technical blog, world of technology A programming
					language is a type of written language that tells computers what to
					do. Examples are: Python, Ruby, Java, JavaScript, C, C++, and C#.</p>
				<p>Programming languages are used to write computer programs and
					computer software. A programming language is like a set of commands
					that tell the computer how to do things.</p>
				<a href="#" class="btn btn-outline-light btn-lg"> <i
					class="fa-solid fa-user-plus mr-1"></i>Start ! its Free
				</a> <a href="login_page.jsp" class="btn btn-outline-light btn-lg">
					<i class="fa-solid fa-circle-user mr-1 fa-spin"></i>Login
				</a>
			</div>
		</div>

	</div>


	<!-- cards -->
	<div class="container">

		<div class="row mb-2">

			<div class="col-md-4">
				<div class="card">

					<div class="card-body">
						<h5 class="card-title">Java Programming Language</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="login_page.jsp" class="btn primary-background text-white">Read
							more</a>
					</div>
				</div>
			</div>

			<div class="col-md-4">
				<div class="card">

					<div class="card-body">
						<h5 class="card-title">Python Programming Language</h5>
						<p class="card-text">Python is a widely used high-level
							programming language for general-purpose programming.</p>
						<a href="login_page.jsp" class="btn primary-background text-white">Read
							more</a>
					</div>
				</div>
			</div>

			<div class="col-md-4">
				<div class="card">

					<div class="card-body">
						<h5 class="card-title">JavaScript Programming Language</h5>
						<p class="card-text">JavaScript is a programming language that
							is primarily used for scripting web pages.</p>
						<a href="login_page.jsp" class="btn primary-background text-white">Read
							more</a>
					</div>
				</div>
			</div>
		</div>

		<div class="row mb-2">
			<div class="col-md-4">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">C++ Programming Language</h5>
						<p class="card-text">C++ is a general-purpose programming
							language created as an extension of the C programming language.</p>
						<a href="login_page.jsp" class="btn primary-background text-white">Read
							more</a>
					</div>
				</div>
			</div>

			<div class="col-md-4">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">Ruby Programming Language</h5>
						<p class="card-text">Ruby is a dynamic, reflective,
							object-oriented, general-purpose programming language.</p>
						<a href="login_page.jsp" class="btn primary-background text-white">Read
							more</a>
					</div>
				</div>
			</div>

			<div class="col-md-4">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">Swift Programming Language</h5>
						<p class="card-text">Swift is a powerful and intuitive
							programming language for macOS, iOS, watchOS, and tvOS.</p>
						<a href="login_page.jsp" class="btn primary-background text-white">Read
							more</a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Javascripts -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
	<script type="text/javascript" src="js/myjavascript.js"></script>

</body>
</html>
