package bookshop.controller.customer.order;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bookshop.dao.OrderDAO;

@WebServlet("/myOrderDetail")
public class MyOrderDetail extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setAttribute("orderMap" , OrderDAO.getInstance().getMyOrderDetail(Long.parseLong(request.getParameter("orderCd"))));
		
		RequestDispatcher dis = request.getRequestDispatcher("views/customer/myOrderDetail.jsp");
		dis.forward(request, response);
	
	}

}
