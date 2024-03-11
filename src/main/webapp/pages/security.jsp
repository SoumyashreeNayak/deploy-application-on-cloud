<!-- //***********************github.com/AkshayTR2023*************************// -->
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);
%>
	<%
   if (session.getAttribute("username") == null) {
        response.sendRedirect("/pages/home.jsp");
    }
%>

