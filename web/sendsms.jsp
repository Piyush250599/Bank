<%-- 
    Document   : sendsms
    Created on : 14 Feb, 2020, 7:49:49 PM
    Author     : piyush
--%>
<%@page import="java.io.BufferedReader"%>
<%@page import ="java.io.IOException" %>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.net.URL"%>
<%@page import="java.net.URLConnection"%>
<%@page import=" java.net.URLEncoder"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String phone=(String)session.getAttribute("mobileno");
            String textmessage="Your account has benn credited";
          //  String phone=request.getParameter("phone");
            String authkey = "130txy7WyB5820xxx82d3";
            //Multiple mobiles numbers separated by comma
            String mobiles = phone;
            //Sender ID,While using route4 sender id should be 6 characters long.
            String senderId = "ABCDEF";
            //Your message to send, Add URL encoding here.
            String message = textmessage;
            //define route
            String route="4";
            //Prepare Url
            URLConnection myURLConnection=null;
            URL myURL=null;
            BufferedReader reader=null;
            //encoding message
            String encoded_message=URLEncoder.encode(message);
            String mainUrl="http://malussms.com/api/sendhttp.php?";//Your sms gateway provider API
            //Prepare parameter string
            StringBuilder sbPostData= new StringBuilder(mainUrl);
            sbPostData.append("authkey="+authkey);
            sbPostData.append("&mobiles="+mobiles);
            sbPostData.append("&message="+encoded_message);
            sbPostData.append("&route="+route);
            sbPostData.append("&sender="+senderId);
            //final string
            mainUrl = sbPostData.toString();
            try
            {
            //prepare connection
            myURL = new URL(mainUrl);
            myURLConnection = myURL.openConnection();
            myURLConnection.connect();
            reader= new BufferedReader(new InputStreamReader(myURLConnection.getInputStream()));
            String success="Your message sent sucessfully";
            out.println(success);
            //finally close connection
            reader.close();
            %>
            <button onclick="location.href='bank3.jsp';">
            <%
            }
            catch (IOException e)
            {
            e.printStackTrace();
            }

                 %>
    </body>
</html>
