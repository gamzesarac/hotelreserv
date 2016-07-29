
<%@page import="db.hotel"%>
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
        String delete = request.getParameter("delete");   

        if (delete.equals("Delete")) {

            user u=new user();
            String hotid= request.getParameter("hotelID");
            int hotelid= Integer.parseInt(hotid);
            hotel h = new hotel();
            
            boolean isSuccess = h.deleteHotel(hotelid); 
            
        if (isSuccess) { 
        %> <SCRIPT LANGUAGE='JavaScript'>
    window.alert('Your hotel is deleted Successfully!!')
     window.location.href='myHotels3.jsp'
    </SCRIPT> <%
             } else { %>
                <SCRIPT LANGUAGE='JavaScript'>
    window.alert('Your hotel could NOT deleted!!')
     window.location.href='myHotels3.jsp'
    </SCRIPT> <%
                
             }
        }
    %>
</body>
</html>