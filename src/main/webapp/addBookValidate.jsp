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
		int ISBN = Integer.parseInt(request.getParameter("ISBN"));
		
		Class.forName("com.mysql.jdbc.Driver");        

        
        final String url = "jdbc:mysql:///library";
        final String user = "root";
        final String password1 = "fb22abhinavindia#3";
        
        Connection con = DriverManager.getConnection(url, user, password1);   
        Connection con2 = DriverManager.getConnection(url, user, password1);   
        Connection con3 = DriverManager.getConnection(url, user, password1);   

        String query1 = "SELECT inventory.ISBN "+
        		"FROM inventory, book "+
        		"WHERE inventory.ISBN = ? "+
        		"AND book.ISBN = ?";
        
       	String updateQuery = "UPDATE inventory "+
       						"SET number_of_copies = number_of_copies + 1 "+
       						"WHERE ISBN = ?";
       								
       	String addQuery = "INSERT INTO inventory (ISBN, number_of_copies) "+
       					"Values( ?, 1)";
       					
       
       PreparedStatement pst1 = con.prepareStatement(query1);
       pst1.setInt(1,ISBN);
       pst1.setInt(2,ISBN);
       
       ResultSet rs = pst1.executeQuery();
       
       if(rs.next()){
    	   PreparedStatement pst2 = con2.prepareStatement(updateQuery);
    	   pst2.setInt(1,ISBN);
    	   int rs2 = pst2.executeUpdate();
    	   if(rs2 == 1)           
               response.sendRedirect("updateInventory.jsp");        
            else
               response.sendRedirect("ErrorMessage.jsp"); 
    	   
       }
       else{
    	   PreparedStatement pst3 = con3.prepareStatement(addQuery);
    	   pst3.setInt(1,ISBN);
    	   int rs3 = pst3.executeUpdate();
    	   if(rs3 == 1)           
               response.sendRedirect("updateInventory.jsp");        
            else
               response.sendRedirect("ErrorMessage.jsp"); 
    	   
       }
	}
       catch(SQLException e){       
      		out.println(e.getMessage());   
	}


%>
</body>
</html>