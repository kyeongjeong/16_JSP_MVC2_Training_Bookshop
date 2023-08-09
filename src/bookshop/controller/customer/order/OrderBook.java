package bookshop.controller.customer.order;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bookshop.dao.BookDAO;
import bookshop.dao.MemberDAO;
import bookshop.dao.OrderDAO;
import bookshop.dto.OrderDTO;

@WebServlet("/orderBook")
public class OrderBook extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		request.setAttribute("memberDTO", MemberDAO.getInstance().getMemberDetail((String)session.getAttribute("memberId")));
		request.setAttribute("bookDTO", BookDAO.getInstance().getBookDetail(Integer.parseInt(request.getParameter("bookCd"))));
		request.setAttribute("orderBookQty", Integer.parseInt(request.getParameter("orderBookQty")));
		RequestDispatcher dis = request.getRequestDispatcher("views/customer/orderBook.jsp");
		dis.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");	
		
		OrderDTO orderDTO = new OrderDTO();
		orderDTO.setMemberId(request.getParameter("memberId"));
		orderDTO.setBookCd(Integer.parseInt(request.getParameter("bookCd")));
		orderDTO.setOrderBookQty(Integer.parseInt(request.getParameter("orderBookQty")));
		orderDTO.setPaymentAmt(Integer.parseInt(request.getParameter("paymentAmt")));
		orderDTO.setOrdererNm(request.getParameter("ordererNm"));
		orderDTO.setOrdererHp(request.getParameter("ordererHp"));
		orderDTO.setReceiverNm(request.getParameter("receiverNm"));
		orderDTO.setReceiverHp(request.getParameter("receiverHp"));
		orderDTO.setZipcode(request.getParameter("zipcode"));
		orderDTO.setRoadAddress(request.getParameter("roadAddress"));
		orderDTO.setJibunAddress(request.getParameter("jibunAddress"));
		orderDTO.setNamujiAddress(request.getParameter("namujiAddress"));
		orderDTO.setDeliveryMethod(request.getParameter("deliveryMethod"));
		orderDTO.setDeliveryMessage(request.getParameter("deliveryMessage"));
		orderDTO.setDeliveryStatus("배송준비중");
		orderDTO.setGiftWrapping(request.getParameter("giftWrapping"));
		orderDTO.setPayMethod(request.getParameter("payMethod"));
		orderDTO.setPayOrdererHp(request.getParameter("payOrdererHp"));
		orderDTO.setCardCompanyNm(request.getParameter("cardCompanyNm"));
		orderDTO.setCardPayMonth(request.getParameter("cardPayMonth"));
		
		int point = Integer.parseInt(request.getParameter("point"));
		
		OrderDAO.getInstance().insertOrderBook(orderDTO , point);
		
		String jsScript = "<script>";
				jsScript += "alert('주문 되었습니다.');";
				jsScript += "location.href='bookList';";
				jsScript += "</script>";
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter pw = response.getWriter();
		pw.print(jsScript);
	}

}
