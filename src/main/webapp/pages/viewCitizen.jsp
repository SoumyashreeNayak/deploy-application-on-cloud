<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@include file="welcomeHeader.jsp"%>
<%@include file="security.jsp"%>
<%@page import="java.util.*" %>
<%@page import="com.vaccination.entity.*"%>
<!DOCTYPE html>
<!-- //***********************github.com/AkshayTR2023*************************// -->
<html>
<head>
<meta charset="ISO-8859-1">
<title>Citizen</title>
<style>
table {
	border-collapse: collapse;
	text-align: center;
}

th, td {
	
	border: 1px solid black;
	
}

th {
	background-color: #f2f2f2;
	height:40px;
}
</style>
</head>
<body >
<br><br>
	<%Citizen citizen = (Citizen)request.getAttribute("citizen"); {
	%>
	<h2 align="left">Citizen Information</h2>
	<table>
		<tr>
			<th colspan="2" ><b><%=citizen.getCitizenName()%></b></th>
		</tr>
		<tr>
			<td>ID</td>
			<td><%=citizen.getId() %></td>
		</tr>	
		<tr>
			<td>City</td>
			<td><%=citizen.getCenter().getCity() %></td>
		</tr>	
		<tr>
			<td>Number of Vaccines</td>
			<td><%=citizen.getDoses()%></td>
		</tr>
		<tr>
			<td>Vaccination Status</td>
			<td><%
			if (citizen.getDoses() == 0) {
			%> Not Vaccinated <%
			}
			if (citizen.getDoses() == 1) {
			%> Partially Vaccinated <%
			}
			if (citizen.getDoses() == 2) {
			%> Fully Vaccinated <%
			}
			%></td>
		</tr>
		<tr>
			<td>Allocated Vaccination Center</td>
			<td><a href = "/vaccinationcenter/view?id=<%=citizen.getCenter().getId()%>"><%=citizen.getCenter().getCenterName() %></a></td>
		</tr>
	</table>
	<%} %>
</body>
</html>