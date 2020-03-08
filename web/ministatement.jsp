<%-- 
    Document   : ministatement
    Created on : 25 Feb, 2020, 10:55:42 PM
    Author     : piyush
--%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="javax.mail.Session"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sabka Bank</title>
    </head>
    <body>
        <%
            String user=(String)session.getAttribute("user");
            String accountno=(String)session.getAttribute("accountno");
            String amount=(String)session.getAttribute("accountb1");
          int amount1=Integer.parseInt(amount);
            Random rand=new Random();
            Date date = new Date();  
            SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");  
            String strDate= formatter.format(date);  
           try{
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/BankingOnline","root","piyush123");
                Statement st=con.createStatement();
                int x=st.executeUpdate("insert into transactions(tid,tdate,sent_account,received_accoun,amount)values('"+rand.nextInt()+"','"+strDate+"','"+user+"','"+accountno+"','"+amount1+"')");
                if(x==1)
                {   
                    %>
                    <button onclick="location.href='bank3.jsp';" >Home Page
                        <%
                   
                }
            }catch(Exception e)
            {
                
            }
            
            %>
    </body>
</html>
