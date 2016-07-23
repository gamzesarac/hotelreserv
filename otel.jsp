
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
        String lastname = u.takeLastname(usernamee);
        session.setAttribute("firstname", firstname); 
        session.setAttribute("lastname", lastname); 
        session.setAttribute("username", usernamee); 

   boolean check=false;
   boolean check1=false;
   try{
       
 String user = request.getParameter("hotelname");
 String hotelnamee= request.getParameter("hotelnamee");
  hotel hl = new hotel();

  int m=hl.takeHotelId(user);



  

        ResultSet inf=hl.showhotelınf(user);
   Connection connection=null;
             Class.forName("com.mysql.jdbc.Driver");
             connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/hotelreservationdb","root","");
             Statement statement=connection.createStatement();
             
             
        String command="SELECT AVG(rating) FROM usercomments AS u WHERE hotel_hotelid='"+m+"' AND isApproved=1";
       ResultSet resultSet= statement.executeQuery(command);
   
       
       ResultSet room=hl.takeRoom(m);
       ResultSet rS= hl.takeComments(m);
       
    

     Statement st2=connection.createStatement();
      String c="select imageaddress from hotelimage where hotel_hotelid='"+m+"'";
      ResultSet image= st2.executeQuery(c);
          
       
     %> <input type="hidden" name="hotelidd" value="<%=m%>"> <%
       
         while(resultSet.next()){
  
    while(inf.next()){

  %>
  
<br></br>
<font color="blue">Hotel Name</font>
<td><%=inf.getString("hotelname")%></td>
<br></br>
<font color="blue">Hotel Information</font>
<td><%=inf.getString("hotelinfo")%></td>
<br></br>
<font color="blue">Hotel Adress</font>
<td><%=inf.getString("address")%></td>
<br></br>
<font color="blue">Hotel Telephone</font>
<td><%=inf.getString("hotelphone")%></td>
<br></br>
<font color="blue">Hotel Rate</font>
<td><%=resultSet.getInt("AVG(rating)")%></td>
<br></br>
<font color="blue">Hotel images</font>

<td><%
 while(image.next())
          { %>
              
              <img src="<%out.print(image.getString("imageaddress"));  %>" height="100" weight ="100" >
             
 <%  } %>
   </td>
  <br></br>

    <table style="width:70%">
<tr>
    <th><font color="blue">Who said</font></th>
    <th><font color="blue">Hotel Comments</font></th>
  </tr>
<%
    
    while(rS.next()){
        
  
 %>   
<tr>
   <!-- <td> /*
        ResultSet suserıdcomment=hl.userıdcomment(m);
 while(suserıdcomment.next()){
  int  commentuserid= suserıdcomment.getInt("user_id");
 

ResultSet comentusername=hl.takeusername(commentuserid);
 while(comentusername.next()){
     out.println(comentusername.getString("username")); 
       
 }
 }
                
                
        
 */ <td>  -->
 <td>  <%
        String s=rS.getString("user_id");
        int id=Integer.parseInt(s);
 String sa=hl.takeusernamee(id);
 out.println(sa);
 
 
 
 
 
 %> </td>  
              
    <td><%=rS.getString("comment")%></td>

</tr>

  <tr>
      
<%
check=true;

}
    if(!check){
       %>
      
  <strong>  <font color="red">No Available Comment!</font></strong>
       
       <%}
    
    %>
    </table>
    
    
   
    
    <br></br>

 <table style="width:70%">
      <tr>
   <th><font color="blue">Hotel Room</font></th>
 <th><font color="blue">Room Cost</font></th>
<th><font color="blue">Hotel Count</font></th>

    
  </tr>

<%
    
    while(room.next()){
  
 %>   
<tr>

<td><%=room.getString("roomname")%></td>
<td><%int rooma=room.getInt("roomid");
      Double para=hl.hotelroommoney(rooma);
       out.println(para);
%></td>
<td><%=room.getString("roomCount")%></td


</tr>



 
      
<%
check1=true;
}
    if(!check1){
        
    %>
    <strong>   <font color="red">No Available Room!</font> </strong>
  <%  }
    %>
 </table>
    
   <% 

   }
         }
    

   
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
