<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<html> 
<head> 
<title>Connection with mysql database</title>
</head> 
<body>
<h1></h1>
<% 
java.sql.Connection conn = null;
String url = "jdbc:mysql://localhost:3306/hotelreservationdb";
String Driver="com.mysql.jdbc.Driver";
String username="root";
String password="";
try { 
            Class.forName(Driver); 
            conn=DriverManager.getConnection(url,username,password);
            if(conn!=null){
                out.println("");
                
            }else{
                out.println("");
                    }
        }catch(Exception ex){
            out.println("Unable to connect to database"+ex);
        }   
%>

</body> 
</html>