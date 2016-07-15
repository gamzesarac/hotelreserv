<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE HTML>
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
<link rel="icon" href="favicon.ico" type="image/x-icon" >
<!-- font-awesome icons -->
<link href="css/font-awesome.css" rel="stylesheet"> 
<!-- //font-awesome icons -->

 <!-- js-->
<script src="js/jquery-1.11.1.min.js"></script>
<script src="js/modernizr.custom.js"></script>

<!--animate-->
<link href="css/animate.css" rel="stylesheet" type="text/css" media="all">

<!--//end-animate-->
<!-- Metis Menu -->
<script src="js/metisMenu.min.js"></script>
<script src="js/custom.js"></script>
<link href="css/custom.css" rel="stylesheet">
<!--//Metis Menu -->
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
								<a href="comment-waiting-approval.jsp" class="active"><i class="fa fa-comments nav_icon"></i>Comment Waiting Approval</a>
							</li>
                                                     <li>
								<a href="refreshInbox.jsp" class="active"><i class="fa fa-comments nav_icon"></i>Refresh Unread Messages</a>
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
									<i class="fa fa-comments"></i>
								</div>
							</div>
							<div class="grid-right">
                                                            <h3><a href="comment-waiting-approval.jsp">Comment Waiting <span>Approval</span></a></h3>
								<p><%

                rs = st.executeQuery("select commentid from usercomments where isApproved='0'");
                int countOfCommentWaitingApproval=0;                              
                    
                    while(rs.next())
                    {
                        countOfCommentWaitingApproval++;
                    }
                rs.close();
                out.print(countOfCommentWaitingApproval);

                    %></p>
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
	 
			<!-- page footer -->   
			<!-- dev-page-footer-closed dev-page-footer-fixed -->
            <div class="dev-page-footer dev-page-footer-fixed"> 
				<!-- container -->
				<div class="container">
					<div class="copyright">
						Footer
					</div>
					<!-- page footer buttons -->

                
                </div>
				<!-- //container -->
            </div>
            <!-- /page footer -->
		</div>
        <!--//footer-->
	</div>
	<!-- Classie -->

	<!-- Bootstrap Core JavaScript --> 
		
        <script type="text/javascript" src="js/bootstrap.min.js"></script>

        <script type="text/javascript" src="js/dev-loaders.js"></script>
        <script type="text/javascript" src="js/dev-layout-default.js"></script>
		<script type="text/javascript" src="js/jquery.marquee.js"></script>
		<link href="css/bootstrap.min.css" rel="stylesheet">
		
		<!-- candlestick -->
		<script type="text/javascript" src="js/jquery.jqcandlestick.min.js"></script>
		<link rel="stylesheet" type="text/css" href="css/jqcandlestick.css" />
		<!-- //candlestick -->
		
		<!--max-plugin-->
		<script type="text/javascript" src="js/plugins.js"></script>
		<!--//max-plugin-->
		
		<!--scrolling js-->
		<script src="js/jquery.nicescroll.js"></script>
		<script src="js/scripts.js"></script>
		<!--//scrolling js-->
		
</body>
</html>