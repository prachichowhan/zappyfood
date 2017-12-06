package zF_Obj;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ob.dao.MyDAO;

/**
 * Servlet implementation class CheckLogin
 */
@WebServlet("/CheckLogin")
public class CheckLogin extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 response.setContentType("text/html");
		  
			String id=request.getParameter("id");
			 String pwd=request.getParameter("pwd");
			 String type=request.getParameter("type");
			 String sql="";
			 PrintWriter out=response.getWriter();
			
			 if(type.equals("Admin"))
					sql="select * from admin where admin_id=? and admin_password=?";
			 
			else if(type.equals("Customer"))
				sql="select * from customer where cust_userid=? and cust_password=?";
		
			else
			  out.println("Invalid Id or password");
				
	  MyDAO m=new MyDAO();
	  int x=m.checkLogin(id, pwd, sql);
	  
			 
			 
			 if(x==1 && type.equals("Admin"))
			 {  
				 RequestDispatcher rd=request.getRequestDispatcher("AdminHome.jsp");
	             rd.forward(request,response);
				 	 }	 
			 else if(x==1 && type.equals("Customer"))
			 {
				 HttpSession session=request.getSession();
				session.setAttribute("cust_id",id);
				
				session.setAttribute("pwd",pwd);
				 RequestDispatcher rd=request.getRequestDispatcher("CustomerHome.jsp");
	             rd.forward(request,response);
				
				// out.print("<br>Welcome Customer  "+n+"with id : "+id);
	
				 }			
	      	else
		   	out.println("Login Failed......");			
//			 out.print("</center>");
	}
	}

