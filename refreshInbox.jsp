<%@page import="db.user"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<html>
<head>
<title>Admin Panel | Hotel Profile Page</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
<!-- Custom CSS -->
<link href="css/style.css" rel='stylesheet' type='text/css' />
<!-- font CSS -->
<link rel="icon" href="favicon.ico" type="image/x-icon" >
<!-- font-awesome icons -->
<link href="css/font-awesome.css" rel="stylesheet"> 
<!-- //font-awesome icons -->


<!-- Metis Menu -->
<link href="css/custom.css" rel="stylesheet">
<!--//Metis Menu -->
</head> 
<% 
    String username = (String)session.getAttribute("username");

    user u=new user();
    int adminid = u.takeUserId(username);
    
    boolean isSuccess = u.deleteMessagePermanent();
            if (isSuccess) {%>    
                <% response.sendRedirect("index.jsp"); %>
            <% } else {%>
                <jsp:forward page="messageSendError.jsp"/>
            <% }
        

    %>
</html>