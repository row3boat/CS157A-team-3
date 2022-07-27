<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>add Book webpage</title>
</head>
<body>
<form method="post" action="addBookValidate.jsp">
		<center>
			<table border="1" cellpadding="5" cellspacing="2">
				<thead>
					<tr>
						<th colspan="2">Input ISBN of Book to add</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>ISBN</td>
						<td><input type= "number" name="ISBN" required /></td>
					</tr>
					
					<tr>
						<td colspan="1" align="center"><input type="submit"
							value="ISBN" /> &nbsp;&nbsp;</td>
					</tr>
				</tbody>
			</table>
		</center>
	</form>
</body>
</html>