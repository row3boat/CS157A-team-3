<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>addLib</title>
</head>
<body>
<%
	try{
		String username = request.getParameter("username");   
        String password = request.getParameter("password");
        

        Class.forName("com.mysql.jdbc.Driver");        
        final String url = "jdbc:mysql:///library";
        final String user = "root";
        final String password1 = "fb22abhinavindia#3";

        Connection con = DriverManager.getConnection(url, user, password1);   
	
        String insertLibrarian = "INSERT INTO librarian " + "(username, password) " + "VALUES (?,?)";
	
        PreparedStatement pst = con.prepareStatement(insertLibrarian);
        pst.setString(1, username);
        pst.setString(2, password);
   		       

        int result = pst.executeUpdate();  
   		
        if(result ==1){
        	response.sendRedirect("addLibrarianConfirmation.jsp");
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