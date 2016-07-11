<%@page import="db.hotelroom"%>
<%@page import="db.user"%>
<%@page import="db.hotel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>
    </head>
    <body>
        <%
          String username = (String)session.getAttribute("username"); 
          user u = new user();
          int user_id=u.takeUserId(username);
          String hotelname = session.getAttribute("hotelname").toString();
          String hotelinfo = session.getAttribute("hotelinfo").toString();
          String hoteladdress = session.getAttribute("hoteladdress").toString();
          String hotelcity = session.getAttribute("hotelcity").toString();
          String hotelstate = session.getAttribute("hotelstate").toString();
          String hoteltelephone = session.getAttribute("hoteltelephone").toString();
          String city_id = session.getAttribute("city_id").toString();
          String state_idd = session.getAttribute("state_id").toString();
          String standartroomsize = session.getAttribute("standardroomsize").toString();
          int standart = Integer.parseInt(standartroomsize);
          String luxuryroomsize = session.getAttribute("luxuryroomsize").toString();
          int luxury = Integer.parseInt(luxuryroomsize); 
          String premiumroomsize = session.getAttribute("premiumroomsize").toString();
          int premium = Integer.parseInt(premiumroomsize);  
          String standartcost = session.getAttribute("standartcost").toString();
          String luxurycost = session.getAttribute("luxurycost").toString();
          String premiumcost = session.getAttribute("premiumcost").toString();
          
          int state_id = Integer.parseInt(state_idd);
          
          hotel h = new hotel();
          boolean isSuccess = h.addHotel(hotelname, hotelinfo, hoteladdress, hoteltelephone, user_id, state_id);          

                if (isSuccess) { 
                int hotelid = h.takeHotelId(hotelname);
                hotelroom r = new hotelroom();
                for(int i=0; i<standart; i++)
                    r.addHotelRoom("standart", standartcost, hotelid);
                for(int i=0; i<luxury; i++)
                    r.addHotelRoom("luxury", luxurycost, hotelid);
                for(int i=0; i<premium; i++)
                    r.addHotelRoom("premium", premiumcost, hotelid);   %>           
              <jsp:forward page="hotelregistered.html"/>
                    
            <% } else {%>
                
                <jsp:forward page="hotelnotregistered.html"/>
            <% }
        
    %>

    </body>
</html>