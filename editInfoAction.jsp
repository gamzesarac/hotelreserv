
<%@page import="java.util.Date"%>
<%@page import="db.user"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Edit Information Page</title>
</head>
<body>
    <%
        String username = (String)session.getAttribute("username");
        user u=new user(username);
        String type = u.checkTypePages(username);
        int check = Integer.parseInt(type); %>
       <% if(check != 3 || check ==-1){ %>
        <jsp:forward page="login.html"/>
        <% } 
        if(session.getAttribute("username") == null){
        response.sendRedirect("index.jsp");
        }
       
        String submit = request.getParameter("Apply");

        if (submit.equals("Apply")) {

            String firstname = request.getParameter("firstname");
            String lastname = request.getParameter("lastname");
            String password = request.getParameter("password");
            String birthdate = request.getParameter("birthdate");
            String telephone = request.getParameter("telephone");
            String email = request.getParameter("email");
            String ssn = request.getParameter("ssn");
            String address = request.getParameter("address");
            
            
            boolean isSuccess = u.editUser(username,password,firstname,lastname,email,birthdate,telephone,ssn,address);
            if (isSuccess) {%>
                <jsp:forward page="editInfoSuccess.html"/>
            <% } else {%>
                <jsp:forward page="editInfoError.html"/>
            <% }
        }
    %>
</body>
</html>

