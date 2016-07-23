<%-- 
    Document   : rezervasyonyapildi.jsp
    Created on : 02.Tem.2016, 20:08:57
    Author     : asus1
--%>

<%@page import="db.user"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
          String usernamee = (String)session.getAttribute("username");
        user u=new user(usernamee);
        String type = u.checkTypePages(usernamee);
        int checkk = Integer.parseInt(type); %>
       <% if(checkk != 3 || checkk ==-1){ %>
        <jsp:forward page="login.html"/>
        <% } 
        if(session.getAttribute("username") == null){
            response.sendRedirect("index.jsp");
        }

        String firstname = u.takeFirstname(usernamee); %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
</head>
<body>
    <h1>Rezervasyonunuz Yapildi!</h1>
  
    
     <%  
    try{
            Connection connection = null;
            
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/hotelreservationdb",
            "root", "");
            
            Statement statement = connection.createStatement();
            String cindate=request.getParameter("datepicker");
            String message=request.getParameter("userMessage");
            String coutdate=request.getParameter("datepicker1");
           
            
            
            Date td = new Date();
            String bcheckin = new String(cindate);
            SimpleDateFormat format = new SimpleDateFormat("YYYY-MM-dd");
            bcheckin = format.format(td); 
            
            Date t = new Date();
            String bcheckout = new String(coutdate);
            SimpleDateFormat format1 = new SimpleDateFormat("YYYY-MM-dd");
            bcheckout= format1.format(t);
             
            Date t1 = new Date();
            String btoday = new String("");
            SimpleDateFormat format2 = new SimpleDateFormat("YYYY-MM-dd");
            btoday = format2.format(t1);
    
            String command = "INSERT INTO reservation VALUES(NULL,'4','2','"+bcheckin+"','"+bcheckout+"','"+message+"','"+btoday+"','0');";
            statement.executeUpdate(command);
    }catch(Exception ex){
            out.println(ex);
        }   
           
        %>
        
</body>
</html>