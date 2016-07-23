
<%@page import="Reservation.hotel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="connact.jsp" %>
<!DOCTYPE html>
<html>


<body>

    <%
 
  
   Connection connection=null;
             Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
             connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/hotelreservationdb2","root","melis");
             Statement statement=connection.createStatement();
             

       
      Statement st2=connection.createStatement();
      String c="select imageaddress from hotelimage where hotel_hotelid=1";
      ResultSet image= st2.executeQuery(c);
          
       
     
       

  
   if(image.next())
          { %>
              
              <img src="<%out.print(image.getString("imageaddress"));  %>" height="200" weight ="200" >
             
 <%  } %>      
    
    
    

 
</body>
</html>
