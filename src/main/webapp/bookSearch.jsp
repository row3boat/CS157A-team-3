<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Search Book</title>
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
<form method="post" action="bookSearchResult.jsp">
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
</body>
</html>