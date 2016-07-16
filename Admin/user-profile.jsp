<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
if(session.getAttribute("username") == null){
        response.sendRedirect("../login.html");
    }
%>
<html>
<head>
<title>Admin Panel | User Profile Page</title>
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
                
                <%
                         String userID = request.getParameter("userid");
                         
                    
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hotelreservationdb", "root", "");
                    Statement st = con.createStatement(); 
                    ResultSet rs;
                    rs = st.executeQuery("select id,username,password,firstname,lastname,birthdate,email,gender,telephone,ssn,address,usertype_id from user where id="+userID);
                    
                    if(rs.next())
                    {
                        out.print(rs.getString("firstname") + " " +rs.getString("lastname"));
                    }
                    else
                        out.print(userID);
                
                %>
                
                
		<!-- main content start-->
		<div id="page-wrapper">
                    <div class="main-page">

                        <div class="col-md-6">
                            <div class="panel panel-widget">
				<div class="validation-grids widget-shadow" data-example-id="basic-forms"> 
                                    <div class="input-info">
					<h3>User Profile :</h3>
                                    </div>
                                    
                                    <div class="form-body form-body-info">
					<form data-toggle="validator" novalidate="true">
                                            <div class="form-group valid-form">
                                                <input type="text" class="form-control" id="userName" value="<% out.print(rs.getString("username")); %>" >
                                            </div>
						<div class="form-group has-feedback">
                                                    <input type="email" class="form-control" id="userEmail"  value="<% out.print(rs.getString("email")); %>">
						</div>
                                                
						<div class="form-group">
								<input type="password" class="form-control"   id="userPassword"  value="<% out.print(rs.getString("password")); %>">
						</div>
                                                
                                                <div class="form-group">
								<input type="text" class="form-control" id="userFirstandLastname" value="<% out.print(rs.getString("firstname") + " " + rs.getString("lastname")); %>" >
						</div>
                                                
						<div class="form-group">
								<input type="text" class="form-control" id="userAddress" value="<% out.print(rs.getString("user.address")); %>" >
						</div>
                                                
                                                <div class="form-group">
								<input type="text" class="form-control" id="userPhone" value="<% out.print(rs.getString("telephone")); %>" >
						</div>
                                                
                                                <div class="form-group">
								<input type="text" class="form-control" id="userPhone" value="<% out.print(rs.getString("birthdate")); %>" >
						</div>
                                                
                                                 <div class="form-group">
								<input type="text" class="form-control" id="userAddress" value="<% out.print(rs.getString("ssn")); %>" >
						</div>               
                                                                
						<div class="form-group">
                                                    <div class="radio">
							<label>
                                                            <input type="radio" name="gender" <% if(rs.getString("gender").equals("female")) {out.print("checked");} %>>
									Female
							</label>
                                                    </div>
                                                    <div class="radio">
							<label>
                                                                <input type="radio" name="gender" <% if(rs.getString("gender").equals("male")) {out.print("checked");} %>>
									Male
							</label>
                                                    </div>
						</div>
						
					</form>
                                    </div>
				</div>
                            </div>
			</div>
                                                                        
                 <%
                Class.forName("com.mysql.jdbc.Driver");
                rs = st.executeQuery("select id, hotelname, reservationdate,hotel.hotelid, hotelrooms.hotelid from user, hotel, reservation, hotelrooms where reservation.userid = user.id AND reservation.roomid = hotelrooms.roomid AND hotelrooms.hotelid = hotel.hotelid AND user.id="+userID);
                                         
                int reservationCount=0;
                while(rs.next())
                {
                    reservationCount++;
                }
                rs.close();
                    %>
                                                                        
                        <div class="col-md-6">
                            <div class="panel panel-widget">
				<div class="validation-grids widget-shadow" data-example-id="basic-forms"> 
                                    <div class="input-info">
					<h3>User Reservations : <% out.print(reservationCount + " Total Reservation"); %></h3>
                                    </div>
                                    
                                    <table class="table table-bordered"> 
                                    <thead> 
                                        <tr> 
                                            <th>Reservation ID</th> <th>Hotel Name</th> <th>Reservation Date</th> 
                                        </tr> 
                                    </thead> 
                                    
                                    <tbody> 
                                        
                                        <% 
                                       rs = st.executeQuery("select id,reservationid, hotelname, reservationdate,hotel.hotelid, hotelrooms.hotelid from user, hotel, reservation, hotelrooms where reservation.userid = user.id AND reservation.roomid = hotelrooms.roomid AND hotelrooms.hotelid = hotel.hotelid AND user.id="+userID);
                                            while(rs.next())
                                           {
                                         %>
                             
                                        <tr> 
                                            <th scope="row"><a href="book-details.jsp?reservationId=<%out.print(rs.getString("reservationid")); %>"><% out.print(rs.getString("reservationid")); %></a></th> 
                                            
                                            <td>
                                                <a href="hotel-profile.jsp?hotelid=<% out.print(rs.getString("hotelid"));%>">
                                                    <% 
                                                       out.print(rs.getString("hotelname")); 
                                                    %> 
                                                </a>
                                            </td> 
                                            
                                            <td>
                                                    <%
                                                        out.print(rs.getString("reservationdate"));
                                                    %>
                                            </td> 
                                        </tr> 
                                        <% } %>
                                    </tbody> 
                                </table>
                                    
                                    <div class="form-body form-body-info">
					
                                    </div>
				</div>
                            </div>
			</div>                                                
                    </div>
		</div>
		<!--footer-->
		 <div class="dev-page">
	 
            <div class="dev-page-footer dev-page-footer-fixed"> 
				<!-- container -->
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