<%@page import="db.user"%> 
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
if(session.getAttribute("username") == null){
        response.sendRedirect("../login.html");
    }
%>
<html>
    
<head>
<title>Inbox</title>

</head> 
<% 
    String username = (String)session.getAttribute("username");
    String hotelidd = request.getParameter("hid");
    
    user u=new user();
    
    String messageidd = request.getParameter("messageidd");
    int messageid = Integer.parseInt(messageidd);
    System.out.println();
    
    boolean isSuccess = u.deleteMessage(messageid);
            if (isSuccess) {%>    
                <% response.sendRedirect("inbox.jsp"); %>
            <% } else {%>
                <jsp:forward page="messageSendError.jsp"/>
            <% }
        

    %>
</html>