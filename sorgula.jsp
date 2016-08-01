<%-- 
    Document   : sorgula
    Created on : 28.Tem.2016, 18:47:43
    Author     : asus1
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    
    
    <head>
        
     <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
    <link rel="stylesheet" href="style.css" type="text/css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
</head>
<body>
        <div id="containerr">
  <ul id="nav">
    <li><a href="contact.html" title="contact">contact</a></li>
    <li><a href="register.html" title="let">register</a></li>
    <li><a href="login.html" title="contact">login</a></li>
  </ul>
      <div class="divider"></div>
  <div id="header">
      <h1><a href="index.html">Hotel Reservation</a><span>Isik University</span></h1>
  </div>
       <div class="divider"></div>
  <div id="sidebar">   
  </div>
       <div id="main">
     <form action="sorgucevap.jsp" action="POST"> 
    <h1>Search Reservation!</h1>
    Write Your Pnr Code
    <br></br>
<input type="text" name="code" required>
  <br></br>
   <input type="submit" name="submit" value="Checking" />
     </form>
           </div>
 
<div id="footer">
    <p>&copy; 2016 Hotel Reservation </p>
  </div>
     </div>    
</body>
</html>
