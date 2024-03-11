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
<title>Vaccination Center</title>
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
.add-center-btn {
            float: right;
        }
.button-width-2 {
	width: 30%;
	margin: 0 auto;
	text-align: center;
}
</style>
</head>
<body >
<br><br>
	<%VaccinationCenter center = (VaccinationCenter)request.getAttribute("center"); 
	List<Citizen> citizens = (List<Citizen>)request.getAttribute("citizens");{
	%>
	<h2 align="left">Center Information</h2>
	<table>
		<tr>
			<th colspan="2" ><b><%=center.getCenterName()%></b></th>
		</tr>
		<tr>
			<td>ID</td>
			<td><%=center.getId() %></td>
		</tr>	
		<tr>
			<td>City</td>
			<td><%=center.getCity() %></td>
		</tr>	
	
	</table>
	<hr>
	<h2 align="left">All Citizens of this center</h2>
	<table>
		<tr>
			<th><b>ID</b></th>
			<th><b>Name</b></th>
			<th><b>Action</b></th>
		</tr>
		<%for (Citizen citizen:citizens){%>
		<tr>
			
			<td><%=citizen.getId() %></td>
			<td><%=citizen.getCitizenName() %></td>
			<td><a href="/citizens/view?id=<%=citizen.getId()%>">View</a>
		</tr>	
		<%} %>
	</table>
	<%} %>
</body>
</html>