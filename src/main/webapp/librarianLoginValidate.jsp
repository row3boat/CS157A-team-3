
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*"%>

<html>
<body> 
<%  
    try{
    	 
        String username = request.getParameter("username");   
        String password = request.getParameter("password");
        

        Class.forName("com.mysql.jdbc.Driver");        

              
        final String url = "jdbc:mysql:///library";
        final String user = "root";
        final String password1 = "root";

   		      

        // establish the connection
        Connection con = DriverManager.getConnection(url, user, password1);   
   		       


        PreparedStatement pst = con.prepareStatement("Select username,password,librarian_id from librarian where username=? and password=?");

        pst.setString(1, username);
        pst.setString(2, password);
   		       

        ResultSet rs = pst.executeQuery();  
   		       

        if(rs.next()) {
            response.sendRedirect("librarianHomePage.jsp");
            session.setAttribute("username", username);
            session.setAttribute("userid", rs.getString(3));
        }
        else
           response.sendRedirect("ErrorMessage.jsp");     
   }
   catch(SQLException e){       
   		out.println(e.getMessage());       
   }  
%>
 </body>
 </html>
