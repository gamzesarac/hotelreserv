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
        


        int userid=u.takeUserId(username);
        ResultSet table = u.commentWaitingAprovalHotel(userid);

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
        <h2 style="font-family: monospace; font-weight: bold;">Comments</h2>
        <table border="2">
                    <tr>
                        <th style="font-size: 15px;">Approve/Reject</th>
                      <!--  <th>Text</th> -->
                      <!--  <th></th> -->

                    </tr>
                    
                    
                      
                    <table>
                        <% while(table.next()){ %> 
                    <form method="post" action="commentApprove.jsp">
                    <tr>       
                        <td> 

                            <% hotel h=new hotel(); String hotelname=h.takeHotelnameFromHotelID(Integer.parseInt(table.getString("hotel_hotelid"))); %>
                            <h4 style="font-weight: bold; color:#014ccc;">HOTEL NAME : <%= hotelname %></h4>
                            
                            <h4 style="font-weight: bold; color:#014ccc;">USERNAME : <% String usern=u.takeUserNamefromID(Integer.parseInt(table.getString("user_id"))); %> <%=usern %> </h4>
                            
                            <h4 style="font-weight: bold; color:#014ccc;">RATING : <% String rt=table.getString("rating"); out.print(rt); %>  </h4>
                            
                            <h4 style="font-weight: bold; color:#014ccc;">COMMENT : <% String cm=table.getString("comment"); out.print(cm); %>  </h4>
                            
                           <input type = "submit" name="approval" value = "Approve" style="width: 95px; background-color: white; border-color: white; color: #014ccc;"/> <input type = "submit" name="approval" value = "Reject" style="width: 95px; background-color: white; border-color: white; color: #014ccc;"/>
                       <div class="divider"></div>
                       <% String cid=table.getString("commentid"); %> 
                           <input type = "hidden" name = "cid" value="<%=cid %>"/> 
                        </td>
                        
                    </tr>
                            
                            <!-- <input type = "submit" name = "Submit" value = "Read"/> -->
                       
                   
                
                    </form>
                            <% } %> 
                </table>
                                         
      </div>

<div id="footer">
    <p>&copy; 2016 Hotel Reservation </p>
  </div>
 </div>
</body>
</html>