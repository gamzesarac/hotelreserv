<%-- 
    Document   : hotelApprove
    Created on : Jun 25, 2016, 4:08:21 PM
    Author     : ONuR
--%>
<%@page import="db.user"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Hotel Approved</title>
    </head>
    <body>
        <%
            String hotelid= request.getParameter("hotel_id");
            int message;
            user usr = new user();
            usr.hotelApprove(hotelid);
            
            String redirectURL = "../Admin/hotel-waiting-aproval.jsp";
            response.sendRedirect(redirectURL);
        %>
        
        
    </body>
</html>
