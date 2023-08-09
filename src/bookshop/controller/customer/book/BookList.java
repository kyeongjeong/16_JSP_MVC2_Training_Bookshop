package bookshop.controller.customer.book;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bookshop.dao.BookDAO;

@WebServlet("/bookList")
public class BookList extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setAttribute("bookList", BookDAO.getInstance().getBookList());
		
		RequestDispatcher dis = request.getRequestDispatcher("views/customer/bookList.jsp");
		dis.forward(request, response);
	}

}
