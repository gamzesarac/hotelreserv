<%@page import="db.user"%>
<%@page import="java.sql.*"%>
<%-- 
    Document   : login
    Created on : Jul 14, 2016, 3:41:51 PM
    Author     : ONuR
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        
        <script>
function goBack() {
    window.history.go(-2);
}
</script>
        
    </head>
    <body>
        
        
        <%
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            
            
            String currentPage = (String)session.getAttribute("currentpage")+"as";
            
            user u = new user();
            ResultSet rs  = u.userDetails(username, password);
            if(rs==null){
               %> <SCRIPT LANGUAGE='JavaScript'>
    window.alert('WRONG USERNAME OR PASSWORD!!!')
     window.location.href='login.html'
    </SCRIPT>   
        
   <%
                
            }
            else{    
            if(rs.getInt("usertype_id") == 1) {
                session.setAttribute("firstname", rs.getString("firstname"));
                session.setAttribute("lastname", rs.getString("lastname"));
                session.setAttribute("username", username);
                response.sendRedirect("Admin/index.jsp");
            
            }
            
            else if(rs.getInt("usertype_id") == 2) {
            session.setAttribute("firstname", rs.getString("firstname"));
            session.setAttribute("lastname", rs.getString("lastname"));
            session.setAttribute("username", username);
            response.sendRedirect("Hotel/hotel.jsp");
            }
            
            else if(rs.getInt("usertype_id") == 3) {
            
            session.setAttribute("firstname", rs.getString("firstname"));
            session.setAttribute("lastname", rs.getString("lastname"));
            session.setAttribute("username", username);
            session.setAttribute("usertype", rs.getString("usertype_id"));
            
            if(currentPage.equals("fullas")){
                    %> 
                    
                    
                    <script>window.onload=goBack;</script>
                    
                    <%
                } else {
            response.sendRedirect("user.jsp");
            }
            
            }
            
            else
            response.sendRedirect("error.html");
} 
        %>
        
    </body>
</html>
