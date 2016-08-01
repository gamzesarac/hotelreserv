<%@page import="db.hotel"%>
<%
if(session.getAttribute("username") == null){
        response.sendRedirect("../login.html");
    }
%>
<!DOCTYPE html>
<html lang="en">
    <%
        String username = (String)session.getAttribute("username");
        hotel h = new hotel();
    String city = request.getParameter("city");
    String city_id = request.getParameter("city_id");
    String state = request.getParameter("state_id");
    String statename = h.takeStatenameFromID(state);
    String distinct = request.getParameter("distinct"); 
    String distinctname = h.takeDistinctnameFromID(distinct);
             if(distinctname.equals("-1"))
            response.sendRedirect("registerhotel.jsp");

    session.setAttribute("city", city);
    session.setAttribute("city_id", city_id);
    session.setAttribute("state", state);
    session.setAttribute("statename", statename);
    session.setAttribute("distinct", distinct);
    session.setAttribute("distinctname", distinctname);

%>
    <head>
        <title>Hotel Registration Form</title>
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
                <h2 style="font-size: 120%; color: blue"> (*) Required Fields</h2>
                
                <div class="divider"></div>
                
                <form name="hotelreservationform" method="get" action="hotelregister.jsp">                                
                    <table>
                        <tr>
                            <td>Hotel Name(*):</td>
                            <td><input type="text" name="hotelname" size="50" maxlength=50 required="yes" /></td>
                        </tr>
                        <tr>
                            <td>Hotel Info(*):</td>
                            <td> <textarea name="hotelInfo" style="width: 360px; height: 150px;"  required="yes" ></textarea>  </td>
                        </tr>
                        <tr>
                            <td>City(*):</td>
                            <td><input type="text" name="hcity" size="50" maxlength=5 value=<%out.print(city);%> DISABLED/></td>
                            <td><input type="hidden" name="city_id" value="<% out.print(city_id); %>" > </td>
                            <td><input type="hidden" name="hotelcity" size="50" maxlength=5 value="<%out.print(city);%>"/></td>
                        </tr>
                        <tr>
                            <td>State(*):</td>
                            <td><input type="text" name="hstate" size="50" maxlength=5 value=<%out.print(statename);%> DISABLED/></td>
                             <td><input type="hidden" name="state_id" value="<% out.print(state); %>" > </td>
                             <td><input type="hidden" name="hotelstate" size="50" maxlength=5 value="<%out.print(statename);%>"/></td>
                        </tr>
                                                <tr>
                            <td>Distinct(*):</td>
                            <td><input type="text" name="hdistinct" size="50" maxlength=5 value=<%out.print(distinctname);%> DISABLED/></td>
                             <td><input type="hidden" name="distinct_id" value="<% out.print(distinct); %>" > </td>
                             <td><input type="hidden" name="hoteldistinct" size="50" maxlength=5 value="<%out.print(distinctname);%>"/></td>
                        </tr>
                         <tr>
                            <td>Address(*):</td>
                            <td><input type="text" name="hoteladdress" size="50" maxlength=100  required="yes" /></td>
                         <td><div class="container">
                        <a href="#" data-toggle="tooltip" title="please enter your only steet details and door no.">?</a>
                            </div></td>
                        </tr>
                        <tr>
                            <td>Telephone (*):</td> 
                            <td><input type="text" name="hoteltelephone" size="50" maxlength=11  required="yes" /></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><input type="submit"  value="Continue" style="font-family: monospace; width: 125px; background-color: white; border-color: white; color: blue;"/></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><input type="reset"  value="Reset" style="font-family: monospace; width: 125px; background-color: white; border-color: white; color: blue;"/></td>
                        </tr>
                    </table>
                </form>
            </div>

            <div class="divider"></div>

            <div id="footer">
                <p>&copy; 2016 Hotel Reservation </p>
            </div>

            <br/><br/>
        </div>
    </div>
</div>
</body>
</div>
</html>