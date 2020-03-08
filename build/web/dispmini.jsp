<%-- 
    Document   : dispmini
    Created on : 26 Feb, 2020, 10:38:26 PM
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
        
    <meta http-equiv="x-ua-compatible" content="ie=edge">
   
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" type="image/png" href="assets/images/icon/favicon.ico">
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/font-awesome.min.css">
    <link rel="stylesheet" href="assets/css/themify-icons.css">
    <link rel="stylesheet" href="assets/css/metisMenu.css">
    <link rel="stylesheet" href="assets/css/owl.carousel.min.css">
    <link rel="stylesheet" href="assets/css/slicknav.min.css">
    <!-- amchart css -->
    <link rel="stylesheet" href="https://www.amcharts.com/lib/3/plugins/export/export.css" type="text/css" media="all" />
    <!-- others css -->
    <link rel="stylesheet" href="assets/css/typography.css">
    <link rel="stylesheet" href="assets/css/default-css.css">
    <link rel="stylesheet" href="assets/css/styles.css">
    <link rel="stylesheet" href="assets/css/responsive.css">
    <!-- modernizr css -->
    <script src="assets/js/vendor/modernizr-2.8.3.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sabka Bank</title>
    </head>
    <body>
        <table id="dtBasicExample" class="table table-striped table-bordered table-sm sortable" cellspacing="0" width="100%">
                                <thead>
                                  <tr>
                                    <th class="th-sm">Transaction Id
                                    </th>
                                    <th class="th-sm">Sender
                                    </th>
                                    <th class="th-sm">Receiver
                                    </th>
                                    <th class="th-sm">Date 
                                    </th>
                                    <th class="th-sm">Amount
                                    </th>
                                  </tr>
                                </thead>
                                 <tbody>
        <%
            String user=(String)session.getAttribute("user");
           try
           {
                        Class.forName("com.mysql.jdbc.Driver");
                     Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/BankingOnline?autoReconnect=true&useSSL=false","root","piyush123");
                    Statement st=con.createStatement();
                    ResultSet rs=st.executeQuery("select * from transactions where sent_account='"+user+"'");
                    while(rs.next())
                    {
                        String tid=rs.getString("tid");
                        String sender=rs.getString("sent_account");
                        String receiver=rs.getString("received_accoun");
                        String tdate=rs.getString("tdate");
                        int amount=rs.getInt("amount");
                        %>
                         <tr>
                                                 <td>
                                                      <%
                                                        out.print(tid);
                                                       %>
                                                  </td>
                                                  <td>
                                                        <%
                                                          out.print(sender);
                                                         %>
                                                  </td>
                                                  <td>
                                                        <%
                                                          out.print(receiver);
                                                        %>
                                                  </td>
                                                  <td>
                                                      <%
                                                        out.print(tdate);
                                                       %>
                                                  </td>
                                                  <td>
                                                      <%
                                                        out.print(amount);
                                                       %>
                                                  </td>
                         </tr>
                                                 
                         <%
                                        
                        
                        
                    }
           
           }catch(Exception e)
           {
               out.println(e);
           }
            
         %>
                                 </tbody>
                                 
        </table>
                                 <button onclick="location.href='bank3.jsp';" >Home Page
    </body>
</html>
