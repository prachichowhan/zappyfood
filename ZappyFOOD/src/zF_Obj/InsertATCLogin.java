package zF_Obj;

import java.io.IOException;

import java.io.PrintWriter;
import java.net.InetAddress;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ob.beans.ProductBean;
import com.ob.dao.MyDAO;
import com.zappyfoods.dboperation.DBConnection;

@WebServlet("/InsertATCLogin")
public class InsertATCLogin extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		out.println("HIII");
		InetAddress ipAddr=InetAddress.getLocalHost();
	     String ip=ipAddr.getHostAddress();
			
	     HttpSession session=request.getSession();
	 	String data=(String)session.getAttribute("cust_id");
	 	
	 	
	 	MyDAO m=new MyDAO();
		int x=m.insertCarttableAfterLogin(ip,data);
		if(x!=0)
		{
			System.out.println("????Data inserted");			
		response.sendRedirect("ViewATCALogin.jsp");
		}
		else
			out.print("noo");
		

	 	
	 	
//	 	String userid;
//		if(data==null)
//	     userid=ip;
//	 	else
//	 		userid=data;
//		
		
//		try {
//			  System.out.println("Hello");
//			  Connection con=new DBConnection().start();
//			  PreparedStatement ps2=con.prepareStatement("select ProductId,ProductName,Price,Quantity,UserId,Total from carttable where UserId=?");
//	          ps2.setString(1,ip);
//	          ResultSet rs=ps2.executeQuery(); 
//	         while(rs.next())
//	          {
//	        	  
//	            PreparedStatement ps1=con.prepareStatement("insert into placedorder values(?,?,?,?,?,?,?)");
//	            ps1.setString(1,rs.getString("UserId"));		 
//				ps1.setString(2,rs.getString("ProductId"));
//				ps1.setString(3,rs.getString("ProductName"));
//				ps1.setDouble(4,rs.getDouble("Price"));
//				ps1.setString(5,rs.getString("Quantity"));
//				ps1.setDouble(6,rs.getDouble("Total"));
//				ps1.setString(7,"0");
//				int x=ps1.executeUpdate();
//				
//				PreparedStatement ps=con.prepareStatement("update placedorder set UserId=? where UserId=?"); 
//				ps.setString(2,ip);
//				ps.setString(1,data);
//				int y=ps.executeUpdate();
//				
//				if(x!=0) {out.println("suces insert");}
//				if(y!=0) {out.println("suces update");}
//				
//	           
//	          }
//	         PreparedStatement ps3=con.prepareStatement("delete from carttable where UserId=? ");	
//	            ps3.setString(1,ip);
//	            int z=ps3.executeUpdate();
//	            if(z!=0) {out.println("suces deleted");}
//	           
//		
//		}catch(SQLException e) {System.out.println(e);}
//	
	 	   
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		 
		
	}

}
