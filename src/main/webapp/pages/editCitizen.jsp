<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
<title>Edit Citizen</title>
<style>
.menu-box {
	border: 1px solid #ccc;
	padding: 10px;
	width: 500px;
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
	height: 40px;
}
</style>
</head>
<body>
<br><br>
	<div class="menu-box">
		<h1>Citizen Information</h1>
		<%
		Citizen citizen = (Citizen) request.getAttribute("citizen");
		List<City> cities = (List<City>) request.getAttribute("cities");
		%>
		<form action="edit-getcenter" method="post">
			<table>
				<tr>
					<th colspan="2"><b>Edit Citizen</b></th>
				</tr>
				<tr>
					<td>Citizen Name</td>
					<td><input type="text" name="citizenName"
						value="<%=citizen.getCitizenName()%>"></td>
				</tr>
				<tr>
					<td>Citizen City</td>
					<td><select name="city" id="city"
						onchange="this.form.submit()">
						
							<%
							for (City city : cities) {
								if (city.getCityname().equals(citizen.getCenter().getCity())) {
							%>
							<option value="<%=city.getCityname()%>" selected><%=city.getCityname()%></option>
							<%
							} else {
							%>
							<option value="<%=city.getCityname()%>"><%=city.getCityname()%></option>
							<%
							}
							}
							%>
					</select></td>
				</tr>
				<tr>
					<td>No. of Doses</td>
					<td><select name="doses">
							<%
							for (int count = 0; count <= 2; count++) {
								if (count == citizen.getDoses()) {
							%>
							<option value="<%=count%>" selected><%=count%></option>
							<%
							} else {
							%>
							<option value="<%=count%>"><%=count%></option>
							<%
							}
							}
							%>
					</select></td>
				</tr>
				<tr>
					<td>Vaccination Center</td>
					<td><select name="center">
							<option value="<%=citizen.getCenter().getId()%>" selected><%=citizen.getCenter().getCenterName()%></option>
					</select></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="Submit"></td>
				</tr>
			</table>
			<input type="hidden" name="id" value="<%= citizen.getId() %>">
		</form>
	</div>
</body>
</html>
