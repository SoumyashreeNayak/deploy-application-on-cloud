<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<!-- //***********************github.com/AkshayTR2023*************************// -->
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration Error</title>
</head>
<body>
	<h1 align="center">
		<%
		if (request.getAttribute("errorMsg").equals("Duplicate username")){
		%>
		Username Already exists! Please use a different Username.
		<%}
		if (request.getAttribute("errorMsg").equals("Duplicate email")){
		%>
		Email ID Already exists! Please use a different email ID.
		<%}%>
	</h1>
	<%@include file="/pages/register.jsp"%>
</body>
</html>