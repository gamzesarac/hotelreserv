<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<%-- 
    Document   : addHotelRoom
    Created on : Jul 12, 2016, 12:11:48 AM
    Author     : ONuR
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <% 
            
            String hotelid = session.getAttribute("hotelRoomID").toString();
           
            String standardroomsize = session.getAttribute("standardroomsize").toString();
            String luxuryroomsize = session.getAttribute("luxuryroomsize").toString();
            String premiumroomsize = session.getAttribute("premiumroomsize").toString();
            
            String standartcost = session.getAttribute("standartcost").toString();
            String luxurycost = session.getAttribute("luxurycost").toString();
            String premiumcost = session.getAttribute("premiumcost").toString();
            
            String[] standardroomscheckvalue = (String[])session.getAttribute("standardroomscheckvalue");
            String[] luxuryroompropertycheckvalue = (String[])session.getAttribute("luxuryroompropertycheckvalue");
            String[] premiumroompropertycheckvalue = (String[])session.getAttribute("premiumroompropertycheckvalue");
            
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hotelreservationdb", "root", "");
            Statement st = con.createStatement(); 
            
            ResultSet rs;
            
            st.executeUpdate("INSERT INTO hotelrooms(hotelid,roomname) VALUES("+hotelid+",'Standart Room')");
            st.executeUpdate("INSERT INTO hotelrooms(hotelid,roomname) VALUES("+hotelid+",'Luxury Room')");
            st.executeUpdate("INSERT INTO hotelrooms(hotelid,roomname) VALUES("+hotelid+",'Premium Room')");
            
            rs = st.executeQuery("select * from hotelrooms where roomname='Standart Room' AND hotelid="+hotelid);
            Statement st2 = con.createStatement(); 
            
            while(rs.next())
            {
                for(int i=0; i<standardroomscheckvalue.length; i++)
                {
                    st2.executeUpdate("INSERT INTO hotelextras(roomid,cost,extras) VALUES("+rs.getInt("roomid")+","+standartcost+",'"+standardroomscheckvalue[i]+"')");
                }
            }
            
            rs = st.executeQuery("select * from hotelrooms where roomname='Luxury Room' AND hotelid="+hotelid);
            Statement st3 = con.createStatement(); 
            
            while(rs.next())
            {
                for(int i=0; i<luxuryroompropertycheckvalue.length; i++)
                {
                    st3.executeUpdate("INSERT INTO hotelextras(roomid,cost,extras) VALUES("+rs.getInt("roomid")+","+luxurycost+",'"+luxuryroompropertycheckvalue[i]+"')");
                }
            }
            
            rs = st.executeQuery("select * from hotelrooms where roomname='Premium Room' AND hotelid="+hotelid);
            Statement st4 = con.createStatement(); 
            
            while(rs.next())
            {
                for(int i=0; i<premiumroompropertycheckvalue.length; i++)
                {
                    st4.executeUpdate("INSERT INTO hotelextras(roomid,cost,extras) VALUES("+rs.getInt("roomid")+","+premiumcost+",'"+premiumroompropertycheckvalue[i]+"')");
                }
            }
            
            String redirectURL = "hotel.jsp";
            response.sendRedirect(redirectURL);
            
        %>
        
        
    </body>
</html>
