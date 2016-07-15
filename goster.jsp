<%@page import="Reservation.reservation"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="connact.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <style>
        div.ex1 {
    direction: rtl;
}
</style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Rezervasyon Yapma Sayfası</title>
</head>
<body>
 


<%
reservation h = new reservation(); 
        ResultSet reservationTable=h.defineReservation();
          
                     
                        while(reservationTable.next())
                        {
                       %>


<tr>
<br></br>
<font color="Red">Rezervasyonunuz Yapıldı.İşlem Bilgilerinizi Aşağıda görebilirsiniz...</font>
<br></br>
<font color="red">Rezervasyonunuz Numaranız</font>
<td><%=reservationTable.getString("reservationid")%></td>

<br></br>
<font color="red">Otelimize giriş yapacağınız zaman</font>
<td><%=reservationTable.getString("checkin")%></td>
<br></br>
<font color="red">Otelimizden çıkış yapacağınız zaman</font>
<td><%=reservationTable.getString("checkout")%></td>
<br></br>
<font color="red">Otelimize Mesajınız</font>
<td><%=reservationTable.getString("usermessage")%></td>
<br></br>

<font color="red">Mesajınız Tarafımıza iletilmiştir</font>


</tr>
<%
}
         
%>   
<br></br>
<div class="ex1"><strong><i>iyi tatiller dileriz</i></strong></div><font color="black"></font>
<br></br>
<div class="ex1"><strong><i>HOTEL RESERVATİON SYSTEM</i></strong></div><font color="black"></font>

</body>
</html>
