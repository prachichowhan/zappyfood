<%@page import="com.ob.beans.ProductBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.ob.dao.MyDAO"%>
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
				
				<li  class="selected">
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
<center>
<form action="ToUpdateProduct" method="post">

    <h1>Update Product</h1>
    
  
 
<% 
String productid=request.getParameter("Pid");
String productname=request.getParameter("Pname");
String price=request.getParameter("Pprice");
String weight=request.getParameter("Pweight");
String details=request.getParameter("Pdetails");
String image=request.getParameter("Pimage");
 
MyDAO m=new MyDAO();
ArrayList<ProductBean> list=m.selectProductFUpdate(productid);
for(ProductBean p:list)
{	
%> 

<p><img src="images/<%=p.getProduct_image() %>" width="150px" height="150px"></p>

<table>
<tr>
<td>Product ID</td><td><input type="text" value="<%=productid %>" name="ppid"  readonly></td>
</tr>

<tr>
<td>Product NAme</td><td> <input type="text" value="<%=productname %>" name="ppname"></td>
</tr>

<tr>
<td>Price</td><td><input type="text" value="<%=price %>" name="ppprice"></td>
</tr>

<tr>
<td>Weight</td><td><input type="text" value="<%=weight%>" name="ppweight"></td>
</tr>

<tr>
<td>Details</td><td><input type="text" value="<%=details%>" name="ppdetails"></td>
</tr> 
   
<tr>
<td colspan="2">

<input type="submit" value="Update" >
</td>
</tr>
</table>
<%} %>
</form>

<table>
<br>
<tr>
      <td> Image </td>
      <td><input type="file" name="file" accept=".jpg" value="<%=image%>" /></td>
      </tr>
      <tr>

</table>
</center>
</body>
</html>