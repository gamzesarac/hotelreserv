<%@page import="db.user"%>
<%@page import="Reservation.hotel"%>
<%@page import="Reservation.hotelroom"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>

<%
   
        String usernamee = (String)session.getAttribute("username");
        user u=new user(usernamee);
        String type = u.checkTypePages(usernamee);
        int checkk = Integer.parseInt(type); 
        
        if(session.getAttribute("username") == null){
            response.sendRedirect("login.html");
        }

        String firstname = u.takeFirstname(usernamee); %>
<html lang="en"> 
    <head>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  
  
  
  
  
 <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  
  
  
  
  
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  
</head>

    </head>
    <h1><i>Enter Your Reservation Entries</i></h1>

          <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
     <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
    <link rel="stylesheet" href="style.css" type="text/css" />
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
              <div id="containerr">
  <ul id="nav">
    <li><a href="contact.jsp" title="contact">contact</a></li>
    <li><a href="logout.jsp" title="logout">logout</a></li>
  </ul>
      <div class="divider"></div>
  <div id="header">
      <h1><a href="user.jsp">Hotel Reservation</a><span>Isik University</span></h1>
  </div>
       <div class="divider"></div>
  <div id="sidebar">   
  </div>
       <div id="main">
        <form action="rezervasyonyapildi.jsp" action="GET"> 
            <%
                hotel c=new hotel();
                
   String hoteli=request.getParameter("hotelidd");
   int hotelidds=Integer.parseInt(hoteli);
   
   %> <input type="hidden" name="hoteliddi" value="<%=hotelidds%>"> <%
                
                %>
            <font color="black" style=" font-size: 15px;"><strong>First name: </strong> <% out.print(session.getAttribute("firstname"));  %>
            <br/><br/>
 <br/><br/>
                                                   
 <strong>Last name:  </strong><% out.print(session.getAttribute("lastname")) ; %>
            <br/><br/>
<br/><br/>
<strong>User name:  </strong><% out.print(session.getAttribute("username")); %>
            <br/><br/>  
<br/><br/>
            <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
                <script src="//code.jquery.com/jquery-1.10.2.js"></script>
                <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
                <link rel="stylesheet" href="/resources/demos/style.css">
                    <script>
                        $(function() {
                            $("#datepicker").datepicker({minDate:0});
                        });
                    </script>
                    <p> <strong>Check-in Date:  </strong><input type="text" id="datepicker" name="datepicker" required></p>

                        <br/><br/> 
<br/><br/>
                        <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
                            <script src="//code.jquery.com/jquery-1.10.2.js"></script>
                            <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
                            <link rel="stylesheet" href="/resources/demos/style.css">
                                <script>
                                    $(function() {
                                        $("#datepicker1").datepicker({minDate:0});
                                    });
                                </script>
                                <p> <strong>Check-out Date: </strong> <input type="text" id="datepicker1" name="datepicker1" required></p>
                                    <br/><br/>
<br/><br/>
                                    <strong>Reservation Date:</strong>
                                    <%

                                        Date date = new Date();
                                        out.print("" + date.toString() + "");
                                    %>
                                    <br/><br/>
                                    <br/><br/> 

                                    Choose Your Room Type
                                     <br/><br/>
<select name="ddlViewBy">
    <option value=""> </option>
  <option value="Standart Room ">Standart Room </option>
  <option value="Luxury Room" selected="selected">Luxury Room </option>
  <option value="Premium Room">Premium Room</option>
</select>
                                     
                                  
                                     
                                    
                                     <br/><br/>
                                                    <br/><br/> 
                                                    <strong> User Message: </strong> <textarea name="userMessage" placeholder="" /></textarea>
                                                    <br/><br/>
                                                    <br/><br/> 
 <script type="text/javascript">
        function show() { 
           
            document.getElementById('area').style.display = 'block'; 
            document.getElementById('text').style.display = 'block'; 
            document.getElementById('alan').style.display = 'block'; 
             document.getElementById('blank').style.display = 'block'; 
             
  
    }
    function hide(){
        document.getElementById('area').style.display = 'none'; 
        document.getElementById('text').style.display = 'none'; 
        document.getElementById('alan').style.display = 'none'; 
        document.getElementById('blank').style.display = 'none'; 
  
    }
       
      </script>

                                                      <input type="radio" name="purpose" value="1" onclick="hide();" required="required" >Otel Payment
        <br></br>
    <input type="radio" name="purpose" value="2" onclick="show();" required="required" >Credit Card(Name,Cvc,Number,Password)
       
     <input id="area" style="display: none;" NAME="data" > 
           <br></br>
   <input id="text" style="display: none;" name="cvc" >  
          <br></br>
      <input id="alan" style="display: none;" type="password" NAME="password"  > 
        <br></br>
     <input id="blank" style="display: none;"type="password" name="creditcard">

 
  

                                                            <br/><br/>  

                                                            <input type="submit" name="submit" value="MakeReservation" />
                                                            <div class="ex1"><strong><i>Have A Nice Vacation</i></strong></div><font color="black"></font>
                                                            <br></br>
                                                            <div class="ex1"><strong><i>HOTEL RESERVATION SYSTEM</i></strong></div><font color="black"></font>
                                                            


                                                            </form>



       </div>
 
<div id="footer">
    <p>&copy; 2016 Hotel Reservation </p>
  </div>
     </div>                                                       </body>
                                                            </html>
