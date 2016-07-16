
<%@page import="Reservation.hotel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="connact.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Otel</title>
</head>
 <style>
        div.ex1 {
    direction: rtl;
}
</style>
<body>
    
    <%
   try{
   String user = request.getParameter("username"); 
  hotel hl = new hotel(); 
        ResultSet inf=hl.showhotelınf(user);
          
 
    while(inf.next()){
  %>
<br></br>
<font color="red">Otelin Adı</font>
<td><%=inf.getString("hotelname")%></td>
<br></br>
<font color="red">Otel Hakkındaki Bilgiler</font>
<td><%=inf.getString("hotelinfo")%></td>
<br></br>
<font color="red">Otelin Adresi</font>
<td><%=inf.getString("address")%></td>
<br></br>
<font color="red">Otelin Telefonu</font>
<td><%=inf.getString("hotelphone")%></td>
<br></br>
<font color="red">Otelin Masrafı</font>
<td><%=inf.getString("budget")%></td>

<%
}

}catch  (Exception ex){
    ex.printStackTrace();
}           
%>   

<br></br>
<div class="ex1"><strong><i>iyi tatiller dileriz</i></strong></div><font color="black"></font>
<br></br>
<div class="ex1"><strong><i>HOTEL RESERVATİON SYSTEM</i></strong></div><font color="black"></font>
</div>
</body>
</html>
