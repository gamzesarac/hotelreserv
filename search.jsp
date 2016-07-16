<%-- 
    Document   : search.jsp
    Created on : 08.Tem.2016, 18:05:33
    Author     : asus1
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <title>TODO supply a title</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
   <form action="otellisteleme.jsp" action="post"> 
<div>En İyi Fırsatları Yakalayın</div>
<br/><br/>
Kim olursan ol,ne ararsan ara,her şey burada başlıyor.
<br/><br/>
Otel İsmi,Şehri ya da ilçesini giriniz
 <br/><br/>
<input type="text" name="search" size="55" value="Gidebileceğinizden daha fazla yer!"><br>
 
 
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
      <p>Check-in Date: <input type="text" id="datepicker"></p>
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
      <p>Check-out Date: <input type="text" id="datepicker1"></p>
<br/><br/> 


Seyahat Amacı 
    <br/><br/>  
    <input type="radio" name="purpose" value="Cift" >Çift
    <input type="radio" name="purpose" value="Aile" >Aile
    <input type="radio" name="purpose" value="Grup" >Grup
    <input type="radio" name="purpose" value="Yalnız Gezgin" >Yalnız Gezgin 
    <input type="radio" name="purpose" value="İş Amaçlı Gezgin" >İş Amaçlı Gezgin
    <input type="radio" name="purpose" value="Diğer" >Diğer
    <br/><br/>  
     <br/><br/> 
Oda
 <select name="oda">
        <option>1</option>
        <option>2</option>
        <option>3</option>
        <option>4</option>
        <option>5</option>
    </select>
 
 Yetişkin
  <select name="yetiskin">
        <option>1</option>
        <option>2</option>
        <option>3</option>
        <option>4</option>
        <option>5</option>
    </select>
 Çocuk
  <select name="cocuk">
        <option>1</option>
        <option>2</option>
        <option>3</option>
        <option>4</option>
        <option>5</option>
    </select>
   <br/><br/>  
   
 <input type="submit" name="submit" value="ARA" />
 </form>
</body>
</html>

