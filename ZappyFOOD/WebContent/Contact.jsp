<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="UTF-8">
		<title>Mixed Rice Restaurant</title>
		<link rel="stylesheet" href="css/style.css" type="text/css">
	</head>
	<body>
		<div id="page">
			<div id="header">
				<a href="index.html" id="logo"><img src="images/logo.gif" alt=""></a>
				<ul id="navigation">
					<li class="first"><a href="Home.jsp">Home</a></li>
					<li><a href="Login.jsp">Login</a></li>
					<li><a href="ViewAllProduct.jsp">Menu</a></li>
					
					<li><a href="about.html">About us</a></li>
					<li class="selected"><a href="Contact.jsp">Contact us</a></li>
				</ul>
			</div> 
			<div id="content">
				<div id="sidebar">
					<div id="connect">
						<h2>Follow Us</h2>
						<ul>
							<li class="first"><a href="http://freewebsitetemplates.com/go/facebook/" class="facebook">Facebook</a></li>
							<li><a href="#" class="subscribe">Subscribe</a></li>
							<li><a href="http://freewebsitetemplates.com/go/twitter/" class="twitter">Twitter</a></li>
							<li><a href="http://www.flickr.com/freewebsitetemplates/" class="flicker">Flicker</a></li>
						</ul>
					</div>
					<div class="featured">
						<a href="filipino.html"><img src="images/new-oriental-mixed.jpg" alt=""></a>
					</div>
				</div>
				<div>
					<div id="contact">
						<h2>Contact us</h2>
						<br>
						<form action="Home.jsp">
							<label for="name" required>Name</label>
							<input type="text" id="name" required>
							<label for="email">E-mail address</label>
							<input type="email" id="email" required>
							<label for="subject">Subject</label>
							<input type="text" id="subject" required>
							<textarea cols="30" rows="10"></textarea>
							<input type="submit" id="submit" value="">
						</form>
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