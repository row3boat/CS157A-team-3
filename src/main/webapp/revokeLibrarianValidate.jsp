<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>revoke librarian functionality</title>
</head>
<body>
<%
	try{
		int librarianId = Integer.parseInt(request.getParameter("LibrarianId"));
		
		Class.forName("com.mysql.jdbc.Driver");        

        
        final String url = "jdbc:mysql:///library";
        final String user = "root";
        final String password1 = "fb22abhinavindia#3";
        
        Connection con = DriverManager.getConnection(url, user, password1);   
        Connection con2 = DriverManager.getConnection(url, user, password1); 
        
        String validate = "SELECT librarian_id "+
        				"FROM librarian WHERE librarian_id = ?";
        
        String delete = "DELETE FROM librarian WHERE librarian_id = ?";
        
        PreparedStatement pst1 = con.prepareStatement(validate);
        pst1.setInt(1, librarianId);
        
        ResultSet rs = pst1.executeQuery();
        if(rs.next()){
        	PreparedStatement pst2 = con2.prepareStatement(delete);
        	pst2.setInt(1,librarianId);
        	int rs2 = pst2.executeUpdate();
        	if(rs2 == 1)           
                response.sendRedirect("revokeLibrarianConfirmation.jsp");        
             else
                response.sendRedirect("revokeLibrarianErrorMessage.jsp");
        }
        else
            response.sendRedirect("revokeLibrarianErrorMessage.jsp");

	}
catch(SQLException e){       
		out.println(e.getMessage());   
}

%>
</body>
</html>