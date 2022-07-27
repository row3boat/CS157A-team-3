
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*"%>

<html>
<body> 
<%  
    try{
    	 
        String username = request.getParameter("username");   
        String password = request.getParameter("password");
        

        Class.forName("com.mysql.jdbc.Driver");        
        final String url = "jdbc:mysql:///Library";
        final String user = "root";
        final String password1 = "root";

   		      

        // establish the connection
        Connection con = DriverManager.getConnection(url, user, password1);   
   		       

        PreparedStatement pst = con.prepareStatement("Select username,password from user where username=? and password=?");
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
        final String password1 = "fb22abhinavindia#3";

   		      

        // establish the connection
        Connection con = DriverManager.getConnection(url, user, password1);   
   		       

        PreparedStatement pst = con.prepareStatement("Select username,password from librarian where username=? and password=?");
        pst.setString(1, username);
        pst.setString(2, password);
   		       

        ResultSet rs = pst.executeQuery();  
   		       

        if(rs.next())           
           response.sendRedirect("librarianHomePage.jsp");        
        else
           response.sendRedirect("ErrorMessage.jsp");     
   }
   catch(SQLException e){       
   		out.println(e.getMessage());       
   }  
%>
 </body>
 </html>
 