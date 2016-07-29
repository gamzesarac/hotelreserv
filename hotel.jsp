<%@page import="db.user"%>
<!DOCTYPE html>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<head>
<title>Hotel Page</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="stylesheet" href="../style.css" type="text/css" />
</head>
<body>

 <%
        String username = (String)session.getAttribute("username");
        String firstname = session.getAttribute("firstname").toString();
        String lastname = session.getAttribute("lastname").toString();
        user u=new user(username);
        String type = u.checkTypePages(username);
        int check = Integer.parseInt(type); %>
       <% if(check != 2 || check ==-1){ %>
        <jsp:forward page="loginError_1.html"/>
        <% } 
        if(session.getAttribute("username") == null){
            response.sendRedirect("index.html");
        }        
        
        int userid = u.takeUserId(username);
        int count = u.messageNotify(userid);
        
    %>
<div id="containerr">
  <ul id="nav">
    <li><a href="contact.jsp" title="contact">contact</a></li>
    <li><a href="../logout.jsp" title="logout">logout</a></li>
  </ul>
      <div class="divider"></div>
  <div id="header">
      <h1><a href="hotel.jsp">Hotel Reservation</a><span>Isik University</span></h1>
  </div>
       <div class="divider"></div>
  <div id="sidebar">
    <h4 style="color: #014ccc; font-style: italic;">Welcome : <%= firstname + " " + lastname %> </h4>
    <fieldset>
        <h3><a href="inbox.jsp">Messages(<%=count%>)</a></h3>
     
    </fieldset>
  </div>
       <div id="main">
        <h2 style="font-family: monospace; font-weight: bold; font-size: 250%; ">Hotel Homepage</h2>
        <p><a style="font-size: 140%; color: black"> Welcome to hotels page.</a></p>
        
       

        <h3><a href="registerhotel.jsp" style="color:#014ccc">Add Hotel</a></h3>
        <h3><a href="myHotels.jsp" style="color:#014ccc">My Hotels</a>&nbsp; &nbsp; <a href="#" data-toggle="tooltip" title="Otelinize henüz oda eklemediyseniz lütfen buradan ekleyin.">?</a></h3>
        <h3><a href="myHotels2.jsp" style="color:#014ccc">Add New Rooms</a> &nbsp; &nbsp; <a href="#" data-toggle="tooltip" title="Mevcut otelinizine yeni odalar ekleyin. Fiyatlar ve özellikleri de bu seçenek ile güncelleyebilirsiniz.">?</a></h3>
        <h3><a href="myHotels3.jsp" style="color:#014ccc">Delete Hotel</a></h3>
        <h3><a href="incomingReservations.jsp" style="color:#014ccc">Incoming Reservations</a></h3>
        <h3><a href="commentsForHotel.jsp" style="color:#014ccc">Approve/Reject Comments</a></h3>
    </div>
    
   


<div id="footer">
    <p>&copy; 2016 Hotel Reservation </p>
  </div>
 </div>
</body>
</html>

