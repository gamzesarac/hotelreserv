<%-- 
    Document   : search.jsp
    Created on : Jul 29, 2016, 4:20:26 PM
    Author     : ONuR
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="db.user"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String input = request.getParameter("input");
            String whichPage = request.getParameter("page");
            user u = new user();
            
            if(whichPage.equals("reservation"))
            {
                String message = u.searchResult(input);
                
                if(message.equals("notFound")) {
                    out.print("No reservation for this PNR");
                    out.print("</br>");
                    out.print("<a href='all-bookings.jsp'>Click Here for Go Back</a> ");
                }else
                {
                    response.sendRedirect("book-details.jsp?pnr="+message);
                }
                
                
            }
            
            if(whichPage.equals("hotel"))
            {
                String message = u.searchHotel(input);
                
                if(message.equals("notFound")) {
                    out.print("No hotel like this.");
                    out.print("</br>");
                    out.print("<a href='javascript:history.back()'>Click Here Go Back</a>");
                }else {
                    response.sendRedirect("hotel-profile.jsp?hotelid="+message);
                }
                
            }
        %>
        
    </body>
</html>
