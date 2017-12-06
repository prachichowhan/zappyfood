<font color="red">
<%
String n=(String)request.getAttribute("msg");
if(n!=null)
	out.println(n);
String l=(String)request.getAttribute("msg1");
if(l!=null)
	out.println(l);
%>
</font>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.ob.dao.MyDAO,com.ob.beans.ProductBean,java.util.ArrayList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1 align="right"><a href="AdminHome.jsp">Back</a></h1>
<table border="1" width="100%">
<tr><th>Product ID</th><th>Product Name</th><th>Price</th><th>Weight</th><th>Details</th><th>Image</th><th>Update/Delete</th></tr>

<% 
 MyDAO m=new MyDAO();
 ArrayList<ProductBean> list=m.viewProductFUpdateDelete();

	   	for(ProductBean p:list)
	    	{	   		
	    %> 
	 <tr>        
      <td><%=p.getProduct_Id() %></td>
      <td><%=p.getProduct_name()%></td>
     <td><%=p.getProduct_price() %></td>
     <td><%=p.getProduct_weigth() %></td>
      <td><%=p.getProduct_details() %></td>
      <td><img src="images/<%=p.getProduct_image() %>" width="250px" height="150px"></td>
    <td>
    <form action="UpdateProduct.jsp">
   <input type="hidden" value="<%=p.getProduct_Id() %>" name="Pid" >
    <input type="hidden" value="<%=p.getProduct_name()%>" name="Pname">
    <input type="hidden" value="<%=p.getProduct_price() %>" name="Pprice">
    <input type="hidden" value="<%=p.getProduct_weigth() %>" name="Pweight">
    <input type="hidden" value="<%=p.getProduct_details() %>" name="Pdetails">
   <input type="submit" value="Update" >
   </form>
   <form action="ToDeleteProduct" method="post">
   <input type="hidden" value="<%=p.getProduct_Id() %>" name="Pid" >
   <input type="submit" value="Delete">
   </form>
     </td>
     </tr>
 
   <% }%>
  </table>
</body>
</html>