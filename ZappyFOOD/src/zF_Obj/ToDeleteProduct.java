package zF_Obj;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ob.dao.MyDAO;
import com.zappyfoods.dboperation.DBConnection;

/**
 * Servlet implementation class ToDeleteProduct
 */
@WebServlet("/ToDeleteProduct")
public class ToDeleteProduct extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	  PrintWriter out=response.getWriter();
	  out.println("hii");
	  String PPId=request.getParameter("Pid");
	  
	  MyDAO m=new MyDAO();
	  int x=m.deleteProduct(PPId);
	  if(x!=0)
	  {
		  RequestDispatcher rd=request.getRequestDispatcher("ViewProductFUpdateDelete.jsp");
	       request.setAttribute("msg1","Data deleted of Product Id "+PPId);
	       rd.forward(request, response);
	  }
	  
		
	}

}
