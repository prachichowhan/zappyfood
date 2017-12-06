package zF_Obj;

import java.io.IOException;

import java.net.InetAddress;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ob.beans.ProductBean;
import com.ob.dao.MyDAO;

/**
 * Servlet implementation class InsertAddToCart
 */
@WebServlet("/InsertAddToCart")
public class InsertAddToCart extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
     InetAddress ipAddr=InetAddress.getLocalHost();
     String ip=ipAddr.getHostAddress();
		
//     HttpSession session=request.getSession();
// 	String data=(String)session.getAttribute("cust_id");
// 	
// 	String userid;
//	if(data==null)
//     userid=ip;
// 	else
// 		userid=data;
//	
 		
		String pid=request.getParameter("pid");
		String pname=request.getParameter("pname");
		double price=Double.parseDouble(request.getParameter("price"));
		int qty=Integer.parseInt(request.getParameter("qty"));
		double tot=price*qty;
		
		ProductBean p=new ProductBean();
		p.setProduct_Id(pid);
		p.setProduct_name(pname);
		p.setProduct_price(price);
		p.setQuantity(qty);
		p.setTotal(tot);
		int count=0; 
		count++; 
		MyDAO m=new MyDAO();
		int x=m.insertCarttable(p,ip);
		if(x!=0)
		{ 
			RequestDispatcher rd=request.getRequestDispatcher("ViewAllProduct.jsp");
			request.setAttribute("msg",+count+"Product Added into Cart" );
			rd.forward(request, response);
		}
		
	
	}

}








