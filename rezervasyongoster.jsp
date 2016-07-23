<%-- 
    Document   : rezervasyongoster.jsp
    Created on : 08.Tem.2016, 16:29:25
    Author     : asus1
--%>

<%@page import="db.user"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>RezervasyonGoster</title>
</head>
<body>
    <h1>Rezervasyon Bilgilerinizi Buradan Görebilirsiniz!</h1>
    <br></br>
<font color="Red">Rezervasyonunuz Yapıldı.İşlem Bilgilerinizi Aşağıda görebilirsiniz...</font>
<br></br>
<font color="red">Adınız-Soyadınız-Kullanıcı İsminiz:</font> ${param.firstName} ${param.lastName} 
                        ${param.userName}

<br></br>
<font color="red">Check-in Tarihiniz</font>
${param.datepicker}
<br></br>

<font color="red">Check-out Tarihiniz</font>
${param.datepicker1}
<br></br>

<font color="red">Otelimize İletmek İstediğiniz Mesajınız</font>
${param.userMessage}
<br></br>

<font color="red">Seçtiğiniz Oda Tipi</font>
${param.oda}
<br></br>

<font color="red">Mesajınız Tarafımıza iletilmiştir</font>
    
    
   
</body>
</html>
