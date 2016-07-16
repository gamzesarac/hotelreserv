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
        <title>Reject Comment</title>
    </head>
    <body>
        <%
            String commentid= request.getParameter("comment_id");
            String message;
            user usr = new user();
            message = usr.commentReject(commentid);
            
            out.print(message);
            
            String redirectURL = "../Admin/comment-waiting-approval.jsp";
            response.sendRedirect(redirectURL);
        %>
        
    </body>
</html>
