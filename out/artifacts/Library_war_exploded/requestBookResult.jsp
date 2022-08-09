<%--
  Author: Lam Pham
  Date: 7/28/22
  Time: 8:00 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Request Result</title>
</head>
<body>

<h1>Request Result:</h1>
<%
	String user_id = (String)request.getSession().getAttribute("userid");
	String isbn = request.getParameter("ISBN");

	String user = "root";
	String password = "root";

	String db = "Library"; //or root
	String url = "jdbc:mysql://localhost:3306/";


	try
	{
		java.sql.Connection connection;
		Class.forName("com.mysql.jdbc.Driver");
		connection = DriverManager.getConnection(url + db, user, password);


		Statement statement = connection.createStatement();
		String insertInto = "INSERT INTO Library.request (user_id, ISBN)";
		String value = "VALUES ('" + user_id + "', '" + isbn + "');";
		
		String insertInstruction = insertInto + " " + value;
		
		PreparedStatement pst = connection.prepareStatement(insertInstruction);
		int rs = pst.executeUpdate();
		
		if (rs == 1)
			out.println ("Succesfully requested ISBN: " + isbn + "<br><br>");
		
		else
			out.println ("Requested Unsuccesfully!<br><br>");


		connection.close();
	}
	catch(SQLException e)
	{
		out.println("SQLException caught: " +e.getMessage());
	}
%>

<form action="requestBook.jsp">
	<input type="submit" value="Back" />
</form>

</body>
</html>