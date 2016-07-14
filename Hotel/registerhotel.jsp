<%@page import="db.hotel"%>
<!DOCTYPE html>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:setProperty name = "dbbean" property = "*" />
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
        ResultSet table=h.takeCities();

   
    %>
    <body>
        <div id ="container">
            <ul id="nav">
                <li><a href="#" title="let">contact</a></li>
                <li><a href="login.jsp" title="login">login</a></li>
            </ul>

            <div class="divider"></div>

            <div id="header">
                <h1><a href="user.jsp">Hotel Reservation</a><span>Isik University</span></h1>
            </div>

            <div class="divider"></div>

            <div id="main">
                <h1 style="font-weight: bold; font-size: 220%;">Hotel Registration Form</h1>
                
                
                <div class="divider"></div>
                
                <table border="4">
                    <th style="font-size: 15px;">Select City</th>
                        <tr><td>
                    <form method="get" action="registerhotel2.jsp">
                        <div class="styled-select">
                             <select name="city">  
                                <option value="none">Select</option>
         
                                <% while(table.next()){ %>
                        <option value="<%=table.getString("CITY_ID")%>"><%=table.getString("CITY_NAME")%></option>  
                                <% } %>                 
                            </select> </div>
                            <p> <input type = "submit" name = "Next" value = "Next" style="width: 75px; background-color: white; border-color: white; color: #014ccc; "/></p>
                       
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