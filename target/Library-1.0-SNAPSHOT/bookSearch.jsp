<%--
  Created by IntelliJ IDEA.
  User: rowanpansare
  Date: 6/12/22
  Time: 4:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*"%>
<html>
<head>
    <title>JDBC Connection Example</title>
    <button class="btn btn-lg btn-primary" id="submit" onclick="location.href ='/Library_war/index.jsp'" >Go To Dashboard</button>
</head>
<body>
<h1> JDBC Connection Example </h1>
<%
    try{
        Class.forName("com.mysql.jdbc.Driver");
        /**
         * CHANGE THIS LINE TO PUT YOUR OWN DATABASE NAME, OWN USER, OWN PASSWORD.
         */
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project?autoReconnect=true&useSSL=false","root","fb22abhinavindia#3");
        /**
         * CHANGE THE ABOVE LINE!
         */
//here wu is database name, root is username and password
        Statement stmt=con.createStatement();
        ResultSet rs=stmt.executeQuery("select * from customer");
        while(rs.next())
            out.println(rs.getInt(1)+" "+rs.getString(2)+" "+rs.getString(3) +"3");
        con.close();
    }catch(Exception e){ out.println(e);}
%>

</body>

</html>
