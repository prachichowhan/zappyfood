package com.ob.dao;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;
import javax.xml.ws.Response;

import com.ob.beans.ClassBean;
import com.ob.beans.ProductBean;
import com.zappyfoods.dboperation.DBConnection;



public class MyDAO
{
  public int checkLogin(String id,String pwd,String sql )
  {
	  int x=0;
	  try
		{
			Connection con=new DBConnection().start();
		
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1,id);
			ps.setString(2,pwd);
			ResultSet rs=ps.executeQuery();
				
			if(rs.next())
			{  x=1;}
		}  catch(SQLException e) {System.out.println(e); e.printStackTrace();}
	return x;	
 }
  
  
  public ArrayList<ProductBean> viewAllFoodProducts()
  { 
	  ArrayList<ProductBean> list=new ArrayList<ProductBean>();
	  
	  try {
			 Connection con=new DBConnection().start();
				
				PreparedStatement ps=con.prepareStatement("select * from product");		
				ResultSet rs=ps.executeQuery();
				
				while(rs.next())
			    {
			    	ProductBean c=new ProductBean();
			    	c.setProduct_image(rs.getString("image"));
			    	c.setProduct_name(rs.getString("pname"));
			    	c.setProduct_Id(rs.getString("pid"));
			    	c.setProduct_price(Double.parseDouble(rs.getString("price")));
			    	c.setProduct_details(rs.getString("details"));
			    	c.setProduct_weigth(rs.getString("weight"));
			    
			    	// <img src="images\<%=iname%>" heigth="100" width="100"/>
			    	
			    	list.add(c);
		    	
			    }
			  con.close();
	  }catch(SQLException e) {System.out.println(e); e.printStackTrace();}
		return list;
	}      
  
  
  public int insertCarttable(ProductBean p,String uid)               //InsertAddToCart
  {
	  int x=0;
	  try {
			 Connection con=new DBConnection().start();

			 PreparedStatement ps1=con.prepareStatement("insert into carttable(ProductId,ProductName,Price,Quantity,UserId,Total) values(?,?,?,?,?,?)");
			 ps1.setString(1,p.getProduct_Id());
				ps1.setString(2,p.getProduct_name());
				ps1.setDouble(3,p.getProduct_price());
				ps1.setDouble(4,p.getQuantity());
				ps1.setString(5,uid);
				ps1.setDouble(6,p.getTotal());
				 x=ps1.executeUpdate();
				  con.close();
			  }catch(SQLException e) {System.out.println(e); e.printStackTrace();}
				return x;
			}      
	
  
  
  
  public ArrayList<ProductBean> viewAddtoCart(String userid)     //ViewAddToCart.jsp	 
  {

	  ArrayList<ProductBean> list=new ArrayList<ProductBean>();
 double grand_total,tot=0.0;
	  try {
			 Connection con=new DBConnection().start();
			
		     
			 PreparedStatement ps=con.prepareStatement("select * from carttable where UserId=?");
				
			 ps.setString(1,userid);
				ResultSet rs=ps.executeQuery();

				while(rs.next())
			    {
			    	ProductBean p=new ProductBean();
			    	p.setIncrement_id(rs.getInt("ID"));
			    	p.setProduct_Id(rs.getString("ProductId"));
			    	p.setProduct_name(rs.getString("ProductName"));
			    	p.setProduct_price(Double.parseDouble(rs.getString("Price")));
			    	p.setQuantity(rs.getInt("Quantity"));
			    	p.setTotal(rs.getDouble("Total"));
			    	list.add(p);
			    }
				
				
			  con.close();
	  }catch(SQLException e) {System.out.println(e); e.printStackTrace();}
		return list;
	}      
  
  
  public double grand_total()
  {double sum=0;
	  try{
	    	Connection con=new DBConnection().start();
	    	PreparedStatement ps=con.prepareStatement("select Total from carttable");
				ResultSet rs=ps.executeQuery();
	           while(rs.next())
	           {
	        	 //  out.println(rs.getInt("Total"));
	        	   sum=sum+rs.getInt("Total");
	           }
	           
	           //out.println(sum);
	    	
	      }
	      catch(SQLException e){System.out.println(e);}
	return sum;
	      
	  
	  
  }
  
  
  
  
  
  public int insertCarttableAfterLogin(String ip,String uid)            //InsertATCLOgin.jsp
  { int status=0;
	  int x = 0,y = 0,z=0,m=0;
	  try {
		  System.out.println("Hello");
		  Connection con=new DBConnection().start();
		  PreparedStatement ps2=con.prepareStatement("select ProductId,ProductName,Price,Quantity,UserId,Total from carttable where UserId=?");
          ps2.setString(1,ip);
          ResultSet rs=ps2.executeQuery(); 
         while(rs.next())
          {
        	  
            PreparedStatement ps1=con.prepareStatement("insert into placedorder(UserId,ProductId,ProductName,Price,Quantity,Total,Status) values(?,?,?,?,?,?,?)");
            ps1.setString(1,rs.getString("UserId"));		 
			ps1.setString(2,rs.getString("ProductId"));
			ps1.setString(3,rs.getString("ProductName"));
			ps1.setDouble(4,rs.getDouble("Price"));
			ps1.setString(5,rs.getString("Quantity"));
			ps1.setDouble(6,rs.getDouble("Total"));
			ps1.setString(7,"0");
			 x=ps1.executeUpdate();
			
			PreparedStatement ps=con.prepareStatement("update placedorder set UserId=? where UserId=?"); 
			ps.setString(1,uid);
			ps.setString(2,ip);
			 y=ps.executeUpdate();
			
			if(x!=0) {System.out.println("suces insert");}
			if(y!=0) {System.out.println("suces update");}
			
           
          }
         PreparedStatement ps3=con.prepareStatement("delete from carttable where UserId=? ");	
            ps3.setString(1,ip);
            z=ps3.executeUpdate();
            if(z!=0) {System.out.println("suces deleted");}
           if(x!=0&&y!=0&&z!=0)
        	   m=1;
	
	}catch(SQLException e) {System.out.println(e); e.printStackTrace();}
	return m;
}      
	
  
  public ArrayList<ProductBean> viewATCAL(String userid) 	 
  {

	  ArrayList<ProductBean> list=new ArrayList<ProductBean>();

	  try {
			 Connection con=new DBConnection().start();
			
		     
			 PreparedStatement ps=con.prepareStatement("select ProductId,ProductName,Price,Quantity,Total,Status from placedorder where UserId=?");
				ps.setString(1,userid);
				ResultSet rs=ps.executeQuery();

				while(rs.next())
			    {
			    	ProductBean c=new ProductBean();
			    	c.setProduct_Id(rs.getString("ProductId"));
			    	c.setProduct_name(rs.getString("ProductName"));
			    	c.setProduct_price(Double.parseDouble(rs.getString("Price")));
			    	c.setQuantity(rs.getInt("Quantity"));
			    	c.setTotal(rs.getDouble("Total"));
			    	c.setStatus(rs.getInt("Status"));
			    	list.add(c);
		    	
			    }
				
				
			  con.close();
	  }catch(SQLException e) {System.out.println(e); e.printStackTrace();}
		return list;
	}      
  
  
  
  public int customerAcCreated(ClassBean c)
  {    int x=0;
	  try {
			 Connection con=new DBConnection().start();
				
				PreparedStatement ps=con.prepareStatement("insert into customer values(?,?,?,?,?,?)");
				ps.setString(1,c.getCust_name());
				ps.setString(2,c.getCust_userid());		
				ps.setString(4,c.getCust_emailid());
				ps.setString(3,c.getCust_pwd());
				ps.setString(6,c.getCust_contactno());
				ps.setString(5,c.getCust_add());
				
			     x=ps.executeUpdate();
			    
		 }catch(SQLException e) {System.out.println(e);}
	return x;
 }

  public ArrayList<ClassBean> viewCustomerRegister()
  {
    ArrayList<ClassBean> list=new ArrayList<ClassBean>();
	  
	  try {
			 Connection con=new DBConnection().start();
				
				PreparedStatement ps=con.prepareStatement("select * from customer");		
				ResultSet rs=ps.executeQuery();
				
				while(rs.next())
			    {
			    	ClassBean c=new ClassBean();
			    	//c.setCust_ac_no(rs.getString("cust_ac_no"));
			    	c.setCust_name(rs.getString("cust_name"));
			    	c.setCust_userid(rs.getString("cust_userid"));
			    	c.setCust_pwd(rs.getString("cust_password"));
			    	c.setCust_emailid(rs.getString("cust_emailid"));
			    	c.setCust_add(rs.getString("cust_add"));
			    	c.setCust_contactno(rs.getString("cust_contactno"));
			    //	c.setCust_bal(rs.getString("balance"));
			    	
			    	list.add(c);
		    	
			    }
			  con.close();
	  }catch(SQLException e) {System.out.println(e); e.printStackTrace();}
		return list;
	}  
  
  
  public int addToCart(int pid,int qty,String ip,ProductBean p)
  {
	  int x=0;
	  try {
		  Connection con=new DBConnection().start();
		  String sql="insert into carttable(ProductId,ProductName,Price,Quantity,UserId,Total) values(?,?,?,?,?,?)";
		  
		 PreparedStatement ps=con.prepareStatement(sql);		  
		 ps.setInt(1,pid);
		 ps.setString(2,p.getProduct_Id());
		 ps.setDouble(3,p.getProduct_price());
		 ps.setInt(4,qty);
		 ps.setString(5,ip);
		 ps.setDouble(6,p.getTotal());
		 
	  }
	  catch(SQLException e) {System.out.println(e);}
	return x;	  
  }
  
  public int deltFromAddToCart(int incid)          //DeletepViewAddToCart
  {int x=0;
	  try {
			Connection con=new DBConnection().start();
			
			PreparedStatement ps=con.prepareStatement("Delete from carttable where ID=?");
			ps.setInt(1,incid);
			
		    x=ps.executeUpdate();
			x=1;
		}catch(SQLException e) {System.out.println(e);}
	return x;
		  
  }
  
    
  public ArrayList<ProductBean> viewOrderPlacedByCust()
  {
	  ArrayList<ProductBean> list=new ArrayList<ProductBean>();
	  //ArrayList<ClassBean> list1=new ArrayList<>();
	//  ArrayList list2=null;
	  try
	  {
		  Connection con=new DBConnection().start();
		  PreparedStatement ps=con.prepareStatement("select * from placedorder ");
		  ResultSet rs=ps.executeQuery();
		  
		  while(rs.next())
		  {
			 
			  ProductBean p=new ProductBean();
			 // ClassBean c=new ClassBean();
			  //c.setCust_userid(rs.getString("UserId"));
			  p.setUID( rs.getString("UserId"));
			  p.setOrderNo(rs.getInt("OrderNo"));
			  p.setProduct_Id(rs.getString("ProductId"));
			  p.setProduct_name(rs.getString("ProductName"));
			  p.setProduct_price(rs.getDouble("Price"));
			  p.setQuantity(rs.getInt("Quantity"));
			  p.setTotal(rs.getDouble("Total"));
			  p.setStatus(rs.getInt("Status"));
			  list.add(p);
			  
		  }
		  
	  }catch(SQLException e) {System.out.println(e);}
	return list;
 }

  public int orderDispatch(String dispid)
  {int x=0;
	  try {
		  Connection con=new DBConnection().start();
		  PreparedStatement ps=con.prepareStatement("update placedorder set Status=? where OrderNo=?");
		  ps.setString(1,"1");
		  ps.setString(2,dispid);
		 x=ps.executeUpdate();	  
		  if(x!=0)
			  x=1;
		  
	  }catch(SQLException e) {System.out.println(e);}
	return x;
	  
  }
  
  public int orderNotAvailable(String oNApid)
  {int x=0;
	  try {
		  Connection con=new DBConnection().start();
		  PreparedStatement ps=con.prepareStatement("update placedorder set Status=? where OrderNo=?");
		  ps.setString(1,"2");
		  ps.setString(2,oNApid);
		 x=ps.executeUpdate();	  
		  if(x!=0)
			  x=1;
		  
	  }catch(SQLException e) {System.out.println(e);}
	return x;
	  
  }
  
  public ArrayList<ProductBean> orderHistory()                // ViewHistory.jsp
  {
	 
	  ArrayList<ProductBean> list=new ArrayList<>();
		    
			  try{
				  Connection con=new DBConnection().start();
				PreparedStatement ps=con.prepareStatement("select * from placedorder ");
				  ResultSet rs=ps.executeQuery();
				  
				  while(rs.next())
				  {
					 
					  ProductBean p=new ProductBean();
					 // ClassBean c=new ClassBean();
					  //c.setCust_userid(rs.getString("UserId"));
					  p.setUID( rs.getString("UserId"));
					  p.setOrderNo(rs.getInt("OrderNo"));
					  p.setProduct_Id(rs.getString("ProductId"));
					  p.setProduct_name(rs.getString("ProductName"));
					  p.setProduct_price(rs.getDouble("Price"));
					  p.setQuantity(rs.getInt("Quantity"));
					  p.setTotal(rs.getDouble("Total"));
					  p.setStatus(rs.getInt("Status"));
			
					  list.add(p);
				  }
			  
	  }catch(SQLException e) {System.out.println(e);}
		return list;
  }
  
  public ArrayList<ProductBean> currentOrder()                // CurrentOrder.jsp
  {
	 
	  ArrayList<ProductBean> list=new ArrayList<>();
		    
			  try{
				  Connection con=new DBConnection().start();
				PreparedStatement ps=con.prepareStatement("select * from placedorder where Status=0 ");
				  ResultSet rs=ps.executeQuery();
				  
				  while(rs.next())
				  {
					 
					  ProductBean p=new ProductBean();
					 // ClassBean c=new ClassBean();
					  //c.setCust_userid(rs.getString("UserId"));
					  p.setUID( rs.getString("UserId"));
					  p.setOrderNo(rs.getInt("OrderNo"));
					  p.setProduct_Id(rs.getString("ProductId"));
					  p.setProduct_name(rs.getString("ProductName"));
					  p.setProduct_price(rs.getDouble("Price"));
					  p.setQuantity(rs.getInt("Quantity"));
					  p.setTotal(rs.getDouble("Total"));
					  p.setStatus(rs.getInt("Status"));
			
					  list.add(p);
				  }
			  
	  }catch(SQLException e) {System.out.println(e);}
		return list;
  }
  
  public ArrayList<ProductBean> checkorderHistory(String userId)
  {
 ArrayList<ProductBean> list=new ArrayList<ProductBean>();
	  
	  try {
			 Connection con=new DBConnection().start();
				
				PreparedStatement ps=con.prepareStatement("select * from product");		
				ResultSet rs=ps.executeQuery();
				
				while(rs.next())
			    {
			    	ProductBean c=new ProductBean();
			    	c.setProduct_image(rs.getString("image"));
			    	c.setProduct_name(rs.getString("pname"));
			    	c.setProduct_Id(rs.getString("pid"));
			    	c.setProduct_price(Double.parseDouble(rs.getString("price")));
			    	c.setProduct_details(rs.getString("details"));
			    	c.setProduct_weigth(rs.getString("weight"));
			    
			    	// <img src="images\<%=iname%>" heigth="100" width="100"/>
			    	
			    	list.add(c);
		    	
			    }
			  con.close();
	 
	  }catch(SQLException e) {System.out.println(e);}
		return list;
  }
  
  public ArrayList<ProductBean> checkOrderStatus(String userId)
  {
	  ArrayList<ProductBean> list=new ArrayList<ProductBean>();
		  try
		  {
			  Connection con=new DBConnection().start();
			  PreparedStatement ps=con.prepareStatement("select UserId,OrderNo,ProductId,ProductName,Price,Quantity,Total,Status from placedorder where UserId=? and Status=? or Status=?");
			  ps.setString(1,userId);
			  ps.setString(2,"1");
			  ps.setString(3,"2");
			  ResultSet rs=ps.executeQuery();
			  
			  while(rs.next())
			  {
				 
				  ProductBean p=new ProductBean();
				 // ClassBean c=new ClassBean();
				  //c.setCust_userid(rs.getString("UserId"));
				  p.setUID( rs.getString("UserId"));
				  p.setOrderNo(rs.getInt("OrderNo"));
				  p.setProduct_Id(rs.getString("ProductId"));
				  p.setProduct_name(rs.getString("ProductName"));
				  p.setProduct_price(rs.getDouble("Price"));
				  p.setQuantity(rs.getInt("Quantity"));
				  p.setTotal(rs.getDouble("Total"));
				  p.setStatus(rs.getInt("Status"));
				  list.add(p);
			  }	  
	  }catch(SQLException e) {System.out.println(e);}
		return list;
  }
 
  
  
  public ArrayList<ProductBean> viewProductFUpdateDelete()
  { 
	  ArrayList<ProductBean> list=new ArrayList<ProductBean>();
	  
	  try {
			 Connection con=new DBConnection().start();
				
				PreparedStatement ps=con.prepareStatement("select * from product");		
				ResultSet rs=ps.executeQuery();
				
				while(rs.next())
			    {
			    	ProductBean c=new ProductBean();
			    	c.setProduct_Id(rs.getString("pid"));
			    	c.setProduct_name(rs.getString("pname"));
			    	c.setProduct_price(Double.parseDouble(rs.getString("price")));
			    	c.setProduct_weigth(rs.getString("weight"));
			    	c.setProduct_details(rs.getString("details"));
			    	c.setProduct_image(rs.getString("image"));    	
			    	list.add(c);
		    	
			    }
			  con.close();
	  }catch(SQLException e) {System.out.println(e); e.printStackTrace();}
		return list;
	}      
  
  
  public ArrayList<ProductBean> selectProductFUpdate(String pid)
  { 
	  ArrayList<ProductBean> list=new ArrayList<ProductBean>();
	  
	  try {
			 Connection con=new DBConnection().start();
				
				PreparedStatement ps=con.prepareStatement("select * from product where pid=?");
				ps.setString(1,pid);
				ResultSet rs=ps.executeQuery();
				
				while(rs.next())
			    {
			    	ProductBean c=new ProductBean();
			    	c.setProduct_Id(rs.getString("pid"));
			    	c.setProduct_name(rs.getString("pname"));
			    	c.setProduct_price(Double.parseDouble(rs.getString("price")));
			    	c.setProduct_weigth(rs.getString("weight"));
			    	c.setProduct_details(rs.getString("details"));
			    	c.setProduct_image(rs.getString("image"));    	
			    	list.add(c);
		    	
			    }
			  con.close();
	  }catch(SQLException e) {System.out.println(e); e.printStackTrace();}
		return list;
	}      
  
 public int updateProduct(ProductBean p,String pid)
  {	  int x=0;

	  try
	  {
		  Connection con=new DBConnection().start();  
		  PreparedStatement ps=con.prepareStatement("update product set pname=?,price=?,weight=?,details=? where pid=?");
		  ps.setString(1,p.getProduct_name());
		  ps.setDouble(2,p.getProduct_price());
		  ps.setString(3,p.getProduct_weigth());
		  ps.setString(4,p.getProduct_details());
		  ps.setString(5,pid);
		 
		 x=ps.executeUpdate();
		 if(x!=0)
			x=1;
			  con.close();
		  	  
		  
	  }catch(SQLException e) {System.out.println(e);}
	return x;
  }
  
 public int deleteProduct(String pid)
 { int x=0;
	 try {
			
			Connection con=new DBConnection().start();
			PreparedStatement ps=con.prepareStatement("delete from product where pid=?");
			ps.setString(1,pid);
			 x=ps.executeUpdate();
			if(x!=0) 
				x=1;
			
		}catch(SQLException e) {System.out.println(e);}
	return x;

	 
 }

	    
	public ArrayList<ClassBean> searchByName(String letter)
	 { 
				  ArrayList<ClassBean> list1=new ArrayList<ClassBean>();
				  
				  try {
						 Connection con=new DBConnection().start();
							
						 PreparedStatement ps1=con.prepareStatement("select * from customer where cust_name like ? ");
							ps1.setString(1,letter+"%");
							ResultSet rs1=ps1.executeQuery();
							
							while(rs1.next())
						    {
						    	ClassBean c1=new ClassBean();
						    	//c1.setCust_ac_no(rs1.getString("cust_ac_no"));
						    	c1.setCust_name(rs1.getString("cust_name"));
						    	c1.setCust_emailid(rs1.getString("cust_email_id"));
						    	c1.setCust_pwd(rs1.getString("password"));
						    	c1.setCust_add(rs1.getString("address"));
						    	//c1.setCust_mobile(rs1.getString("mobile"));
						    	//c1.setCust_bal(rs1.getString("balance"));
						    	
						    	list1.add(c1);
					    	
						    }
						  con.close();
						    
					 
			  }catch(SQLException e) {System.out.println(e); e.printStackTrace();}
	return list1;
}

public int changePassword(String checkpwd,String id,String pwd,String np,String cp)
{int x=0;
try {
	
		Connection con=new DBConnection().start();
		
		  if(pwd.equals(checkpwd))
		  {
			if(np.equals(cp))
			{
				
			PreparedStatement ps=con.prepareStatement("update customer set password=? where "
					+ "cust_ac_no=?");
			ps.setString(1,np);
			ps.setString(2,id);
			 x=ps.executeUpdate();
				}
		  }
}
	catch(SQLException e) {System.out.println(e);}
    return x;
	}
}
