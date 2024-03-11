<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.vaccination.entity.*"%>
<%@page import="java.util.*"%>
<%@include file="welcomeHeader.jsp"%>
<%@include file="security.jsp"%>
<!DOCTYPE html>
<!-- //***********************github.com/AkshayTR2023*************************// -->
<html>
<head>
<meta charset="ISO-8859-1">
<title>Citizen Information</title>
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
<!-- This extra jsp is used to select centers present in the city selected in editCitizen.jsp -->
	<br>
	<br>
	<div class="menu-box">
		<h1>Citizen Information</h1>
		<form action="editCitizen" method="post">
			<table>
				<tr>
					<th colspan="2"><b>Edit Citizen</b></th>
				</tr>
				<tr>
					<td>Citizen Name</td>
					<td><input type="text" name="citizenName"
						value="<%=request.getAttribute("citizenName")%>"></td>
				</tr>
				<tr>
					<td>Citizen City</td>
					<td><select name="city">
							<option
								value="<%=(String) request.getAttribute("selectedCity")%>"
								selected><%=(String) request.getAttribute("selectedCity")%></option>
					</select></td>
				</tr>
				<tr>
					<td>No. of Doses</td>
					<td><select name="doses">
							<%
							for (int count = 0; count <= 2; count++) {
								if (count == Integer.parseInt((String) request.getAttribute("doses"))) {
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
							<%
							List<VaccinationCenter> centers = (List<VaccinationCenter>) request.getAttribute("centers");
							for (VaccinationCenter center : centers) {
							%>
							<option value="<%=center.getId()%>"><%=center.getCenterName()%></option>
							<%
							}
							%>
					</select></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="Submit"></td>
				</tr>
			</table>
			<input type="hidden" name="id"
						value="<%=(Integer) request.getAttribute("citizenId")%>">
		</form>
		<i>Go Back, if you wish to change city</i>
	</div>
</body>
</html>
