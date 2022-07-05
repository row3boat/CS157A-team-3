<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %> <html>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<h1>Search Results:</h1>
<%

	String actor = request.getParameter("actor");

	String db = "Library"; //or root
	String user = "root";
	String password = "tonngoHOK.81";
	
	try
	{
		java.sql.Connection con;
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/" + db, user, password);
		out.println (db + " database successfully opened.");
		
	
		Statement stmt=con.createStatement();
		String querySql = "SELECT * FROM sakila.actor WHERE actor.first_name = '" + actor + "';";
		ResultSet rs=stmt.executeQuery(querySql); out.println("<br>" + "Database:");
		while (rs.next())
		out.println("<br>" + rs.getInt(1) + " " + rs.getString(2) + " " + rs.getString(3));
		con.close();
	}
	catch(SQLException e)
	{
		out.println("SQLException caught: " +e.getMessage());
	}
%>
</body>
</html>