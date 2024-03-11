<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<!-- //***********************github.com/AkshayTR2023*************************// -->
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
<style>
.menu-box {
	border: 1px solid #ccc;
	padding: 10px;
	width: 300px;
	margin: 0 auto;
	text-align: center;
}

.menu-box a {
	display: block;
	margin-bottom: 10px;
}
</style>
</head>
<body>
	<div class="menu-box">

		<form action="/login" method="post">

			<table>
				<tr>
					<td><b>Admin Login</b></td>
					<td></td>
				</tr>
				<tr>
					<td>Username</td>
					<td><input type="text" name="username" required></td>
				</tr>


				<tr>
					<td>Password</td>
					<td><input type="password" name="password" required></td>
				</tr>

				<tr>
					<td><input type="submit" value="Login"></td>

				</tr>


			</table>

		</form>
		<br> <b>New User? Register here </b><br> <a
			href="/pages/register.jsp"><button>Registration</button></a>
	</div>
</body>
</html>