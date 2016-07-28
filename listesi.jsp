<%@page import="db.user"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@include file="connact.jsp" %>
<%
        String usernamee = (String)session.getAttribute("username");
        user u=new user(usernamee);
        String type = u.checkTypePages(usernamee);
        int check = Integer.parseInt(type); %>
       <% if(check != 3 || check ==-1){ %>
        <jsp:forward page="login.html"/>
        <% } 
        if(session.getAttribute("username") == null){
            response.sendRedirect("index.jsp");
        }

        String firstname = u.takeFirstname(usernamee);
    
       try{
             Connection connection=null;
             Class.forName("com.mysql.jdbc.Driver");
             connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/hotelreservationdb","root","");
             Statement statement=connection.createStatement();
             String command="select imageaddress from hotelimage where hotel_hotelid=1";
          ResultSet resultSet= statement.executeQuery(command);
          
          if(resultSet.next())
          {
              %>
              <img src="<%out.print(resultSet.getString("imageaddress"));  %>" >
              <%
          }
       
%>
<tr bgcolor="#8FBC8F">
    
<table>
<tr>
    <th></th>
    

    
  </tr>

<%
        if(resultSet.next()){
    while(resultSet.next()){
  
 %>   
<tr>

<td><%=resultSet.getString("roomname")%></td>
<td><%=resultSet.getString("roomCount")%></td>

</tr>

</table>
  <tr>




<%
}
        }
 else
      out.println("Bu Otelde Odam?z Bulunmamaktad?r");
  }
    
          
              
 
         
       catch(Exception ex){
           out.println(ex);
       } 

            %>
           
     </form>      
  
</body>
</html>
