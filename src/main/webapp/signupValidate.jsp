
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*"%>

<html>
<body> 
<%  
	String INSERT = "INSERT INTO user" + "(username, password)" + "VALUES (?,?)";
    try{
    	 
        String username = request.getParameter("username");   
        String password = request.getParameter("password");
        

        Class.forName("com.mysql.jdbc.Driver");        
        final String url = "jdbc:mysql:///library";
        final String user = "root";
        final String password1 = "root";

   		      

        // establish the connection
        Connection con = DriverManager.getConnection(url, user, password1);   
   		       

        PreparedStatement pst = con.prepareStatement(INSERT);
        pst.setString(1, username);
        pst.setString(2, password);
   		       

        int result = pst.executeUpdate();  
   		
        if(result ==1){
        	response.sendRedirect("backToHomePage.jsp");
        }
        else{
        	response.sendRedirect("ErrorMessage.jsp");
        }


                 
   }
   catch(SQLException e){     
	   response.sendRedirect("ErrorMessage.jsp");
   		//out.println(e.getMessage());       
   }  
%>
 </body>
 </html>
