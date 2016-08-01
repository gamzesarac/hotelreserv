<%@page import="Reservation.hotel"%>
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
boolean check=false;
     String codem=request.getParameter("code");
hotel h = new hotel(); 
        ResultSet reservationTable=h.check(codem);
        boolean kontrol=h.checkDigit(codem);
          if(kontrol==false){
                     %><SCRIPT LANGUAGE='JavaScript'>
    window.alert('Not 10 Digit!')
     window.location.href='index.html'
    </SCRIPT>   
                    <%  }
          else{
                    while(reservationTable.next())
                        {
                       %>

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
<tr>
    <h2><i>Welcome To Hotel Reservation System</i></h2>
<br></br>
<font color="Blue">Rezervasyonunuz Yapıldı.İşlem Bilgilerinizi Aşağıda görebilirsiniz...</font>
<br></br>
<font color="Blue">Pnr Code</font>
<td><%=reservationTable.getString("pnr")%></td>

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
check=true;
}
          }
                         if(!check){
       %>
      
  <strong>  <font color="red">No Reservation!</font></strong>
       
       <%}
                         
         
%>   
<br></br>
<div class="ex1"><strong><i>Happy Vacation</i></strong></div><font color="black"></font>
<br></br>
<div class="ex1"><strong><i>HOTEL RESERVATİON SYSTEM</i></strong></div><font color="black"></font>

</div>
 
<div id="footer">
    <p>&copy; 2016 Hotel Reservation </p>
  </div>
     </div>                                                       </body>
                                                            </html>
