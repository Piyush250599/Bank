<%-- 
    Document   : sendmoney
    Created on : 6 Feb, 2020, 7:14:57 PM
    Author     : piyush
--%>
<%@page import="javax.mail.Session"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Sending Money</h1>
        <%
            String user=(String)session.getAttribute("user");
            out.println("hey "+user);
            
        %>
        <form action="sendmoneynext.jsp" method="post">
            <br><label>Receivers Account no</label><br>
            <input type="text" name="accountno">
            <br><label>Amount</label><br>
            <input type="number" name="Amount" min="0">
            <br><label>Mobile number:</label>
            <input type="text" name="mobileno">
            <br><label>Email id:</label>
            <input type="email" name="email">
            <br><input type="submit">
        </form>
    </body>
    <a href="logout.jsp">Log out</a>
</html>
