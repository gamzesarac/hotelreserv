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
try{
         Class.forName("com.mysql.jdbc.Driver");
           Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hotelreservationdb", "root", "");
           Statement st=con.createStatement();
           
                String q="SELECT * FROM reservation ORDER BY reservationid DESC LIMIT 1";
                ResultSet rs=st.executeQuery(q);
                while(rs.next()){

%>
<tr>
<br></br>
<font color="Red">Rezervasyonunuz Yapıldı.İşlem Bilgilerinizi Aşağıda görebilirsiniz...</font>
<br></br>
<font color="red">Rezervasyonunuz Numaranız</font>
<td><%=rs.getString("reservationid")%></td>

<br></br>
<font color="red">Oda numaranız</font>
<td><%=rs.getString("roomid")%></td>
<br></br>
<font color="red">Otelimize giriş yapacağınız zaman</font>
<td><%=rs.getString("checkin")%></td>
<br></br>
<font color="red">Otelimizden çıkış yapacağınız zaman</font>
<td><%=rs.getString("checkout")%></td>
<br></br>
<font color="red">Otelimize Mesajınız</font>
<td><%=rs.getString("usermessage")%></td>
<br></br>

<font color="red">Mesajınız Tarafımıza iletilmiştir</font>


</tr>
<%
}
con.close();
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
