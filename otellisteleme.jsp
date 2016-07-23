<%@page import="db.user"%> 
<%@page import="java.text.DateFormat"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>  
<%@page import="Reservation.reservation"%>
<%@page import="Reservation.hotel"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="connact.jsp" %>
    <%@page import="java.text.SimpleDateFormat" %>  
  <html lang="en">  
    
    
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
     <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
    <link rel="stylesheet" href="style.css" type="text/css" />
</head>
    <style>
        table, th, td {
    border: 1px solid black;
    border-collapse: collapse;
}
th, td {
    padding: 5px;
    text-align: left;
}
        table#t012{
    width: 100%;
    background-color: #f1f1c1;
}
        table {
            width:100%;
        }
        table, th, td {
            border: 1px solid black;
            border-collapse: collapse;
        }
        th, td {
            padding: 5px;
            text-align: left;
        }
        table#t01 tr:nth-child(even) {
            background-color: #eee;
        }
        table#t01 tr:nth-child(odd) {
            background-color:#fff;
        }
        table#t01 th {
            background-color: black;
            color: white;
        }
        div.ex1 {
            direction: rtl;



    </style>
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

       <form action="otel.jsp" action="post"> 

 
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

    try{
         
 boolean mel=true;
         Connection connection=null;
             Class.forName("com.mysql.jdbc.Driver");
             connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/hotelreservationdb","root","");
             Statement statement=connection.createStatement();
             
        
   String value=request.getParameter("search");
    String cdate=request.getParameter("datepicker");
    String cotdate=request.getParameter("datepicker1");  
     hotel h=new hotel();
     reservation r =new reservation();
     ResultSet idotellist=h.idHotelList(value);
     ResultSet otellist=h.defineHotelList(value);

            DateFormat s = new SimpleDateFormat("MM/dd/yyyy");
            Date startDate1 = s.parse(cdate); 
            Date endDate1 = s.parse(cotdate); 
   boolean succ=r.datetodate(startDate1, endDate1);
  
        
     
            if(succ==false ){ 
  
            
              
   //String redirectURL = "oda.jsp";
 //response.sendRedirect(redirectURL);}
        %> <SCRIPT LANGUAGE='JavaScript'>
    window.alert('Checkin Tarihiniz CheckOut Tarihinizden Önce Seçilmiş.Lütfen Değiştiriniz!')
     window.location.href='search.jsp'
    </SCRIPT>   
        
   <%} 
        
  %>
   <h2><i>Welcome To Hotel Reservation System</i></h2>
    <table id="t01">
  <tr>
     
    <th>Hotel images</th>
   <th>Hotel Name</th>
   <th>Hotel Adress</th>
   <th>Hotel City</th>
   <th>Hotel State</th>
    <th>Hotel Rate</th>
   
  </tr>
<%
        
    while(otellist.next()){

 %>   

       <tr>
        <td>  <% String m=otellist.getString("hotelid");
        int otelid=Integer.parseInt(m);
        out.println(otelid);
        Statement st2=connection.createStatement();
      String c="select imageaddress from hotelimage where hotel_hotelid='"+otelid+"'";
      ResultSet image= st2.executeQuery(c);
                
          while(image.next()) { %>
              
              <img src="<%out.print(image.getString("imageaddress"));  %>" height="75" weight ="75" >
             
 <%  break;} %>
        
        
        
        
        
        
        </td>
        <td><a href="otel.jsp?hotelname=<%=otellist.getString("hotelname")%>"><%=otellist.getString("hotelname")%></a></td>
        
        <td> <%=otellist.getString("address")%></td>
        <td> <%=otellist.getString("CITY_NAME")%></td>
        <td> <%=otellist.getString("STATE_NAME")%></td>
        
        <td><%int sa=otellist.getInt("hotelid");
        
              ResultSet resultSet= h.AverageRate(sa);
 while(resultSet.next()){
     out.println(resultSet.getDouble("AVG(rating)"));
 }
 
        
        %></td>
      
       
       </tr>
         
           <%
  
mel=false;
    }%>
    </table> <%
    if(mel){
        %>
        <SCRIPT LANGUAGE='JavaScript'>
    window.alert('SYSTEM HAVENT GOT A HOTEL LIKE THAT!')
     window.location.href='search.jsp'
    </SCRIPT>   
      
   <% }
   
             
  
    }catch(Exception ex){
        out.println(ex);
    }
 %>


 </form>
   


 </div> 

 
<div id="footer">
    <p>&copy; 2016 Hotel Reservation </p>
  </div>
 </div>
</body>
</html>
