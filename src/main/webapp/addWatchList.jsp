<%--
  Author: Lam Pham
  Date: 7/28/22
  Time: 8:00 AM
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %> <html>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Watch List</title>
</head>
<body>
<h1>Add Watch List</h1>

<%
String user_id = request.getParameter ("user_id");
request.getSession().setAttribute("user_id", user_id);
%>

<form action="addWatchListResult.jsp" method="GET">
Enter Inventory ID: <input type="text" name="inventory_id">
<input type="submit" value="Add" />
</form>

<% if (session.getAttribute("userid") == null){ %>
<form action="index.jsp">
<input type="submit" value="Back" />
</form>
<% } else { %>
<form action="userHomePage.jsp">
<input type="submit" value="Back" />
</form>
    <%
}
%>
</body>
</html>
