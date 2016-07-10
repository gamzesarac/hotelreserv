


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
   Connection connection = null;
   Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
   connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/hotelreservationdb", "root", "melis");
   Statement st=conn.createStatement();
   ResultSet rs = st.executeQuery("SELECT hotelid,hotelname,STATE_NAME,CITY_NAME  FROM hotel AS h  JOIN state AS s ON h.STATE_ID = s.STATE_ID JOIN city AS c  ON s.CITY_ID = c.CITY_ID WHERE hotelname='"+value+"' OR STATE_NAME='"+value+"' OR CITY_NAME='"+value+"'");
  %>
    <table id="t01">
  <tr>
    
   <th>Otelin Adı</th>
   <th>Otelin Bulunduğu İl</th>
   <th>Otelin Bulunduğu İlce</th>
   <th>Otelinizi Seciniz</th>
  </tr>
<%
    while(rs.next()){
  if(rs.next()){
 %>    

       <tr>
        <td> <%=rs.getString("hotelname")%></td>
        <td><%=rs.getString("CITY_NAME")%> </td>
        <td>  <%=rs.getString("STATE_NAME")%></td>
         <td> <input type="hidden" name="username" value="<%=rs.getString("hotelid")%>" /> 
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
