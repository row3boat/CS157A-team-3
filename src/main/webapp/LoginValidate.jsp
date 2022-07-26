
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*"%>

<html>
<body> 
<%  
    try{
    	 
        String username = request.getParameter("username");   
        String password = request.getParameter("password");
        

        Class.forName("com.mysql.jdbc.Driver");        
<<<<<<< HEAD
        final String url = "jdbc:mysql:///Library";
=======
        final String url = "jdbc:mysql:///library";
>>>>>>> refs/heads/Abhinav
        final String user = "root";
        final String password1 = "root";

   		      

        // establish the connection
        Connection con = DriverManager.getConnection(url, user, password1);   
   		       

<<<<<<< HEAD
        PreparedStatement pst = con.prepareStatement("Select username,password from Library.user where username=? and password=?");
=======
        PreparedStatement pst = con.prepareStatement("Select username,password from user where username=? and password=?");
>>>>>>> refs/heads/Abhinav
        pst.setString(1, username);
        pst.setString(2, password);
   		       

        ResultSet rs = pst.executeQuery();  
   		       

        if(rs.next())           
           response.sendRedirect("userHomePage.jsp");        
        else
           response.sendRedirect("ErrorMessage.jsp");     
   }
   catch(SQLException e){       
   		out.println(e.getMessage());       
   }  
%>
 </body>
 </html>
