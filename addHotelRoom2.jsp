<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
if(session.getAttribute("username") == null){
        response.sendRedirect("../login.html");
    }
%>



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
            ResultSet rs2;
            
            st.executeUpdate("UPDATE hotelrooms SET roomCount=roomCount+'"+standardroomsize+"' where hotelid='"+hotelid+"' and roomname='Standart Room'");
            st.executeUpdate("UPDATE hotelrooms SET roomCount=roomCount+'"+luxuryroomsize+"' where hotelid='"+hotelid+"' and roomname='Luxury Room'");
            st.executeUpdate("UPDATE hotelrooms SET roomCount=roomCount+'"+premiumroomsize+"' where hotelid='"+hotelid+"' and roomname='Premium Room'");
            
            rs = st.executeQuery("select * from hotelrooms where roomname='Standart Room' AND hotelid="+hotelid);
            rs.first();
            Statement st2 = con.createStatement(); 
            rs2 = st.executeQuery("select * from hotelextras where roomid='"+rs.getInt("roomid")+"'");
            rs2.first();           
            
            
            while(rs2.next()){
            st2.executeUpdate("DELETE from hotelextras where roomid="+rs2.getInt("roomid")+" and id="+rs2.getInt("id")+"");
            }
            rs = st.executeQuery("select * from hotelrooms where roomname='Standart Room' AND hotelid="+hotelid);
            while(rs.next())
            {
                for(int i=0; i<standardroomscheckvalue.length; i++)
                {
                    
                    st2.executeUpdate("INSERT INTO hotelextras(roomid,cost,extras) VALUES("+rs.getInt("roomid")+","+standartcost+",'"+standardroomscheckvalue[i]+"')");
                }
            }
            
            rs = st.executeQuery("select * from hotelrooms where roomname='Luxury Room' AND hotelid="+hotelid);
            rs.first();
            Statement st3 = con.createStatement(); 
            st3.executeUpdate("DELETE from hotelextras where roomid="+rs.getInt("roomid")+"");
                        rs2 = st.executeQuery("select * from hotelextras where roomid='"+rs.getInt("roomid")+"'");
            rs2.first();           
            
            
            while(rs2.next()){
            st2.executeUpdate("DELETE from hotelextras where roomid="+rs2.getInt("roomid")+" and id="+rs2.getInt("id")+"");
            }
            
            rs = st.executeQuery("select * from hotelrooms where roomname='Luxury Room' AND hotelid="+hotelid);
            while(rs.next())
            {
                for(int i=0; i<luxuryroompropertycheckvalue.length; i++)
                {
                    st3.executeUpdate("INSERT INTO hotelextras(roomid,cost,extras) VALUES("+rs.getInt("roomid")+","+luxurycost+",'"+luxuryroompropertycheckvalue[i]+"')");
                }
            }
            
            rs = st.executeQuery("select * from hotelrooms where roomname='Premium Room' AND hotelid="+hotelid);
            rs.first();
            Statement st4 = con.createStatement(); 
            st4.executeUpdate("DELETE from hotelextras where roomid="+rs.getInt("roomid")+"");
            rs2 = st.executeQuery("select * from hotelextras where roomid='"+rs.getInt("roomid")+"'");
            rs2.first();           
            
            
            while(rs2.next()){
            st2.executeUpdate("DELETE from hotelextras where roomid="+rs2.getInt("roomid")+" and id="+rs2.getInt("id")+"");
            }
            
            rs = st.executeQuery("select * from hotelrooms where roomname='Premium Room' AND hotelid="+hotelid);
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
