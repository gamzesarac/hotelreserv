<%@page import="Reservation.hotelroom"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>



<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

    </head>
    <h1><i>Enter Your Reservation Entries</i></h1>

    <style>
        table {
            width:35%;
        }
        table, th, td {
            border: 1px solid black;
            border-collapse: collapse;
        }
        th, td {
            padding: 5px;
            text-align: left;
        }
        table#t01 tr:nth-child(even) {
            background-color: #eee;
        }
        table#t01 tr:nth-child(odd) {
            background-color:#fff;
        }
        table#t01 th {
            background-color: black;
            color: white;
        }
        div.ex1 {
            direction: rtl;


        </style>
    </head>
    <body>
        <form action="rezervasyonyapildi.jsp" action="GET"> 
            <font color="black"><strong>First name: </strong> <input type="text" name="firstName" required />
            <br/><br/>

            <strong>Last name:  </strong><input type="text" name="lastName" required/>
            <br/><br/>

            <strong>User name:  </strong><input type="text" name="userName" required />
            <br/><br/>  

            <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
                <script src="//code.jquery.com/jquery-1.10.2.js"></script>
                <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
                <link rel="stylesheet" href="/resources/demos/style.css">
                    <script>
                        $(function() {
                            $("#datepicker").datepicker();
                        });
                    </script>
                    <p> <strong>Check-in Date:  </strong><input type="text" id="datepicker" name="datepicker" required></p>

                        <br/><br/> 

                        <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
                            <script src="//code.jquery.com/jquery-1.10.2.js"></script>
                            <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
                            <link rel="stylesheet" href="/resources/demos/style.css">
                                <script>
                                    $(function() {
                                        $("#datepicker1").datepicker();
                                    });
                                </script>
                                <p> <strong>Check-out Date: </strong> <input type="text" id="datepicker1" name="datepicker1" required></p>
                                    <br/><br/>

                                    <strong>Reservation Date:</strong>
                                    <%

                                        Date date = new Date();
                                        out.print("" + date.toString() + "");
                                    %>
                                    <br/><br/>
                                    <br/><br/> 

                                    <strong>Check Your Room Type</strong>
                                    <br/><br/> 
                                    <table id="t01">
                                      
                                        <tr>
                                           <th></th>
                                            <th>Choose</th>
                                            <th>Oda Type</th>
                                            <th>Cost</th>
                                            
                                        </tr>
                                        <tr>
                                            <td>*</td>
                                             <td><input type="radio" name="oda" value="standardroomproperty" checked ><br></td>
                                            <td>Standard Room Property</td>
                                            <td><% String o="standardroomproperty";
            
           
            hotelroom standard=new hotelroom();
              String mstandard=standard.takeRoomType(standard.takeroomid(o));
          
           
            int s=standard.takeroomid(mstandard);
            Double standards=standard.takeRoomCost(s);
            out.println(standards);  %></td>
                                            
                                            </tr>
                                            <tr>
                                                <td>**</td>
                                                 <td> <input type="radio" name="oda" value="luxuryroomproperty"><br></td>
                                                <td>Luxury Room Property</td>
                                                 <td><% String od="luxuryroomproperty";
            
           
            hotelroom luxury=new hotelroom();
              String mluxury=luxury.takeRoomType(luxury.takeroomid(od));
          
           
            int sluxury=luxury.takeroomid(mluxury);
            Double luxurys=luxury.takeRoomCost(sluxury);
            out.println(luxurys);  %></td>
                                               
                                                </tr>
                                                <tr>
                                                    <td>***</td>
                                                    <td> <input type="radio" name="oda" value="premiumroomproperty"></td>
                                                    <td>Premium Room Property</td>
                                                     <td><% String oda="premiumroomproperty";
            
           
            hotelroom prem=new hotelroom();
              String mprem=prem.takeRoomType(prem.takeroomid(oda));
          
           
            int sprem=prem.takeroomid(mprem);
            Double premi=prem.takeRoomCost(sprem);
            out.println(premi);  %></td></td>
                                                   
                                                    </tr>
                                                    </table>


                                                    <br/><br/>
                                                    <br/><br/>  

                                                    <strong> User Message: </strong> <textarea name="userMessage" placeholder="" /></textarea>
                                                    <br/><br/>
                                                    <br/><br/> 


                                                    <strong>What's your purpose on holiday: </strong> <br/>
                                                    <input type="radio" name="purpose" value="Bussiness" >Bussiness
                                                        <input type="radio" name="purpose" value="Entertainment" >Entertainment
                                                            <br/><br/>  

                                                            <input type="submit" name="submit" value="MakeReservation" />
                                                            <div class="ex1"><strong><i>Have A Nice Vacation</i></strong></div><font color="black"></font>
                                                            <br></br>
                                                            <div class="ex1"><strong><i>HOTEL RESERVATION SYSTEM</i></strong></div><font color="black"></font>
                                                            </div>


                                                            </form>


                                                            </body>
                                                            </html>
