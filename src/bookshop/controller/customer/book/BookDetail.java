package bookshop.controller.customer.book;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bookshop.dao.BookDAO;
import bookshop.dto.BookDTO;

@WebServlet("/bookDetail")
public class BookDetail extends HttpServlet {

	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		BookDTO bookDTO = BookDAO.getInstance().getBookDetail(Integer.parseInt(request.getParameter("bookCd")));
		
		request.setAttribute("bookDTO", bookDTO);
		request.setAttribute("relatedBookList" , BookDAO.getInstance().getRelatedBookList(bookDTO.getSort()));
		
		RequestDispatcher dis = request.getRequestDispatcher("views/customer/bookDetail.jsp");
		dis.forward(request, response);
		
	}


}
