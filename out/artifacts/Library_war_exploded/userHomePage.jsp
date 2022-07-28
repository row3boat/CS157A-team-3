<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>

    <title>eLib!</title>

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
    <%= "Welcome to eLib, " + session.getAttribute("username") + "!" %>
    <button name="b1" class="search-button" onclick="location.href ='bookSearch.jsp'">Search all books.</button>
</>

<h2>
    <button name="b1" class="search-button" onclick="location.href ='checkout.jsp'">Check out books.</button>
    <button name="b1" class="search-button" onclick="location.href ='checkin.jsp'">Check in books.</button>
</h2>


<ul class="login">
    <li>
        <button name="b1" onclick="location.href ='index.jsp'">Click to logout.</button>
    </li>
</ul>

<h2> Most Checked Out This Month:
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
            ResultSet rs=stmt.executeQuery("SELECT book.name AS Bestseller, COUNT(checked_out.inventory_id) AS Total_Checked_Out " +
                    "FROM Library.checked_out, Library.book, Library.inventory " +
                    "WHERE checked_out.checkout_date >= ( CURDATE() - INTERVAL 30 DAY ) AND checked_out.inventory_id = inventory.inventory_id AND inventory.ISBN = book.ISBN " +
                    "GROUP BY checked_out.inventory_id " +
                    "ORDER BY Total_Checked_Out desc LIMIT 3");
    %>
    <table>
        <tr><th>Title</th><th>Number Checked Out</th></tr>
        <%
            while(rs.next()){
        %>
        <tr><td> <%=rs.getString(1)%></td><td><%=rs.getInt(2)%></td></tr>
        <%
            }
        %>
    </table>
    <%
            con.close();
        }catch(Exception e){ out.println(e);}
    %>


</body>
</html>