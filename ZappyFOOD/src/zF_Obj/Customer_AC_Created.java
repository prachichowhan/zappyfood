package zF_Obj;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ob.beans.ClassBean;
import com.ob.dao.MyDAO;

/**
 * Servlet implementation class Customer_AC_Created
 */
@WebServlet("/Customer_AC_Created")
public class Customer_AC_Created extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		out.print("hiii");
		         String cust_userid=request.getParameter("uid");
				 String cust_name=request.getParameter("name");
				 String cust_emailid=request.getParameter("emailid");
				 String cust_pwd=request.getParameter("pwd");
				 String cust_contactno=request.getParameter("cno");
				 String cust_add=request.getParameter("add");
				 
				 ClassBean c=new ClassBean();
				 c.setCust_userid(cust_userid);
				 c.setCust_name(cust_name);
				 c.setCust_emailid(cust_emailid);
				 c.setCust_pwd(cust_pwd);
				 c.setCust_contactno(cust_contactno);
				 c.setCust_add(cust_add); 
				
				 MyDAO m=new MyDAO();
				 int x=m.customerAcCreated(c);
				 
				 if(x!=0)
				    {
//					 RequestDispatcher rd1=request.getRequestDispatcher("CreateCustomerAccount.jsp");
//			      		request.setAttribute("msg1","<h1 align='center'>Cutomer account created successfully ...... </h1>");
//			      		rd1.forward(request, response);
//			      		
				    	out.println("<h1 align='center'>'Cutomer account created successfully ......' </h1>");  	
				   }
				 else
					 out.println("not");
				
		}
		}