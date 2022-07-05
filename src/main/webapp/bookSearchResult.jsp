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
<title>Search Result</title>
</head>
<body>

<h1>Search Results:</h1>
<%

	String keyword = request.getParameter("keyword");

	String user = "root";
	String password = "tonngoHOK.81";
	
	String db = "Library"; //or root
	String url = "jdbc:mysql://localhost:3306/";
	
	
	try
	{
		java.sql.Connection connection;
		Class.forName("com.mysql.jdbc.Driver");
		connection = DriverManager.getConnection(url + db, user, password);
		
	
		Statement statement = connection.createStatement();
		
		String select = "DISTINCT *";
		String from = "Library.book";
		String where = "name LIKE '%" + keyword + "%'" +
				" OR " + "genre LIKE '%" + keyword + "%'" +
				" OR " + "author LIKE '%" + keyword + "%'";
		String querySql = "SELECT " + select + " FROM " + from + " WHERE " + where + ";";
		
		ResultSet rs = statement.executeQuery(querySql);
		boolean flagResult = false;
		
		out.println("<br>");
		while (rs.next())
		{
			out.println("<b>" + rs.getString(2) + "</b><br>");
			out.println(rs.getString(3) + "<br>");
			out.println(rs.getString(4) + "<br>");
			out.println(rs.getDate(5) + "<br>");
			out.println("<br><br>");
			
			
			flagResult = true;
		}
		
		if (flagResult == false)
		{
			out.println("<b>Not Available</b>");
		}
		
		connection.close();
	}
	catch(SQLException e)
	{
		out.println("SQLException caught: " +e.getMessage());
	}
%>

<form action="bookSearch.jsp">
<input type="submit" value="Back" />
</form>

</body>
</html>
