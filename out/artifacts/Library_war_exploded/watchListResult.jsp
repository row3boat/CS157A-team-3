<%--
  Author: Lam Pham
  Date: 7/27/22
  Time: 11:45 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Watch List</title>
</head>
<body>

<h1>Watch List:</h1>
<%

	String user_id = request.getParameter("user_id");

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
		String select = "SELECT book.name, book.ISBN, inventory.number_of_copies";
		String from = "FROM Library.book, Library.inventory, Library.watch_list, Library.user";
		String where = "WHERE book.ISBN = inventory.ISBN AND inventory.inventory_id = watch_list.inventory_id" + 
						" AND watch_list.user_id = user.user_id" +
						" AND user.user_id = '" + user_id + "';";
				
		String querySql = select + " " + from + " " + where;


		ResultSet rs = statement.executeQuery(querySql);
		boolean flag = false;

		while (rs.next())
		{
			out.println("<b>" + rs.getString(1) + "</b><br>");
			out.println(rs.getString(2) + "<br>");
			out.println("Number of copies: " + rs.getString(3) + "<br>");
			out.println ("<br><br>");
	
			flag = true;
		}
		

		if (flag == false)
		{
			out.println ("N/A");
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