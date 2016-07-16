


<%@page import="Reservation.hotel"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="connact.jsp" %>
    <%@page import="java.text.SimpleDateFormat" %>  
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
</head>
<body>
       <form action="otel.jsp" action="post"> 
    <style>
        table, th, td {
    border: 1px solid black;
    border-collapse: collapse;
}
th, td {
    padding: 5px;
    text-align: left;
}
        table#t01 {
    width: 100%;
    background-color: #f1f1c1;
}

    </style>
 
    <%
    try{
   String value=request.getParameter("search");;
 
   hotel h=new hotel();
   ResultSet otellist=h.defineHotelList(value);
  %>
    <table id="t01">
  <tr>
    
   <th>Otelin Adı</th>
   <th>Otelin Bulunduğu İl</th>
   <th>Otelin Bulunduğu İlce</th>
   <th>Otelinizi Seciniz</th>
  </tr>
<%
    while(otellist.next()){
  if(otellist.next()){
 %>    

       <tr>
        <td> <%=otellist.getString("hotelname")%></td>
        <td><%=otellist.getString("CITY_NAME")%> </td>
        <td>  <%=otellist.getString("STATE_NAME")%></td>
         <td> <input type="hidden" name="username" value="<%=otellist.getString("hotelid")%>" /> 
               <input id="button" type="submit" value="Sec" >
</td>
       </tr>
         
           <%
        
  } 
   
   
     else{
     out.println("Sistemimizde böyle bir otel bulunmamaktadır");
              
              }
   
   }
  
    }catch(Exception ex){
        out.println(ex);
    }
 %>


 </form>
</body>
</html>
