
<%@page import="db.user"%>
<%@page import="Reservation.hotel"%>
<%@page import="java.sql.Statement"%>
<%@page import="Reservation.hotelroom"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="Reservation.reservation"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="connact.jsp" %>

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

        String firstname = u.takeFirstname(usernamee);
        int userid= u.takeUserId(usernamee);
        %>

<!DOCTYPE html>
<html lang="en">
    <head>
   
    
     <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
    <link rel="stylesheet" href="style.css" type="text/css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
</head>
<body>
    <div id="containerr">
  <ul id="nav">
    <li><a href="contact.jsp" title="contact">contact</a></li>
    <li><a href="logout.jsp" title="logout">logout</a></li>
  </ul>
      <div class="divider"></div>
  <div id="header">
      <h1><a href="user.jsp">Hotel Reservation</a><span>Isik University</span></h1>
  </div>
       <div class="divider"></div>
  <div id="sidebar">   
  </div>
       <div id="main">
     <form action="goster.jsp" action="POST"> 
   <%
       try{
                  int a=0;
 String iskontrol=request.getParameter("purpose");
 int is=Integer.parseInt(iskontrol);

  if(is==1){
      a=1;
   }
      
if(is==2){
    a=0;
}

            String hoteli=request.getParameter("hoteliddi");
   int hotelidds=Integer.parseInt(hoteli);
   

        
   
             Connection connection=null;
             Class.forName("com.mysql.jdbc.Driver");
             connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/hotelreservationdb","root","");
             Statement statement=connection.createStatement();
             hotel c=new hotel();
           
           
            String cindate=request.getParameter("datepicker");
            String message=request.getParameter("userMessage");
            String coutdate=request.getParameter("datepicker1");
             String rooms=request.getParameter("ddlViewBy");
            hotelroom h=new hotelroom();
            int roomaydi=h.takeroomaydi(rooms);
            reservation res =new reservation();
        
         
       
                                   
         
     
          int pnrcode = (int)(Math.random()*1000000000+1000000000);
         String pnr = Long.toString(pnrcode);
        
              
            
            DateFormat s = new SimpleDateFormat("MM/dd/yyyy");
            Date startDate1 = s.parse(cindate); 
            Date endDate1 = s.parse(coutdate); 
            
            boolean succ=res.datetodate(startDate1, endDate1);
            
            
            if(succ==false ){ 
  
            
              
   //String redirectURL = "oda.jsp";
 //response.sendRedirect(redirectURL);}
        %> <SCRIPT LANGUAGE='JavaScript'>
    window.alert('Checkin Tarihiniz CheckOut Tarihinizden Önce Seçilmiş.Lütfen Değiştiriniz!')
     window.location.href='search.jsp'
    </SCRIPT>   
        
   <%} 
           
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
      
        
       /*  String comm="UPDATE hotelrooms set roomCount=roomCount-'1' where hotelid='"+hotelidds+"' AND roomname='"+rooms+"'"; */
       // statement.executeUpdate(comm);

          int roomCount=c.hotelroomcount(hotelidds, rooms);
          if(roomCount>0){
         
          
          
        String command="INSERT INTO reservation (userid, roomid, checkin, checkout, usermessage, reservationdate,pnr,isPaid) VALUES('"+userid+"','"+roomaydi+"','"+bcheckin+"','"+bcheckout+"','"+message+"','"+btoday+"','"+pnr+"','"+a+"');";
        statement.executeUpdate(command);
         
          int cc = c.roomcountdecrease(hotelidds, rooms);
         
          
   out.println("Reservation Has Done Successfully");
          
           %>
          
              <input type="submit" name="submit" value="See Your Reservation" />
                
            <%  
       }else{
              //response.sendRedirect("reservationnocss.jsp");
              %> <SCRIPT LANGUAGE='JavaScript'>
    window.alert('Try Another Room!')
     window.location.href='search.jsp'
    </SCRIPT>  <% 
          }
       }
       catch(Exception ex){
           out.println(ex);
       } 

            %>
           
     </form>      
  </div>
 
<div id="footer">
    <p>&copy; 2016 Hotel Reservation </p>
  </div>
     </div>    
</body>
</html>
