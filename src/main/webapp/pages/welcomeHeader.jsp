<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<!-- //***********************github.com/AkshayTR2023*************************// -->
<html>
<head>
<meta charset="ISO-8859-1">
<style>
table {
	width: 100%;
	border-collapse: collapse;
}

th, td {
	height: 20px;
	width: 25%;
	padding: 8px;
	border: 2px solid #ccc;
}

.center-text {
	width: 100%;
	margin: 0 auto;
	text-align: center;
}
</style>
</head>
<body>

	<table>
		<tr>
			<td><a href="/citizens/"> Citizens</a></td>
			<td><a href="/vaccinationcenter/" >Vaccination Centers</a></td>
			<td><a href="/pages/logout.jsp">Logout</a></td>
			<td><p class="center-text"><b >Welcome, <%=session.getAttribute("username")%></b></p></td>


		</tr>
	</table>
</body>
</html>