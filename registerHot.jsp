
<%@page import="java.util.Date"%>
<%@page import="db.user"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>




<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Register Hotel Page</title>
</head>
<body>
    <%
        String submit = request.getParameter("Register");   

        if (submit.equals("Register")) {
            String firstname=request.getParameter("firstname");
            String lastname=request.getParameter("lastname");
            String username=request.getParameter("username");
            String password=request.getParameter("password");
            String gender=request.getParameter("gender");
            String birthdate=request.getParameter("bdate");
            String telephone=request.getParameter("telephone");
            String email=request.getParameter("email");
            String address=request.getParameter("address");
            String ssn=request.getParameter("ssn");
            int type=2;
            user u=new user(username,firstname,lastname,password,birthdate,email,gender,telephone,type,address,ssn);

            boolean isSuccess = u.addUser(); 
            
        if (isSuccess) { 
            session.setAttribute("username", request.getParameter("username"));
            session.setAttribute("firstname", firstname);
            session.setAttribute("lastname", lastname);
                response.sendRedirect("hotel.jsp");
             } else {
                response.sendRedirect("registerError.html");
                
             }
        }
    %>
</body>
</html>