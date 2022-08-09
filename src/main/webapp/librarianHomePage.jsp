<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Librarian Home Page</title>
</head>

<style>
    h1 {
        text-align: center;
    }
    h2{
        text-align:center;
    }

    p {
        text-align: center;
    }

    div {
        text-align: center;
    }

    button {
        background-color: gray; /* Green */
        border: 2px solid black;
        color: white;
        padding: 15px 30px;
        text-align: center;
        text-decoration: none;
        font-size: 16px;
        width: 20%;
    }

    table,th,td{
        border:1px solid black;
        text-align:center;
        margin-left: auto;
        margin-right: auto;
        background-color: green;
        color:white;
        font-size: 16px;
        text-decoration: none;
        width: 20%;
    }

    .login {
        list-style-type: none;
        text-align: center;
        margin: auto;
    }

    .search-button {
        background-color: green;
    }
    .logo{
        display: block;
        margin-left: auto;
        margin-right: auto;
    }

</style>
<body>
<img class= "logo" src="https://i.imgur.com/U1itnl6.jpeg" alt="SJSU Library" width="500" height="100">
<h1>
    <%= "Librarian Home Page!" %>
</h1>
<u1 class = "login">
	<li>
		<button name="b1"  onclick="location.href ='addBook.jsp'">Click to add a book to the database.</button>
    </li>
    <li>
    	<button name="b2"  onclick="location.href ='deleteBook.jsp'">Click to delete a book from the database.</button>
    </li>
    <li>
    <button name="b3"  onclick="location.href ='addLibrarian.jsp'">Click to add a new librarian.</button>
    </li>
    <li>
    <button name="b4"  onclick="location.href ='revokeLibrarian.jsp'">Click to delete a librarian.</button>
    </li>
</u1>
    

</body>
</html>