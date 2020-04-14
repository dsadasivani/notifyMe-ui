<!DOCTYPE html>
<html lang="en">
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</head>
<body>
	<form action="signupAction" style="border: 1px solid #ccc" method="post">
		<div class="container">
			<h1>Sign Up</h1>
			<p>Please fill in this form to create an account.</p>
			<hr>
			<div class="form-group">
				<div>
					<label for="name"><b>Name</b></label>
				</div>
				<div>
					<input type="text" placeholder="Enter Name" name="userName" required>
				</div>
			</div>
			<div class="form-group">
				<div>
					<label for="psw"><b>Password</b></label>
				</div>
				<div>
					<input type="password" placeholder="Enter Password" name="password"
						required>
				</div>
			</div>
			<div class="form-group">
				<div>
					<label for="psw-repeat"><b>Repeat Password</b></label>
				</div>
				<div>
					<input type="password" placeholder="Repeat Password"
						name="rpassword" required>
				</div>
			</div>
			<div class="form-group">
				<div>
					<label for="email"><b>Email</b></label>
				</div>
				<div>
					<input type="text" placeholder="Enter Email" name="userId" required>
				</div>
			</div>
			<div class="form-group">
				<div>
					<label for="mobileno"><b>Mobile No</b></label>
					<div>
						<input type="text" placeholder="Enter Mobile No" name="mobileNo"
							required>
					</div>
				</div>
				<div class="form-group">
					<label> <input type="checkbox" checked="checked"
						name="remember" style="margin-bottom: 15px"> Remember me
					</label>
				</div>
				<p>
					By creating an account you agree to our <a href="#"
						style="color: dodgerblue">Terms & Privacy</a>.
				</p>
				<button type="submit" class="btn btn-primary">Submit</button>
			</div>
		</div>
	</form>
</body>
</html>