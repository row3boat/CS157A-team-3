<%--
  Author: Lam Pham
  Date: 7/4/22
  Time: 4:16 PM
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %> <html>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Searching Book</title>
</head>
<body>
<h1>Searching Books in Library Database</h1>

<form action="bookSearchResult.jsp" method="GET">
Keyword: <input type="text" name="keyword">
<input type="submit" value="Search" />
</form>

<form action="index.jsp">
<input type="submit" value="Back" />
</form>

</body>
</html>
