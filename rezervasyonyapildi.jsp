<%-- 
    Document   : rezervasyonyapildi1
    Created on : 15.Tem.2016, 12:30:42
    Author     : asus1
--%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="Reservation.reservation"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
</head>
<body>
     <form action="goster.jsp" action="POST"> 
   <%
       try{
            int reservationid=1;
            int userid=1;
            int roomid=1;
            int isCancelled=1;
            String cindate=request.getParameter("datepicker");
            String message=request.getParameter("userMessage");
            String coutdate=request.getParameter("datepicker1");
           String rooms=request.getParameter("oda");
            reservation res =new reservation();
         
        
            Date td = new Date();
            String btoday = new String("");
            SimpleDateFormat format = new SimpleDateFormat("YYYY-MM-dd");
            btoday = format.format(td);
            
           
           DateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
           Date startDate = sdf.parse(cindate);      
           DateFormat format1 = new SimpleDateFormat("YYYY-MM-dd");
           String bcheckin = format1.format(startDate);
    
       
       
           DateFormat sd = new SimpleDateFormat("MM/dd/yyyy");
           Date endDate = sd.parse(coutdate);    
          DateFormat format2 = new SimpleDateFormat("YYYY-MM-dd");
          String bcheckout = format2.format(endDate);
      
         int roomaydi=res.takeroomid(rooms);
         boolean success=res.addreservation(reservationid, userid, roomaydi,bcheckin,bcheckout,message, btoday, isCancelled);  
         
          if (success) {
              
   out.println("Rezervasyonunuz Başarılı Bir Şekilde Tamamlandı");
           %>
          
              <input type="submit" name="submit" value="RezervasyonBilgileri için Tıklayın" />
                
            <% } 
       }catch(Exception ex){
           out.println(ex);
       } 

            %>
           
     </form>      
  
</body>
</html>
