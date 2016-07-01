<%@page import="db.hotelroom"%>
<%@page import="db.reservation"%>
<%@page import="db.user"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html lang="en">
<head>
  <title>User Page</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  <style>
    /* Remove the navbar's default margin-bottom and rounded borders */
    .navbar {
      margin-bottom: 0;
      border-radius: 0;
    }
    
    /* Set height of the grid so .sidenav can be 100% (adjust as needed) */
    .row.content {height: 450px}
    
    /* Set gray background color and 100% height */
    .sidenav {
      padding-top: 20px;
      background-color: #f1f1f1;
      height: 100%;
    }
    
    /* Set black background color, white text and some padding */
    footer {
      background-color: #555;
      color: white;
      padding: 15px;
    }
    
    /* On small screens, set height to 'auto' for sidenav and grid */
    @media screen and (max-width: 767px) {
      .sidenav {
        height: auto;
        padding: 15px;
      }
      .row.content {height:auto;}
    }
  </style>
</head>
<body>
 <%
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
    %>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="user.jsp">Hotel Reservation</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="user.jsp">Home</a></li>
        <li><a href="#">Hotels</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="logout.jsp"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
      </ul>
    </div>
  </div>
</nav>
  
<div class="container-fluid text-center">
  <div class="row content">
    <div class="col-sm-2 sidenav">

    </div>
    <div class="col-sm-8 text-left">
        <h1 style="font-family: monospace; font-weight: bold;">See Your Reservations</h1>
        <table border="4">
                    <tr>
                        <th style="font-size: 15px;">Reservation Info</th>
                      <!--  <th>Text</th> -->
                      <!--  <th></th> -->

                    </tr>
                    
                    
                      
                    <table>
                    <tr>       
                        <td> 
                            
                            <h4 style="font-weight: bold; color:darkred;">RESERVATION ID : <%out.print(table.getString("reservationid"));%></h4>
                            <br>
                            <h4 style="font-weight: bold; color:darkred;">ROOM ID : <%out.print(table.getString("roomid"));%></h4>
                            <br>
                            <%hotelroom h2=new hotelroom();
                            String roomtype=h2.takeRoomType(table.getInt("roomid")); %>
                            <h4 style="font-weight: bold; color:darkred;">ROOM TYPE : <%= roomtype %></h4>
                            <br>
                            <%reservation r=new reservation();
                            String hotelname=r.takeHotelName(table.getInt("roomid")); %>
                            <h4 style="font-weight: bold; color:darkred;">HOTEL NAME : <%= hotelname %></h4>
                            <br>
                            <h4 style="font-weight: bold; color:darkred;">CHECK IN : <%out.print(table.getString("checkin"));%></h4>
                            <br>
                            <h4 style="font-weight: bold; color:darkred;">CHECK OUT : <%out.print(table.getString("checkout"));%></h4>
                            <br>
                            <h4 style="font-weight: bold; color:darkred;">RESERVATION CREATION DATE : <%out.print(table.getString("reservationdate"));%></h4>
                            <br>
                            <h4 style="font-weight: bold; color:darkred;">STATUS : <% if(table.getInt("isCancelled")==0){ %> active <% } %> </h4>
                            <br>
                            <%hotelroom h=new hotelroom();
                            double cost=h.takeRoomCost(table.getInt("roomid")); %>
                            <h4 style="font-weight: bold; color:darkred;">COST : <%= cost %> </h4>
                            
                        </td>
                    </tr>
                            
                            <!-- <input type = "submit" name = "Submit" value = "Read"/> -->
                       
                   
                
                    
                </table>
      <hr>
       
    </div>
    <div class="col-sm-2 sidenav">
        <a href="user.jsp"><h4 style="color: black; font-style: italic;">Welcome : <%= firstname %> </h4></a>
      <div class="well">
          
          
        <p style="font-weight: bolder; font-size: larger;">Facebook</p>
      </div>
      <div class="well">
          <p style="font-weight: bolder; font-size: larger;">Twitter</p>
      </div>
    </div>
  </div>
</div>

<footer class="container-fluid text-center">
  <p>Contact us</p>
</footer>

</body>
</html>

