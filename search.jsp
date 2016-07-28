<%-- 
    Document   : search.jsp
    Created on : 08.Tem.2016, 18:05:33
    Author     : asus1
--%>

<%@page import="db.user"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    
<html>
    <head>
    <title>TODO supply a title</title>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
    <link rel="stylesheet" href="style.css" type="text/css" />

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
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
      <a href="user.jsp"><h4 style="color: #014ccc; font-style: italic;"> </h4></a>
      </div>
        <div id="main">
            <h2 style="font-family: monospace; font-weight: bold; font-size: 200%;">Search</h2>
   <form action="otellisteleme.jsp" action="post"> 
<div>Catch Best Opportunities</div>
<br/><br/>
Whoever you are , whatever you call or looking for, everything starts here.
<br/><br/>
Hotel Name,City,State
 <br/><br/>
Location: <input type="text" name="search" size="55" value="" required><br>
 
 
   <br/><br/>  
  <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script>
  $(function() {
    $( "#datepicker" ).datepicker({minDate:0});
  });
  </script>
      <font color="blue">  <p>Check-in Date: <input type="text" id="datepicker" name="datepicker" required></font></p>
<br/><br/> 

<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script>
  $(function() {
    $( "#datepicker1" ).datepicker({minDate:0});
  });
  </script>
      <font color="blue">  <p>Check-out Date: <input type="text" id="datepicker1"  name="datepicker1" required></font></p>
<br/><br/> 


   
 <input type="submit" name="submit" value="ARA" />
 </form>
  </div>

<div id="footer">
    <p>&copy; 2016 Hotel Reservation </p>
  </div>
    </div>

</body>
</html>

