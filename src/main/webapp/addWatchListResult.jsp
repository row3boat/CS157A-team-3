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
	<title>Add Watch List Result</title>
</head>
<style>
  .logo{
        display: block;
        margin-left: auto;
        margin-right: auto;
    }
</style>
<body>
<img class= "logo" src="https://i.imgur.com/U1itnl6.jpeg" alt="SJSU Library" width="500" height="100">
<h1>Watch List Result:</h1>

<%
	String user_id = (String)request.getSession().getAttribute("user_id");
	String inventory_id = request.getParameter("inventory_id");

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
		String insertInto = "INSERT INTO Library.watch_list (user_id, inventory_id)";
		String value = "VALUES ('" + user_id + "', '" + inventory_id + "');";
		
		String insertInstruction = insertInto + " " + value;
		
		
		
		PreparedStatement pst = connection.prepareStatement(insertInstruction);
		int rs = pst.executeUpdate();
		
		if (rs == 1)
			out.println ("Succesfully added inventory ID " + inventory_id + " to Watch List<br><br>");
		
		else
			out.println ("Added Unsuccesfully!<br><br>");


		connection.close();
	}
	catch(SQLException e)
	{
		out.println("SQLException caught: " +e.getMessage());
	}
%>

<form action="addWatchList.jsp">
	<input type="submit" value="Back" />
</form>

</body>
</html>
