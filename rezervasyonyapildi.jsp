<%-- 
    Document   : rezervasyonyapildi.jsp
    Created on : 02.Tem.2016, 20:08:57
    Author     : asus1
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="connact.jsp" %>
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
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/hotelreservationdb", "", "");

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
    
            String command = "INSERT INTO reservation VALUES(NULL,'1','1','"+bcheckin+"','"+bcheckout+"','"+message+"','"+btoday+"','0');";
            statement.executeUpdate(command);
    }catch(Exception ex){
            out.println(ex);
        }   
           
        %>
        
</body>
</html>
