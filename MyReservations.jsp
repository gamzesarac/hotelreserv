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
<title>My Reservations</title>
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
       <% if(check != 3 || check ==-1){ %>
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
        ResultSet table2 = r.takeMyReservations(userid);
        String ridString;
        ResultSet table3;
        Date checkin;
    %>
<div id="container">
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
    <a href="user.jsp"><h4 style="color: #014ccc; font-style: italic;">Welcome : <%= firstname %> </h4></a>
  </div>
       <div id="main">
        <h2 style="font-family: monospace; font-weight: bold; font-size: 200%;">See Your All Reservations</h2>
        <table border="4">
                    <tr>
                        <th style="font-size: 15px;">Your Reservations</th>
                      <!--  <th>Text</th> -->
                      <!--  <th></th> -->

                    </tr>
                    
                    <table border="2" >
         
                        <th>Reservation ID</th>
                        <th>Hotel Name</th>
                        <th>Room Type</th>
                        <th>Check In</th>
                        <th>Check Out</th>
                        <th>Cost</th>
                        <th>Status</th>


       <% while(table2.next()){%>   
                    <form method="post" action="selectedReservation.jsp">
                    <tr>       
                        <td>                             
                        <input id="messageLink" type = "submit" name = "Submit" value = "<%out.print(table2.getInt("reservationid"));%>"/>
                        <input type="hidden" name="rid" value="<%out.print(table2.getString("reservationid"));%>">
                            <% ridString = table2.getString("reservationid");
                                int rid=Integer.parseInt(ridString);
                         table3 = u.takeSelectedReservation(rid);
                         checkin = table3.getDate("checkin"); %>
                        </td>
                        <td>
                            <%
                            String hotelname=r.takeHotelName(table2.getInt("roomid")); %>
                            <%= hotelname %>
                        </td>                        
                        <td>                            
                            <%hotelroom h2=new hotelroom();
                            String roomtype=h2.takeRoomType(table2.getInt("roomid")); %>
                          <%= roomtype %>
                        </td>
                         <td>
                         <%out.print(table2.getString("checkin"));%>
                         </td>
                         <td>
                          <%out.print(table2.getString("checkout"));%>
                         </td>
                         <td>
                                                      
                            <%hotelroom h=new hotelroom();
                            double cost=h.takeRoomCost(table2.getInt("roomid")); %>
                            <%= cost %>
                         </td>
                         <td>
                         <% if(checkin.compareTo(date)>0&&table2.getInt("isCancelled")==0){ %> active <% } else{ %> inactive <% } %>
                         </td>                            
                            
                    </tr>
                            
                            <!-- <input type = "submit" name = "Submit" value = "Read"/> -->
                       
                    </form>
                
                    <%}%>
                </table>

                    </div>

<div id="footer">
    <p>&copy; 2016 Hotel Reservation </p>
  </div>
 </div>
</body>
</html>