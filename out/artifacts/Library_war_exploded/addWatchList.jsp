<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add to Watch List</title>
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

<%
String user_id = request.getParameter ("user_id");
request.getSession().setAttribute("user_id", user_id);
%>

<form method="post" action="addWatchListResult.jsp">
		<center>
			<table border="1" cellpadding="5" cellspacing="2">
				<thead>
					<tr>
						<th colspan="2">Enter Inventory ID</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>Inventory ID</td>
						<td><input type= "text" name="inventory_id" required /></td>
					</tr>
					
					<tr>
						<td colspan="1" align="center"><input type="submit"
							value="Add" /> &nbsp;&nbsp;</td>
					</tr>
				</tbody>
			</table>
		</center>
	</form>
	
<% if (session.getAttribute("user_id") == null){ %>
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
