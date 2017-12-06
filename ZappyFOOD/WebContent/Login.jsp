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
		<meta charset="UTF-8">
		<title>Mixed Rice Restaurant</title>
		<link rel="stylesheet" href="css/style.css" type="text/css">
	    <style type="text/css">
<!--
.style1 {color: #990000}
-->
        </style>
</head>
	<body>
		<div id="page">
			<div id="header">
			  <a href="Home.jsp" id="logo"><img src="images/C2.jpg" alt="" width="232" height="104"></a>
			  <ul id="navigation">
					<li class="first"><a href="Home.jsp">Home</a></li>
					<li class="selected"><a href="Login.jsp">Login</a></li>
					<li><a href="ViewAllProduct.jsp">Menu</a></li>
					<li><a href="About.jsp">About us</a></li>
					<li><a href="Contact.jsp">Contact us</a></li>
			  </ul>
		  </div> 
			<div id="content">
			  <div id="sidebar">
					<div id="archives">
						<h2>&nbsp;</h2>
						<p><a href="http://freewebsitetemplates.com/go/twitter/" class="twitter"><img src="images/chinese-menu.jpg" width="281" height="186"></a></p>
						<div>
						  <ul>
							  <li class="first"></li>
						  </ul>
					  </div>
					  
						
					</div>
					<div id="connect">
						<h2>Follow Us</h2>
						<ul>
							<li class="first"><a href="http://freewebsitetemplates.com/go/facebook/" class="facebook">Facebook</a></li>
							<li><a href="#" class="subscribe">Subscribe</a></li>
							<li><a href="http://freewebsitetemplates.com/go/twitter/" class="twitter">Twitter</a></li>
							<li><a href="http://www.flickr.com/freewebsitetemplates/" class="flicker">Flicker</a></li>
						</ul>
					</div>
			  </div>
				<div>
			
				</div>
				<div>
					<div id="article">
					  <div class="first">
							<div>
							  <div class="first">
									<h4>LOGIN</h4>
									<form action="./CheckLogin" method="post" >
								    <table width="325" border="0">
                                      <tr>
                                        <th width="157" scope="row">USER ID</th>
                                        <td width="152">
                                            <input type="text" name="id">
                                        </td>
                                      </tr>
                                      <tr>
                                        <th scope="row">PASSWORD</th>
                                        <td>
                                            <input type="text" name="pwd">
                                        </td>
                                      </tr>
                                      <tr>
                                        <th scope="row">TYPE</th>
                                        <td>
                                            <select name="type">
											<option>Admin</option>
											<option>Customer</option>
                                            </select>
                                        </td>
									  <tr><td>&nbsp;</td></td>
                                      </tr>
                                      <tr>
                                        <th scope="row" colspan="2">
                                            <input type="submit" name="Submit" value="Save">
                                          <input type="reset" name="Reset" value="Reset">
                                        </th>
                                      </tr>
                                    </table>
                                    </form>
						
							      <h3>&nbsp;</h3>
							      </div>
							</div>
					  </div>
						<div>
							<div>
							  <div>
								  <h4>REGISTER</h4>
									<div class="share">
										<a href="http://freewebsitetemplates.com/go/twitter/" class="twitter">tweet</a>
										<a href="#" class="heart">love</a>
										<a href="http://freewebsitetemplates.com/go/facebook/" class="facebook">facebook</a>
									</div>
								  <h3 class="style1">Customer Registration .....</h3>
								  <form action="./Customer_AC_Created" method="post">
								  <table width="326" border="0">
                                    <tr>
                                      <th width="156" scope="row">NAME</th>
                                      <td width="154">
                                          <input type="text" name="name">
                                    </td>
                                    </tr>
                                    <tr>
                                      <th scope="row">EMAIL ID </th>
                                      <td>
                                          <input type="text" name="emailid">
                                     </td>
                                    </tr>
                                    <tr>
                                      <th scope="row">USER ID </th>
                                     
                                      <td>
                                          <input type="text" name="uid">
                                     </td>
                                    </tr>
                                    <tr>
                                      <th scope="row">PASSWORD</th>
                                      <td>
                                          <input type="text" name="pwd">
                                    </td>
                                    </tr>
                                    <tr>
                                      <th scope="row">ADDRESS</th>
                                      <td>
                                          <input type="text" name="add">
                                     </td>
                                    </tr>
                                    <tr>
                                      <th scope="row">CONTACT NO </th>
                                      <td>
                                          <input type="text" name="cno">
                                    </td>
                                    </tr>
									<tr><td>&nbsp;</td></td>
                                    <tr>
                                      <th scope="row" colspan="2">
                                        <input type="submit" name="Submit3" value="SAVE">
                                        <input type="reset" name="Submit2" value="RESET">
                                      </th>
                                    </tr>
                                  </table>
                                  </form>
							  </div>
							</div>
						</div>
						<div id="pagination">
							<a href="#" class="first">New Post</a>
							<a href="#">Old Post</a>
						</div>
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