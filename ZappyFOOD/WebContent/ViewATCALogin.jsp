<%
response.addHeader("pragma","no-cache");
response.addHeader("cache-control","no-store");
response.addHeader("expire","0");
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.ob.dao.MyDAO,com.ob.beans.ProductBean,java.util.ArrayList,java.net.InetAddress" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="css/style.css" type="text/css">
</head>
<body>
<div id="page">
	
		<div id="header">
			<a href="index.html" id="logo"><img src="images/C2.jpg" alt="" width="232" height="104"></a><img src="file:///D:/Eclipse/ZappyFoods/WebContent/images/C2.jpg" alt="" width="226" height="98"></a>
			<ul id="navigation">
				<li class="first">
					<a href="Home.jsp">Home</a>
				</li>
				<%
                       HttpSession sesion=request.getSession();
					   String data=(String)session.getAttribute("cust_id");
					   if(data==null)
					   {
						%>
						   <li><a href="Login.jsp">Login</a></li>
						   
					  <% }
					  else
					  { %>
				        <li><a href="Logout">Logout</a></li> 
					<%} %>
				<li>
					<a href="ViewAllProduct.jsp">Menu</a>
				</li>
			
				<li class="selected">
					<a href="ViewAddToCart.jsp">Show Cart</a>
				</li>
				<li>
					<a href="contact.html">Contact us</a>
				</li>
			</ul>
	  </div>
	  <div class="container">
  <div class="row">
  </div>
  </br></br></br></br></br>
	  
 <h3 align="right"><a href="OrderPlaced.jsp">Save</a></h3>	
	  
	  
	  <% 
	     HttpSession s=request.getSession();
	 	String data1=(String)s.getAttribute("cust_id");
	 	
	 	
		%>
		<table border="1"  width="100%">
		<tr><th>Product Id</th><th>Name</th><th>Price</th><th>Quantity</th><th>Total</th></tr>

		<%  
				
		MyDAO m=new MyDAO();
		 ArrayList<ProductBean> list=m.viewATCAL(data1);		 
		 for(ProductBean p:list)
		 {
		%>
		  <tr>
		     <td><%=p.getProduct_Id() %></td>
			 <td><%=p.getProduct_name()%></td>			 
			 <td><%=p.getProduct_price()%></td>
			 <td><%=p.getQuantity() %></td>
			 <td><%=p.getTotal()%></td>	
			 </tr>  
		<% }%>
     
       
       
	 
</body>
</html>