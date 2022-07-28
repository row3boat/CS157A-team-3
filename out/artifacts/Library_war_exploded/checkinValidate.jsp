
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*"%>

<html>
<body>
<%
    try{

        String inventory_id = request.getParameter("inventoryid");


        Class.forName("com.mysql.jdbc.Driver");
        final String url = "jdbc:mysql:///Library";
        final String user = "root";
        final String password1 = "root";



        // establish the connection
        Connection con = DriverManager.getConnection(url, user, password1);


        PreparedStatement pst = con.prepareStatement("DELETE  " +
                "FROM checked_out " +
                "WHERE user_id=? and inventory_id=?");

        pst.setInt(1, Integer.parseInt((String) session.getAttribute("userid")));
        pst.setInt(2, Integer.parseInt(inventory_id));

        pst.executeUpdate();

        pst = con.prepareStatement("UPDATE transactions  " +
                "SET isCheckout = 0 " +
                "WHERE user_id=? AND inventory_id=?");

        pst.setInt(1, Integer.parseInt((String) session.getAttribute("userid")));
        pst.setInt(2, Integer.parseInt(inventory_id));

        pst.executeUpdate();


        response.sendRedirect("checkin.jsp");
    }
    catch(SQLException e){
        out.println(e.getMessage());
    }
%>
</body>
</html>
