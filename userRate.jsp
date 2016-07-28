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
<title>Rate Hotel</title>
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
       <% if(check != 3 || check ==-1){ %>
        <jsp:forward page="login.html"/>
        <% } 
        if(session.getAttribute("username") == null){
            response.sendRedirect("index.jsp");
        }

        String firstname = u.takeFirstname(username);
        String rid2=request.getParameter("rid2");
        String roomid=request.getParameter("roomid");
    %>
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
    <a href="user.jsp"><h4 style="color: #014ccc; font-style: italic;">Welcome : <%= firstname %> </h4></a>
  </div>
       <div id="main">
        <h2 style="font-family: monospace; font-weight: bold;">Rate This Hotel!</h2>
       <form method="post" action="userRateAction.jsp">
        <table border="2">
            
                    <tr>
                        <th style="font-size: 15px;">Your Comment: </th>
                      <td> <TEXTAREA name="text" ROWS=5 COLS=30 required="yes"></TEXTAREA>   </td>           
                      
                    </tr>
                        <th style="font-size: 15px;">Your Rating: 
                    <td> 
                        <% for (int i=1; i<6; i++){ %>
                         <input type="radio" name="rate" value="<%=i%>" required="yes"/><%=i %>
                         <% } %>
                       </th>
                        </td>
                        
                    </tr>
               
                </table> 
                       <input type="submit" name="Send" value="Send" style="width: 125px; background-color: white; border-color: white; color: #014ccc;"/>
                       <input type="hidden" name="rid2" value="<%= rid2 %>">
                       <input type="hidden" name="roomid" value="<%= roomid %>">
                     </form>
                                
       </div>

<div id="footer">
    <p>&copy; 2016 Hotel Reservation </p>
  </div>
 </div>
</body>
</html>