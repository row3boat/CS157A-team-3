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
        <th>Check in Early</th></tr>
    <%
        while(rs.next()){
    %>
    <tr>
        <td> <%=rs.getString(1) //title%></td>
        <td><%=rs.getDate(2) //date checkedout%></td>
        <td> <%=rs.getInt(3) //inventory id %></td>
        <td><button onclick = "location.href = 'checkinValidate.jsp'">Checkin</button></td></tr>
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
