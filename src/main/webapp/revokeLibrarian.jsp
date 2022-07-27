
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>add librarian webpage</title>
    </head>
    <body>
        <form method="post" action="revokeLibrarianValidate.jsp">
            <center>
            <table border="1" cellpadding="5" cellspacing="2">
                <thead>
                    <tr>
                        <th colspan="2">Input LibrarianID to delete</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>ID</td>
                        <td><input type="number" name="LibrarianId" required/></td>
                    </tr>
                    
                    <tr>
                        <td colspan="1" align="center"><input type="submit" value="Login" />
                            &nbsp;&nbsp;
                          
                        </td>                        
                    </tr>                    
                </tbody>
            </table>
            </center>
        </form>
    </body>
</html>