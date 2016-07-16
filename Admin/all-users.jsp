<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="db.user"%>
<%
if(session.getAttribute("username") == null){
        response.sendRedirect("../login.html");
    }
%>
<html>
<head>
<title>Admin Panel | All Booking</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
<!-- Custom CSS -->
<link href="css/style.css" rel='stylesheet' type='text/css' />
<!-- font CSS -->
<link rel="icon" href="favicon.ico" type="image/x-icon" >
<!-- font-awesome icons -->
<link href="css/font-awesome.css" rel="stylesheet"> 
<!-- //font-awesome icons -->


<!-- Metis Menu -->
<link href="css/custom.css" rel="stylesheet">
<!--//Metis Menu -->
</head> 
<body class="cbp-spmenu-push">
    <div class="main-content">
		<!--left-fixed -navigation-->
		<div class="sidebar" role="navigation">
            <div class="navbar-collapse">
				<nav class="cbp-spmenu cbp-spmenu-vertical cbp-spmenu-right dev-page-sidebar mCustomScrollbar _mCS_1 mCS-autoHide mCS_no_scrollbar" id="cbp-spmenu-s1">
					<div>
						<ul class="nav" id="side-menu">
							<li>
								<a href="index.jsp" class="active"><i class="fa fa-home nav_icon"></i>Dashboard</a>
							</li>
                                                        <li>
								<a href="all-bookings.jsp" class="active"><i class="fa fa-book nav_icon"></i>All Booking</a>
							</li>
                                                        
                                                        <li>
								<a href="hotel-waiting-aproval.jsp" class="active"><i class="fa fa-check nav_icon"></i>Hotel Waiting Approval</a>
							</li>
                                                        <li>
								<a href="approved-hotels.jsp" class="active"><i class="fa fa-check nav_icon"></i>Approved Hotels</a>
							</li>
                                                        
                                                        <li>
								<a href="all-users.jsp" class="active"><i class="fa fa-user nav_icon"></i>All Users</a>
							</li>
                                                        
                                                        <li>
								<a href="comment-waiting-approval.jsp" class="active"><i class="fa fa-comments nav_icon"></i>Comment Waiting Approval</a>
							</li>
                                                        
						</ul>
					</div>
					<!-- //sidebar-collapse -->
				</nav>
			</div>
		</div>
		<!--left-fixed -navigation-->
		<!-- header-starts -->
		<div class="sticky-header header-section ">
			<div class="header-left">
				<!--logo -->
				<div class="logo">
					<a href="index.jsp">
						<ul>	
							<li><img src="images/logo1.png" alt="" /></li>
							<li><h1>Hotel Booking</h1></li>
							<div class="clearfix"> </div>
						</ul>
					</a>
				</div>
				<!--//logo-->
				
				
				
				<div class="clearfix"> </div>
			</div>

			<div class="header-right">
				
				
				<div class="profile_details">		
					<ul>
						<li class="dropdown profile_details_drop">
							<a  class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
								<div class="profile_img">	
									<span class="prfil-img"><img src="images/onur.jpg" alt=""> <% out.print(session.getAttribute("firstname") + " " + session.getAttribute("lastname")); %> </span> 
									<div class="clearfix"></div>	
								</div>	
							</a>
							
						</li>
					</ul>
				</div>
				<!--toggle button start-->
				
				<!--toggle button end-->
				<div class="clearfix"> </div>				
			</div>
			<div class="clearfix"> </div>	
		</div>
		<!-- //header-ends -->
		<!-- main content start-->
		<div id="page-wrapper">
			
				
		<div class="panel panel-widget">
			<div class="tables">
				<h4> <%

                user u = new user();
                ResultSet rs = u.allUsers();
                
                int userCount=0;
                rs.beforeFirst();
                while(rs.next())
                {
                    userCount++;
                }
                    out.print(userCount + " total users");
                    %> </h4>
				<table class="table table-bordered"> <thead> <tr> <th>User ID</th> <th>Name</th> <th>Email</th> <th>Telephone</th> </tr> </thead> 
                                    <tbody> 
                                        
                                        <% 
                                            rs.beforeFirst();
                                            while(rs.next())
                                                    {
                                        %>
                             
                                        <tr> 
                                            <th scope="row">
                                                <a href="user-profile.jsp?userid=<% out.print(rs.getString("id"));%>"><% out.print(rs.getString("id"));%></a>
                                            </th> 
                                            
                                            <td>
                                                <a href="user-profile.jsp?userid=<% out.print(rs.getString("id"));%>"> 
                                                    <%
                                                        out.print(rs.getString("firstname") + " " + rs.getString("lastname")); 
                                                    %>
                                                </a>
                                            </td> 
                                            
                                            <td>
                                                <% 
                                                    out.print(rs.getString("email")); 
                                                %> 
                                            </td>
                                            
                                            <td>
                                                <%
                                                    out.print(rs.getString("telephone"));
                                                %>
                                            </td> 
                                        </tr> 
                                                <% } %>
                                    </tbody> 
                                </table>
			</div>
		</div>
				
				
				
			
		</div>
		<!--footer-->
	<div class="dev-page">
	 
			  
			
            <div class="dev-page-footer dev-page-footer-fixed"> 
				
		<div class="container">
			<div class="copyright">
						<font size="3" face="Arial" color="white">Admin panel v1. Coded by Onur</font>
			</div>

                </div>

            </div>
           
	</div>
        <!--//footer-->
    </div>

</body>
</html>