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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="css/style.css" type="text/css">
<title>Insert title here</title>
</head>
<body>
<div id="page">
	
		<div id="header">
			<a href="index.html" id="logo"><img src="images/C2.jpg" alt="" width="232" height="104"></a><img src="file:///D:/Eclipse/ZappyFoods/WebContent/images/C2.jpg" alt="" width="226" height="98"></a>
			<ul id="navigation">
				<li class="first">
					<a href="Home.jsp">Home</a>
				</li>
				
				 <li><a href="Logout">Logout</a></li> 
					
				<li  class="selected">
					<a href="AddProduct.jsp">Menu</a>
				</li>
				
				<li>
					<a href="Contact.jsp">Contact us</a>
				</li>
				<li>
					<a href="ViewAddToCart.jsp">Show Cart</a>
				</li>
			</ul>
	  </div>
 <div class="container">
  <div class="row">
  
	  <font color="red">
<%
String n=(String)request.getAttribute("msg");
if(n!=null)
out.print(n);
%>
</font>
     <pre>
     <center>
     <form action="UploadProduct" method="post" enctype="multipart/form-data">
      <h1>ADD PRODUCTS</h1> 
      <table border="1"> 
     
           <tr>
      <td><h2>Product Name</h2></td>
      <td><input type="text" name="pname">
      </tr>
      
      <tr>
      <td><h2>Price </h2></td>
      <td><input type="number" name="price"></td>
      </tr>
      
       <tr>
      <td><h2>weight</h2></td>
      <td><input type="text" name="weight">
      </tr>
      
       <tr>
      <td><h2>Details</h2></td>
      <td><input type="text" name="details">
      </tr>

      
      <tr>
      <td> <h2>Image </h2></td>
      <td><input type="file" name="file" accept=".jpg" /></td>
      </tr>
      
      <tr>
      <td colspan="2"><input type="submit" value="Save" /></td>
      </tr>             
      </table></form>
 </center>

     </pre>
       <div id="pagination">
						
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