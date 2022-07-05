<%--
  Author: Lam Pham
  Date: 7/4/22
  Time: 4:16 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*"%>

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
	String password = "root";

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
		boolean flag = false;


		out.write("<table border=\"1\"><thead>" +
				"<tr><td>Title</td><td>Genre</td><td>Author</td><td>Publish Date</td></tr></thead><tbody>");

		while (rs.next())
		{
			out.write("<tr><td>" + rs.getString(2) + "</td><td>" + rs.getString(3) + "</td><td>" + rs.getString(4) + "</td><td>" + rs.getDate(5)+ "</td></tr>");
			flag = true;
		}
		out.write("</tbody></table>");

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