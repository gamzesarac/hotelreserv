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
          boolean b= true;
          int user_id=u.takeUserId(username);
            String hotelname = request.getParameter("hotelname");
            if(hotelname.equals("")){ b=false;
                %> <SCRIPT LANGUAGE='JavaScript'>
    window.alert('Please enter your HOTELS NAME!!')
     window.location.href='hotelindex.jsp'
    </SCRIPT>   <%  }         
            
            
          String hotelinfo = request.getParameter("hotelInfo");
            if(hotelinfo.equals("")){ b=false;
                %> <SCRIPT LANGUAGE='JavaScript'>
    window.alert('Please enter your HOTELS INFO!!')
     window.location.href='hotelindex.jsp'
    </SCRIPT>   <%    }      
          
          
          String hoteladdress = request.getParameter("hoteladdress");
            if(hoteladdress.equals("")){ b=false;
                %> <SCRIPT LANGUAGE='JavaScript'>
    window.alert('Please enter your HOTELS STREET!!')
     window.location.href='hotelindex.jsp'
    </SCRIPT>   <%   }           
          
          String hotelcity = request.getParameter("hotelcity");
           if(hotelcity.equals("")){ b=false;
                %> <SCRIPT LANGUAGE='JavaScript'>
    window.alert('Unknown CITY!!')
     window.location.href='hotelindex.jsp'
    </SCRIPT>   <% }
          String hotelstate = request.getParameter("hotelstate");
           if(hotelstate.equals("")){ b=false;
                %> <SCRIPT LANGUAGE='JavaScript'>
    window.alert('Unknown STATE !!')
     window.location.href='hotelindex.jsp'
    </SCRIPT>   <%   }       
          
          String hoteltelephone = request.getParameter("hoteltelephone");
           if(hoteltelephone.equals("")){ b=false;
                %> <SCRIPT LANGUAGE='JavaScript'>
    window.alert('Please enter your HOTELS TELEPHONE !!')
     window.location.href='hotelindex.jsp'
    </SCRIPT>   <%     }     
          String city_id = request.getParameter("city_id");
           if(city_id.equals("")){ b=false; 
                %> <SCRIPT LANGUAGE='JavaScript'>
    window.alert('Unknown CITY ID !!')
     window.location.href='hotelindex.jsp'
    </SCRIPT>   <%    }      
          String state_idd = request.getParameter("state_id");
           if(state_idd.equals("")){ b=false; 
                %> <SCRIPT LANGUAGE='JavaScript'>
    window.alert('Unknown STATE ID !!')
     window.location.href='hotelindex.jsp'
    </SCRIPT>   <%    }       
          String distinct_id = request.getParameter("distinct_id");
           if(distinct_id.equals("")){ b=false;
                %> <SCRIPT LANGUAGE='JavaScript'>
    window.alert('Unknown DISTINCT ID !!')
     window.location.href='hotelindex.jsp'
    </SCRIPT>   <%   }       
          String distinctname = request.getParameter("distinctname");
              
            
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
          int distinct_idd = Integer.parseInt(distinct_id); 
          
          hotel h = new hotel();
          if(b){ 
          boolean isSuccess = h.addHotel(hotelname, hotelinfo, hoteladdress, hoteltelephone, user_id, state_id, distinct_id, distinct_idd);          

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
        %> <SCRIPT LANGUAGE='JavaScript'>
            window.alert('You Have Already Added a Hotel to same street before!!!')
            window.location.href='registerhotel.jsp'
    </SCRIPT>   <%
        }
          }else{

                %> <SCRIPT LANGUAGE='JavaScript'>
    window.alert('Unknown ERROR !!')
     window.location.href='hotel.jsp'
    </SCRIPT>   <% }    
           
        
    %>

    </body>
</html>