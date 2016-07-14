<%@page import="db.user"%>
<%@page import="db.hotel"%>
<!DOCTYPE html>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:setProperty name = "dbbean" property = "*" />
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Hotel Inbox</title>
        <meta charset="utf-8">
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
        <link rel="stylesheet" href="../style.css" type="text/css" />
        <style>
        
        #messageLink {background-color: white;
                      border: 0;
                      cursor: pointer;
                      font-weight: bold;
                      font-size: 20px;
                      /* text-decoration: underline; */
                      color: #014ccc;
                      /* font-style: italic; */
                      }
    </style>
    </head>
     <%
        String username = (String)session.getAttribute("username");
        user u=new user(username);
        String type = u.checkTypePages(username);
        int check = Integer.parseInt(type); %>
       <% if(check != 2 || check ==-1){ %>
        <jsp:forward page="loginError_1.html"/>
        <% } 
        if(session.getAttribute("username") == null){
            response.sendRedirect("index.html");
        }
        int userid = u.takeUserId(username);
        ResultSet rs = u.takeMessageSelected(userid);
        hotel h = new hotel(); 
        

   
    %>
    <body>
        <div id ="container">
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
                <h1 style="font-weight: bold; font-size: 220%;">Inbox</h1>
                
                <br>

                
                <table>
                    <th  style="font-size: 30px;"></th>
                        <tr><td>
                    
                       
                        <table border="0">
                        <tr>
                        <th style="font-size: 25px; color: black; font-style: italic">Hotel ID</th>
                        <th style="font-size: 25px; color: black; font-style: italic">Message</th>
                        
                        </tr>
                        <% while(rs.next())
                        {
                        %>
                        <tr>
                        <td style="font-size: 20px;"><% out.print(rs.getString("hotelid")); %>  </td>                       
                         
                            
                        <td style="font-size: 20px;">
                            <form method="get" action="readMessage.jsp">
                        <input id="messageLink" type = "submit" name = "Submit" value = "<%out.print(rs.getString("message"));%>"/>
                        <input type="hidden" name="messageid" value="<%out.print(rs.getString("messageid"));%>"></td>
                        </form>

                        
                        
                        <% } %>
                        </tr>
                        </table>
                        
                        
                        
                        
                   
                       
                    
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