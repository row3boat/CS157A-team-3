<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Librarian Home Page</title>
</head>
<body>
<h1>
    <%= "Librarian Home Page!" %>
    <button name="b1" class="search-button" onclick="location.href ='addBook.jsp'">Click to add a book to the database.
    <button name="b2" class="search-button" onclick="location.href ='deleteBook.jsp'">Click to delete a book from the database.
    <button name="b3" class="search-button" onclick="location.href ='addLibrarian.jsp'">Click to add a new librarian.
    <button name="b4" class="search-button" onclick="location.href ='revokeLibrarian.jsp'">Click to delete a librarian.
    
    
    </button>
</h1>
</body>
</html>