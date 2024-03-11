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
<title>Add New Citizen</title>
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
	<!-- This extra jsp is used to select centers present in the city selected in addCitizen.jsp -->
	<br><br>
	<div class="menu-box">
		<h1>Add New Citizen</h1>
		<form action="addCitizen" method="post">
			<table>
				<tr>
					<td>Citizen Name</td>
					<td><input type="text" name="citizenName"value="<%=request.getAttribute("citizenName")%>"></td>
				</tr>
				<tr>
					<td>No. of Doses</td>
					<td>
						<select name="doses">
							<%
							
							for (int count=0;count<=2;count++) {
								if (count==Integer.parseInt((String)request.getAttribute("doses"))) {
							%>
							<option value="<%= count %>" selected><%= count%></option>
							<%
								} else {
							%>
							<option value="<%= count %>"><%= count %></option>
							<%
								}
							}
							%>
						</select>
					</td>
				</tr>
				<tr>
					<td>City Name</td>
					<td><select name="city">
							<option value="<%=(String)request.getAttribute("selectedCity")%>" selected><%=(String)request.getAttribute("selectedCity")%></option>
					</select></td>
				</tr>
				<tr>
					<td>Center Name</td>
					 <td>
                        <select name="center" >
                            <% List<VaccinationCenter> centers = (List<VaccinationCenter>) request.getAttribute("centers");
                            	for(VaccinationCenter center: centers){
                            %>
                                <option value="<%=center.getId()%>"><%=center.getCenterName() %></option>
                            <%} %>
                        </select>
                    </td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="Submit"></td>
				</tr>
			</table>
		</form>
		<i>Go Back, if you wish to change city</i>
	</div>
</body>
</html>
