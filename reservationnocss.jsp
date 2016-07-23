<%@page import="db.user"%>
<%@page import="java.util.Date"%>

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

        String firstname = u.takeFirstname(usernamee); %>

<html>
    <head>

<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

</head>
 <h1><i>Rezervasyon Bilgilerinizi Giriniz</i></h1>
     <style>
         table {
    width:35%;
}
table, th, td {
    border: 1px solid black;
    border-collapse: collapse;
}
th, td {
    padding: 5px;
    text-align: left;
}
table#t01 tr:nth-child(even) {
    background-color: #eee;
}
table#t01 tr:nth-child(odd) {
   background-color:#fff;
}
table#t01 th {
    background-color: black;
    color: white;
}
        div.ex1 {
    direction: rtl;
    
</style>
</head>
<body>
    <form action="rezervasyonyapildi.jsp" action="post"> 
     <font color="black"><strong>First name: </strong> <input type="text" name="firstName" />
    <br/><br/>
    
     <strong>Last name:  </strong><input type="text" name="lastName" />
    <br/><br/>
    
     <strong>User name:  </strong><input type="text" name="userName" />
    <br/><br/>  
    
  <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script>
  $(function() {
    $( "#datepicker" ).datepicker();
  });
  </script>
      <p> <strong>Check-in Date:  </strong><input type="text" id="datepicker" name="datepicker"></p>
<br/><br/> 
      <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script>
  $(function() {
    $( "#datepicker1" ).datepicker();
  });
  </script>
      <p> <strong>Check-out Date: </strong> <input type="text" id="datepicker1" name="datepicker1"></p>
      <br/><br/>
      
      <strong>Reservation Date:</strong>
        <%
         Date date = new Date();
        out.print( "" +date.toString()+"");
        %>
      <br/><br/>
      <br/><br/> 
      
<strong>Oda Tipini Seçin</strong>
      <br/><br/> 
 <table id="t01">
  <tr>
    <th>Azami</th>
    <th>Oda Tipi</th>
    <th>Fiyatlar</th>
    <th>Seç</th>
  </tr>
  <tr>
    <td>*</td>
    <td>Tek Kisilik Oda</td>
    <td>50</td>
    <td> <input type="radio" name="oda" value="tekkisi" checked>Sec<br></td>
  </tr>
  <tr>
    <td>**</td>
    <td>Çift Kisilik Oda</td>
    <td>100</td>
    <td>  <input type="radio" name="oda" value="ciftkisi"> Sec<br></td>
  </tr>
  <tr>
    <td>**</td>
    <td>Çift Kisilik Oda</td>
    <td>100</td>
    <td>  <input type="radio" name="oda" value="cciftkisi"> Sec</td>
  </tr>
</table>
    <br/><br/>
    <br/><br/>  
    
       <strong> User Message: </strong> <textarea name="userMessage" placeholder="" /></textarea>
    <br/><br/>
    <br/><br/> 
    
    
       <strong>What's your purpose on holiday: </strong> <br/>
       <input type="radio" name="purpose" value="Bussiness" >Gezme
       <input type="radio" name="purpose" value="Entertainment" >Is
      <br/><br/>  
      
    <input type="submit" name="submit" value="Rezervasyon Yap" />
    <div class="ex1"><strong><i>iyi tatiller dileriz</i></strong></div><font color="black"></font>
<br></br>
<div class="ex1"><strong><i>HOTEL RESERVATION SYSTEM</i></strong></div><font color="black"></font>
</div>
    </form>
    
    
</body>
</html>