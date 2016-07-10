
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
   Connection connection = null;
   Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
   connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/hotelreservationdb", "root", "");
   Statement st=conn.createStatement();
   ResultSet rs = st.executeQuery("SELECT * FROM hotel WHERE hotelid='"+user+"'" );
    while(rs.next()){
  %>
<br></br>
<font color="red">Otelin Adı</font>
<td><%=rs.getString("hotelname")%></td>
<br></br>
<font color="red">Otel Hakkındaki Bilgiler</font>
<td><%=rs.getString("hotelinfo")%></td>
<br></br>
<font color="red">Otelin Adresi</font>
<td><%=rs.getString("address")%></td>
<br></br>
<font color="red">Otelin Telefonu</font>
<td><%=rs.getString("hotelphone")%></td>
<br></br>
<font color="red">Otelin Masrafı</font>
<td><%=rs.getString("budget")%></td>

<%
}
connection.close();
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
