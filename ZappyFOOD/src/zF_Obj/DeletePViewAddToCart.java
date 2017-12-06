package zF_Obj;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ob.dao.MyDAO;
import com.zappyfoods.dboperation.DBConnection;

/**
 * Servlet implementation class DeletePViewAddToCart
 */
@WebServlet("/DeletePViewAddToCart")
public class DeletePViewAddToCart extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
  
    int incid=Integer.parseInt(request.getParameter("inc_id"));
      
	    MyDAO md=new MyDAO();
	    int x=md.deltFromAddToCart(incid);
	    if(x!=0)
		{	
		  response.sendRedirect("ViewAddToCart.jsp");
		}
	
		}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
}

}
