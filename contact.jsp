<%@page import="db.user"%>
<!DOCTYPE html>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<head>
<title>User Page</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="stylesheet" href="style.css" type="text/css" />
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

        String firstname = u.takeFirstname(username);


   
    %>
<div id="containerr">
  <ul id="nav">
    <li><a href="contact.jsp" title="contact">contact</a></li>
    <li><a href="logout.jsp" title="logout">logout</a></li>
  </ul>
      <div class="divider"></div>
  <div id="header">
      <h1><a href="user.jsp">Hotel Reservation</a><span>Isik University</span></h1>
  </div>
       <div class="divider"></div>
  <div id="sidebar">
    <a href="user.jsp"><h4 style="color: #014ccc; font-style: italic;">Welcome : <%= firstname %> </h4></a>
  </div>
       <div id="main">
        <h2 style="font-family: monospace; font-weight: bold; font-size: 250%; ">Communicate Information</h2>
        <h3><a style="font-size: 140%; color: black"> Yağız ŞENER</a></h3>
        <p><a href="mailto:yagiz.sener@isik.edu.tr" title="Click to send an e-mail to Yağız!">yagiz.sener@isik.edu.tr</a></p>	
        <p><font size="1">Access Level: Admin</font></p>
        <hr>
        <h3><a style="font-size: 140%; color: black"> Melis DELIPINAR</a></h3>
        <p><a href="mailto:melis.delipinar@isik.edu.tr" title="Click to send an e-mail to Melis!">melis.delipinar@isik.edu.tr</a></p>	
        <p><font size="1">Access Level: Admin</font></p>
        <hr>
        <h3><a style="font-size: 140%; color: black"> Onur CIMŞIT</a></h3>
        <p><a href="mailto:onur.cimsit@isik.edu.tr" title="Click to send an e-mail to Onur!">onur.cimsit@isik.edu.tr</a></p>	
        <p><font size="1">Access Level: Admin</font></p>
        <hr>        
        <h3><a style="font-size: 140%; color: black"> Orhun BUYUKAYDIN</a></h3>
        <p><a href="mailto:orhun.buyukaydin@isik.edu.tr" title="Click to send an e-mail to Orhun!">orhun.buyukaydin@isik.edu.tr</a></p>	
        <p><font size="1">Access Level: Admin</font></p>
        <hr>
        
        <h3>Address</h3>
                <p>
                <b>Şile Kampüsü</b><br>
                Işık Üniversitesi 34980 Şile/İstanbul
                <br></br>
                Telefon	:0 216 712 14 60<br>
                Faks    :0 216 710 28 73<br>
                E-Posta	:<a href="mailto:info@isikun.edu.tr">info@isikun.edu.tr</a></p>
                <br/>
                <p>
                <b>Maslak Kampüsü</b><br>
                Işık Üniversitesi Büyükdere Caddesi No: 194 34398 Maslak/İstanbul
                <br></br>
                Telefon	:0 212 286 49 11<br>
                Faks    :0 212 286 57 96<br>
                E-Posta	:<a href="mailto:info@isikun.edu.tr">info@isikun.edu.tr</a></p>
        
    </div>
    
   


<div id="footer">
    <p>&copy; 2016 Hotel Reservation </p>
  </div>
 </div>
</body>
</html>

