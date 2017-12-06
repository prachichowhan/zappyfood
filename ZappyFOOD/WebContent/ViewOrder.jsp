<%
response.addHeader("pragma","no-cache");
response.addHeader("cache-control","no-store");
response.addHeader("expire","0");
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.ob.dao.MyDAO,com.ob.beans.ProductBean,java.util.ArrayList" %>
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
					<a href="AdminHome.jsp">Home</a>
				</li>
			    <li><a href="Logout">Logout</a></li> 
					
				<li >
					<a href="ViewAllProduct.jsp">Menu</a>
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
  </div> 
  <br><br>
  
<font color="red">
<h2 align="center" width="30%">
<%
String n=(String)request.getAttribute("msg");
if(n!=null)
out.print(n);

String l=(String)request.getAttribute("msg1");
if(l!=null)
out.print(l);
%>
</h2>

</font>  
  <table border="1" align="center" width="70%">
		<tr><th>UserId</th><th>Order No</th><th>Product Id</th><th>Name</th><th>Price</th><th>Quantity</th><th>Total</th><th>Status</th><th>Dispatch/Not Available</th></tr>
  
<%  

         MyDAO m=new MyDAO();
		ArrayList<ProductBean> list=m.viewOrderPlacedByCust();		 
		
		 for(ProductBean p:list)
		 {
		%>
		  <tr>
		     <td><%=p.getUID()%></td>
		     <td><%=p.getOrderNo() %></td>
		     <td><%=p.getProduct_Id() %></td>
			 <td><%=p.getProduct_name()%></td>			 
			 <td><%=p.getProduct_price()%></td>
			 <td><%=p.getQuantity()%></td>
			 <td><%=p.getTotal()%></td>	
			 <td><%=p.getStatus() %></td>
			 <td>
			 <form action="OrderDispatch" method="post">
			 <input type="hidden" value="<%=p.getOrderNo() %>" name="dispid">
			 <input type="submit" value="Dispatch">
			 </form>
			 <form action="OrderNotAvailable" method="post">
			 <input type="hidden" value="<%=p.getOrderNo() %> " name="oNApid">
			 
			 <input type="submit" value="Not Available">
			 </form>
			 </td>
			 </tr>  
		<% }%>
      </div>
</center>
   
    </div>
 </div>
</body>
</html>