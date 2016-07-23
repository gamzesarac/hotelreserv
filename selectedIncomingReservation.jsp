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

<html lang="en">
<head>
<title>Reservation</title>
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
         //String current = dateFormat.format(date);
         
         
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
        
        //user uu= new user(table.getString("username"),table.getString("firstname"),table.getString("lastname"),table.getString("password"),table.getString("birthdate"),table.getString("email"),table.getString("gender"),table.getString("telephone"),table.getInt("usertype_id"),table.getString("address"),table.getString("ssn"));
        String ridString= request.getParameter("rid");
        int rid=Integer.parseInt(ridString);
        ResultSet table = u.takeSelectedReservation(rid);
        Date checkin = table.getDate("checkin");
    %>
<div id="containerr">
  <ul id="nav">
    <li><a href="contact.jsp" title="contact">contact</a></li>
    <li><a href="logout.jsp" title="logout">logout</a></li>
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
        <h2 style="font-family: monospace; font-weight: bold;">Reservation Details</h2>
        <table border="2">
                    <tr>
                        <th style="font-size: 15px;">Reservation Info</th>
                      <!--  <th>Text</th> -->
                      <!--  <th></th> -->

                    </tr>
                    
                    
                      
                    <table>
                    <form method="post" action="cancelReservation.jsp">
                    <tr>       
                        <td> 
                            
                            <h4 style="font-weight: bold; color:#014ccc;">RESERVATION ID : <%out.print(table.getString("reservationid"));%>
                            <input type="hidden" name="rid" value="<%out.print(table.getString("reservationid"));%>">
                            </h4>
                            
                            <h4 style="font-weight: bold; color:#014ccc;">ROOM ID : <%out.print(table.getString("roomid"));%></h4>
                            
                            <%hotelroom h2=new hotelroom();
                            String roomtype=h2.takeRoomType(table.getInt("roomid")); %>
                            <h4 style="font-weight: bold; color:#014cccd;">ROOM TYPE : <%= roomtype %></h4>
                            
                            <%reservation r=new reservation();
                            String hotelname=r.takeHotelName(table.getInt("roomid")); %>
                            <h4 style="font-weight: bold; color:#014ccc;">HOTEL NAME : <%= hotelname %></h4>
                           
                            <h4 style="font-weight: bold; color:#014ccc;">CHECK IN : <%out.print(table.getString("checkin"));%></h4>
                            
                            <h4 style="font-weight: bold; color:#014ccc;">CHECK OUT : <%out.print(table.getString("checkout"));%></h4>
                            
                            <h4 style="font-weight: bold; color:#014ccc;">RESERVATION CREATION DATE : <%out.print(table.getString("reservationdate"));%></h4>
                            
                            <h4 style="font-weight: bold; color:#014ccc;">COST : <% hotelroom hh=new hotelroom(); double cost=hh.takeRoomCost(table.getInt("roomid")); %> <%=cost %> </h4>
                            
                            <h4 style="font-weight: bold; color:#014ccc;">STATUS : <% if(checkin.compareTo(date)>0&&table.getInt("isCancelled")==0){ %> active <% }else{ %>  inactive <% } %>  </h4>
                            
                            
                       
                        </td>
                        
                    </tr>
                            
                            <!-- <input type = "submit" name = "Submit" value = "Read"/> -->
                       
                   
                
                    </form>
                </table>
                                         
      </div>

<div id="footer">
    <p>&copy; 2016 Hotel Reservation </p>
  </div>
 </div>
</body>
</html>