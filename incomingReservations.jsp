<%@page import="db.hotel"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="db.hotelroom"%>
<%@page import="db.reservation"%>
<%@page import="db.user"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Date"%>
<!DOCTYPE html>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:setProperty name = "dbbean" property = "*" />
<html lang="en">
<head>
<title>Incoming Reservations</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="stylesheet" href="style.css" type="text/css" />
  <style>
      #messageLink {background-color: white;
                      border: 0;
                      cursor: pointer;
                      font-weight: bold;
                      /* text-decoration: underline; */
                      color: #014ccc;
                      font-style: initial;
                      }
      
      
    
  </style>
</head>
<body>
 <%
         DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
         Date date = new Date(); 
        String username = (String)session.getAttribute("username");
        user u=new user(username);
        String type = u.checkTypePages(username);
        int check = Integer.parseInt(type); %>
       <% if(check != 2 || check ==-1){ %>
        <jsp:forward page="loginError_1.html"/>
        <% } 
        if(session.getAttribute("username") == null){
            response.sendRedirect("index.jsp");
        }

        String firstname = u.takeFirstname(username);
        ResultSet table = u.takeUserInfo(username);
        //user uu= new user(table.getString("username"),table.getString("firstname"),table.getString("lastname"),table.getString("password"),table.getString("birthdate"),table.getString("email"),table.getString("gender"),table.getString("telephone"),table.getInt("usertype_id"),table.getString("address"),table.getString("ssn"));
        int userid=u.takeUserId(username);
        reservation r = new reservation();
        hotel hotel= new hotel();
        int hotelid=hotel.takeHotelIdfromID(userid);
        ResultSet table2 = r.takeHotelReservations(hotelid);
        String ridString;
        ResultSet table3;
        Date checkin;
    %>
<div id="containerr">
  <ul id="nav">
    <li><a href="contact.jsp" title="contact">contact</a></li>
    <li><a href="../logout.jsp" title="logout">logout</a></li>
  </ul>
      <div class="divider"></div>
  <div id="header">
      <h1><a href="hotel.jsp">Hotel Reservation</a><span>Isik University</span></h1>
  </div>
       <div class="divider"></div>
  <div id="sidebar">
    <a href="hotel.jsp"><h4 style="color: #014ccc; font-style: italic;">Welcome : <%= firstname %> </h4></a>
  </div>
       <div id="main">
        <h2 style="font-family: monospace; font-weight: bold; font-size: 200%;">See Your Incoming Reservations</h2>
        <table border="4">
                    <tr>
                        <th style="font-size: 15px;">Incoming Reservations</th>
                      <!--  <th>Text</th> -->
                      <!--  <th></th> -->

                    </tr>
                    
                    <table border="0" >
         
                        
                        <th>Hotel Name</th>
                        <th>Room Type</th>
                        <th>Check In</th>
                        <th>Check Out</th>
                        <th>Cost</th>
                        <th>Status</th>
                        <th>Customer Username</th>


       <% while(table2.next()){%>   
                    <form method="post" action="selectedIncomingReservation.jsp">
                    <tr>       
                                                   
                        
                        
                            <% ridString = table2.getString("reservationid");
                                int rid=Integer.parseInt(ridString);
                         table3 = u.takeSelectedReservation(rid);
                         checkin = table3.getDate("checkin"); %>
                        
                        
                        <td>
                            <%
                            String hotelname=r.takeHotelName(table2.getInt("roomid")); %>
                            <input id="messageLink" type = "submit" name = "Submit" value = "<%= hotelname %>"/>
                            <input type="hidden" name="rid" value="<%out.print(table2.getString("reservationid"));%>">
                        </td>                        
                        <td>                            
                            <%hotelroom h2=new hotelroom();
                            String roomtype=h2.takeRoomType(table2.getInt("roomid")); %>
                          <input id="messageLink" type = "submit" name = "Submit" value = "<%= roomtype %>"/>
                        </td>
                         <td>
                         <input id="messageLink" type = "submit" name = "Submit" value = "<%out.print(table2.getString("checkin"));%>"/>
                         </td>
                         <td>
                         <input id="messageLink" type = "submit" name = "Submit" value = "<%out.print(table2.getString("checkout"));%>"/>
                         </td>
                         <td>
                           <% hotelroom hh=new hotelroom(); double cost=hh.takeRoomCost(table2.getInt("roomid")); %> <input id="messageLink" type = "submit" name = "Submit" value = "<%=cost %>"/>                            
                            
                         </td>
                         <td>
                         <% if(checkin.compareTo(date)>0&&table2.getInt("isCancelled")==0){ %> <input id="messageLink" type = "submit" name = "Submit" value = "active"/> <% } else{ %> <input id="messageLink" type = "submit" name = "Submit" value = "inactive"/> <% } %>
                         </td>                            
                         </form> 
                         <td>
                             <form method="post" action="userInfo.jsp">
                                 <% String unm=u.takeUserNamefromID(table2.getInt("userid")); %>
                        <input id="messageLink" type = "submit" name = "Submit" value = "<%=unm %>"/>
                        <% session.setAttribute("useridd", table2.getString("userid")); %>
                        <input type="hidden" name="uid" value="<%out.print(table2.getString("userid"));%>">
                             </form> 
                        </td> 
                    </tr>
                            
                            <!-- <input type = "submit" name = "Submit" value = "Read"/> -->
                       
                    
                
                    <%}%>
                </table>

                    </div>

<div id="footer">
    <p>&copy; 2016 Hotel Reservation </p>
  </div>
 </div>
</body>
</html>