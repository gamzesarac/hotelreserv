

<%@page import="java.text.DateFormat"%>
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
    <h1>Rezervasyon</h1>
    <form action="goster.jsp" action="POST"> 
   
     <%  
    try{
            Connection connection = null;
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/hotelreservationdb", "root", "melis");

            Statement statement = connection.createStatement();
            String cindate=request.getParameter("datepicker");
            String message=request.getParameter("userMessage");
            String coutdate=request.getParameter("datepicker1");
            

            Date td = new Date();
            String btoday = new String("");
            SimpleDateFormat format = new SimpleDateFormat("YYYY-MM-dd");
            btoday = format.format(td);
            
            
            
          
 
DateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
Date startDate = sdf.parse(cindate);
            
       out.println(sdf.format(startDate));      
      DateFormat format1 = new SimpleDateFormat("YYYY-MM-dd");
       String bcheckin = format1.format(startDate);
    
       
       
            DateFormat sd = new SimpleDateFormat("MM/dd/yyyy");
Date endDate = sd.parse(coutdate);
            
       out.println(sd.format(startDate));      
      DateFormat format2 = new SimpleDateFormat("YYYY-MM-dd");
       String bcheckout = format2.format(endDate);
            
            
         String command = "INSERT INTO reservation VALUES(NULL,'1','1','"+bcheckin+"','"+bcheckout+"','"+message+"','"+btoday+"','0');";
            statement.executeUpdate(command);
              %> 
            <input type="submit" name="submit" value="RezervasyonBilgileri için Tıklayın" />
           
            <% 
    }catch(Exception ex){
            out.println(ex);
        }   
           
        %>
         
           
            
    </form>
    
</body>
</html>
