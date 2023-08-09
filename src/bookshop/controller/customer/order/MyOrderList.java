package bookshop.controller.customer.order;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bookshop.dao.OrderDAO;

@WebServlet("/myOrderList")
public class MyOrderList extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		HttpSession session = request.getSession();
		request.setAttribute("orderMapList" , OrderDAO.getInstance().getMyOrderList((String)session.getAttribute("memberId")));
		
		RequestDispatcher dis = request.getRequestDispatcher("views/customer/myOrderList.jsp");
		dis.forward(request, response);
		
	}


}
