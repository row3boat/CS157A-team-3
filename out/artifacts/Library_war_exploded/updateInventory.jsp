<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<style>
    h1 {
        text-align: center;
    }
    h2{
        text-align:center;
    }

    p {
        text-align: center;
    }

    div {
        text-align: center;
    }

    button {
        background-color: gray; /* Green */
        border: 2px solid black;
        color: white;
        padding: 15px 30px;
        text-align: center;
        text-decoration: none;
        font-size: 16px;
        width: 20%;
    }

    table,th,td{
        border:1px solid black;
        text-align:center;
        margin-left: auto;
        margin-right: auto;
        background-color: green;
        color:white;
        font-size: 16px;
        text-decoration: none;
        width: 20%;
    }

    .login {
        list-style-type: none;
        text-align: center;
        margin: auto;
    }

    .search-button {
        background-color: green;
    }
    .logo{
        display: block;
        margin-left: auto;
        margin-right: auto;
    }

</style>
<body>
<img class= "logo" src="https://i.imgur.com/U1itnl6.jpeg" alt="SJSU Library" width="500" height="100">
<h1>
<%= "Book has successfully been added/removed. Current Inventory is as Follows:" %>
</h1>
<ul class="login">
    <li>
        <button name="b1" onclick="location.href ='librarianHomePage.jsp'">Click to go back to Librarian home page.</button>
    </li>
<h2> Current Inventory
	<% 
		try{
		 Class.forName("com.mysql.jdbc.Driver");
		 final String url = "jdbc:mysql:///library";
	        final String user = "root";
	        final String password1 = "root";

	   		      

	        // establish the connection
	        Connection con = DriverManager.getConnection(url, user, password1); 
            Statement stmt=con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM inventory");
		%>
	<table>
           <tr><th>Inventory ID</th><th>ISBN</th><th>Number of Copies</th></tr>
     <%
            while(rs.next()){
                %>
            <tr><td> <%=rs.getInt(1)%></td><td><%=rs.getInt(2)%></td><td><%=rs.getInt(3)%></td></tr>
    <%
            }
            %>
         </table>

<% 
		}catch(SQLException e){       
	out.println(e.getMessage());   
}
%>

</h2>










</body>
</html>