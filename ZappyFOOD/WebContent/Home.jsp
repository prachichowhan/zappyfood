<%
response.addHeader("pragma","no-cache");
response.addHeader("cache-control","no-store");
response.addHeader("expire","0");
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>Mixed Rice Restaurant</title>
		<link rel="stylesheet" href="css/style.css" type="text/css">
	</head>
	<body>
		<div class="page">
			<div id="header">
			  <a href="index.html" id="logo"><img src="images/C2.jpg" alt="" width="230" height="101"></a>
			  <ul id="navigation">
					<li class="selected first"><a href="Home.jsp">Home</a></li>
					<li><a href="Login.jsp">Login</a></li>
					<li><a href="ViewAllProduct.jsp">Menu</a></li>
					<li><a href="Logout">Logout</a></li>
					<li><a href="Contact.jsp">Contact us</a></li>
			  </ul>
				<div id="featured">
					<img src="images/oriental-mixed-rice.jpg" alt="">
					<h3>Oriental Mixed Rice Restaurant</h3>
					<p>Lorem ipsum dolor sit amet, <br>
					adipiscing elit, sed diam nonummy nibh <br>
					euismod tincidunt ut laoreet dolore <br>
					magna aliquam erat volutpat. Ut wisi</p>
					<a href="blog.html">Read more</a>
				</div>
		  </div> 
			<div id="content">
				<div id="home">
					<ul>
						<li><a href="japanese.html"><img src="images/japanese.jpg" alt=""></a></li>
						<li><a href="chinese.html"><img src="images/chinese.jpg" alt=""></a></li>
						<li><a href="filipino.html"><img src="images/filipino.jpg" alt=""></a></li>
						<li><a href="vietnamese.html"><img src="images/vietnamese.jpg" alt=""></a></li>
						<li><a href="korean.html"><img src="images/korean.jpg" alt=""></a></li>
					</ul>					
					<div class="first">
						<h3>Mixed Rice Restaurant</h3>
						<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy 
						nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi 
						enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis 
						nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in 
						hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu 
						feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui 
						blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla 
						facilisi.</p>
					</div>
					<div>
						<a href="blog.html"><img src="images/main-dish.jpg" alt=""></a>
						<p>Mirum est notare quam littera gothica, quam nunc putamus parum claram, 
						anteposuerit litterarum formas humanitatis per seacula quarta decima et 
						quinta decima. Eodem anitatis per seacula quarta decima et quinta decima. 
						Eodem modo typi, qui nunvide clari.</p>
					</div>
				</div>
			</div>
			<div id="footer">
				<div>
					<div class="section1">
						<a href="blog.html"><img src="images/health-benefits.jpg" alt=""></a>
						<h4>Health Benefits</h4>
						<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy ut lao 
						magna. <a href="blog.html">Read More</a></p>
					</div>
					<div class="section2">
						<a href="blog.html"><img src="images/mixed-rice.jpg" alt=""></a>
						<p><span>Lorem ipsum</span> dolor sit amet, consectetuer adipiscing elit, sed diam nonummy
						nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi 
						enim ad minim veniam, quis nostrud. <a href="blog.html">Read More</a></p>
					</div>
					<div class="section3">
						<a href="blog.html"><img src="images/mixed-rice2.jpg" alt=""></a>
						<p><span>Lorem ipsum</span> dolor sit amet, consectetuer adipiscing elit, sed diam nonummy
						nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi 
						enim ad minim veniam, quis nostrud. <a href="blog.html">Read More</a></p>
					</div>
				</div>
				<div id="footnote">
					<p>&#169; Copyright 2012. All Rights Reserved.</p>
				</div>
			</div>
		</div>
	</body>
</html>  