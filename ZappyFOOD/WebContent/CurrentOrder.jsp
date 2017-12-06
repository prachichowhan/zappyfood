<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@page import="com.ob.dao.MyDAO,com.ob.beans.ProductBean,java.util.ArrayList,java.sql.*,com.zappyfoods.dboperation.*" %>
    
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
					<a href="AdminHome.jsp">Home</a>
				</li>
				
				        <li><a href="Logout">Logout</a></li> 
				<li>
					<a href="ViewAllProduct.jsp">Menu</a>
				</li>
			
				<li class="selected">
					<a href="ViewHistory.jsp">OrderHistory</a>
				</li>
				<li>
					<a href="Contact.jsp">Contact us</a>
				</li>
			</ul>
	  </div>
	  <div class="container">
  <div class="row">
  </div>
  </br>
</br>
</br>
<h1 align="center"></h1>
 <table border="1"  width="100%">
		<tr><th>UserId</th><th>Order No</th><th>Product Id</th><th>Name</th><th>Price</th><th>Quantity</th><th>Total</th><th>Status</th></tr>
  <%!String s; %>
<%  
         MyDAO m=new MyDAO();
		ArrayList<ProductBean> list=m.currentOrder();		 
		
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
			 <td><%
			        if(p.getStatus()==0)out.print("Pending");  
			 %></td>
  		
		</tr>
			  
		<% }%>
		 
      </div>
</center>
   
    </div>
 </div>
</body>
