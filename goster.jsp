<%@page import="db.user"%>
<%@page import="Reservation.reservation"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="connact.jsp"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        
        <style>
        div.ex1 {
    direction: rtl;
}
</style>
          <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
     <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
    <link rel="stylesheet" href="style.css" type="text/css" />
    <title>Rezervasyon Yapma Sayfası</title>
</head>
<body>
 


<%
        String usernamee = (String)session.getAttribute("username");
        user u=new user(usernamee);
        String type = u.checkTypePages(usernamee);
        int check = Integer.parseInt(type); %>
       <% if(check != 3 || check ==-1){ %>
        <jsp:forward page="login.html"/>
        <% } 
        if(session.getAttribute("username") == null){
            response.sendRedirect("index.jsp");
        }

        String firstname = u.takeFirstname(usernamee);
 
reservation h = new reservation(); 
        ResultSet reservationTable=h.defineReservation();
          
                     
                        while(reservationTable.next())
                        {
                       %>

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
  </div>
       <div id="main">
<tr>
    <h2><i>Welcome To Hotel Reservation System</i></h2>
<br></br>
<font color="Blue">Rezervasyonunuz Yapıldı.İşlem Bilgilerinizi Aşağıda görebilirsiniz...</font>
<br></br>
<font color="Blue">Reservation ID</font>
<td><%=reservationTable.getString("reservationid")%></td>

<br></br>
<font color="Blue">Checkİn Date</font>
<td><%=reservationTable.getString("checkin")%></td>
<br></br>
<font color="Blue">Checkout Date</font>
<td><%=reservationTable.getString("checkout")%></td>
<br></br>
<font color="Blue">Your Message To Our Hotel</font>
<td><%=reservationTable.getString("usermessage")%></td>
<br></br>
<font color="Blue">Reservation Date</font>
<td><%=reservationTable.getString("reservationdate")%></td>
<br></br>
<font color="Blue">Mesajınız Tarafımıza iletilmiştir</font>


</tr>
<%
}
         
%>   
<br></br>
<div class="ex1"><strong><i>iyi tatiller dileriz</i></strong></div><font color="black"></font>
<br></br>
<div class="ex1"><strong><i>HOTEL RESERVATİON SYSTEM</i></strong></div><font color="black"></font>

</div>
 
<div id="footer">
    <p>&copy; 2016 Hotel Reservation </p>
  </div>
     </div>                                                       </body>
                                                            </html>
