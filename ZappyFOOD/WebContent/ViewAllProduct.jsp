<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.ob.dao.MyDAO,com.ob.beans.ProductBean,java.util.ArrayList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
				
				<li  class="selected">
					<a href="ViewAllProduct.jsp">Menu</a>
				</li>
				
				<li>
					<a href="contact.html">Contact us</a>
				</li>
				<li>
					<a href="ViewAddToCart.jsp">Show Cart</a>
				</li>
			</ul>
	  </div>
	
 <div class="container">
  <div class="row">
  
  </div>
    <h2 align="right">
 <font color="red">
  <%
  String msg=(String)request.getAttribute("msg");
  if(msg!=null)
	  out.println(msg);
  %>
 </font>
 </h2>
  </br></br></br>
 
<% 
 MyDAO md=new MyDAO();
 ArrayList<ProductBean> list=md.viewAllFoodProducts();

	   	for(ProductBean p:list)
	    	{	   		
	    %> 
	     
	     <center>
	         <div class="col-sm-4" >
      
      <p><img src="images/<%=p.getProduct_image() %>" width="150px" height="150px"></p>
      <p><%=p.getProduct_Id() %></p>
      <p><%=p.getProduct_name()%></p>
     <p><%=p.getProduct_price() %></p>
     <p><%=p.getProduct_weigth() %></p>
      <p><%=p.getProduct_details() %></p>
    
    <form action="InsertAddToCart" method="post">
      <p><h2><input type="hidden" name="pid" value="<%=p.getProduct_Id() %>" />
      <p><h2><input type="hidden" name="pname" value="<%=p.getProduct_name() %>" />
      <p><h2><input type="hidden" name="price" value="<%=p.getProduct_price() %>" />
   
      Quantity<input type="number" name="qty"></h2></p>
      <p><input type="submit" value="ADD To Cart" name="atc"></p>
     </form>
     
      </div>
</center>
   <% }%>
    </div>
 </div>
</body>
</html>