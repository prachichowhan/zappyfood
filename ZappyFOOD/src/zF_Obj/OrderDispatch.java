package zF_Obj;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ob.dao.MyDAO;

/**
 * Servlet implementation class OrderDispatch
 */
@WebServlet("/OrderDispatch")
public class OrderDispatch extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
   PrintWriter out=response.getWriter();
   
	String dispid= request.getParameter("dispid");
   MyDAO m=new MyDAO();
   int x=m.orderDispatch(dispid);
   if(x!=0)
   {
	  RequestDispatcher rd=request.getRequestDispatcher("ViewOrder.jsp");
	  request.setAttribute("msg","Order Dispatch successfully");
	  rd.forward(request, response);
   }
 
	}

}
