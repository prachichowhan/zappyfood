<%
response.addHeader("pragma","no-cache");
response.addHeader("cache-control","no-store");
response.addHeader("expire","0");
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.ob.dao.MyDAO,com.ob.beans.ClassBean,java.util.ArrayList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="css/style.css" type="text/css">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
 <div id="page">
	
		<div id="header">
			<a href="index.html" id="logo"><img src="images/C2.jpg" alt="" width="232" height="104"></a><img src="file:///D:/Eclipse/ZappyFoods/WebContent/images/C2.jpg" alt="" width="226" height="98"></a>
			<ul id="navigation">
				<li class="first">
					<a href="AdminHome.jsp">Home</a>
				</li>
				<li>
					<a href="Logout">Logout</a>
				</li>
				<li>
					<a href="ViewAllProduct.jsp">Menu</a>
				</li>
				
				<li >
					<a href="about.html">About us</a>
				</li>
				<li>
					<a href="Contact.jsp">Contact us</a>
				</li>
			</ul>
	  </div>
	  <br>
<h1 align="right"><a href="AdminHome.jsp">Back</a></h1>
		<%
		MyDAO m=new MyDAO();
		 ArrayList<ClassBean> list=m.viewCustomerRegister();
		 %>
		 <center>
		  <h1>Customer Account</h1>
		  <table border="1"  class=".table-bordered">
		  <tr><th>Account no</th><th>Name</th><th>Email Id</th><th>Password</th><th>Address</th><th>Mobile</th></tr>
	   <% 
	   	for(ClassBean c:list)
	    	{
	     %>
	    	
	   		<tr>
	   		<td><%=c.getCust_userid()%></td>
		    	<td><%=c.getCust_name()%></td>
		    	<td><%=c.getCust_emailid()%></td>
		    	<td><%=c.getCust_pwd() %></td>
		    	<td><%=c.getCust_add() %></td>
		    	<td><%=c.getCust_contactno() %></td>
		    </tr>	
	   <% }%>
	     
	    	</table>
		    </center>
</body>
</html>