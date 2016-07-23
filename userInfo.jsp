<%@page import="db.user"%>
<!DOCTYPE html>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:setProperty name = "dbbean" property = "*" />
<html lang="en">
<head>
<title>User Page</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="stylesheet" href="style.css" type="text/css" />
  <style>
      #messageLink {background-color: white;
                      border: 0;
                      cursor: pointer;
                      font-weight: bold;
                      /* text-decoration: underline; */
                      color: #014ccc;
                      font-style: initial;
                      }
      
      
    
  </style>
</head>
<body>>
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
        String idd = (String)session.getAttribute("useridd");
        int uid = Integer.parseInt(idd);
        
        String firstname = u.takeFirstname(username);
        ResultSet table=u.takeUserInfo(uid);

   
    %>
<div id="containerr">
  <ul id="nav">
    <li><a href="contact.jsp" title="contact">contact</a></li>
    <li><a href="logout.jsp" title="logout">logout</a></li>
  </ul>
      <div class="divider"></div>
  <div id="header">
      <h1><a href="hotel.jsp">Hotel Reservation</a><span>Isik University</span></h1>
  </div>
       <div class="divider"></div>
  <div id="sidebar">
    <a href="hotel.jsp"><h4 style="color: #014ccc; font-style: italic;">Welcome : <%= firstname %> </h4></a>
  </div>
       <div id="main">

      <hr>
       <h2>Customer Details</h2>
            <p>
            <form method="post" action="editInfoAction.jsp">
                <table>
                    
                    <tr> 
                     
                        <tr><td>First name<sup></sup> (*):</td>
                        <td><input type="text" name="firstname" value= <%out.print(table.getString("firstname"));%> DISABLED/></td></tr>
                        
                        <tr><td>Last name (*):</td>
                        <td><input type="text" name="lastname" value= <%out.print(table.getString("lastname"));%> DISABLED/></td></tr>
                     
                        
                        <tr><td>Birthdate :</td>
                        <td><input type="date" name="birthdate" value= <%out.print(table.getString("birthdate"));%> DISABLED/></td></tr>                        
        
                        <tr><td>Telephone :</td>
                        <td><input type="text" name="telephone" value= <%out.print(table.getString("telephone"));%> DISABLED/></td></tr>
                        
                        <tr><td>Email (*):</td>
                        <td><input type="text" name="email" value= <%out.print(table.getString("email"));%> DISABLED/></td></tr>
                        
                        <tr><td>Addresss Information:</td> 
                        <td><input type="text" name="address" value= <%out.print(table.getString("address"));%> DISABLED/></td></tr>
                        
    
                        
                        
                        
<!-- #2B374A -->
                    </tr>
                    <%%>
                </table>
            </form>
     </div>

<div id="footer">
    <p>&copy; 2016 Hotel Reservation </p>
  </div>
 </div>
</body>
</html>