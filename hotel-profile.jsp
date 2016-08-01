<%@page import="db.hotel"%>
?<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="db.user"%>
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
<title>Admin Panel | Hotel Profile Page</title>
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
								<a href="logout.jsp" class="active"><i class="fa fa-comments nav_icon"></i>Logout</a>
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
                         String hotelId = request.getParameter("hotelid");
                         
                    
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hotelreservationdb", "root", "");
                    Statement st = con.createStatement();
                    hotel h=new hotel();
                    
                    ResultSet rs;
                    rs = st.executeQuery("select hotelname,hotelinfo,hotel.address,user.address,hotelphone,status,firstname,lastname,username,password,email,birthdate,telephone,ssn,gender from user,hotel where hotel.user_id = user.id and hotelid=" + hotelId);

                    if(rs.next())
                    {
                        out.print(rs.getString("firstname") + " " +rs.getString("lastname"));
                    }
                    else
                        out.print(hotelId);
                
                %>
                
                
		<!-- main content start-->
		<div id="page-wrapper">
                    <div class="main-page">
				
			<div class="col-md-6">
                            <div class="panel panel-widget">
                                <div class="my-div">
                                    
                                        <div class="input-info">
                                            <h3>Hotel Information:</h3>
                                        </div>
                                            <label for="field-1" >Hotel Name</label>
                                                <div class="form-group" >
                                                    <input type="text" name="hotelName"  class="form-control" value="<% out.print(rs.getString("hotelname")); %>" disabled="true"/>
                                                </div>

                                            <label for="field-1-2" >Hotel Details</label>
                                                <div class="form-group" >
                                                    <textarea name="hotelDetails" disabled="true" class="form-control"  ><% out.print(rs.getString("hotelinfo")); %></textarea>
                                                </div>
                                                <label for="field-1-2" >Hotel Address</label>
                                                <div class="form-group" >
                                                    <textarea name="hotelAddress" disabled="true" class="form-control"  ><% out.print(rs.getString("address")); %></textarea>
                                                </div>
                                                <label for="field-1-2" >Standart Room Extras</label>
                                                <div class="form-group" >
                                                    
                                                    <%
                                                        int room_id;
                                                        Statement st2 = con.createStatement();
                                                        ResultSet rs2;
                                                        ResultSet rs3;
                                                        
                                                        rs2 = st2.executeQuery("select roomid from hotelrooms where roomname = 'Standart Room' AND hotelid ="+ hotelId );
                                                        
                                                        if(rs2.next()) {
                                                            room_id = rs2.getInt("roomid");
                                                            rs3 = st2.executeQuery("select extras, cost from hotelextras where roomid = "+ room_id);
                                                            
                                                            while(rs3.next())
                                                            {
                                                                out.println(rs3.getString("extras"));
                                                                %>
                                                                <br> <br>
                                                                <%
                                                            }
                                                        }
                                                    %>
                                                    
                                                </div>
                                                
                                                <label for="field-1-2" >Luxury Room Extras</label>
                                                <div class="form-group" >
                                                    
                                                    <%
                                                        
                                                        rs2 = st2.executeQuery("select roomid from hotelrooms where roomname = 'Luxury Room' AND hotelid ="+ hotelId );
                                                        
                                                        if(rs2.next()) {
                                                            room_id = rs2.getInt("roomid");
                                                            rs3 = st2.executeQuery("select extras, cost from hotelextras where roomid = "+ room_id);
                                                            
                                                            while(rs3.next())
                                                            {
                                                                out.print(rs3.getString("extras") );
                                                                %>
                                                                <br> <br>
                                                                <%
                                                            }
                                                        }
                                                    %>
                                                    
                                                </div>
                                                
                                                <label for="field-1-2" >Premium Room Extras</label>
                                                <div class="form-group" >
                                                    
                                                   <%
                                                        
                                                        rs2 = st2.executeQuery("select roomid from hotelrooms where roomname = 'Premium Room' AND hotelid ="+ hotelId );
                                                        
                                                        if(rs2.next()) {
                                                            room_id = rs2.getInt("roomid");
                                                            rs3 = st2.executeQuery("select extras, cost from hotelextras where roomid = "+ room_id);
                                                            
                                                            while(rs3.next())
                                                            {
                                                                out.print(rs3.getString("extras") );
                                                                %>
                                                                <br> <br>
                                                                <%
                                                            }
                                                        }
                                                    %>
                                                    
                                                </div>
                                                
                                                
                                                
                                                
                                                
                                                        <hr>
							<p>
                                                            
                                                            <% 
                                                                String hotelStatus = rs.getString("status");
                                                                
                                                                if(hotelStatus.equals("0"))
                                                                {
                                                            %>
                                                           
                                                        <form action="hotelStatus.jsp" method="get" class="">
                                                                        <input type="hidden" value="<% out.print(hotelId); %>" name="hotel_id" />
                                                                        <input type="submit" name="Status" value="Approve" class="btn btn-primary">
                                                                        <input type="submit" name="Status" value="Reject" class="btn btn-primary">
                                                        </form>
                                                     
                                                           
                                                        
                                                                        
                                                                        <% }%>
                                                           
							</p>
                                        
                                </div>
                            </div>
			</div>
                            
                        <div class="col-md-6">
                            <div class="panel panel-widget">
				<div class="validation-grids widget-shadow" data-example-id="basic-forms"> 
                                    <div class="input-info">
					<h3>Hotel Owner Profile :</h3>
                                    </div>
                                    
                                    <div class="form-body form-body-info">
					<form data-toggle="validator" novalidate="true">
                                            <div class="form-group valid-form">
                                                <input type="text" class="form-control" id="firstAndLastName" value="<% out.print(rs.getString("firstname") + " " + rs.getString("lastname")); %>" disabled="true">
                                            </div>
                                            <div class="form-group valid-form">
                                                <input type="text" class="form-control" id="userName" value="<% out.print(rs.getString("username")); %>" disabled="true">
                                            </div>
						<div class="form-group has-feedback">
                                                    <input type="email" class="form-control" id="userEmail"  value="<% out.print(rs.getString("email")); %>"disabled="true">
						</div>
                                                
						<div class="form-group">
								<input type="password" class="form-control"   id="userPassword"  value="<% out.print(rs.getString("password")); %>" disabled="true">
						</div>
                                                
						<div class="form-group">
								<input type="text" class="form-control" id="userAddress" value="<% out.print(rs.getString("user.address")); %>" disabled="true">
						</div>
                                                
                                                <div class="form-group">
								<input type="text" class="form-control" id="userPhone" value="<% out.print(rs.getString("telephone")); %>" disabled="true">
						</div>
                                                
                                                <div class="form-group">
								<input type="text" class="form-control" id="userBdate" value="<% out.print(rs.getString("birthdate")); %>" disabled="true">
						</div>
                                                
                                                 <div class="form-group">
								<input type="text" class="form-control" id="userAddress" value="<% out.print(rs.getString("ssn")); %>" disabled="true">
						</div>               
                                                                
						<div class="form-group">
                                                    <div class="radio">
							<label>
                                                            <input type="radio" name="gender" <% if(rs.getString("gender").equals("female")) {out.print("checked");} %> disabled="true">
									Female
							</label>
                                                    </div>
                                                    <div class="radio">
							<label>
                                                                <input type="radio" name="gender" <% if(rs.getString("gender").equals("male")) {out.print("checked");} %> disabled="true">
									Male
							</label>
                                                    </div>
						</div>
						
					</form>
                                    </div>
				</div>
                            </div>
			</div>
                                                                        
                        <div class="col-md-6">                                                
                        <div class="panel panel-widget">   
                        <div class="my-div">
                            <%
                                Statement st5 = con.createStatement();                                     
                                ResultSet rs5 = st5.executeQuery("select hotelid, imageaddress from hotel,hotelimage where hotelid = hotel_hotelid AND hotelid="+hotelId);                               
                            
                               if(!rs5.next())
                               {
                                   out.print("no image");
                                   
                               } else {
                                   
                                   %>
                                   <h3>Hotel Images</h3>
                                     <!-- #region Jssor Slider Begin --><!-- Generated by Jssor Slider Maker. --><!-- This is deep minimized demo, it works alone, it doesn't depend on any javascript library. --><script>(function(h,f,c,j,d,l,k){/*! Jssor */
                                    new(function(){});var e={Me:function(a){return-c.cos(a*c.PI)/2+.5},Hd:function(a){return a},Md:function(a){return-a*(a-2)}};var b=new function(){var g=this,Ab=/\S+/g,F=1,yb=2,fb=3,eb=4,jb=5,G,r=0,i=0,s=0,X=0,z=0,I=navigator,ob=I.appName,o=I.userAgent,p=parseFloat;function Ib(){if(!G){G={Ue:"ontouchstart"in h||"createTouch"in f};var a;if(I.pointerEnabled||(a=I.msPointerEnabled))G.Zc=a?"msTouchAction":"touchAction"}return G}function v(j){if(!r){r=-1;if(ob=="Microsoft Internet Explorer"&&!!h.attachEvent&&!!h.ActiveXObject){var e=o.indexOf("MSIE");r=F;s=p(o.substring(e+5,o.indexOf(";",e)));/*@cc_on X=@_jscript_version@*/;i=f.documentMode||s}else if(ob=="Netscape"&&!!h.addEventListener){var d=o.indexOf("Firefox"),b=o.indexOf("Safari"),g=o.indexOf("Chrome"),c=o.indexOf("AppleWebKit");if(d>=0){r=yb;i=p(o.substring(d+8))}else if(b>=0){var k=o.substring(0,b).lastIndexOf("/");r=g>=0?eb:fb;i=p(o.substring(k+1,b))}else{var a=/Trident\/.*rv:([0-9]{1,}[\.0-9]{0,})/i.exec(o);if(a){r=F;i=s=p(a[1])}}if(c>=0)z=p(o.substring(c+12))}else{var a=/(opera)(?:.*version|)[ \/]([\w.]+)/i.exec(o);if(a){r=jb;i=p(a[2])}}}return j==r}function q(){return v(F)}function Q(){return q()&&(i<6||f.compatMode=="BackCompat")}function db(){return v(fb)}function ib(){return v(jb)}function vb(){return db()&&z>534&&z<535}function J(){v();return z>537||i>42||r==F&&i>=11}function O(){return q()&&i<9}function wb(a){var b,c;return function(f){if(!b){b=d;var e=a.substr(0,1).toUpperCase()+a.substr(1);n([a].concat(["WebKit","ms","Moz","O","webkit"]),function(g,d){var b=a;if(d)b=g+e;if(f.style[b]!=k)return c=b})}return c}}function ub(b){var a;return function(c){a=a||wb(b)(c)||b;return a}}var K=ub("transform");function nb(a){return{}.toString.call(a)}var kb={};n(["Boolean","Number","String","Function","Array","Date","RegExp","Object"],function(a){kb["[object "+a+"]"]=a.toLowerCase()});function n(b,d){var a,c;if(nb(b)=="[object Array]"){for(a=0;a<b.length;a++)if(c=d(b[a],a,b))return c}else for(a in b)if(c=d(b[a],a,b))return c}function C(a){return a==j?String(a):kb[nb(a)]||"object"}function lb(a){for(var b in a)return d}function A(a){try{return C(a)=="object"&&!a.nodeType&&a!=a.window&&(!a.constructor||{}.hasOwnProperty.call(a.constructor.prototype,"isPrototypeOf"))}catch(b){}}function u(a,b){return{x:a,y:b}}function rb(b,a){setTimeout(b,a||0)}function H(b,d,c){var a=!b||b=="inherit"?"":b;n(d,function(c){var b=c.exec(a);if(b){var d=a.substr(0,b.index),e=a.substr(b.index+b[0].length+1,a.length-1);a=d+e}});a=c+(!a.indexOf(" ")?"":" ")+a;return a}function tb(b,a){if(i<9)b.style.filter=a}g.Fe=Ib;g.ed=q;g.oe=db;g.ye=J;g.dd=O;wb("transform");g.hd=function(){return i};g.fd=rb;function Y(a){a.constructor===Y.caller&&a.Wc&&a.Wc.apply(a,Y.caller.arguments)}g.Wc=Y;g.eb=function(a){if(g.De(a))a=f.getElementById(a);return a};function t(a){return a||h.event}g.Ac=t;g.Xb=function(b){b=t(b);var a=b.target||b.srcElement||f;if(a.nodeType==3)a=g.wc(a);return a};g.uc=function(a){a=t(a);return{x:a.pageX||a.clientX||0,y:a.pageY||a.clientY||0}};function D(c,d,a){if(a!==k)c.style[d]=a==k?"":a;else{var b=c.currentStyle||c.style;a=b[d];if(a==""&&h.getComputedStyle){b=c.ownerDocument.defaultView.getComputedStyle(c,j);b&&(a=b.getPropertyValue(d)||b[d])}return a}}function ab(b,c,a,d){if(a!==k){if(a==j)a="";else d&&(a+="px");D(b,c,a)}else return p(D(b,c))}function m(c,a){var d=a?ab:D,b;if(a&4)b=ub(c);return function(e,f){return d(e,b?b(e):c,f,a&2)}}function Db(b){if(q()&&s<9){var a=/opacity=([^)]*)/.exec(b.style.filter||"");return a?p(a[1])/100:1}else return p(b.style.opacity||"1")}function Fb(b,a,f){if(q()&&s<9){var h=b.style.filter||"",i=new RegExp(/[\s]*alpha\([^\)]*\)/g),e=c.round(100*a),d="";if(e<100||f)d="alpha(opacity="+e+") ";var g=H(h,[i],d);tb(b,g)}else b.style.opacity=a==1?"":c.round(a*100)/100}var L={Y:["rotate"],F:["rotateX"],S:["rotateY"],Eb:["skewX"],Db:["skewY"]};if(!J())L=B(L,{n:["scaleX",2],m:["scaleY",2],P:["translateZ",1]});function M(d,a){var c="";if(a){if(q()&&i&&i<10){delete a.F;delete a.S;delete a.P}b.e(a,function(d,b){var a=L[b];if(a){var e=a[1]||0;if(N[b]!=d)c+=" "+a[0]+"("+d+(["deg","px",""])[e]+")"}});if(J()){if(a.ab||a.V||a.P)c+=" translate3d("+(a.ab||0)+"px,"+(a.V||0)+"px,"+(a.P||0)+"px)";if(a.n==k)a.n=1;if(a.m==k)a.m=1;if(a.n!=1||a.m!=1)c+=" scale3d("+a.n+", "+a.m+", 1)"}}d.style[K(d)]=c}g.Qc=m("transformOrigin",4);g.ve=m("backfaceVisibility",4);g.ue=m("transformStyle",4);g.te=m("perspective",6);g.se=m("perspectiveOrigin",4);g.re=function(a,b){if(q()&&s<9||s<10&&Q())a.style.zoom=b==1?"":b;else{var c=K(a),f="scale("+b+")",e=a.style[c],g=new RegExp(/[\s]*scale\(.*?\)/g),d=H(e,[g],f);a.style[c]=d}};g.Wb=function(b,a){return function(c){c=t(c);var e=c.type,d=c.relatedTarget||(e=="mouseout"?c.toElement:c.fromElement);(!d||d!==a&&!g.pe(a,d))&&b(c)}};g.a=function(a,d,b,c){a=g.eb(a);if(a.addEventListener){d=="mousewheel"&&a.addEventListener("DOMMouseScroll",b,c);a.addEventListener(d,b,c)}else if(a.attachEvent){a.attachEvent("on"+d,b);c&&a.setCapture&&a.setCapture()}};g.C=function(a,c,d,b){a=g.eb(a);if(a.removeEventListener){c=="mousewheel"&&a.removeEventListener("DOMMouseScroll",d,b);a.removeEventListener(c,d,b)}else if(a.detachEvent){a.detachEvent("on"+c,d);b&&a.releaseCapture&&a.releaseCapture()}};g.Bb=function(a){a=t(a);a.preventDefault&&a.preventDefault();a.cancel=d;a.returnValue=l};g.me=function(a){a=t(a);a.stopPropagation&&a.stopPropagation();a.cancelBubble=d};g.D=function(d,c){var a=[].slice.call(arguments,2),b=function(){var b=a.concat([].slice.call(arguments,0));return c.apply(d,b)};return b};g.Ab=function(d,c){for(var b=[],a=d.firstChild;a;a=a.nextSibling)(c||a.nodeType==1)&&b.push(a);return b};function mb(a,c,e,b){b=b||"u";for(a=a?a.firstChild:j;a;a=a.nextSibling)if(a.nodeType==1){if(U(a,b)==c)return a;if(!e){var d=mb(a,c,e,b);if(d)return d}}}g.o=mb;function S(a,d,f,b){b=b||"u";var c=[];for(a=a?a.firstChild:j;a;a=a.nextSibling)if(a.nodeType==1){U(a,b)==d&&c.push(a);if(!f){var e=S(a,d,f,b);if(e.length)c=c.concat(e)}}return c}function gb(a,c,d){for(a=a?a.firstChild:j;a;a=a.nextSibling)if(a.nodeType==1){if(a.tagName==c)return a;if(!d){var b=gb(a,c,d);if(b)return b}}}g.Re=gb;g.Pe=function(b,a){return b.getElementsByTagName(a)};function B(){var e=arguments,d,c,b,a,g=1&e[0],f=1+g;d=e[f-1]||{};for(;f<e.length;f++)if(c=e[f])for(b in c){a=c[b];if(a!==k){a=c[b];var h=d[b];d[b]=g&&(A(h)||A(a))?B(g,{},h,a):a}}return d}g.K=B;function Z(f,g){var d={},c,a,b;for(c in f){a=f[c];b=g[c];if(a!==b){var e;if(A(a)&&A(b)){a=Z(a,b);e=!lb(a)}!e&&(d[c]=a)}}return d}g.Gc=function(a){return C(a)=="function"};g.De=function(a){return C(a)=="string"};g.Le=function(a){return!isNaN(p(a))&&isFinite(a)};g.e=n;function R(a){return f.createElement(a)}g.T=function(){return R("DIV")};g.zc=function(){};function V(b,c,a){if(a==k)return b.getAttribute(c);b.setAttribute(c,a)}function U(a,b){return V(a,b)||V(a,"data-"+b)}g.s=V;g.g=U;function x(b,a){if(a==k)return b.className;b.className=a}g.Kc=x;function qb(b){var a={};n(b,function(b){a[b]=b});return a}function sb(b,a){return b.match(a||Ab)}function P(b,a){return qb(sb(b||"",a))}g.le=sb;function bb(b,c){var a="";n(c,function(c){a&&(a+=b);a+=c});return a}function E(a,c,b){x(a,bb(" ",B(Z(P(x(a)),P(c)),P(b))))}g.wc=function(a){return a.parentNode};g.G=function(a){g.H(a,"none")};g.I=function(a,b){g.H(a,b?"none":"")};g.qd=function(b,a){b.removeAttribute(a)};g.kd=function(){return q()&&i<10};g.Ad=function(d,a){if(a)d.style.clip="rect("+c.round(a.j||a.p||0)+"px "+c.round(a.u)+"px "+c.round(a.r)+"px "+c.round(a.k||a.q||0)+"px)";else if(a!==k){var g=d.style.cssText,f=[new RegExp(/[\s]*clip: rect\(.*?\)[;]?/i),new RegExp(/[\s]*cliptop: .*?[;]?/i),new RegExp(/[\s]*clipright: .*?[;]?/i),new RegExp(/[\s]*clipbottom: .*?[;]?/i),new RegExp(/[\s]*clipleft: .*?[;]?/i)],e=H(g,f,"");b.yb(d,e)}};g.N=function(){return+new Date};g.E=function(b,a){b.appendChild(a)};g.xb=function(b,a,c){(c||a.parentNode).insertBefore(b,a)};g.wb=function(b,a){a=a||b.parentNode;a&&a.removeChild(b)};g.Sd=function(a,b){n(a,function(a){g.wb(a,b)})};g.nc=function(a){g.Sd(g.Ab(a,d),a)};g.Ed=function(a,b){var c=g.wc(a);b&1&&g.v(a,(g.i(c)-g.i(a))/2);b&2&&g.z(a,(g.l(c)-g.l(a))/2)};g.ce=function(b,a){return parseInt(b,a||10)};g.be=p;g.pe=function(b,a){var c=f.body;while(a&&b!==a&&c!==a)try{a=a.parentNode}catch(d){return l}return b===a};function W(d,c,b){var a=d.cloneNode(!c);!b&&g.qd(a,"id");return a}g.nb=W;g.gb=function(e,f){var a=new Image;function b(e,d){g.C(a,"load",b);g.C(a,"abort",c);g.C(a,"error",c);f&&f(a,d)}function c(a){b(a,d)}if(ib()&&i<11.6||!e)b(!e);else{g.a(a,"load",b);g.a(a,"abort",c);g.a(a,"error",c);a.src=e}};g.Yd=function(d,a,e){var c=d.length+1;function b(b){c--;if(a&&b&&b.src==a.src)a=b;!c&&e&&e(a)}n(d,function(a){g.gb(a.src,b)});b()};g.Xd=function(a,g,i,h){if(h)a=W(a);var c=S(a,g);if(!c.length)c=b.Pe(a,g);for(var f=c.length-1;f>-1;f--){var d=c[f],e=W(i);x(e,x(d));b.yb(e,d.style.cssText);b.xb(e,d);b.wb(d)}return a};function Gb(a){var l=this,p="",r=["av","pv","ds","dn"],e=[],q,j=0,h=0,d=0;function i(){E(a,q,e[d||j||h&2||h]);b.Q(a,"pointer-events",d?"none":"")}function c(){j=0;i();g.C(f,"mouseup",c);g.C(f,"touchend",c);g.C(f,"touchcancel",c)}function o(a){if(d)g.Bb(a);else{j=4;i();g.a(f,"mouseup",c);g.a(f,"touchend",c);g.a(f,"touchcancel",c)}}l.Vd=function(a){if(a===k)return h;h=a&2||a&1;i()};l.Bc=function(a){if(a===k)return!d;d=a?0:3;i()};l.db=a=g.eb(a);var m=b.le(x(a));if(m)p=m.shift();n(r,function(a){e.push(p+a)});q=bb(" ",e);e.unshift("");g.a(a,"mousedown",o);g.a(a,"touchstart",o)}g.Kb=function(a){return new Gb(a)};g.Q=D;g.fb=m("overflow");g.z=m("top",2);g.v=m("left",2);g.i=m("width",2);g.l=m("height",2);g.Pd=m("marginLeft",2);g.Od=m("marginTop",2);g.A=m("position");g.H=m("display");g.B=m("zIndex",1);g.Yb=function(b,a,c){if(a!=k)Fb(b,a,c);else return Db(b)};g.yb=function(a,b){if(b!=k)a.style.cssText=b;else return a.style.cssText};var T={ib:g.Yb,j:g.z,k:g.v,Hb:g.i,vb:g.l,jb:g.A,ff:g.H,kb:g.B};function w(f,l){var e=O(),b=J(),d=vb(),h=K(f);function i(b,d,a){var e=b.cb(u(-d/2,-a/2)),f=b.cb(u(d/2,-a/2)),g=b.cb(u(d/2,a/2)),h=b.cb(u(-d/2,a/2));b.cb(u(300,300));return u(c.min(e.x,f.x,g.x,h.x)+d/2,c.min(e.y,f.y,g.y,h.y)+a/2)}function a(d,a){a=a||{};var f=a.P||0,l=(a.F||0)%360,m=(a.S||0)%360,o=(a.Y||0)%360,p=a.ef;if(e){f=0;l=0;m=0;p=0}var c=new Cb(a.ab,a.V,f);c.F(l);c.S(m);c.Qd(o);c.Rd(a.Eb,a.Db);c.cc(a.n,a.m,p);if(b){c.lb(a.q,a.p);d.style[h]=c.ld()}else if(!X||X<9){var j="";if(o||a.n!=k&&a.n!=1||a.m!=k&&a.m!=1){var n=i(c,a.bb,a.Z);g.Od(d,n.y);g.Pd(d,n.x);j=c.pd()}var r=d.style.filter,s=new RegExp(/[\s]*progid:DXImageTransform\.Microsoft\.Matrix\([^\)]*\)/g),q=H(r,[s],j);tb(d,q)}}w=function(e,c){c=c||{};var h=c.q,i=c.p,f;n(T,function(a,b){f=c[b];f!==k&&a(e,f)});g.Ad(e,c.c);if(!b){h!=k&&g.v(e,(c.Cc||0)+h);i!=k&&g.z(e,(c.Dc||0)+i)}if(c.sd)if(d)rb(g.D(j,M,e,c));else a(e,c)};g.tb=M;if(d)g.tb=w;if(e)g.tb=a;else if(!b)a=M;g.R=w;w(f,l)}g.tb=w;g.R=w;function Cb(i,l,p){var d=this,b=[1,0,0,0,0,1,0,0,0,0,1,0,i||0,l||0,p||0,1],h=c.sin,g=c.cos,m=c.tan;function f(a){return a*c.PI/180}function o(a,b){return{x:a,y:b}}function n(c,e,l,m,o,r,t,u,w,z,A,C,E,b,f,k,a,g,i,n,p,q,s,v,x,y,B,D,F,d,h,j){return[c*a+e*p+l*x+m*F,c*g+e*q+l*y+m*d,c*i+e*s+l*B+m*h,c*n+e*v+l*D+m*j,o*a+r*p+t*x+u*F,o*g+r*q+t*y+u*d,o*i+r*s+t*B+u*h,o*n+r*v+t*D+u*j,w*a+z*p+A*x+C*F,w*g+z*q+A*y+C*d,w*i+z*s+A*B+C*h,w*n+z*v+A*D+C*j,E*a+b*p+f*x+k*F,E*g+b*q+f*y+k*d,E*i+b*s+f*B+k*h,E*n+b*v+f*D+k*j]}function e(c,a){return n.apply(j,(a||b).concat(c))}d.cc=function(a,c,d){if(a==k)a=1;if(c==k)c=1;if(d==k)d=1;if(a!=1||c!=1||d!=1)b=e([a,0,0,0,0,c,0,0,0,0,d,0,0,0,0,1])};d.lb=function(a,c,d){b[12]+=a||0;b[13]+=c||0;b[14]+=d||0};d.F=function(c){if(c){a=f(c);var d=g(a),i=h(a);b=e([1,0,0,0,0,d,i,0,0,-i,d,0,0,0,0,1])}};d.S=function(c){if(c){a=f(c);var d=g(a),i=h(a);b=e([d,0,-i,0,0,1,0,0,i,0,d,0,0,0,0,1])}};d.Qd=function(c){if(c){a=f(c);var d=g(a),i=h(a);b=e([d,i,0,0,-i,d,0,0,0,0,1,0,0,0,0,1])}};d.Rd=function(a,c){if(a||c){i=f(a);l=f(c);b=e([1,m(l),0,0,m(i),1,0,0,0,0,1,0,0,0,0,1])}};d.cb=function(c){var a=e(b,[1,0,0,0,0,1,0,0,0,0,1,0,c.x,c.y,0,1]);return o(a[12],a[13])};d.ld=function(){return"matrix3d("+b.join(",")+")"};d.pd=function(){return"progid:DXImageTransform.Microsoft.Matrix(M11="+b[0]+", M12="+b[4]+", M21="+b[1]+", M22="+b[5]+", SizingMethod='auto expand')"}}new function(){var a=this;function b(d,g){for(var j=d[0].length,i=d.length,h=g[0].length,f=[],c=0;c<i;c++)for(var k=f[c]=[],b=0;b<h;b++){for(var e=0,a=0;a<j;a++)e+=d[c][a]*g[a][b];k[b]=e}return f}a.n=function(b,c){return a.Hc(b,c,0)};a.m=function(b,c){return a.Hc(b,0,c)};a.Hc=function(a,c,d){return b(a,[[c,0],[0,d]])};a.cb=function(d,c){var a=b(d,[[c.x],[c.y]]);return u(a[0][0],a[1][0])}};var N={Cc:0,Dc:0,q:0,p:0,X:1,n:1,m:1,Y:0,F:0,S:0,ab:0,V:0,P:0,Eb:0,Db:0};g.ie=function(a){var c=a||{};if(a)if(b.Gc(a))c={bc:c};else if(b.Gc(a.c))c.c={bc:a.c};return c};g.Ie=function(l,m,x,q,z,A,n){var a=m;if(l){a={};for(var g in m){var B=A[g]||1,w=z[g]||[0,1],f=(x-w[0])/w[1];f=c.min(c.max(f,0),1);f=f*B;var u=c.floor(f);if(f!=u)f-=u;var h=q.bc||e.Me,i,C=l[g],o=m[g];if(b.Le(o)){h=q[g]||h;var y=h(f);i=C+o*y}else{i=b.K({Gb:{}},l[g]);var v=q[g]||{};b.e(o.Gb||o,function(d,a){h=v[a]||v.bc||h;var c=h(f),b=d*c;i.Gb[a]=b;i[a]+=b})}a[g]=i}var t=b.e(m,function(b,a){return N[a]!=k});t&&b.e(N,function(c,b){if(a[b]==k&&l[b]!==k)a[b]=l[b]});if(t){if(a.X)a.n=a.m=a.X;a.bb=n.bb;a.Z=n.Z;a.sd=d}}if(m.c&&n.lb){var p=a.c.Gb,s=(p.j||0)+(p.r||0),r=(p.k||0)+(p.u||0);a.k=(a.k||0)+r;a.j=(a.j||0)+s;a.c.k-=r;a.c.u-=r;a.c.j-=s;a.c.r-=s}if(a.c&&b.kd()&&!a.c.j&&!a.c.k&&!a.c.p&&!a.c.q&&a.c.u==n.bb&&a.c.r==n.Z)a.c=j;return a}};function n(){var a=this,d=[];function i(a,b){d.push({kc:a,mc:b})}function g(a,c){b.e(d,function(b,e){b.kc==a&&b.mc===c&&d.splice(e,1)})}a.mb=a.addEventListener=i;a.removeEventListener=g;a.f=function(a){var c=[].slice.call(arguments,1);b.e(d,function(b){b.kc==a&&b.mc.apply(h,c)})}}var m=function(z,C,i,J,M,L){z=z||0;var a=this,q,n,o,u,A=0,G,H,F,B,y=0,g=0,m=0,D,k,f,e,p,w=[],x;function O(a){f+=a;e+=a;k+=a;g+=a;m+=a;y+=a}function t(o){var h=o;if(p&&(h>=e||h<=f))h=((h-f)%p+p)%p+f;if(!D||u||g!=h){var j=c.min(h,e);j=c.max(j,f);if(!D||u||j!=m){if(L){var l=(j-k)/(C||1);if(i.Ee)l=1-l;var n=b.Ie(M,L,l,G,F,H,i);if(x)b.e(n,function(b,a){x[a]&&x[a](J,b)});else b.R(J,n)}a.ic(m-k,j-k);m=j;b.e(w,function(b,c){var a=o<g?w[w.length-c-1]:b;a.M(m-y)});var r=g,q=m;g=h;D=d;a.Jb(r,q)}}}function E(a,b,d){b&&a.Zb(e);if(!d){f=c.min(f,a.Jc()+y);e=c.max(e,a.Sb()+y)}w.push(a)}var r=h.requestAnimationFrame||h.webkitRequestAnimationFrame||h.mozRequestAnimationFrame||h.msRequestAnimationFrame;if(b.oe()&&b.hd()<7)r=j;r=r||function(a){b.fd(a,i.Nc)};function I(){if(q){var d=b.N(),e=c.min(d-A,i.tc),a=g+e*o;A=d;if(a*o>=n*o)a=n;t(a);if(!u&&a*o>=n*o)K(B);else r(I)}}function s(h,i,j){if(!q){q=d;u=j;B=i;h=c.max(h,f);h=c.min(h,e);n=h;o=n<g?-1:1;a.oc();A=b.N();r(I)}}function K(b){if(q){u=q=B=l;a.xc();b&&b()}}a.sc=function(a,b,c){s(a?g+a:e,b,c)};a.qc=s;a.U=K;a.Ae=function(a){s(a)};a.O=function(){return g};a.rc=function(){return n};a.pb=function(){return m};a.M=t;a.lb=function(a){t(g+a)};a.Ec=function(){return q};a.Se=function(a){p=a};a.Zb=O;a.Pc=function(a,b){E(a,0,b)};a.dc=function(a){E(a,1)};a.Jc=function(){return f};a.Sb=function(){return e};a.Jb=a.oc=a.xc=a.ic=b.zc;a.lc=b.N();i=b.K({Nc:16,tc:50},i);p=i.Mc;x=i.he;f=k=z;e=z+C;H=i.Fd||{};F=i.Ld||{};G=b.ie(i.hb)};new(function(){});var i=function(p,fc){var g=this;function Bc(){var a=this;m.call(a,-1e8,2e8);a.Ge=function(){var b=a.pb(),d=c.floor(b),f=t(d),e=b-c.floor(b);return{W:f,He:d,jb:e}};a.Jb=function(b,a){var e=c.floor(a);if(e!=a&&a>b)e++;Tb(e,d);g.f(i.Qe,t(a),t(b),a,b)}}function Ac(){var a=this;m.call(a,0,0,{Mc:q});b.e(C,function(b){D&1&&b.Se(q);a.dc(b);b.Zb(kb/bc)})}function zc(){var a=this,b=Ub.db;m.call(a,-1,2,{hb:e.Hd,he:{jb:Zb},Mc:q},b,{jb:1},{jb:-2});a.Fb=b}function mc(o,n){var b=this,e,f,h,k,c;m.call(b,-1e8,2e8,{tc:100});b.oc=function(){M=d;R=j;g.f(i.Ne,t(w.O()),w.O())};b.xc=function(){M=l;k=l;var a=w.Ge();g.f(i.Cd,t(w.O()),w.O());!a.jb&&Dc(a.He,s)};b.Jb=function(i,g){var b;if(k)b=c;else{b=f;if(h){var d=g/h;b=a.Te(d)*(f-e)+e}}w.M(b)};b.zb=function(a,d,c,g){e=a;f=d;h=c;w.M(a);b.M(0);b.qc(c,g)};b.nd=function(a){k=d;c=a;b.sc(a,j,d)};b.od=function(a){c=a};w=new Bc;w.Pc(o);w.Pc(n)}function oc(){var c=this,a=Xb();b.B(a,0);b.Q(a,"pointerEvents","none");c.db=a;c.Cb=function(){b.G(a);b.nc(a)}}function xc(o,f){var e=this,r,L,v,k,y=[],x,B,W,G,Q,F,h,w,p;m.call(e,-u,u+1,{});function E(a){r&&r.Rc();T(o,a,0);F=d;r=new I.L(o,I,b.be(b.g(o,"idle"))||lc);r.M(0)}function Z(){r.lc<I.lc&&E()}function M(p,r,o){if(!G){G=d;if(k&&o){var h=o.width,c=o.height,n=h,m=c;if(h&&c&&a.ob){if(a.ob&3&&(!(a.ob&4)||h>K||c>J)){var j=l,q=K/J*c/h;if(a.ob&1)j=q>1;else if(a.ob&2)j=q<1;n=j?h*J/c:K;m=j?J:c*K/h}b.i(k,n);b.l(k,m);b.z(k,(J-m)/2);b.v(k,(K-n)/2)}b.A(k,"absolute");g.f(i.xd,f)}}b.G(r);p&&p(e)}function Y(b,c,d,g){if(g==R&&s==f&&N)if(!Cc){var a=t(b);A.Ce(a,f,c,e,d);c.Wd();U.Zb(a-U.Jc()-1);U.M(a);z.zb(b,b,0)}}function bb(b){if(b==R&&s==f){if(!h){var a=j;if(A)if(A.W==f)a=A.qe();else A.Cb();Z();h=new vc(o,f,a,r);h.bd(p)}!h.Ec()&&h.Mb()}}function S(d,g,l){if(d==f){if(d!=g)C[g]&&C[g].Ud();else!l&&h&&h.ge();p&&p.Bc();var m=R=b.N();e.gb(b.D(j,bb,m))}else{var k=c.min(f,d),i=c.max(f,d),o=c.min(i-k,k+q-i),n=u+a.Kd-1;(!Q||o<=n)&&e.gb()}}function db(){if(s==f&&h){h.U();p&&p.Jd();p&&p.Id();h.id()}}function eb(){s==f&&h&&h.U()}function ab(a){!P&&g.f(i.Nd,f,a)}function O(){p=w.pInstance;h&&h.bd(p)}e.gb=function(c,a){a=a||v;if(y.length&&!G){b.I(a);if(!W){W=d;g.f(i.Zd,f);b.e(y,function(a){if(!b.s(a,"src")){a.src=b.g(a,"src2");b.H(a,a["display-origin"])}})}b.Yd(y,k,b.D(j,M,c,a))}else M(c,a)};e.fe=function(){var h=f;if(a.Vc<0)h-=q;var d=h+a.Vc*tc;if(D&2)d=t(d);if(!(D&1)&&!ib)d=c.max(0,c.min(d,q-u));if(d!=f){if(A){var e=A.Be(q);if(e){var i=R=b.N(),g=C[t(d)];return g.gb(b.D(j,Y,d,g,e,i),v)}}cb(d)}};e.gc=function(){S(f,f,d)};e.Ud=function(){p&&p.Jd();p&&p.Id();e.Xc();h&&h.rd();h=j;E()};e.Wd=function(){b.G(o)};e.Xc=function(){b.I(o)};e.Bd=function(){p&&p.Bc()};function T(a,c,e){if(b.s(a,"jssor-slider"))return;if(!F){if(a.tagName=="IMG"){y.push(a);if(!b.s(a,"src")){Q=d;a["display-origin"]=b.H(a);b.G(a)}}b.dd()&&b.B(a,(b.B(a)||0)+1)}var f=b.Ab(a);b.e(f,function(f){var h=f.tagName,i=b.g(f,"u");if(i=="player"&&!w){w=f;if(w.pInstance)O();else b.a(w,"dataavailable",O)}if(i=="caption"){if(c){b.Qc(f,b.g(f,"to"));b.ve(f,b.g(f,"bf"));b.g(f,"3d")&&b.ue(f,"preserve-3d")}else if(!b.ed()){var g=b.nb(f,l,d);b.xb(g,f,a);b.wb(f,a);f=g;c=d}}else if(!F&&!e&&!k){if(h=="A"){if(b.g(f,"u")=="image")k=b.Re(f,"IMG");else k=b.o(f,"image",d);if(k){x=f;b.H(x,"block");b.R(x,V);B=b.nb(x,d);b.A(x,"relative");b.Yb(B,0);b.Q(B,"backgroundColor","#000")}}else if(h=="IMG"&&b.g(f,"u")=="image")k=f;if(k){k.border=0;b.R(k,V)}}T(f,c,e+1)})}e.ic=function(c,b){var a=u-b;Zb(L,a)};e.W=f;n.call(e);b.te(o,b.g(o,"p"));b.se(o,b.g(o,"po"));var H=b.o(o,"thumb",d);if(H){e.zd=b.nb(H);b.G(H)}b.I(o);v=b.nb(gb);b.B(v,1e3);b.a(o,"click",ab);E(d);e.ad=k;e.gd=B;e.Fb=L=o;b.E(L,v);g.mb(203,S);g.mb(28,eb);g.mb(24,db)}function vc(y,f,p,q){var a=this,n=0,u=0,h,j,e,c,k,t,r,o=C[f];m.call(a,0,0);function v(){b.nc(L);cc&&k&&o.gd&&b.E(L,o.gd);b.I(L,!k&&o.ad)}function w(){a.Mb()}function x(b){r=b;a.U();a.Mb()}a.Mb=function(){var b=a.pb();if(!B&&!M&&!r&&s==f){if(!b){if(h&&!k){k=d;a.id(d);g.f(i.md,f,n,u,h,c)}v()}var l,p=i.Tc;if(b!=c)if(b==e)l=c;else if(b==j)l=e;else if(!b)l=j;else l=a.rc();g.f(p,f,b,n,j,e,c);var m=N&&(!E||F);if(b==c)(e!=c&&!(E&12)||m)&&o.fe();else(m||b!=e)&&a.qc(l,w)}};a.ge=function(){e==c&&e==a.pb()&&a.M(j)};a.rd=function(){A&&A.W==f&&A.Cb();var b=a.pb();b<c&&g.f(i.Tc,f,-b-1,n,j,e,c)};a.id=function(a){p&&b.fb(lb,a&&p.vc.We?"":"hidden")};a.ic=function(b,a){if(k&&a>=h){k=l;v();o.Xc();A.Cb();g.f(i.Je,f,n,u,h,c)}g.f(i.Ke,f,a,n,j,e,c)};a.bd=function(a){if(a&&!t){t=a;a.mb($JssorPlayer$.Td,x)}};p&&a.dc(p);h=a.Sb();a.dc(q);j=h+q.jd;e=h+q.cd;c=a.Sb()}function Kb(a,c,d){b.v(a,c);b.z(a,d)}function Zb(c,b){var a=x>0?x:fb,d=zb*b*(a&1),e=Ab*b*(a>>1&1);Kb(c,d,e)}function Pb(){qb=M;Ib=z.rc();G=w.O()}function gc(){Pb();if(B||!F&&E&12){z.U();g.f(i.Oe)}}function ec(f){if(!B&&(F||!(E&12))&&!z.Ec()){var d=w.O(),b=c.ceil(G);if(f&&c.abs(H)>=a.Sc){b=c.ceil(d);b+=jb}if(!(D&1))b=c.min(q-u,c.max(b,0));var e=c.abs(b-d);e=1-c.pow(1-e,5);if(!P&&qb)z.Ae(Ib);else if(d==b){tb.Bd();tb.gc()}else z.zb(d,b,e*Vb)}}function Hb(a){!b.g(b.Xb(a),"nodrag")&&b.Bb(a)}function rc(a){Yb(a,1)}function Yb(a,c){a=b.Ac(a);var k=b.Xb(a);if(!O&&!b.g(k,"nodrag")&&sc()&&(!c||a.touches.length==1)){B=d;yb=l;R=j;b.a(f,c?"touchmove":"mousemove",Bb);b.N();P=0;gc();if(!qb)x=0;if(c){var h=a.touches[0];ub=h.clientX;vb=h.clientY}else{var e=b.uc(a);ub=e.x;vb=e.y}H=0;hb=0;jb=0;g.f(i.je,t(G),G,a)}}function Bb(e){if(B){e=b.Ac(e);var f;if(e.type!="mousemove"){var l=e.touches[0];f={x:l.clientX,y:l.clientY}}else f=b.uc(e);if(f){var j=f.x-ub,k=f.y-vb;if(c.floor(G)!=G)x=x||fb&O;if((j||k)&&!x){if(O==3)if(c.abs(k)>c.abs(j))x=2;else x=1;else x=O;if(ob&&x==1&&c.abs(k)-c.abs(j)>3)yb=d}if(x){var a=k,i=Ab;if(x==1){a=j;i=zb}if(!(D&1)){if(a>0){var g=i*s,h=a-g;if(h>0)a=g+c.sqrt(h)*5}if(a<0){var g=i*(q-u-s),h=-a-g;if(h>0)a=-g-c.sqrt(h)*5}}if(H-hb<-2)jb=0;else if(H-hb>2)jb=-1;hb=H;H=a;sb=G-H/i/(Y||1);if(H&&x&&!yb){b.Bb(e);if(!M)z.nd(sb);else z.od(sb)}}}}}function bb(){qc();if(B){B=l;b.N();b.C(f,"mousemove",Bb);b.C(f,"touchmove",Bb);P=H;z.U();var a=w.O();g.f(i.ke,t(a),a,t(G),G);E&12&&Pb();ec(d)}}function jc(c){if(P){b.me(c);var a=b.Xb(c);while(a&&v!==a){a.tagName=="A"&&b.Bb(c);try{a=a.parentNode}catch(d){break}}}}function Jb(a){C[s];s=t(a);tb=C[s];Tb(a);return s}function Dc(a,b){x=0;Jb(a);g.f(i.ne,t(a),b)}function Tb(a,c){wb=a;b.e(S,function(b){b.jc(t(a),a,c)})}function sc(){var b=i.Uc||0,a=X;if(ob)a&1&&(a&=1);i.Uc|=a;return O=a&~b}function qc(){if(O){i.Uc&=~X;O=0}}function Xb(){var a=b.T();b.R(a,V);b.A(a,"absolute");return a}function t(a){return(a%q+q)%q}function kc(b,d){if(d)if(!D){b=c.min(c.max(b+wb,0),q-u);d=l}else if(D&2){b=t(b+wb);d=l}cb(b,a.Ob,d)}function xb(){b.e(S,function(a){a.Pb(a.Ib.Ye<=F)})}function hc(){if(!F){F=1;xb();if(!B){E&12&&ec();E&3&&C[s].gc()}}}function Ec(){if(F){F=0;xb();B||!(E&12)||gc()}}function ic(){V={Hb:K,vb:J,j:0,k:0};b.e(T,function(a){b.R(a,V);b.A(a,"absolute");b.fb(a,"hidden");b.G(a)});b.R(gb,V)}function ab(b,a){cb(b,a,d)}function cb(g,f,j){if(Rb&&(!B&&(F||!(E&12))||a.Yc)){M=d;B=l;z.U();if(f==k)f=Vb;var e=Cb.pb(),b=g;if(j){b=e+g;if(g>0)b=c.ceil(b);else b=c.floor(b)}if(D&2)b=t(b);if(!(D&1))b=c.max(0,c.min(b,q-u));var i=(b-e)%q;b=e+i;var h=e==b?0:f*c.abs(i);h=c.min(h,f*u*1.5);z.zb(e,b,h||1)}}g.we=cb;g.sc=function(){if(!N){N=d;C[s]&&C[s].gc()}};g.ze=function(){return P};function W(){return b.i(y||p)}function nb(){return b.l(y||p)}g.bb=W;g.Z=nb;function Eb(c,d){if(c==k)return b.i(p);if(!y){var a=b.T(f);b.Kc(a,b.Kc(p));b.yb(a,b.yb(p));b.H(a,"block");b.A(a,"relative");b.z(a,0);b.v(a,0);b.fb(a,"visible");y=b.T(f);b.A(y,"absolute");b.z(y,0);b.v(y,0);b.i(y,b.i(p));b.l(y,b.l(p));b.Qc(y,"0 0");b.E(y,a);var h=b.Ab(p);b.E(p,y);b.Q(p,"backgroundImage","");b.e(h,function(c){b.E(b.g(c,"noscale")?p:a,c);b.g(c,"autocenter")&&Lb.push(c)})}Y=c/(d?b.l:b.i)(y);b.re(y,Y);var g=d?Y*W():c,e=d?c:Y*nb();b.i(p,g);b.l(p,e);b.e(Lb,function(a){var c=b.ce(b.g(a,"autocenter"));b.Ed(a,c)})}g.xe=Eb;g.pc=function(a){var d=c.ceil(t(kb/bc)),b=t(a-s+d);if(b>u){if(a-s>q/2)a-=q;else if(a-s<=-q/2)a+=q}else a=s+b-d;return a};n.call(g);g.db=p=b.eb(p);var a=b.K({ob:0,Kd:1,Vb:1,Ub:0,Tb:l,sb:1,qb:d,Yc:d,Vc:1,Lc:3e3,Ic:1,Ob:500,Te:e.Md,Sc:20,Oc:0,J:1,Rb:0,yd:1,Qb:1,Fc:1},fc);a.qb=a.qb&&b.ye();if(a.wd!=k)a.Lc=a.wd;if(a.td!=k)a.Rb=a.td;var fb=a.Qb&3,tc=(a.Qb&4)/-4||1,mb=a.df,I=b.K({L:r,qb:a.qb},a.cf);I.ac=I.ac||I.bf;var Fb=a.af,Z=a.ee,eb=a.Dd,Q=!a.yd,y,v=b.o(p,"slides",Q),gb=b.o(p,"loading",Q)||b.T(f),Nb=b.o(p,"navigator",Q),dc=b.o(p,"arrowleft",Q),ac=b.o(p,"arrowright",Q),Mb=b.o(p,"thumbnavigator",Q),pc=b.i(v),nc=b.l(v),V,T=[],uc=b.Ab(v);b.e(uc,function(a){if(a.tagName=="DIV"&&!b.g(a,"u"))T.push(a);else b.dd()&&b.B(a,(b.B(a)||0)+1)});var s=-1,wb,tb,q=T.length,K=a.de||pc,J=a.ae||nc,Wb=a.Oc,zb=K+Wb,Ab=J+Wb,bc=fb&1?zb:Ab,u=c.min(a.J,q),lb,x,O,yb,S=[],Qb,Sb,Ob,cc,Cc,N,E=a.Ic,lc=a.Lc,Vb=a.Ob,rb,ib,kb,Rb=u<q,D=Rb?a.sb:0,X,P,F=1,M,B,R,ub=0,vb=0,H,hb,jb,Cb,w,U,z,Ub=new oc,Y,Lb=[];if(q){if(a.qb)Kb=function(a,c,d){b.tb(a,{ab:c,V:d})};N=a.Tb;g.Ib=fc;ic();b.s(p,"jssor-slider",d);b.B(v,b.B(v)||0);b.A(v,"absolute");lb=b.nb(v,d);b.xb(lb,v);if(mb){cc=mb.Ze;rb=mb.L;ib=u==1&&q>1&&rb&&(!b.ed()||b.hd()>=8)}kb=ib||u>=q||!(D&1)?0:a.Rb;X=(u>1||kb?fb:-1)&a.Fc;var Gb=v,C=[],A,L,Db=b.Fe(),ob=Db.Ue,G,qb,Ib,sb;Db.Zc&&b.Q(Gb,Db.Zc,([j,"pan-y","pan-x","none"])[X]||"");U=new zc;if(ib)A=new rb(Ub,K,J,mb,ob);b.E(lb,U.Fb);b.fb(v,"hidden");L=Xb();b.Q(L,"backgroundColor","#000");b.Yb(L,0);b.xb(L,Gb.firstChild,Gb);for(var db=0;db<T.length;db++){var wc=T[db],yc=new xc(wc,db);C.push(yc)}b.G(gb);Cb=new Ac;z=new mc(Cb,U);if(X){b.a(v,"mousedown",Yb);b.a(v,"touchstart",rc);b.a(v,"dragstart",Hb);b.a(v,"selectstart",Hb);b.a(f,"mouseup",bb);b.a(f,"touchend",bb);b.a(f,"touchcancel",bb);b.a(h,"blur",bb)}E&=ob?10:5;if(Nb&&Fb){Qb=new Fb.L(Nb,Fb,W(),nb());S.push(Qb)}if(Z&&dc&&ac){Z.sb=D;Z.J=u;Sb=new Z.L(dc,ac,Z,W(),nb());S.push(Sb)}if(Mb&&eb){eb.Ub=a.Ub;Ob=new eb.L(Mb,eb);S.push(Ob)}b.e(S,function(a){a.Nb(q,C,gb);a.mb(o.Lb,kc)});b.Q(p,"visibility","visible");Eb(W());b.a(v,"click",jc,d);b.a(p,"mouseout",b.Wb(hc,p));b.a(p,"mouseover",b.Wb(Ec,p));xb();a.Vb&&b.a(f,"keydown",function(b){if(b.keyCode==37)ab(-a.Vb);else b.keyCode==39&&ab(a.Vb)});var pb=a.Ub;if(!(D&1))pb=c.max(0,c.min(pb,q-u));z.zb(pb,pb,0)}};i.Nd=21;i.je=22;i.ke=23;i.Ne=24;i.Cd=25;i.Zd=26;i.xd=27;i.Oe=28;i.Qe=202;i.ne=203;i.md=206;i.Je=207;i.Ke=208;i.Tc=209;var o={Lb:1};var s=function(a,g,h){var c=this;n.call(c);var r,q,e,f,i;b.i(a);b.l(a);function k(a){c.f(o.Lb,a,d)}function p(c){b.I(a,c||!h.sb&&e==0);b.I(g,c||!h.sb&&e>=q-h.J);r=c}c.jc=function(b,a,c){if(c)e=a;else{e=b;p(r)}};c.Pb=p;var m;c.Nb=function(c){q=c;e=0;if(!m){b.a(a,"click",b.D(j,k,-i));b.a(g,"click",b.D(j,k,i));b.Kb(a);b.Kb(g);m=d}};c.Ib=f=b.K({vd:1},h);i=f.vd;if(f.cc==l){b.s(a,"noscale",d);b.s(g,"noscale",d)}if(f.rb){b.s(a,"autocenter",f.rb);b.s(g,"autocenter",f.rb)}},q=function(g,B){var h=this,z,p,a,v=[],x,w,e,q,r,u,t,m,s,f,k;n.call(h);g=b.eb(g);function A(n,f){var g=this,c,m,l;function q(){m.Vd(p==f)}function i(d){if(d||!s.ze()){var a=e-f%e,b=s.pc((f+a)/e-1),c=b*e+e-a;h.f(o.Lb,c)}}g.W=f;g.yc=q;l=n.zd||n.ad||b.T();g.Fb=c=b.Xd(k,"thumbnailtemplate",l,d);m=b.Kb(c);a.ec&1&&b.a(c,"click",b.D(j,i,0));a.ec&2&&b.a(c,"mouseover",b.Wb(b.D(j,i,1),c))}h.jc=function(b,d,f){var a=p;p=b;a!=-1&&v[a].yc();v[b].yc();!f&&s.we(s.pc(c.floor(d/e)))};h.Pb=function(a){b.I(g,a)};var y;h.Nb=function(D,C){if(!y){z=D;c.ceil(z/e);p=-1;m=c.min(m,C.length);var h=a.ub&1,n=u+(u+q)*(e-1)*(1-h),k=t+(t+r)*(e-1)*h,B=n+(n+q)*(m-1)*h,o=k+(k+r)*(m-1)*(1-h);b.A(f,"absolute");b.fb(f,"hidden");a.rb&1&&b.v(f,(x-B)/2);a.rb&2&&b.z(f,(w-o)/2);b.i(f,B);b.l(f,o);var j=[];b.e(C,function(l,g){var i=new A(l,g),d=i.Fb,a=c.floor(g/e),k=g%e;b.v(d,(u+q)*k*(1-h));b.z(d,(t+r)*k*h);if(!j[a]){j[a]=b.T();b.E(f,j[a])}b.E(j[a],d);v.push(i)});var E=b.K({Tb:l,Yc:l,de:n,ae:k,Oc:q*h+r*(1-h),Sc:12,Ob:200,Ic:1,Qb:a.ub,Fc:a.Xe||a.Ve?0:a.ub},a);s=new i(g,E);y=d}};h.Ib=a=b.K({fc:0,hc:0,J:1,ub:1,rb:3,ec:1},B);x=b.i(g);w=b.l(g);f=b.o(g,"slides",d);k=b.o(f,"prototype");u=b.i(k);t=b.l(k);b.wb(k,f);e=a.ud||1;q=a.fc;r=a.hc;m=a.J;a.cc==l&&b.s(g,"noscale",d)};function r(e,d,c){var a=this;m.call(a,0,c);a.Rc=b.zc;a.jd=0;a.cd=c}jssor_1_slider_init=function(){var f={Tb:d,ee:{L:s},Dd:{L:q,J:9,fc:3,hc:3,Rb:260}},e=new i("jssor_1",f);function a(){var b=e.db.parentNode.clientWidth;if(b){b=c.min(b,600);e.xe(b)}else h.setTimeout(a,30)}a();b.a(h,"load",a);b.a(h,"resize",a);b.a(h,"orientationchange",a)}})(window,document,Math,null,true,false)</script><style>.jssora02l,.jssora02r{display:block;position:absolute;width:55px;height:55px;cursor:pointer;background:url('img/a02.png') no-repeat;overflow:hidden}.jssora02l{background-position:-3px -33px}.jssora02r{background-position:-63px -33px}.jssora02l:hover{background-position:-123px -33px}.jssora02r:hover{background-position:-183px -33px}.jssora02l.jssora02ldn{background-position:-3px -33px}.jssora02r.jssora02rdn{background-position:-63px -33px}.jssort03 .p{position:absolute;top:0;left:0;width:62px;height:32px}.jssort03 .t{position:absolute;top:0;left:0;width:100%;height:100%;border:none}.jssort03 .w,.jssort03 .pav:hover .w{position:absolute;width:60px;height:30px;border:#fff 1px dashed;box-sizing:content-box}.jssort03 .pdn .w,.jssort03 .pav .w{border-style:solid}.jssort03 .c{position:absolute;top:0;left:0;width:62px;height:32px;background-color:#000;filter:alpha(opacity=45);opacity:.45;transition:opacity .6s;-moz-transition:opacity .6s;-webkit-transition:opacity .6s;-o-transition:opacity .6s}.jssort03 .p:hover .c,.jssort03 .pav .c{filter:alpha(opacity=0);opacity:0}.jssort03 .p:hover .c{transition:none;-moz-transition:none;-webkit-transition:none;-o-transition:none}* html .jssort03 .w{width:62px;height:32px}</style><div id="jssor_1" style="position: relative; margin: 0 auto; top: 0px; left: 0px; width: 600px; height: 300px; overflow: hidden; visibility: hidden;"><!-- Loading Screen --><div data-u="loading" style="position: absolute; top: 0px; left: 0px;"><div style="filter: alpha(opacity=70); opacity: 0.7; position: absolute; display: block; top: 0px; left: 0px; width: 100%; height: 100%;"></div><div style="position:absolute;display:block;background:url('img/loading.gif') no-repeat center center;top:0px;left:0px;width:100%;height:100%;"></div></div><div data-u="slides" style="cursor: default; position: relative; top: 0px; left: 0px; width: 600px; height: 300px; overflow: hidden;">
            
                                   <%
                           
                               rs5.beforeFirst();
                               while(rs5.next())
                                    {
                        %>                                                
                            
                                             <div data-p="112.50" style="display: none;">
                                                <img data-u="image" src="../<% out.print(rs5.getString("imageaddress")); %> " />
                                                <img data-u="thumb" src="../<% out.print(rs5.getString("imageaddress")); %> " />
                                             </div>
                                           
                                         <%
                    }
                    
                               
                            
            %>
                                         </div>
                                         <!-- Thumbnail Navigator -->
                                         <div u="thumbnavigator" class="jssort03" style="position:absolute;left:0px;bottom:0px;width:600px;height:60px;" data-autocenter="1"><div style="position: absolute; top: 0; left: 0; width: 100%; height:100%; background-color: #000; filter:alpha(opacity=30.0); opacity:0.3;"></div><!-- Thumbnail Item Skin Begin --><div u="slides" style="cursor: default;"><div u="prototype" class="p"><div class="w"><div u="thumbnailtemplate" class="t"></div></div><div class="c"></div></div></div><!-- Thumbnail Item Skin End --></div><!-- Arrow Navigator --><span data-u="arrowleft" class="jssora02l" style="top:0px;left:8px;width:55px;height:55px;" data-autocenter="2"></span><span data-u="arrowright" class="jssora02r" style="top:0px;right:8px;width:55px;height:55px;" data-autocenter="2"></span></div><script>jssor_1_slider_init();</script><!-- #endregion Jssor Slider End -->
                                        <% } %>
                                </div>
                            </div>  
                        </div>	 
                                             
                 <%
                rs = st.executeQuery("select hotel_hotelid, commentid, isApproved from usercomments where isApproved=1 AND hotel_hotelid="+hotelId);
                
                int commentCount=0;
                while(rs.next())
                {
                    commentCount++;
                }
                rs.close();
                   
                    %>
                                             
                        <div class="col-md-6">
                            <div class="panel panel-widget">
                                    <div class="my-div">
                                        <div class="input-info">
                                            
                                            <% if(commentCount==0) 
                                            { %>
                                                
                                                No comment and rating for this hotel
                                           <% } else {
                                            %>
                                            
					<h3>Hotel Comments And Ratings : <% out.print(commentCount + " Total Comment"); %></h3>
                                    </div>
                                
                                        <table class="table table-bordered"> 
                                    <thead> 
                                        <tr> 
                                            <th>User Name</th> <th>Comment</th> <th>Rating</th>
                                        </tr> 
                                    </thead> 
                                    <tbody> 
                                        <tr> 
                                            <% 
                                            rs = st.executeQuery("select commentid, comment, rating,hotelid,id, hotel_hotelid,usercomments.user_id,isApproved,firstname,lastname,hotelname from user,hotel,usercomments where usercomments.user_id = user.id AND usercomments.hotel_hotelid = hotel.hotelid AND isApproved=1 AND hotel_hotelid="+hotelId +" ORDER BY commentid ASC");
                                            
                                            while(rs.next())
                                            {
                                            
                                            %>
                                            
                                            <td>
                                                <a href="user-profile.jsp?userid=<% out.print(rs.getString("id"));%>">
                                                    <%
                                                        out.print(rs.getString("firstname") + " " + rs.getString("lastname")); 
                                                     %>
                                                </a>
                                            </td> 
                                             
                                            
                                            <td>
                                                    <%
                                                      out.print(rs.getString("comment"));
                                                    %>
                                            </td> 
                                            
                                            <td>
                                                    <%
                                                       out.print(rs.getString("rating"));
                                                    %>
                                            </td> 
                                            
                                        </tr> 
                                        <% } %>
                                    </tbody> 
                                </table>
                                        
                                </div> 
                            </div>
                                    <% } %>
			</div>              

                    </div>
		</div>
                        
		<!--footer-->
		 <div class="dev-page">
	 
            <div class="dev-page-footer dev-page-footer-fixed"> 
				<!-- container -->
				<div class="container">
					<div class="copyright">
                                                <font size="3" face="Arial" color="white">Admin panel v1.</font>
					</div>

                </div>

            </div>
           
		</div>
        <!--//footer-->
	</div>

</body>
</html>