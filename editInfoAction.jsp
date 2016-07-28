
<%@page import="java.util.Date"%>
<%@page import="db.user"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Edit Information Page</title>
</head>
<body>
    <%
        String username = (String)session.getAttribute("username");
        user u=new user(username);
        String type = u.checkTypePages(username);
        int check = Integer.parseInt(type); %>
       <% if(check != 3 || check ==-1){ %>
        <jsp:forward page="login.html"/>
        <% } 
        if(session.getAttribute("username") == null){
        response.sendRedirect("index.jsp");
        }
       
        String submit = request.getParameter("Apply");



            String firstname = request.getParameter("firstname");
            boolean b= true; 

            String firstnamee=request.getParameter("firstname");
            if(firstname.equals("")){ b=false;
                %> <SCRIPT LANGUAGE='JavaScript'>
    window.alert('Please enter your FIRSTNAME!!')
     window.location.href='editInfo.jsp'
    </SCRIPT>   
        
   <%  }

            String lastname = request.getParameter("lastname");
            if(lastname==""){ b=false;
    %> <SCRIPT LANGUAGE='JavaScript'>
    window.alert('Please enter your LASTNAME!!')
     window.location.href='editInfo.jsp'
    </SCRIPT>   
        
   <%
}

            String password = request.getParameter("password");
            if(password==""){ b=false;
 %> <SCRIPT LANGUAGE='JavaScript'>
    window.alert('Please enter your PASSWORD!!')
     window.location.href='editInfo.jsp'
    </SCRIPT>  
        
   <% } else { if(!u.checkPassword(password)){
%> <SCRIPT LANGUAGE='JavaScript'>
    window.alert('Your password must include AT LEAST 8 MAXIMUM 16 CHARACTERS and MUST INCLUDE EACH STRING AND INTEGERS!!!')
     window.location.href='editInfo.jsp'
    </SCRIPT>  
        
   <%    
}    
}

            String birthdate = request.getParameter("birthdate");
            if(birthdate==""){ b=false;
 %> <SCRIPT LANGUAGE='JavaScript'>
    window.alert('Please enter your BIRTHDATE!!')
     window.location.href='editInfo.jsp'
    </SCRIPT>  
        
   <% }

            String telephone = request.getParameter("telephone");
            if(telephone==""){ b=false;
 %> <SCRIPT LANGUAGE='JavaScript'>
    window.alert('Please enter your TELEPHONE!!')
     window.location.href='editInfo.jsp'
    </SCRIPT>  
        
   <% } else { if(!u.checkTel(telephone)){
%> <SCRIPT LANGUAGE='JavaScript'>
    window.alert('You must enter a VALID Telephone Number!!!')
     window.location.href='editInfo.jsp'
    </SCRIPT>  
        
   <%    
}    
}


            String email = request.getParameter("email");
            if(email==""){ b=false;
 %> <SCRIPT LANGUAGE='JavaScript'>
    window.alert('Please enter your E-MAIL!!')
     window.location.href='editInfo.jsp'
    </SCRIPT>  
        
   <% } else { if(!u.checkMail(email)){
%> <SCRIPT LANGUAGE='JavaScript'>
    window.alert('You must enter a VALID E-mail!!!')
     window.location.href='editInfo.jsp'
    </SCRIPT>  
        
   <%    
}    
}


            String ssn = request.getParameter("ssn");
            if(ssn==""){ b=false;
 %> <SCRIPT LANGUAGE='JavaScript'>
    window.alert('Please enter your SSN!!')
     window.location.href='editInfo.jsp'
    </SCRIPT>  
        
   <% } else { if(!u.checkSSN(ssn)){
%> <SCRIPT LANGUAGE='JavaScript'>
    window.alert('You must enter a VALID SSN!!!')
     window.location.href='editInfo.jsp'
    </SCRIPT>  
        
   <%    
}    
}


            String address = request.getParameter("address");
            if(address==""){ b=false;
 %> <SCRIPT LANGUAGE='JavaScript'>
    window.alert('Please enter your ADDRESS!!')
     window.location.href='editInfo.jsp'
    </SCRIPT>  
        
   <% }
            
                    if (submit.equals("Apply")&&b) {
            boolean isSuccess = u.editUser(username,password,firstnamee,lastname,email,birthdate,telephone,ssn,address);
            if (isSuccess) {%>
                <jsp:forward page="editInfo.jsp"/>
            <% } else {%>
                <jsp:forward page="user.jsp"/>
            <% }
        }
    %>
</body>
</html>

