
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*"%>

<html>
<body> 
<%  
    try{
    	 
        String username = request.getParameter("username");   
        String password = request.getParameter("password");
        

        Class.forName("com.mysql.jdbc.Driver");        
        final String url = "jdbc:mysql:///project";
        final String user = "root";
        final String password1 = "fb22abhinavindia#3";

   		      

        // establish the connection
        Connection con = DriverManager.getConnection(url, user, password1);   
   		       

        PreparedStatement pst = con.prepareStatement("Select username,password from customer where username=? and password=?");
        pst.setString(1, username);
        pst.setString(2, password);
   		       

        ResultSet rs = pst.executeQuery();  
   		       

        if(rs.next())           
           out.println("Valid login credentials");        
        else
           out.println("Invalid login credentials");            
   }
   catch(SQLException e){       
   		out.println(e.getMessage());       
   }  
%>
 </body>
 </html>
