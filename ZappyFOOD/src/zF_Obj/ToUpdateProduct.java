package zF_Obj;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ob.beans.ProductBean;
import com.ob.dao.MyDAO;

/**
 * Servlet implementation class ToUpdateProduct
 */
@WebServlet("/ToUpdateProduct")
public class ToUpdateProduct extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	String ppid=request.getParameter("ppid");
	String ppname=request.getParameter("ppname");
	double pprice=Double.parseDouble(request.getParameter("ppprice"));
	String ppweight=request.getParameter("ppweight");
	String ppdetails=request.getParameter("ppdetails");
	PrintWriter out=response.getWriter();
	
	ProductBean p=new ProductBean();
	p.setProduct_name(ppname);
	p.setProduct_price(pprice);
	p.setProduct_weigth(ppweight);
	p.setProduct_details(ppdetails);
	
	
		MyDAO md=new MyDAO();
		int l=md.updateProduct(p,ppid);
		if(l!=0)
		{
         RequestDispatcher rd=request.getRequestDispatcher("ViewProductFUpdateDelete.jsp");
         request.setAttribute("msg","Data updated of Product Id "+ppid);
         rd.forward(request, response);
			
		}
		
	}

}
