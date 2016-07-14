<%@page import="db.user"%>
<!DOCTYPE html>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<head>
<title>User Page</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="stylesheet" href="../style.css" type="text/css" />
</head>
<body>

 <%
        String username = (String)session.getAttribute("username");
        String firstname = session.getAttribute("firstname").toString();
        String lastname = session.getAttribute("lastname").toString();
        
        
   
    %>
<div id="container">
  <ul id="nav">
    <li><a href="contact.jsp" title="contact">contact</a></li>
    <li><a href="logout.jsp" title="logout">logout</a></li>
  </ul>
      <div class="divider"></div>
  <div id="header">
      <h1><a href="hotel.jsp">Hotel Reservation</a><span>Isik University</span></h1>
  </div>
       <div class="divider"></div>
  <div id="sidebar">
    <h4 style="color: #014ccc; font-style: italic;">Welcome : <%= firstname + " " + lastname %> </h4>
    <fieldset>
     <a href="inbox.jsp">Messages()</a>
     
    </fieldset>
  </div>
       <div id="main">
        <h2 style="font-family: monospace; font-weight: bold; font-size: 250%; ">Personal Homepage</h2>
        <p><a style="font-size: 140%; color: black"> Welcome to your personal page.</a></p>
        
       

        <h3><a href="registerhotel.jsp" style="color:#014ccc">Add Hotel</a></h3>
        <h3><a href="myHotels.jsp" style="color:#014ccc">My Hotels</a></h3>
       
    </div>
    
   


<div id="footer">
    <p>&copy; 2016 Hotel Reservation </p>
  </div>
 </div>
</body>
</html>

