<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Home Page</title>
</head>
<body>
<h1>
    <%= "Search by title, author, or genre!" %>
    <button name="b1" class="search-title" onclick="location.href ='titleSearch.jsp'">Click to search books by title.</button>
    <button name="b1" class="search-author" onclick="location.href ='authorSearch.jsp'">Click to search books by title.</button>
    <button name="b1" class="search-genre" onclick="location.href ='genreSearch.jsp'">Click to search books by title.</button>
    
    
</h1>
</body>
</html>