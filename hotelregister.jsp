<%@page import="db.hotelroom"%>
<%@page import="db.user"%>
<%@page import="db.hotel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<!DOCTYPE html>
<%
if(session.getAttribute("username") == null){
        response.sendRedirect("../login.html");
    }
%>
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
            String hotelname = request.getParameter("hotelname");
          String hotelinfo = request.getParameter("hotelInfo");
          String hoteladdress = request.getParameter("hoteladdress");
          String hotelcity = request.getParameter("hotelcity");
          String hotelstate = request.getParameter("hotelstate");
          String hoteltelephone = request.getParameter("hoteltelephone");
          String city_id = request.getParameter("city_id");
          String state_idd = request.getParameter("state_id");
            
          //String standartroomsize = session.getAttribute("standardroomsize").toString();
         // int standart = Integer.parseInt(standartroomsize);
         // String luxuryroomsize = session.getAttribute("luxuryroomsize").toString();
         // int luxury = Integer.parseInt(luxuryroomsize); 
         // String premiumroomsize = session.getAttribute("premiumroomsize").toString();
         // int premium = Integer.parseInt(premiumroomsize);  
         // String standartcost = session.getAttribute("standartcost").toString();
         // String luxurycost = session.getAttribute("luxurycost").toString();
          //String premiumcost = session.getAttribute("premiumcost").toString();
          
          int state_id = Integer.parseInt(state_idd);
          
          hotel h = new hotel();
          boolean isSuccess = h.addHotel(hotelname, hotelinfo, hoteladdress, hoteltelephone, user_id, state_id);          

                if (isSuccess) { 
                //int hotelid = h.takeHotelId(hotelname);
                //hotelroom r = new hotelroom();
                //for(int i=0; i<standart; i++)
                //    r.addHotelRoom("standart", standartcost, hotelid);
               // for(int i=0; i<luxury; i++)
               //     r.addHotelRoom("luxury", luxurycost, hotelid);
               // for(int i=0; i<premium; i++)
               //     r.addHotelRoom("premium", premiumcost, hotelid);   
                    
            String redirectURL = "hotel.jsp";
            response.sendRedirect(redirectURL);
            
                }
        
                else {
           String redirectURL = "hotelnotregistered.jsp";
           response.sendRedirect(redirectURL);
        }
            
           
        
    %>

    </body>
</html>