<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Function to delete book</title>
<%
	try{
		int ISBN = Integer.parseInt(request.getParameter("ISBN"));
		
		Class.forName("com.mysql.jdbc.Driver");        

        
        final String url = "jdbc:mysql:///library";
        final String user = "root";
        final String password1 = "fb22abhinavindia#3";
        
        Connection con = DriverManager.getConnection(url, user, password1);   
        Connection con2 = DriverManager.getConnection(url, user, password1);   
 
		
        String validateQuery = "SELECT number_of_copies FROM inventory "+
        						"WHERE ISBN = ? ";
        
        String updateQuery = "UPDATE inventory "+
        				"SET number_of_copies = number_of_copies - 1 "+
        				"WHERE ISBN = ? ";
        
        PreparedStatement pst = con.prepareStatement(validateQuery);
        pst.setInt(1,ISBN);
        
        ResultSet rs = pst.executeQuery();
        if(rs.next()){
        	if(rs.getInt(1) <= 0)
        		response.sendRedirect("deleteBookErrorMessage.jsp");
      	  else{
        		PreparedStatement pst2 = con2.prepareStatement(updateQuery);
        		pst2.setInt(1,ISBN);
        		int result = pst2.executeUpdate();
        	
        		if(result == 1)
        			response.sendRedirect("updateInventory.jsp");
        		else
        		response.sendRedirect("deleteBookErrorMessage.jsp");
       		}
        }else{
        	response.sendRedirect("deleteBookErrorMessage.jsp");
        }
        	
	}
catch(SQLException e){       
		out.println(e.getMessage());   
}



%>
</head>
<body>

</body>
</html>