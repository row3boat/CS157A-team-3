<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - TitleScreen</title>
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



<ul class="User Login">
    <li>
    	User Login
        <button name="b1" onclick="location.href ='login.jsp'">Click to login.</button>
    </li>
    <li>
        <button name="b1" onclick="location.href ='signup.jsp'">Click to create an account.</button>
    </li>
</ul>

<u2 class="Librarian Login">
    <li>
    	Librarian Login
        <button name="b1" onclick="location.href ='librarianLogin.jsp'">Click to login.</button>
    </li>
    
</u2>
<h2> Bestsellers List:
    <%
        try{
            Class.forName("com.mysql.jdbc.Driver");
            /**
             * CHANGE THIS LINE TO PUT YOUR OWN DATABASE NAME, OWN USER, OWN PASSWORD.
             */
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ Library?autoReconnect=true&useSSL=false","root","dragon165");
            /**
             * CHANGE THE ABOVE LINE!
             */
//here wu is database name, root is username and password
            Statement stmt=con.createStatement();
            ResultSet rs=stmt.executeQuery("SELECT Book.name AS Bestseller, COUNT(Checked_Out.book_id) AS Total_Checked_Out " +
                    "FROM Library.Checked_Out, Library.Book WHERE Library.Checked_Out.book_id = Library.Book.book_id " +
                    "GROUP BY Library.Checked_Out.book_id ORDER BY Total_Checked_Out desc LIMIT 3");
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
</h2>

</body>
</html>