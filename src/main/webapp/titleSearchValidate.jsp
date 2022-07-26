<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%  
    try{
    	 
        String title = request.getParameter("title");   
        
        

        Class.forName("com.mysql.jdbc.Driver");        
        final String url = "jdbc:mysql:///library";
        final String user = "root";
        final String password1 = "fb22abhinavindia#3";

   		      

        // establish the connection
        Connection con = DriverManager.getConnection(url, user, password1);   
   		       
		String query = "SELECT number_of_copies" +
				"FROM inventory, book " +
				"WHERE inventory.ISBN = book.isbn" +
				"AND name = Rowan's Book" ;
        PreparedStatement pst = con.prepareStatement(query);
        pst.setString(1, title);
               

        ResultSet rs = pst.executeQuery();  
   		       

        if(rs.next())           
           out.println(rs);        
        else
           response.sendRedirect("ErrorMessage.jsp");     
   }
   catch(SQLException e){       
   		out.println(e.getMessage());       
   }  
%>
</body>
</html>