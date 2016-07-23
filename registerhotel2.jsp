<%@page import="db.hotel"%>
<!DOCTYPE html>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Hotel Registration Form</title>
        <meta charset="utf-8">
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
        <link rel="stylesheet" href="../style.css" type="text/css" />
    </head>
     <%
         
         String username = (String)session.getAttribute("username");
        hotel h = new hotel();
        String city_idd = request.getParameter("city");
        String city = h.takeCitynameFromID(city_idd);
         if(city.equals("-1"))
            response.sendRedirect("registerhotel.jsp");
         int city_id = Integer.parseInt(city_idd);
        ResultSet table=h.takeStates(city_id);

   
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
                <h1 style="font-weight: bold; font-size: 220%;">Hotel Registration Form</h1>
                
                
                <div class="divider"></div>
                
                <table border="4">
                    <th style="font-size: 15px;">Select State</th>
                        <tr><td>
                    <form method="get" action="hotelindex.jsp">
     <div class="styled-select">
                <select name="city"> 
    <option value="<%=city%>"><%=city%></option>
                </select></div> <br> <br>
                        <div class="styled-select">
                             <select name="state">  
                                <option value="none">Select</option>
         
                                <% while(table.next()){ %>
                        <option value="<%=table.getString("STATE_ID")%>"><%=table.getString("STATE_NAME")%></option>  
                                <% } %>                 
                            </select> </div>
                            <p> <input type = "submit" name = "Next" value = "Next" style="width: 75px; background-color: white; border-color: white; color: #014ccc; "/></p>
                         <td><input type="hidden" name="city" value="<% out.print(city); %>" > </td>
                         <td><input type="hidden" name="city_id" value="<% out.print(city_idd); %>" > </td>
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