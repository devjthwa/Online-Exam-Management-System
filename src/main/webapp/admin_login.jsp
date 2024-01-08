<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Staff Login</title>
	<link rel="stylesheet"
		href=".\css\admin.css">

</head>
<body>
<div class="container">

		<!-- upper button section to select
			the login or signup form -->
		<div class="slider"></div>
		<div class="btn">
			<button class="faculty">Faculty</button>
			<button class="admin">Admin</button>
		</div>

		<!-- Form section that contains the
			login and the signup form -->
		<div class="form-section">

			<!-- faculty login -->
			<form method="post" action="./faculty" class="faculty-box">
                
                 <h2>Login Here !</h2>
				<input type="email"
					class="email ele"
					placeholder="youremail@email.com" id="email" name="email" required>
				<input type="password"
					class="password ele"
					placeholder="password" required id="password" name="password">
                    <div class="forgotpassword">
<!--                         <a href="Teacher-dashboard.jsp">Forgot password</a> -->
                    </div>
                
				<button class="clkbtn" >Login</button>
            </form>

			<!-- admin login -->
			<form method="post" action="./admin" class="admin-box">
                <h2>Login Here !</h2>
				<input type="email"
					class="email ele"
					placeholder="youremail@email.com" id="email" name="email" required>
				<input type="password"
					class="password ele"
					placeholder="password" required id="password" name="password">
                    <div class="forgotpassword">
                     <!--    <a href="#">Forgot password</a> -->
                    </div>
				<button class="clkbtn">Login</button>
			</form>
			
		</div>
	</div>
	<%if(session.getAttribute("wrong") != null){ %>
	<div class="wrong_pwd">
		Invalid username or password
	</div>
	<%
	session.removeAttribute("wrong");
	} %>
	<script src=".\js\index.js"></script>

</body>
</html>