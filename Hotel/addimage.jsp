<!DOCTYPE html>
<html lang="en">
    <head>
    <head>
        <title>Hotel Room Add Page</title>
        <meta charset="utf-8">
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
        <link rel="stylesheet" href="../style.css" type="text/css" />
    </head>
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
                <h2 style="font-size: 120%; color: blue">Please enter the room images.</h2>

                <div class="divider"></div>

                <form name="hotelreservationform" method="post" action="uploadServlet">                                
                    <table>
                        <tr>
                            <td>For Standard Room: </td>
                            <td><input type="file" name="photo" size="50"/></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <input type="submit" value="Save">
                            </td>
                        </tr>
                    </table>
                </form>
                <form>
                    <br/><br/>
            </div>

            <div class="divider"></div>

            <div id="footer">
                <p>&copy; 2016 Hotel Reservation </p>
            </div>
        </div>
    </body>
</html>