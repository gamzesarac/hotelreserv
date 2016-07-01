<%@page import="db.user"%>
<!DOCTYPE html>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:setProperty name = "dbbean" property = "*" />
<html lang="en">
<head>
  <title>User Page</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  <style>
    /* Remove the navbar's default margin-bottom and rounded borders */
    .navbar {
      margin-bottom: 0;
      border-radius: 0;
    }
    
    /* Set height of the grid so .sidenav can be 100% (adjust as needed) */
    .row.content {height: 450px}
    
    /* Set gray background color and 100% height */
    .sidenav {
      padding-top: 20px;
      background-color: #f1f1f1;
      height: 100%;
    }
    
    /* Set black background color, white text and some padding */
    footer {
      background-color: #555;
      color: white;
      padding: 15px;
    }
    
    /* On small screens, set height to 'auto' for sidenav and grid */
    @media screen and (max-width: 767px) {
      .sidenav {
        height: auto;
        padding: 15px;
      }
      .row.content {height:auto;}
    }
  </style>
</head>
<body>
 <%
        String username = (String)session.getAttribute("username");
        user u=new user(username);
        String type = u.checkTypePages(username);
        int check = Integer.parseInt(type); %>
       <% if(check != 2 || check ==-1){ %>
        <jsp:forward page="loginError_1.html"/>
        <% } 
        if(session.getAttribute("username") == null){
            response.sendRedirect("index.jsp");
        }

        String firstname = u.takeFirstname(username);
        ResultSet table=u.takeUserInfo(username);

   
    %>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="user.jsp">Hotel Reservation</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="user.jsp">Home</a></li>
        <li><a href="#">Hotels</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="logout.jsp"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
      </ul>
    </div>
  </div>
</nav>
  
<div class="container-fluid text-center">
  <div class="row content">
    <div class="col-sm-2 sidenav">

    </div>
    <div class="col-sm-8 text-left">

      <hr>
       <h2>Edit Information Page</h2>
            <p>
            <form method="post" action="editInfoAction.jsp">
                <table>
                    
                    <tr> 
                     
                        <tr><td>First name<sup></sup> (*):</td>
                        <td><input type="text" name="firstname" value= <%out.print(table.getString("firstname"));%> /></td></tr>
                        
                        <tr><td>Last name (*):</td>
                        <td><input type="text" name="lastname" value= <%out.print(table.getString("lastname"));%> /></td></tr>
                        
                        
                        <tr><td>Password (*):</td>
                        <td><input type="password" name="password" value= <%out.print(table.getString("password"));%> /></td></tr>
                     
                        
                        <tr><td>Birthdate :</td>
                        <td><input type="date" name="birthdate" value= <%out.print(table.getString("birthdate"));%> /></td></tr>                        
        
                        <tr><td>Telephone :</td>
                        <td><input type="text" name="telephone" value= <%out.print(table.getString("telephone"));%> /></td></tr>
                        
                        <tr><td>Email (*):</td>
                        <td><input type="text" name="email" value= <%out.print(table.getString("email"));%> /></td></tr>
                        
                        <tr><td>Addresss Information:</td> 
                        <td><input type="text" name="address" value= <%out.print(table.getString("address"));%> /></td></tr>
                        
                        <tr><td>SSN :</td>
                        <td><input type="text" name="ssn" value= <%out.print(table.getString("ssn"));%> /></td></tr>
    
                        
                        
                        <tr><td></td><td><input type="submit" name="Apply" value="Apply" style="width: 125px; background-color: white; border-color: white; color: brown"/></td>
<!-- #2B374A -->
                    </tr>
                    <%%>
                </table>
            </form>
    </div>
    <div class="col-sm-2 sidenav">
        <a href="user.jsp"><h4 style="color: black; font-style: italic;">Welcome : <%= firstname %> </h4></a>
      <div class="well">
          
          
        <p style="font-weight: bolder; font-size: larger;">Facebook</p>
      </div>
      <div class="well">
          <p style="font-weight: bolder; font-size: larger;">Twitter</p>
      </div>
    </div>
  </div>
</div>

<footer class="container-fluid text-center">
  <p>Contact us</p>
</footer>

</body>
</html>

