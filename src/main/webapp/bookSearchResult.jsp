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
	String password = "tonngoHOK.81";

	String db = "Library"; //or root
	String url = "jdbc:mysql://localhost:3306/";


	try
	{
		java.sql.Connection connection;
		Class.forName("com.mysql.jdbc.Driver");
		connection = DriverManager.getConnection(url + db, user, password);


		Statement statement = connection.createStatement();
		String select = "SELECT DISTINCT book.name, author.first_name, author.last_name, genre.genre_name, book.publish_date";
		String from = "FROM Library.book, Library.genre, Library.author";
		String where = "WHERE book.genre_id = genre.genre_id AND book.author_id = author.author_id" +
						" AND (book.name LIKE '%" + keyword + "%'" +
						" OR author.first_name LIKE '%" + keyword + "%'" +
						" OR author.last_name LIKE '%" + keyword + "%'" +
						" OR genre.genre_name = '%" + keyword + "%');";

				
		String querySql = select + " " + from + " " + where;


		ResultSet rs = statement.executeQuery(querySql);
		boolean flag = false;

		while (rs.next())
		{
			out.println("<b>" + rs.getString(1) + "</b><br>");
			out.println(rs.getString(2) + " " + rs.getString(3) + "<br>");
			out.println(rs.getString(4) + "<br>");
			out.println(rs.getDate(5) + "<br>");
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