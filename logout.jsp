<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Logout</title>
</head>
<body>
    <%
    if(session.getAttribute("username") == null){
        response.sendRedirect("index.jsp");
    }
    session.invalidate();        
    %>
    <jsp:forward page="index.jsp"/>
</body>
</html>
