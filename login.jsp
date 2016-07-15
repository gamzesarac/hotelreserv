<%@page import="db.user"%>
<%@page import="java.sql.*"%>
<%-- 
    Document   : login
    Created on : Jul 14, 2016, 3:41:51 PM
    Author     : ONuR
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
    </head>
    <body>
        
        <%
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            
            user u = new user();
            ResultSet rs  = u.userDetails(username, password);
        
            if(rs.getInt("usertype_id") == 1) {
            response.sendRedirect("Admin/index.jsp");
            session.setAttribute("firstname", rs.getString("firstname"));
            session.setAttribute("lastname", rs.getString("lastname"));
            session.setAttribute("username", username);
            }
            
            else if(rs.getInt("usertype_id") == 2) {
            response.sendRedirect("Hotel/hotel.jsp");
            session.setAttribute("firstname", rs.getString("firstname"));
            session.setAttribute("lastname", rs.getString("lastname"));
            session.setAttribute("username", username);
            }
            
            else if(rs.getInt("usertype_id") == 3) {
            response.sendRedirect("user.jsp");
            session.setAttribute("firstname", rs.getString("firstname"));
            session.setAttribute("lastname", rs.getString("lastname"));
            session.setAttribute("username", username);
            }
            
            else
            response.sendRedirect("error.html");
            
        %>
        
    </body>
</html>
