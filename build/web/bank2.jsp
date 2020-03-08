<%-- 
    Document   : bank2.jsp
    Created on : 2 Feb, 2020, 6:57:32 PM
    Author     : piyush
--%>

<%@page import="java.sql.PreparedStatement"%>

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
            
        String userid=(String)session.getAttribute("user");
              
        //String password=request.getParameter("password");
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/BankingOnline?autoReconnect=true&useSSL=false","root","piyush123");
            String sql="select accountno,accounttype,accountbalance,customer.userid from account,customer where customer.userid='"+userid+"'";
            PreparedStatement st=con.prepareStatement(sql);
            ResultSet rs=st.executeQuery();
           // out.println("hdfsd");
            if(rs.next())
            {
                String accountno=rs.getString("accountno");
               // String =rs.getString("accounttype");
                String accountbalance=rs.getString("accountbalance");
                out.println("Welcome '"+userid+"' your account no is '"+accountno+"' and accountbalance is'"+accountbalance+"'");
                response.sendRedirect("bank2.jsp");
            }
            else
            {
                //out.println("jfmsd");
            }
        }catch(Exception e)
        {
            out.println(e);
        }
        %>
         <a href="logout.jsp">Log Out</a>
    </body>
</html>
