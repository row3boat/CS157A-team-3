<%--
  Created by IntelliJ IDEA.
  User: rowanpansare
  Date: 7/26/22
  Time: 8:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*"%>
<html>
<head>
    <title>Current Books</title>
</head>
<body>

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

    .form-design{
        text-align: center;
    }
</style>
<h1>Currently Checked Out Books: </h1>
<%
    try{
        Class.forName("com.mysql.jdbc.Driver");
        /**
         * CHANGE THIS LINE TO PUT YOUR OWN DATABASE NAME, OWN USER, OWN PASSWORD.
         */
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ Library?autoReconnect=true&useSSL=false","root","root");
        /**
         * CHANGE THE ABOVE LINE!
         */
        Statement stmt=con.createStatement();
        ResultSet rs=stmt.executeQuery("SELECT book.name, checked_out.checkout_date, inventory.inventory_id " +
                "FROM Library.checked_out, Library.book, Library.inventory " +
                "WHERE book.ISBN = inventory.ISBN AND checked_out.inventory_id = inventory.inventory_id AND checked_out.user_id = '"+session.getAttribute("userid")+"'");
%>
<table>
    <tr>
        <th>Title</th>
        <th>Date Checked Out</th>
        <th>Inventory ID</th></tr>
    <%
        while(rs.next()){
    %>
    <tr>
        <td> <%=rs.getString(1)%></td>
        <td><%=rs.getDate(2)%></td>
        <td> <%=rs.getInt(3)%></td></tr>
    <%
        }
    %>
</table>
<%
        con.close();
    }catch(Exception e){ out.println(e);}
%>
<br>
<br>
<form method="post" action="checkinValidate.jsp" class="form-design">
    <label for = "checkin"> Check in using inventory ID:</label><br>
    <input type = "text" id = "checkin" name = "inventoryid"><br>
    <input type = "submit" value = "Submit" class="search-button">
</form>

<form action="userHomePage.jsp" class="form-design" >
    <input type="submit" value="Back" class = "search-button"/>
</form>

</body>
</html>
