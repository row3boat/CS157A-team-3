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
<style>
  .logo{
        display: block;
        margin-left: auto;
        margin-right: auto;
    }
</style>
<body>
<img class= "logo" src="https://i.imgur.com/U1itnl6.jpeg" alt="SJSU Library" width="500" height="100">
<form method="post" action="searchBookResult.jsp">
		<center>
			<table border="1" cellpadding="5" cellspacing="2">
				<thead>
					<tr>
						<th colspan="2">Input keyword to search</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>Keyword</td>
						<td><input type= "text" name="keyword" required /></td>
					</tr>
					
					<tr>
						<td colspan="1" align="center"><input type="submit"
							value="Search" /> &nbsp;&nbsp;</td>
					</tr>
				</tbody>
			</table>
		</center>
	</form>
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
		String select = "SELECT DISTINCT book.name, author.name, genre.genre_name, book.ISBN, book.publish_date";

		String from = "FROM Library.book, Library.genre, Library.author";
		String where = "WHERE book.genre_id = genre.genre_id AND book.author_id = author.author_id" +
						" AND (book.name LIKE '%" + keyword + "%'" +
						" OR author.name LIKE '%" + keyword + "%'" +
						" OR genre.genre_name LIKE '%" + keyword + "%'" + ");";

				
		String querySql = select + " " + from + " " + where;


		ResultSet rs = statement.executeQuery(querySql);
		boolean flag = false;

		while (rs.next())
		{
			out.println("<b>" + rs.getString(1) + "</b><br>");
			out.println("Author: " + rs.getString(2) + "<br>");
			out.println("Genre: " + rs.getString(3) + "<br>");
			out.println ("ISBN: " + rs.getInt(4) + "<br>");
			out.println("Published: " + rs.getDate(5) + "<br>");
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