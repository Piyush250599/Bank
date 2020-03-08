<%-- 
    Document   : index
    Created on : 25 Jan, 2020, 11:04:20 AM
    Author     : piyush
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Banking Application</h1>
        <form action="bank1.jsp" method="post">
            <label>User-id</label><br>
            <input type="text" name="userid">
            <br><label>Password</label><br>
            <input type="password" name="password">  
            <br><input type="submit">
        </form>
    </body>
</html>
