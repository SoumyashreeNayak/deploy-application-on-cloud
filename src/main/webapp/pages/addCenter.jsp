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
<title>Add New Center</title>
<style>
.menu-box {
	border: 1px solid #ccc;
	padding: 10px;
	width: 500px;
	margin: 0 auto;
	text-align: center;
}

.menu-box a {
	display: block;
	margin-bottom: 10px;
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
        <h1>Add new Vaccination Center</h1>
        <form action="addCenter" method="post" >
            <table>
                <tr>
                    <td>Center Name</td>
                    <td><input type="text" name="center"></td>
                </tr>
                <tr>
                    <td>Center City</td>
                    <td>
                        <select name="city" >
                            <% List<City> cities = (List<City>) request.getAttribute("cities");
                            	for(City city: cities){
                            %>
                                <option value="<%=city.getCityname()%>"><%=city.getCityname() %></option>
                            <%} %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td colspan="2"><input type="submit" value="Submit"></td>
                </tr>
            </table>
        </form>
    </div>
</body>
</html>
