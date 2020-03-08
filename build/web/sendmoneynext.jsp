<%-- 
    Document   : sendmoneynext
    Created on : 6 Feb, 2020, 7:23:56 PM
    Author     : piyush
--%>
<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.Message.RecipientType"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="java.util.Properties"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.net.URL"%>
<%@page import="java.net.URLConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="javax.mail.Session"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
             <% 
                 Random rand=new Random();
                 Date date=new Date();
                String user=(String)session.getAttribute("user");
                String accountno=request.getParameter("accountno");
                session.setAttribute("accountno", accountno);
                int accountbalance1,accountbalance2;
                String accountb1=request.getParameter("Amount");
                session.setAttribute("accountb1", accountb1);
                int accountb=Integer.parseInt(request.getParameter("Amount"));
                
                String phone=request.getParameter("mobile");
               // session.setAttribute("mobileno", mobileno);
                String email=request.getParameter("email");
           /* Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", 465);
        props.put("mail.smtp.user", "agrawalpiyush2505@gmail.com");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.debug", "true");
        props.put("mail.smtp.socketFactory.port", 465);
        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.socketFactory.fallback", "false"); */
            
               
                try{
                    Class.forName("com.mysql.jdbc.Driver");
                     Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/BankingOnline?autoReconnect=true&useSSL=false","root","piyush123");
                    Statement st=con.createStatement();
                  Statement st2=con.createStatement();
                  Statement st5=con.createStatement();
                    ResultSet rs=st.executeQuery("select * from account where accountno='"+accountno+"'");
                     ResultSet rs3=st2.executeQuery("select * from account where userid='"+user+"'");
                    
                  
                   Statement st1=con.createStatement();
                  /*Session session1 = Session.getDefaultInstance(props, null);
                session1.setDebug(true);
                MimeMessage message = new MimeMessage(session1);
                message.setText("Your account is credited");
                message.setSubject("Password for your account");
                message.setFrom(new InternetAddress("agrawalpiyush2505@gmail.com"));
                message.addRecipient(RecipientType.TO, new InternetAddress(email));
                message.saveChanges();
                Transport transport = session1.getTransport("smtp");
                transport.connect("smtp.gmail.com", "agrawalpiyush2505@gmail.com", "passwordispiyush@01");
                transport.sendMessage(message, message.getAllRecipients());
                transport.close();
                */
            
                    
                    if(rs.next())
                    {
                       // String account=rs.getString("accountno");
                        //String accounttype=rs.getString("accounttype");
                        accountbalance1=rs.getInt("accountbalance");
                        accountbalance1+=accountb;
                        if(rs3.next()){
                        accountbalance2=rs3.getInt("accountbalance");
                        accountbalance2-=accountb;
                          int x1=st.executeUpdate("update account set accountbalance='"+accountbalance2+"'where userid='"+user+"'");
                        }
                    
                        int x=st1.executeUpdate("update account set accountbalance='"+accountbalance1+"'where accountno='"+accountno+"'");
                      
                        if(x==1)
                        {      %>
                          <button onclick="location.href='bank3.jsp';" >Home Page
                              <button onclick="location.href='ministatement.jsp';"></button>
                                
                          <%
                            //response.sendRedirect("ministatement.jsp");
                        }
                        else
                            out.println("cannot send money right now try after some time");
                        
                        //out.println(account+" , "+accounttype+" , "+accountbalance+"  ");
                    }
                    else
                    {
                        out.println("accountno:"+accountno+"does not exist try again");
                    }
                    
                }catch(Exception e)
                {
                    out.println(e);
                }
                                                %>
    </body>
</html>
