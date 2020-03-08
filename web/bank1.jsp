<%-- 
    Document   : bank1
    Created on : 25 Jan, 2020, 11:12:41 AM
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
        <%
            
        String userid=request.getParameter("userid");
        session.setAttribute("user",userid);
        String password=request.getParameter("password");
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/BankingOnline?autoReconnect=true&useSSL=false","root","piyush123");
            Statement st=con.createStatement();
            ResultSet rs=st.executeQuery("select accountno,accounttype,accountbalance,customer.userid from account,customer where customer.userid='"+userid+"'and password='"+password+"'");
           // out.println("hdfsd");
            if(rs.next())
            {
                /*String accountno=rs.getString("accountno");
               // String =rs.getString("accounttype");
                String accountbalance=rs.getString("accountbalance");
                out.println("Welcome '"+userid+"' your account no is '"+accountno+"' and accountbalance is'"+accountbalance+"'");*/
              response.sendRedirect("bank3.jsp");
        %>   <a href="logout.jsp">Log Out</a>
           <% }
            else
            {
                out.println("Invalid login Credentials");
            }
        }catch(Exception e)
        {
            out.println(e);
        }
        %>
        
    </body>
</html>
