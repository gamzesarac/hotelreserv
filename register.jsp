
<%@page import="java.util.Date"%>
<%@page import="db.user"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>




<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Register Page</title>
</head>
<body>
    <% user uu= new user();
        String submit = request.getParameter("Register");   
        boolean b= true; 

            String firstname=request.getParameter("firstname");
            if(firstname.equals("")){ b=false;
                %> <SCRIPT LANGUAGE='JavaScript'>
    window.alert('Please enter your FIRSTNAME!!')
     window.location.href='register.html'
    </SCRIPT>   
        
   <%  }
  
            String lastname=request.getParameter("lastname");
            if(lastname==""){ b=false;
    %> <SCRIPT LANGUAGE='JavaScript'>
    window.alert('Please enter your LASTNAME!!')
     window.location.href='register.html'
    </SCRIPT>   
        
   <%
}
            String username=request.getParameter("username");
            if(username==""){ b=false;
 %> <SCRIPT LANGUAGE='JavaScript'>
    window.alert('Please enter your USERNAME!!')
     window.location.href='register.html'
    </SCRIPT>  
        
   <% } else { if(uu.checkUsername(username)){
%> <SCRIPT LANGUAGE='JavaScript'>
    window.alert('Your username must include ONLY STRING or MIXED!!!')
     window.location.href='register.html'
    </SCRIPT>  
        
   <%    
}    
}

            String password=request.getParameter("password");
            if(password==""){ b=false;
 %> <SCRIPT LANGUAGE='JavaScript'>
    window.alert('Please enter your PASSWORD!!')
     window.location.href='register.html'
    </SCRIPT>  
        
   <% } else { if(!uu.checkPassword(password)){
%> <SCRIPT LANGUAGE='JavaScript'>
    window.alert('Your password must include AT LEAST 8 MAXIMUM 16 CHARACTERS and MUST INCLUDE EACH STRING AND INTEGERS!!!')
     window.location.href='register.html'
    </SCRIPT>  
        
   <%    
}    
}

            String gender=request.getParameter("gender");
            if(gender==""){ b=false;
 %> <SCRIPT LANGUAGE='JavaScript'>
    window.alert('Please enter your GENDER!!')
     window.location.href='register.html'
    </SCRIPT>  
        
   <% }
            String birthdate=request.getParameter("bdate");
            if(birthdate==""){ b=false;
 %> <SCRIPT LANGUAGE='JavaScript'>
    window.alert('Please enter your BIRTHDATE!!')
     window.location.href='register.html'
    </SCRIPT>  
        
   <% }
            String telephone=request.getParameter("telephone");
            if(telephone==""){ b=false;
 %> <SCRIPT LANGUAGE='JavaScript'>
    window.alert('Please enter your TELEPHONE!!')
     window.location.href='register.html'
    </SCRIPT>  
        
   <% } else { if(!uu.checkTel(telephone)){
%> <SCRIPT LANGUAGE='JavaScript'>
    window.alert('You must enter a VALID Telephone Number!!!')
     window.location.href='register.html'
    </SCRIPT>  
        
   <%    
}    
}



            String email=request.getParameter("email");
            if(email==""){ b=false;
 %> <SCRIPT LANGUAGE='JavaScript'>
    window.alert('Please enter your E-MAIL!!')
     window.location.href='register.html'
    </SCRIPT>  
        
   <% } else { if(!uu.checkMail(email)){
%> <SCRIPT LANGUAGE='JavaScript'>
    window.alert('You must enter a VALID E-mail!!!')
     window.location.href='register.html'
    </SCRIPT>  
        
   <%    
}    
}


            String address=request.getParameter("address");
            if(address==""){ b=false;
 %> <SCRIPT LANGUAGE='JavaScript'>
    window.alert('Please enter your ADDRESS!!')
     window.location.href='register.html'
    </SCRIPT>  
        
   <% }
            String ssn=request.getParameter("ssn");
            if(ssn==""){ b=false;
 %> <SCRIPT LANGUAGE='JavaScript'>
    window.alert('Please enter your SSN!!')
     window.location.href='register.html'
    </SCRIPT>  
        
   <% } else { if(!uu.checkSSN(ssn)){
%> <SCRIPT LANGUAGE='JavaScript'>
    window.alert('You must enter a VALID SSN!!!')
     window.location.href='register.html'
    </SCRIPT>  
        
   <%    
}    
}


        if (submit.equals("Register")&&b) {
            int type=3;
            user u=new user(username,firstname,lastname,password,birthdate,email,gender,telephone,type,address,ssn);

            boolean isSuccess = u.addUser(); 
            
        if (isSuccess) { session.setAttribute("username", request.getParameter("username"));
             %>                
                <jsp:forward page="user.jsp"/>
            <% } else {%>
                <SCRIPT LANGUAGE='JavaScript'>
    window.alert('This username is ALREADY REGISTERED!!!')
     window.location.href='register.html'
    </SCRIPT> 
            <% }
        }
    %>
</body>
</html>