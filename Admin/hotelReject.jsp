<%-- 
    Document   : hotelReject
    Created on : Jun 25, 2016, 4:08:28 PM
    Author     : ONuR
--%>
<%@page import="Bean.user"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reject Hotel</title>
    </head>
    <body>
        <%
            String hotelid= request.getParameter("hotel_id");
            String message;
            user usr = new user();
            message = usr.hotelReject(hotelid);
            
            out.print(message);
            
            String redirectURL = "../Admin/hotel-waiting-aproval.jsp";
            response.sendRedirect(redirectURL);
        %>
        
    </body>
</html>
