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
</head>
<body>
<h1> JDBC Connection Example </h1>
<%
    try{
        Class.forName("com.mysql.jdbc.Driver");
        /**
         * CHANGE THIS LINE TO PUT YOUR OWN DATABASE NAME, OWN USER, OWN PASSWORD.
         */
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ XXXPUTDBNAMEHEREXXX?autoReconnect=true&useSSL=false","PUT_USER_HERE","PUT_PASSWORD_HERE");
        /**
         * CHANGE THE ABOVE LINE!
         */
//here wu is database name, root is username and password
        Statement stmt=con.createStatement();
        ResultSet rs=stmt.executeQuery("select * from Student");
        while(rs.next())
            out.println(rs.getInt(1)+" "+rs.getString(2)+" "+rs.getString(3));
        con.close();
    }catch(Exception e){ out.println(e);}
%>

</body>
</html>
