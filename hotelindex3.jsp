<%@page import="db.hotel"%>
<!DOCTYPE html>
<%
    String username = (String)session.getAttribute("username");
    hotel h= new hotel();
    
    String hotelname = session.getAttribute("hotelname").toString();
    String hotelinfo = session.getAttribute("hotelinfo").toString();
    String hoteladdress = session.getAttribute("hoteladdress").toString();
    String hotelcity = session.getAttribute("hotelcity").toString();
    String hotelstate = session.getAttribute("hotelstate").toString();
    String hoteltelephone = session.getAttribute("hoteltelephone").toString();
    String city_id = session.getAttribute("city_id").toString();
    String state_id = session.getAttribute("state_id").toString();
    
    String standartcost = request.getParameter("standartcost");
    String luxurycost = request.getParameter("luxurycost"); 
    String premiumcost = request.getParameter("premiumcost");
    
    session.setAttribute("hotelname", hotelname);
    session.setAttribute("hotelinfo", hotelinfo);
    session.setAttribute("hoteladdress", hoteladdress);
    session.setAttribute("hotelcity", hotelcity);
    session.setAttribute("city_id", city_id);
    session.setAttribute("hotelstate", hotelstate);
    session.setAttribute("state_id", state_id);
    session.setAttribute("hoteltelephone", hoteltelephone);
    session.setAttribute("standartcost", standartcost);
    session.setAttribute("luxurycost", luxurycost);
    session.setAttribute("premiumcost", premiumcost);
    
    String standardroomsize = request.getParameter("standardroomsize");
    session.setAttribute("standardroomsize", standardroomsize);
    String[] checkboxvalues1 = request.getParameterValues("standardroomproperty");
    String standartroomproperty=h.roomPropertyToString(checkboxvalues1);
    session.setAttribute("standartroomproperty", standartroomproperty);
    

    String luxuryroomsize = request.getParameter("luxuryroomsize");
    session.setAttribute("luxuryroomsize", luxuryroomsize);
    String[] checkboxvalues2 = request.getParameterValues("luxuryroomproperty");
    String luxuryroomproperty=h.roomPropertyToString(checkboxvalues2);
    session.setAttribute("luxuryroomproperty", luxuryroomproperty);
    

    String premiumroomsize = request.getParameter("premiumroomsize");
    session.setAttribute("premiumroomsize", premiumroomsize);
    String[] checkboxvalues3 = request.getParameterValues("premiumroomproperty");
    String premiumroomproperty=h.roomPropertyToString(checkboxvalues3);
    session.setAttribute("premiumroomproperty", premiumroomproperty);
    

%>
<html lang="en">
    <head>
        <title>Hotel Registration Form</title>
        <meta charset="utf-8">
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
        <link rel="stylesheet" href="../style.css" type="text/css" />
    </head>
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
                <h1 style="font-weight: bold; font-size: 220%;">Hotel Registration Form</h1>
                <h2 style="font-size: 120%; color: blue">You are almost done! Please check your information.</h2>

                <div class="divider"></div>

                <form name="hotelreservationform" method="get" action="hotelregister.jsp">                                
                    <table>
                        <tbody>
                            <tr>
                                <td>Hotel Name:</td>
                                <td><%= hotelname%></td>
                                <td><input type="hidden" name="hotelName" value="<% out.print(hotelname); %>" > </td>
                                
                            <tr>
                                <td>Hotel Info</td>
                                <td><%= hotelinfo%></td>
                                <td><input type="hidden" name="hotelInfo" value="<% out.print(hotelinfo); %>" > </td>
                                
                            
                            <tr>
                                <td>Address:</td>
                                <td><%= hoteladdress%></td>
                                <td><input type="hidden" name="hotelAddress" value="<% out.print(hoteladdress); %>" > </td>
                            </tr>
                            <tr>
                                <td>City:</td>
                                <td><%= hotelcity%></td>
                                <td><input type="hidden" name="hotelCity" value="<% out.print(hotelcity); %>" > </td>
                            </tr>
                            <tr>
                                <td>State</td>
                                <td><%= hotelstate%></td>
                                <td><input type="hidden" name="hotelState" value="<% out.print(hotelstate); %>" > </td>
                            </tr>
                            <tr>
                                <td>Telephone:</td>
                                <td><%= hoteltelephone%></td>
                                <td><input type="hidden" name="hotelPhone" value="<% out.print(hoteltelephone); %>" > </td>
                            </tr>
                           
                        </tbody>
                    </table>
                            
                    <div class="divider"></div>
                    
                    <table>
                        <tbody>
                            <tr>
                        <h3>Hotel Room Informations:</h3>
                        </tr>
                        <tr>
                            <td>
                                <%
                                    if (standardroomsize == "") {
                                        out.print("There is no standard room in your hotel.");
                                    } else {
                                        out.print("There are " + standardroomsize + " standard rooms in your hotel.");
                                    }
                                %> 
                            </td>
                        </tr>
                        <tr>
                            <td>Standard Room Properties:</td>
                        </tr>
                        <tr>
                            <td>
                                <%
                                    if (checkboxvalues1 != null) {
                                        for (int i = 0; i < checkboxvalues1.length; i++) {
                                            out.println(checkboxvalues1[i] + " - ");
                                        }
                                    } else {
                                        out.print("none selected");
                                    }
                                %>
                            </td>
                        </tr>
                        <tr><td>--------------------</td></tr>
                        <tr>
                            <td>
                                <%
                                    if (luxuryroomsize == "") {
                                        out.print("There is no luxury room in your hotel.");
                                    } else {
                                        out.print("There are " + luxuryroomsize + " luxury rooms in your hotel.");
                                    }
                                %> 
                            </td>
                        </tr>
                        <tr>
                            <td>Luxury Room Properties:</td>
                        </tr>
                        <tr>
                            <td>
                                <%
                                    if (checkboxvalues2 != null) {
                                        for (int i = 0; i < checkboxvalues2.length; i++) {
                                            out.println(checkboxvalues2[i] + " - ");
                                        }
                                    } else {
                                        out.print("none selected");
                                    }
                                %>
                            </td>
                        </tr>
                        <tr><td>--------------------</td></tr>
                        <tr>
                            <td>
                                <%
                                    if (premiumroomsize == "") {
                                        out.print("There is no premium room in your hotel.");
                                    } else {
                                        out.print("There are " + premiumroomsize + " premium rooms in your hotel.");
                                    }
                                %> 
                            </td>
                        </tr>
                        <tr>
                            <td>Premium Room Properties:</td>
                        </tr>
                        <tr>
                            <td>
                                <%
                                    if (checkboxvalues3 != null) {
                                        for (int i = 0; i < checkboxvalues3.length; i++) {
                                            out.println(checkboxvalues3[i] + " - ");
                                        }
                                    } else {
                                        out.print("none selected");
                                    }
                                %>
                            </td>
                        </tr>
                        </tbody>
                        <tr>
                            <td></td><td></td>
                            <td><input type="submit" value="Submit" style="font-family: monospace; width: 125px; background-color: white; border-color: white; color: blue;"/></td>
                        </tr>
                        <tr>
                            <td></td><td></td>
                            <td><input type="submit" value="Go Back" style="font-family: monospace; width: 125px; background-color: white; border-color: white; color: blue;"/></td>
                        </tr>         
                    </table>
                </form>
                <br/><br/>
            </div>

            <div class="divider"></div>

            <div id="footer">
                <p>&copy; 2016 Hotel Reservation </p>
            </div>
        </div>
    </body>
</html>