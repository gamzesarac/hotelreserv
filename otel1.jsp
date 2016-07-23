
<%@page import="db.user"%>
<%@page import="Reservation.hotel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="connact.jsp" %>
 
<!DOCTYPE html>
 <html lang="en"> 
    <head>
          <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
     <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
    <link rel="stylesheet" href="style.css" type="text/css" />
    <h1><i>Welcome To Hotel Reservation System</i></h1>
</head>

 <style>
  

    table, th, td {
    border: 1px solid black;
    border-collapse: collapse;
}


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
    <form action="reservationnocss.jsp" action="POST"> 
    <%
          String usernamee = (String)session.getAttribute("username");
        user u=new user(usernamee);
        String type = u.checkTypePages(usernamee);
        int checkk = Integer.parseInt(type); %>
       <% if(checkk != 3 || checkk ==-1){ %>
        <jsp:forward page="login.html"/>
        <% } 
        if(session.getAttribute("username") == null){
            response.sendRedirect("index.jsp");
        }

        String firstname = u.takeFirstname(usernamee);
  
   boolean check=false;
   boolean check1=false;
   try{
       
 String user = request.getParameter("hotelname");
 String hotelnamee= request.getParameter("hotelnamee");
  hotel hl = new hotel();

  int m=hl.takeHotelId(user);



  

        ResultSet inf=hl.showhotelınf(user);
   Connection connection=null;
             Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
             connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/hotelreservationdb2","root","melis");
             Statement statement=connection.createStatement();
             
             
        String command="SELECT AVG(rating) FROM usercomments AS u WHERE hotel_hotelid='"+m+"' AND isApproved=1";
       ResultSet resultSet= statement.executeQuery(command);
   
       
       ResultSet room=hl.takeRoom(m);
       ResultSet rS= hl.takeComments(m);
       
      Statement st2=connection.createStatement();
      String c="select imageaddress from hotelimage where hotel_hotelid='"+m+"'";
      ResultSet image= st2.executeQuery(c);
          
       
     %> <input type="hidden" name="hotelidd" value="<%=m%>"> <%
       
       
  
  
  %>
  

<font color="blue">Hotel images</font>
<td>
    <%
    if(image.next())
          {
              %>
              <img src="<%out.print(image.getString("imageaddress"));  %>" height="200" weight ="200" >
              <%
          }
    
    %>
    

  
         
    

   <%
   }catch  (Exception ex){
    ex.printStackTrace();
}           
%>   
<br></br>
<br></br>
<% if(check1){ %>
<input type="submit" name="submit" value="MakeReservation" />
 <% } %>
<br></br>
<div class="ex1"><strong><i>iyi tatiller dileriz</i></strong></div><font color="black"></font>
<br></br>
<div class="ex1"><strong><i>HOTEL RESERVATİON SYSTEM</i></strong></div><font color="black"></font>


 
</form>
</div>

 

 
<div id="footer">
    <p>&copy; 2016 Hotel Reservation </p>
  </div>
</div>
    </body>
</html>
