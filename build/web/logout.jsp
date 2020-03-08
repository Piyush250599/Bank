<%-- 
    Document   : logout
    Created on : 2 Feb, 2020, 6:47:38 PM
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
        <%
            session=request.getSession();
            session.removeAttribute("user");
            session.invalidate();
            response.sendRedirect("index.jsp");
                    
         %>
            
    </body>
</html>
