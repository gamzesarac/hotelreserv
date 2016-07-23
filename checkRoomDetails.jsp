<%@page import="db.hotel"%>
<%-- 
    Document   : checkRoomDetails
    Created on : Jul 11, 2016, 11:53:26 PM
    Author     : ONuR
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    
    String username = (String)session.getAttribute("username");
    hotel h= new hotel();
    
    String standardroomsize = request.getParameter("standardroomsize");
    String[] standardroomscheckvalue = request.getParameterValues("standardroomproperty");
    String standartcost = request.getParameter("standartcost");
    
    String luxuryroomsize = request.getParameter("luxuryroomsize");
    String[] luxuryroompropertycheckvalue = request.getParameterValues("luxuryroomproperty");
    String luxurycost = request.getParameter("luxurycost");
    
    String premiumroomsize = request.getParameter("premiumroomsize");
    String[] premiumroompropertycheckvalue = request.getParameterValues("premiumroomproperty");
    String premiumcost = request.getParameter("premiumcost");
    
    session.setAttribute("standardroomsize", standardroomsize);
    session.setAttribute("luxuryroomsize", luxuryroomsize);
    session.setAttribute("premiumroomsize", premiumroomsize);
    
    session.setAttribute("standartcost", standartcost);
    session.setAttribute("luxurycost", luxurycost);
    session.setAttribute("premiumcost", premiumcost);
    
    session.setAttribute("standardroomscheckvalue", standardroomscheckvalue);
    session.setAttribute("luxuryroompropertycheckvalue", luxuryroompropertycheckvalue);
    session.setAttribute("premiumroompropertycheckvalue", premiumroompropertycheckvalue);
    
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Check Details Page</title>
        <meta charset="utf-8">
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
        <link rel="stylesheet" href="../style.css" type="text/css" />
    </head>
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
                <h2 style="font-size: 120%; color: blue">You are almost done! Please check your information.</h2>

                <div class="divider"></div>

                <form name="hotelreservationform" method="get" action="addHotelRoom.jsp">                                

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
                                    if (standardroomscheckvalue != null) {
                                        for (int i = 0; i < standardroomscheckvalue.length; i++) {
                                            out.println(standardroomscheckvalue[i] + " - ");
                                        }
                                    } else {
                                        out.print("none selected");
                                    }
                                    
                                    
                                %>
                            </td>
                        </tr>
                        <tr>
                            <td><b> <% out.print("Your room cost is :" + standartcost); %> </b></td>
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
                                    if (luxuryroompropertycheckvalue != null) {
                                        for (int i = 0; i < luxuryroompropertycheckvalue.length; i++) {
                                            out.println(luxuryroompropertycheckvalue[i] + " - ");
                                        }
                                    } else {
                                        out.print("none selected");
                                    }
                                %>
                            </td>
                        </tr>
                        <tr>
                            <td><b> <% out.print("Your room cost is :" + luxurycost); %> </b></td>
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
                                    if (premiumroompropertycheckvalue != null) {
                                        for (int i = 0; i < premiumroompropertycheckvalue.length; i++) {
                                            out.println(premiumroompropertycheckvalue[i] + " - ");
                                        }
                                    } else {
                                        out.print("none selected");
                                    }
                                %>
                            </td>
                        </tr>
                        <tr>
                            <td><b> <% out.print("Your room cost is :" + premiumcost); %> </b></td>
                        </tr>
                        </tbody>
                        <tr>
                            <td></td><td></td>
                            <td><input type="submit" value="Finish" style="font-family: monospace; width: 125px; background-color: white; border-color: white; color: blue;"/></td>
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
