<%@page import="db.user"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Login Page</title>
</head>
<body> 
    <%
        String submit = request.getParameter("Login");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        user u=new user(username,password);
        String usertype = u.checkType(username, password);
        int check = Integer.parseInt(usertype);
        
    %>        
    <%  if( check == 1 ) {
            if( u.checkAdmin(username,password) ){
                session.setAttribute("username", username);
                response.sendRedirect("admin.jsp");
            } else {
                response.sendRedirect("loginError.html");
            }
        } else if ( check == 2 ) {
            if( u.checkRegistered(username,password) ){
                session.setAttribute("username", username);
                response.sendRedirect("user.jsp");
            } else {
                response.sendRedirect("loginError.html");
            }
        } else if ( check == -1)            
             response.sendRedirect("loginError.html");           
         else {
            response.sendRedirect("loginError.html");
        }%>        
</body>
</html>
