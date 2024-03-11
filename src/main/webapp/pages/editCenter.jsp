<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.vaccination.*"%>
<%@ page import="java.util.* "%>
<%@page import="com.vaccination.entity.*"%>
<%@include file="security.jsp"%>
<%@include file="welcomeHeader.jsp"%>
<!DOCTYPE html>
<!-- //***********************github.com/AkshayTR2023*************************// -->
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Center</title>
<style>
.menu-box {
	border: 1px solid #ccc;
	padding: 10px;
	width: 300px;
	margin: 0 auto;
	text-align: center;
}
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
</style>
</head>
<body>
<br><br>
	<div class="menu-box">
		<h1>Center Information</h1>
		<%
		VaccinationCenter center = (VaccinationCenter) request.getAttribute("center");
		List<City> cities = (List<City>) request.getAttribute("cities");
		%>
		<form action="editCenter">
			<table>
				<tr>
					<th colspan="2">Edit <%= center.getCenterName() %></th>
				</tr>
				<tr>
					<td>Center Name</td>
					<td><input type="text" name="center" value="<%= center.getCenterName() %>"></td>
				</tr>
				<tr>
					<td>Center City</td>
					<td>
						<select name="city">
							<%
							for (City city : cities) {
								if (city.getCityname().equals(center.getCity())) {
							%>
							<option value="<%= city.getCityname() %>" selected><%= city.getCityname()%></option>
							<%
								} else {
							%>
							<option value="<%= city.getCityname() %>"><%= city.getCityname() %></option>
							<%
								}
							}
							%>
						</select>
					</td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="Submit"></td>
				</tr>
			</table>
			<input type="hidden" name="id" value="<%= center.getId() %>">
		</form>
	</div>
</body>
</html>
