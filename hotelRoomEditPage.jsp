
<!DOCTYPE html>
<%
    if(session.getAttribute("username") == null){
        response.sendRedirect("../login.html");
    }
    
    String hotelid = request.getParameter("hotelID");
    
    session.setAttribute("hotelRoomID", hotelid);
    
    String addSetting = request.getParameter("AddSetting");
%>
<html lang="en">
    <head>
    <head>
        <title>Hotel Room Add Page</title>
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
            <% String choice=request.getParameter("hotelID");                
                if(choice==null){%>
                    <SCRIPT LANGUAGE='JavaScript'>
    window.alert('Please check a Hotel from the list!')
     window.location.href='myHotels.jsp'
    </SCRIPT>   
                <%}
                if(addSetting.equals("Add Room")) { %>
            <div id="main">
                <h1 style="font-weight: bold; font-size: 220%;">Hotel Registration Form</h1>
                <h2 style="font-size: 120%; color: blue">Please enter the number of the rooms that your hotel contains and select the properties.</h2>
                <h2 style="font-size: 120%; color: blue">If you don't have the room type please enter "0" for the relevant space.</h2>
                
                <div class="divider"></div>
                
                <form name="hotelreservationform" method="get" action="checkRoomDetails2.jsp">                                
                    <table>
                        <tr>
                            <td>
                                <input type="text" name="standardroomsize" size="2" maxlength=5 required="yes"/> Standard Room with 
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input type="checkbox" name="standardroomproperty" value="Air Conditioning">Air Conditioning
                                <input type="checkbox" name="standardroomproperty" value="Washer">Washer
                                <input type="checkbox" name="standardroomproperty" value="Dryer">Dryer            
                                <input type="checkbox" name="standardroomproperty" value="TV">TV
                                <input type="checkbox" name="standardroomproperty" value="Pool">Pool
                            </td>
                        </tr> 
                        <tr>
                            <td>
                                <input type="checkbox" name="standardroomproperty" value="Fireplace">Indoor Fireplace
                                <input type="checkbox" name="standardroomproperty" value="Terrace">Terrace with a View
                                <input type="checkbox" name="standardroomproperty" value="Jacuzzi">Jacuzzi
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input type="checkbox" name="standardroomproperty" value="Breakfast">Breakfast Included
                                <input type="checkbox" name="standardroomproperty" value="Lunch">Lunch Included
                                <input type="checkbox" name="standardroomproperty" value="Dinner">Dinner Included
                            </td>
                        </tr> 
                        <tr><td>Cost:
                        <input type="text" name="standartcost" size="10" required="yes"/></td></tr>
                        <tr>
                            <td>
                                <input type="text" name="luxuryroomsize" size="2" maxlength=5 required="yes"/> Luxury Room with 
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input type="checkbox" name="luxuryroomproperty" value="Air Conditioning">Air Conditioning
                                <input type="checkbox" name="luxuryroomproperty" value="Washer">Washer
                                <input type="checkbox" name="luxuryroomproperty" value="Dryer">Dryer            
                                <input type="checkbox" name="luxuryroomproperty" value="TV">TV
                                <input type="checkbox" name="luxuryroomproperty" value="Pool">Pool
                            </td>
                        </tr> 
                        <tr>
                            <td>
                                <input type="checkbox" name="luxuryroomproperty" value="Fireplace">Indoor Fireplace
                                <input type="checkbox" name="luxuryroomproperty" value="Terrace">Terrace with a View
                                <input type="checkbox" name="luxuryroomproperty" value="Jacuzzi">Jacuzzi
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input type="checkbox" name="luxuryroomproperty" value="Breakfast">Breakfast Included
                                <input type="checkbox" name="luxuryroomproperty" value="Lunch">Lunch Included
                                <input type="checkbox" name="luxuryroomproperty" value="Dinner">Dinner Included
                            </td>
                        </tr>   
                        <tr><td>Cost:
                        <input type="text" name="luxurycost" size="10"/></td></tr>
                        <tr>
                            <td>
                                <input type="text" name="premiumroomsize" size="2" maxlength=5 required="yes"/> Premium Room with 
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input type="checkbox" name="premiumroomproperty" value="Air Conditioning">Air Conditioning
                                <input type="checkbox" name="premiumroomproperty" value="Washer">Washer
                                <input type="checkbox" name="premiumroomproperty" value="Dryer">Dryer            
                                <input type="checkbox" name="premiumroomproperty" value="TV">TV
                                <input type="checkbox" name="premiumroomproperty" value="Pool">Pool
                            </td>
                        </tr> 
                        <tr>
                            <td>
                                <input type="checkbox" name="premiumroomproperty" value="Fireplace">Indoor Fireplace
                                <input type="checkbox" name="premiumroomproperty" value="Terrace">Terrace with a View
                                <input type="checkbox" name="premiumroomproperty" value="Jacuzzi">Jacuzzi
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input type="checkbox" name="premiumroomproperty" value="Breakfast">Breakfast Included
                                <input type="checkbox" name="premiumroomproperty" value="Lunch">Lunch Included
                                <input type="checkbox" name="premiumroomproperty" value="Dinner">Dinner Included
                            </td>
                        </tr>
                        <tr><td>Cost:
                        <input type="text" name="premiumcost" size="10" required="yes"/></td></tr>

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
                <br/><br/>
            </div>
            <% } if(addSetting.equals("Add Images")) { 
            %>
            <div id="main">
<form name="form1" method="post" enctype="multipart/form-data" action="insertimage.jsp">
 
<p>
<input type="file" name="ImageFile" id="ImageFile" />
<input type="hidden" name="hotelID" value="<% out.print(hotelid); %>" />
</p>
<p>
<input type="submit" name="submit" value="Upload" />
</p>
</form>
                </div>
            <div class="divider"></div>
            <% } %>
            <div id="footer">
                <p>&copy; 2016 Hotel Reservation </p>
            </div>
        </div>
</body>
</html>