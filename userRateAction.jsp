
<%@page import="db.hotelroom"%>
<%@page import="db.reservation"%>
<%@page import="java.util.Date"%>
<%@page import="db.user"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Rate Hotel</title>
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
       
        String submit = request.getParameter("Send");
        String comment = request.getParameter("text");
        int rating = Integer.parseInt(request.getParameter("rate"));
        hotelroom h=new hotelroom();
        int reservid = Integer.parseInt(request.getParameter("rid2"));
        int roomid = Integer.parseInt(request.getParameter("roomid"));
        int hotelid = h.takeHotelId(roomid);
        if (submit.equals("Send")) {

           int userid = u.takeUserId(username);
           int rid2 = Integer.parseInt(request.getParameter("rid2"));
            reservation r = new reservation();
            boolean isSuccess = r.addComment(hotelid, userid, comment, rating, reservid);
            if (isSuccess) {%>
                <jsp:forward page="user.jsp"/>
            <% } else {%>
                <jsp:forward page="user.jsp"/>
            <% }
        }
    %>
</body>
</html>

