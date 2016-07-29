<%@page import="db.user"%>
<%@page import="db.hotel"%>
<%-- 
    Document   : checkRoomDetails
    Created on : Jul 11, 2016, 11:53:26 PM
    Author     : ONuR
--%>
<%
if(session.getAttribute("username") == null){
        response.sendRedirect("../login.html");
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    
    String username = (String)session.getAttribute("username");
    hotel h= new hotel();
    user u=new user();
    String standardroomsize = request.getParameter("standardroomsize");
    //int standardroom=Integer.parseInt(standardroomsize);

    String[] standardroomscheckvalue = request.getParameterValues("standardroomproperty");
    String standartcost = request.getParameter("standartcost");
    
    String luxuryroomsize = request.getParameter("luxuryroomsize");

    //int luxuryroom=Integer.parseInt(luxuryroomsize); 

    String[] luxuryroompropertycheckvalue = request.getParameterValues("luxuryroomproperty");
    String luxurycost = request.getParameter("luxurycost");
    
    String premiumroomsize = request.getParameter("premiumroomsize");

    //int premiumroom=Integer.parseInt(premiumroomsize);   

 
    String[] premiumroompropertycheckvalue = request.getParameterValues("premiumroomproperty");
    String premiumcost = request.getParameter("premiumcost");
    
        if(standardroomsize.equals("")||luxuryroomsize.equals("")||premiumroomsize.equals("")){
        %> <SCRIPT LANGUAGE='JavaScript'>
    window.alert('Please enter an INTEGER value to your room count settings')
     window.location.href='myHotels2.jsp'
    </SCRIPT>     <%
    }
    if(!standardroomsize.equals("")){
        if(u.checkInt(standardroomsize)){
        int standardroom=Integer.parseInt(standardroomsize);
        if(standardroom<0){
            %> <SCRIPT LANGUAGE='JavaScript'>
    window.alert('Please enter a POSITIVE value to your room count field (STANDART ROOM)')
     window.location.href='myHotels2.jsp'
    </SCRIPT>     <% } 
        }
        else{
             %> <SCRIPT LANGUAGE='JavaScript'>
    window.alert('Please enter an INTEGER value to your room count field (STANDART ROOM)')
     window.location.href='myHotels2.jsp'
    </SCRIPT>     <%
        }
    }
        if(!luxuryroomsize.equals("")){
            if(u.checkInt(luxuryroomsize)){
        int luxuryroom=Integer.parseInt(luxuryroomsize);
        if(luxuryroom<0){
             %> <SCRIPT LANGUAGE='JavaScript'>
    window.alert('Please enter a POSITIVE value to your room count field (LUXURY ROOM)')
     window.location.href='myHotels2.jsp'
    </SCRIPT>     <% }
            }
            else{
                %> <SCRIPT LANGUAGE='JavaScript'>
    window.alert('Please enter an INTEGER value to your room count field (LUXURY ROOM)')
     window.location.href='myHotels2.jsp'
    </SCRIPT>     <%
            }
    }
         if(!premiumroomsize.equals("")){
             if(u.checkInt(premiumroomsize)){
        int premiumroom=Integer.parseInt(premiumroomsize);
        if(premiumroom<0){
             %> <SCRIPT LANGUAGE='JavaScript'>
    window.alert('Please enter a POSITIVE value to your room count field (PREMIUM ROOM)')
     window.location.href='myHotels2.jsp'
    </SCRIPT>     <% }
             }
             else{
                %> <SCRIPT LANGUAGE='JavaScript'>
    window.alert('Please enter an INTEGER value to your room count field (PREMIUM ROOM)')
     window.location.href='myHotels2.jsp'
    </SCRIPT>     <% 
            }
    }
         
         if(standartcost.equals("")||luxurycost.equals("")||premiumcost.equals("")){
         %> <SCRIPT LANGUAGE='JavaScript'>
    window.alert('Please enter an INTEGER value to cost fields')
     window.location.href='myHotels2.jsp'
    </SCRIPT>     <%
    }
    
         if(!standartcost.equals("")){
        if(u.checkDouble(standartcost)){
        double standardcst=Double.parseDouble(standartcost);
        if(standardcst<0){
             %> <SCRIPT LANGUAGE='JavaScript'>
    window.alert('Please enter a POSITIVE value to your room cost field (STANDART COST)')
     window.location.href='myHotels2.jsp'
    </SCRIPT>     <% }
        }
        else{
             %> <SCRIPT LANGUAGE='JavaScript'>
    window.alert('Please enter an DOUBLE value to your room cost field (STANDART COST)')
     window.location.href='myHotels2.jsp'
    </SCRIPT>     <%
        }
    }
           if(!luxurycost.equals("")){
        if(u.checkDouble(luxurycost)){
        double luxurycst=Double.parseDouble(luxurycost);
        if(luxurycst<0){
             %> <SCRIPT LANGUAGE='JavaScript'>
    window.alert('Please enter a POSITIVE value to your room cost field (LUXURY COST)')
     window.location.href='myHotels2.jsp'
    </SCRIPT>     <% }
        }
        else{
             %> <SCRIPT LANGUAGE='JavaScript'>
    window.alert('Please enter an DOUBLE value to your room cost field (LUXURY COST)')
     window.location.href='myHotels2.jsp'
    </SCRIPT>     <%
        }
    }
           if(!premiumcost.equals("")){
        if(u.checkDouble(premiumcost)){
        double premiumcst=Double.parseDouble(premiumcost);
        if(premiumcst<0){
             %> <SCRIPT LANGUAGE='JavaScript'>
    window.alert('Please enter a POSITIVE value to your room cost field (PREMIUM COST)')
     window.location.href='myHotels2.jsp'
    </SCRIPT>     <% }
        }
        else{
             %> <SCRIPT LANGUAGE='JavaScript'>
    window.alert('Please enter an DOUBLE value to your room cost field (PREMIUM COST)')
     window.location.href='myHotels2.jsp'
    </SCRIPT>     <%
        }
    }         
      
       if(standardroomscheckvalue==null||luxuryroompropertycheckvalue==null||premiumroompropertycheckvalue==null){
            %> <SCRIPT LANGUAGE='JavaScript'>
    window.alert('Please check AT LEAST 1 checkbox in the room specifications from all room types!!')
     window.location.href='myHotels2.jsp'
    </SCRIPT>     <% }
           
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
                <li><a href="../logout.jsp" title="logout">logout</a></li>
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

                <form name="hotelreservationform" method="get" action="addHotelRoom2.jsp">                                

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
