<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

    <title>Librarian Home Page!</title>

</head>
<style>
    h1 {
        text-align: center;
    }
    h2{
        text-align:center;
    }

    h3{
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
    <%= "Welcome to Librarian Home Page, " + session.getAttribute("username") + "!" %>
</>

<h2>
    <button name="b1" class="search-button" onclick="location.href ='addBook.jsp'">Add book.</button>
    <button name="b1" class="search-button" onclick="location.href ='deleteBook.jsp'">Delete book.</button>
    <button name="b1" class="search-button" onclick="location.href ='addLibrarian.jsp'">Add new Librarian.</button>
    <button name="b1" class="search-button" onclick="location.href ='revokeLibrarian.jsp'">Remove Librarian.</button>
</h2>

<h3>
    <br>
    <button name="b1" onclick="location.href ='index.jsp'">Logout.</button>

</h3>
</body>
</html>