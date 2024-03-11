<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<!-- //***********************github.com/AkshayTR2023*************************// -->
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Registration</title>
</head>
<style>
table {
	width: 100%;
	border-collapse: collapse;
}

th, td {
	padding: 8px;
	border: 1px solid #ccc;
}

th {
	background-color: #f2f2f2;
}
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
<body>
	<h1>Admin Registration</h1>
	<div class="menu-box">
	<form action="/register" method="post">
	
		<table>
			<tr>
				<td><h3 align="center">Registration</h3></td>
			</tr>
			<tr>
			<td>
				<table>

				<tr>
				<td>Username</td>
				<td><input type="text" name="username" required></td>
			</tr>


			<tr>
				<td>Email</td>
				<td><input type="email" name="email" required></td>
			</tr>

			<tr>
				<td>Password</td>
				<td><input type="password" name="password" required></td>
			</tr>

		</table>
		</td>
		</tr>
		<tr>
			<td><input type="submit" value="Register"></td>
		</tr>


		</table>
	</form>
	</div>
</body>
</html>