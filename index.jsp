<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="db.user"%>
<!DOCTYPE HTML>
<%
if(session.getAttribute("username") == null){
        response.sendRedirect("../login.html");
    }
else {
    String username = (String)session.getAttribute("username");
    user u = new user();
    boolean isAdmin = u.checkAdminPanel(username);
    if(!isAdmin)
      response.sendRedirect("../login.html");  
}
%>

<html>
<head>
<title>Admin Panel | Home</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
<!-- Custom CSS -->
<link href="css/style.css" rel='stylesheet' type='text/css' />
<!-- font CSS -->
<!-- font-awesome icons -->
<link href="css/font-awesome.css" rel="stylesheet"> 
<!-- //font-awesome icons -->
<link href="css/custom.css" rel="stylesheet">

</head> 
<body class="cbp-spmenu-push">
	<div class="main-content">
		<!--left-fixed -navigation-->
		<div class="sidebar" role="navigation">
            <div class="navbar-collapse">
				<nav class="cbp-spmenu cbp-spmenu-vertical cbp-spmenu-right dev-page-sidebar mCustomScrollbar _mCS_1 mCS-autoHide mCS_no_scrollbar" id="cbp-spmenu-s1">
					<div class="scrollbar scrollbar1">
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
								<a href="logout.jsp" class="active"><i class="fa fa-comments nav_icon"></i>Logout</a>
							</li>
                                                    <!-- <li>
								<a href="refreshInbox.jsp" class="active"><i class="fa fa-comments nav_icon"></i>Refresh Messagebox</a>
							</li> -->
                                                        
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
							
							<li><h1>Hotel Booking</h1></li>
							<div class="clearfix"> </div>
						</ul>
					</a>
				</div>
				<!--//logo-->
			</div>
                        			<!--search-box-->
				<div class="search-box">
                                    <form class="input" action="#">
                                        <input class="sb-search-input input__field--madoka"  placeholder="Search..." type="search" id="input-31" />
					</form>
				</div>
				<!--//end-search-box-->
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
				
		</div>
		
		<!-- //header-ends -->
		<!-- main content start-->
		<div id="page-wrapper">
			<div class="main-page">
			
				<!-- four-grids -->                                          <!-- üstteki 4 menü -->  
				<div class="row four-grids">
					<div class="col-md-3 ticket-grid">
						<div class="tickets">
							<div class="grid-left">
								<div class="book-icon">
									<i class="fa fa-book"></i>
								</div>
							</div>
							<div class="grid-right">
                                                            <h3><a href="all-bookings.jsp">Total <span>Booking</span></a></h3>
								<p><%

                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hotelreservationdb", "root", "");
                Statement st = con.createStatement();
                ResultSet rs;
                rs = st.executeQuery("select reservationid from reservation");
                 
                int bookingCount=0;
                while(rs.next())
                {
                    bookingCount++;
                }
                out.print(bookingCount);
                rs.close();

                    %></p>
							</div>
							<div class="clearfix"> </div>
						</div>
					</div>
					<div class="col-md-3 ticket-grid">
						<div class="tickets">
							<div class="grid-left">
								<div class="book-icon">
									<i class="fa fa-check"></i>
								</div>
							</div>
							<div class="grid-right">
                                                            <h3><a href="hotel-waiting-aproval.jsp">Hotel Waiting <span>Approval</span></a></h3>
								<p><%

                rs = st.executeQuery("select hotelid from hotel where status='0'");
                int countOfWaitingApprovalHotel=0;                              
                    
                    while(rs.next())
                    {
                        countOfWaitingApprovalHotel++;
                    }
                rs.close();
                out.print(countOfWaitingApprovalHotel);

                    %> </p>
							</div>
							<div class="clearfix"> </div>
						</div>
					</div>
					
					<div class="col-md-3 ticket-grid">
						<div class="tickets">
							<div class="grid-left">
								<div class="book-icon">
									<i class="fa fa-user"></i>
								</div>
							</div>
							<div class="grid-right">
                                                            <h3><a href="all-users.jsp"> Total <span>User</span></a></h3>
								<p><%

                rs = st.executeQuery("select id from user");
                int countOfUser=0;                              
                    
                    while(rs.next())
                    {
                        countOfUser++;
                    }
                rs.close();
                out.print(countOfUser);

                    %></p>
							</div>
							<div class="clearfix"> </div>
						</div>
					</div>
					<div class="clearfix"> </div>
				</div>
				<!-- //four-grids -->


			</div>
		</div>
		<!--footer-->
		 <div class="dev-page">
	 
			
            <div class="dev-page-footer dev-page-footer-fixed"> 
				
				<div class="container">
					<div class="copyright">
						<font size="3" face="Arial" color="white">Admin panel v1.</font>
					</div>	
                </div>
				
                </div>
            </div>
	</div>
	

		
		
</body>
</html>