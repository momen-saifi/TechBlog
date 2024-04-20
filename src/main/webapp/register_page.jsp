<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

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


<title>Register Page</title>
</head>
<body>

	<%@include file="normal_navbar.jsp"%>
	<main class="primary-background  banner-background"
		style="padding-bottom: 100px">
		<div class="container">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-header text-center primary-background text-white">
						<i class="fa-solid fa-circle-user fa-3x"></i> <br>
						<p>Register here</p>
					</div>
					<div class="card-body">
						<form action="RegisterServlet" method="post" id="reg-form">
							<div class="form-group">
								<label for="user_name">User Name</label> <input name="user_name"
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter Name">
							</div>
							<div class="form-group">
								<label for="user_email">Email address</label> <input
									name="user_email" type="email" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									placeholder="Enter Email">
							</div>
							<div class="form-group">
								<label for="gender">Select Gender</label> <br> 
								<input
									type="radio" id="gender" value="Male" name="gender">
									<label
									for="gender">Male</label>
									 <input type="radio" id="gender"
									value="Female" name="gender"><label for="gender">Female</label>
							</div>

							<div class="form-group">
								<textarea name="about" class="form-control" rows="5"
									placeholder="Enter something about yourself"></textarea>
							</div>
							<div class="form-group">
								<label for="user_password">Password</label> <input
									name="user_password" type="password" class="form-control"
									id="exampleInputPassword1">
							</div>
							<div class="form-group form-check">
								<input name="check" type="checkbox" class="form-check-input"
									id="exampleCheck1"> <label class="form-check-label"
									for="exampleCheck1">agree term and conditions</label>
							</div>
							<br>
							<div class="container text-center" id="loader"
								style="display: none;">
								<i class="fa-solid fa-arrows-rotate fa-spin fa-3x"></i>
								<h4>Please Wait...</h4>
							</div>
							<br>
							<button id="submit-btn" type="submit" class="btn btn-primary">Submit</button>
						</form>

					</div>

				</div>

			</div>

		</div>

	</main>



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

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"
		integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA=="
		crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script type="text/javascript" src="js/myjavascript.js"></script>
	<script type="text/javascript">
	
	
	 $(document).ready(function() {
         console.log("page is ready.");
         $("#reg-form").on('submit', function(event) {
             event.preventDefault();

             let form=new FormData(this);
             
             $("submit-btn").hide();
             $("#loader").show();
             

             $.ajax({
                 url: "RegisterServlet",
                 data: form,
                 type: 'POST',
                 success: function(data, textStatus, jqXHR) {
                     console.log(data);
                     $("submit-btn").show();
                     $("#loader").hide();
                    
						if(data.trim()=='done'){
							  swal("Registered successfully..We are going to redirect to login page")
			                     .then((value) => {
			                       window.location="login_page.jsp"
			                     });
						}else{
							swal(data);
						}
                   
                 },
                 error: function(jqXHR, textStatus, errorThrown) {
                     console.log(jqXHR);
                     $("submit-btn").show();
                     $("#loader").hide();
                     swal("something went wrong..try agiain")
                     
                     .then((value) => {
                       window.location="login_page.jsp"
                     });
                 },
                 processData: false,
                 contentType: false
             });
         });
     });

	</script>


</body>
</html>