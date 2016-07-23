<%@page import="db.hotel"%>
<!DOCTYPE html>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:setProperty name = "dbbean" property = "*" />
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Hotel List Page</title>
        <meta charset="utf-8">
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
        <link rel="stylesheet" href="../style.css" type="text/css" />
    </head>
     <%
        String username = (String)session.getAttribute("username");

        hotel h = new hotel(); 
        ResultSet hotelTable=h.takeHotelList(username);

   
    %>
    <body>
        <div id ="containerr">
            <ul id="nav">
                <li><a href="#" title="let">contact</a></li>
                <li><a href="logout.jsp" title="logout">logout</a></li>
            </ul>

            <div class="divider"></div>

            <div id="header">
                <h1><a href="hotel.jsp">Hotel Reservation</a><span>Isik University</span></h1>
            </div>

            <div class="divider"></div>

            <div id="main">
                <h1 style="font-weight: bold; font-size: 220%;">Hotel Room Add Page</h1>
                
                
                <div class="divider"></div>
                
                <table border="4">
                    <th style="font-size: 15px;">Select Hotel</th>
                        <tr><td>
                    <form method="get" action="hotelRoomAddPage.jsp">
                       
                        <table border="1">
                        <tr>
                        <th>Hotel Name</th>
                        <th>Hotel Address</th>
                        <th>Choose Hotel</th>
                        </tr>
                        <% while(hotelTable.next())
                        {
                        %>
                        <tr>
                        <td><% out.print(hotelTable.getString("hotelname")); %></td>
                            
                        <td><% out.print(hotelTable.getString("address")); %></td>
                        
                        <td><input type="radio" name="hotelID" value="<% out.print(hotelTable.getString("hotelid")); %>" ></td>
                        
                        
                        <% } %>
                        </tr>
                        </table>
                        
                        
                        
                        
                   <p> <input type = "submit" value = "Choose Hotel" style="width: 95px; background-color: white; border-color: white; color: #014ccc; "/></p>
                       
                    </form>
            </td></tr>
                    </table> 

            <div class="divider"></div>



            <br/><br/>
        </div>
    <div id="footer">
                <p>&copy; 2016 Hotel Reservation </p>
            </div>
    </div>

</body>
</div>
</html>