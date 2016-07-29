
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
          

            user u = new user();
            String approval=request.getParameter("approval");
            String commentid=request.getParameter("cid");            
            int cid = Integer.parseInt(commentid);            
            if(approval.equals("Approve")){
            boolean isSuccess = u.commentAcceptHotel(cid);
            if(isSuccess){
               %> <SCRIPT LANGUAGE='JavaScript'>
    window.alert('Comment Accepted!')
     window.location.href='commentsForHotel.jsp'
    </SCRIPT>     <% 
            }
        else{%> <SCRIPT LANGUAGE='JavaScript'>
    window.alert('Comment Did Not Accepted!')
     window.location.href='commentsForHotel.jsp'
    </SCRIPT>     <%

        }
            }
            
            if(approval.equals("Reject")){
            boolean isSuccess = u.commentRejectHotel(cid);
            if(isSuccess){
               %> <SCRIPT LANGUAGE='JavaScript'>
    window.alert('Comment Rejected!')
     window.location.href='commentsForHotel.jsp'
    </SCRIPT>     <% 
            }
            else{%> <SCRIPT LANGUAGE='JavaScript'>
    window.alert('Comment Did Not Rejected!')
     window.location.href='commentsForHotel.jsp'
    </SCRIPT>     <%

        }
            }


    %>
</body>
</html>