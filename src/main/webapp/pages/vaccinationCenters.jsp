<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%@include file="welcomeHeader.jsp"%>
<%@include file="security.jsp"%>
<%@page import="java.util.*" %>
<%@page import="com.vaccination.entity.*" %>
<!DOCTYPE html>
<!-- //***********************github.com/AkshayTR2023*************************// -->
<html>
<head>
<meta charset="ISO-8859-1">
<title>Vaccination Centers</title>
<style>
table {
	width: 100%;
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
	<h2 align="left">Centers</h2>
	<%
	List<VaccinationCenter> centers = (List<VaccinationCenter>)request.getAttribute("centers");
	int count = 0;
	%>
	<table>
		<tr>
			<td colspan="4"><a href="add" class="add-center-btn"><button>Add New Center</button></a></td>
		</tr>
		<tr>
			<th>ID</th>
			<th>Name</th>
			<th>City</th>
			<th>Action</th>
		</tr>
		<%
		for (VaccinationCenter center : centers) {
		%>
		<tr>
			<td><%=center.getId()%></td>
			<td><%=center.getCenterName()%></td>
			<td><%=center.getCity()%></td>
		
			<td>
				<a href="view?id=<%=center.getId() %>" ><button class="button-width-2">View</button></a>
				<a href="edit?id=<%=center.getId() %>"><button class="button-width-2">Edit</button></a>
				<a href="delete?id=<%=center.getId() %>"><button class="button-width-2">Delete</button></a>
				
			</td>

		</tr>
		<%
		count++;
		}
		%>
		<tr>
			<td colspan="4">Total <%=count %> Vaccination Centers found.</td>
		</tr>
		
	</table>
	
</body>
</html>