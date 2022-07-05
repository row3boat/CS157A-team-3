<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
try{
	java.sql.Connection con;
	Class.forName("com.mysql.jdbc.Driver");  
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project?", "root","fb22abhinavindia#3");
	out.println("step 1 passed");
	con.close();
}
catch(SQLException e){
	out.println(e.getMessage());
}
%>
</body>
</html>