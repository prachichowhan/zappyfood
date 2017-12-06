<%
response.addHeader("pragma","no-cache");
response.addHeader("cache-control","no-store");
response.addHeader("expire","0");
%>

<%@page import="com.ob.beans.ProductBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.ob.dao.MyDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="css/style.css" type="text/css">
<link rel="stylesheet" href="css/style.css" type="text/css">
<title>Insert title here</title>
</head>
<body>
<div id="page">
	
		<div id="header">
			<a href="index.html" id="logo"><img src="images/C2.jpg" alt="" width="232" height="104"></a><img src="file:///D:/Eclipse/ZappyFoods/WebContent/images/C2.jpg" alt="" width="226" height="98"></a>
			<ul id="navigation">
				<li class="first">
					<a href="CustomerHome.jsp">Home</a>
				</li>
				
				 <li><a href="Logout">Logout</a></li> 
					
				<li>
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
  <br><br><br><br>
 <table border="1"  width="100%">
		<tr><th>UserId</th><th>Order No</th><th>Product Id</th><th>Name</th><th>Price</th><th>Quantity</th><th>Total</th></tr>
  
<%
HttpSession s=request.getSession();
String userid=(String)s.getAttribute("cust_id");
  
MyDAO m=new MyDAO();
ArrayList<ProductBean> list=m.checkorderHistory(userid);

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
	 </tr>  
<% }%>
</div>
</center>

</div>
</div>
</body>
</html>