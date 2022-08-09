
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*"%>

<html>
<body>
<%
    try{

        String isbn = request.getParameter("isbn");


        Class.forName("com.mysql.jdbc.Driver");
        final String url = "jdbc:mysql:///Library";
        final String user = "root";
        final String password1 = "root";



        // establish the connection
        Connection con = DriverManager.getConnection(url, user, password1);


        //first check if the isbn is valid and there is more than one copy.
        PreparedStatement pst = con.prepareStatement("SELECT number_of_copies, inventory_id  " +
                "FROM inventory " +
                "WHERE ISBN=?");

        pst.setInt(1, Integer.parseInt(isbn));
        ResultSet isbnvalid = pst.executeQuery();


        if(isbnvalid.next()) {
            //this means that the isbn is valid.
            //now we need to check if there are any copies in stock.
            pst = con.prepareStatement("SELECT COUNT(*) FROM checked_out WHERE inventory_id = ?");
            pst.setInt(1, isbnvalid.getInt(2));
            ResultSet checkedoutbooks = pst.executeQuery();

            if (checkedoutbooks.next()) {

                if (isbnvalid.getInt(1) - checkedoutbooks.getInt(1) > 0) {

                    //the book is valid, so now we need to mark it down as a new transaction
                    pst = con.prepareStatement("INSERT INTO transactions " +
                            "(user_id,inventory_id,isCheckout) " +
                            "VALUES(?,?,1)");

                    pst.setInt(1, Integer.parseInt((String) session.getAttribute("userid")));
                    pst.setInt(2, isbnvalid.getInt(2));
                    pst.executeUpdate();

                    //now we need to add it to checked_out table.

                    pst = con.prepareStatement("INSERT INTO checked_out  " +
                            "(user_id, inventory_id) " +
                            "VALUES(?,?)");

                    pst.setInt(1, Integer.parseInt((String) session.getAttribute("userid")));
                    pst.setInt(2, isbnvalid.getInt(2));
                    pst.executeUpdate();
                    response.sendRedirect("checkout.jsp");

                } else {
                    out.println("Sorry, this book is out of stock.  Try putting it on your watch list.");
                %>

<form method="post" action="watchListResult.jsp">
    <label for = "watchlist">Add to watchlist using ISBN:</label><br>
    <input type = "text" id = "watchlist" name = "isbn"><br>
    <input type = "submit" value = "Submit">
</form>

<%
                    return;
                }

            }
        }
        else{
            out.println("Sorry, that ISBN is invalid.");
            return;
    }
    }
    catch(SQLException e){
        out.println(e.getMessage());
    }
%>

<form action="checkout.jsp">
    <input type="submit" value="Back" />
</form>
</body>
</html>
