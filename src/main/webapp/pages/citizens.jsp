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
<title>Citizens</title>
<style>
table {
	width: 100%;
	border-collapse: collapse;
	text-align: center;
}

th, td {
width:14%;
	border: 1px solid black;
	padding: 8px;
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
<body>
<br><br>
<h2 align="left">Citizens</h2>
<%
List<Citizen> citizens = (List<Citizen>)request.getAttribute("citizens");
int count = 0;
%>
<table>
	<tr>
		<td colspan="7"><a href="add" class="add-center-btn"><button>Add New Citizen</button></a></td>
	</tr>
	<tr>
		<th>ID</th>
		<th>Name</th>
		<th>City</th>
		<th>No. Of Doses</th>
		<th>Vaccination Status</th>
		<th>Vaccination Center</th>
		<th>Action</th>
	</tr>
	<%
	for (Citizen citizen : citizens) {
	%>
	<tr>
		<td><%=citizen.getId()%></td>
		<td><%=citizen.getCitizenName()%></td>
		<td><%=citizen.getCenter().getCity()%></td>
		<td><%=citizen.getDoses()%></td>
		<td>
			<%
			if (citizen.getDoses() == 0) {
			%> Not Vaccinated <%
			}
			if (citizen.getDoses() == 1) {
			%> Partially Vaccinated <%
			}
			if (citizen.getDoses() == 2) {
			%> Fully Vaccinated <%
			}
			%>
		</td>
		<td><%=citizen.getCenter().getCenterName()%></td>
		<td class="action-buttons">
			<a href="view?id=<%=citizen.getId()%>"><button class="button-width-2">View</button></a>
			<a href="edit?id=<%=citizen.getId()%>"><button class="button-width-2">Edit</button></a>
			<a href="delete?id=<%=citizen.getId()%>"><button class="button-width-2">Delete</button></a>
		</td>
	</tr>
	<%
	count++;
	}
	%>
	<tr>
		<td colspan="7">Total <%=count%> citizens found.</td>
	</tr>
</table>
</body>
</html>
