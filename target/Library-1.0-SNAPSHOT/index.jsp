<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<style>
    h1 {text-align: center;}
    p {text-align: center;}
    div {text-align: center;}
    button {
        background-color: #4CAF50; /* Green */
        border: none;
        color: white;
        padding: 15px 32px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 16px;
    }
</style>
<body>
<h1>
    <button name ="b1" onclick="location.href ='bookSearch.jsp'">Click to search books in stock.</button>
    <%= "Welcome to the eLibrary!" %>
    <button name ="b1" onclick="location.href ='login.jsp'">Click to login.</button>

</h1>
<br/>
</body>
</html>