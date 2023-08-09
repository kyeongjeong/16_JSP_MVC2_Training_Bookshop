package bookshop.controller.customer.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bookshop.dao.MemberDAO;
import bookshop.dto.MemberDTO;

@WebServlet("/register")
public class Register extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dis = request.getRequestDispatcher("views/customer/register.jsp");
		dis.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("utf-8");	
		
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setMemberId(request.getParameter("memberId"));
		memberDTO.setMemberNm(request.getParameter("memberNm"));
		memberDTO.setPasswd(request.getParameter("passwd"));
		memberDTO.setSex(request.getParameter("sex"));
		memberDTO.setBirthDt(request.getParameter("birthDt"));
		memberDTO.setHp(request.getParameter("hp"));
		if (request.getParameter("smsstsYn") != null) memberDTO.setSmsstsYn(request.getParameter("smsstsYn"));
		else  										  memberDTO.setSmsstsYn("N");
		
		memberDTO.setEmail(request.getParameter("email"));
		if (request.getParameter("emailstsYn") != null) memberDTO.setEmailstsYn(request.getParameter("emailstsYn"));
		else  											memberDTO.setEmailstsYn("N");
		
		memberDTO.setZipcode(request.getParameter("zipcode"));
		memberDTO.setRoadAddress(request.getParameter("roadAddress"));
		memberDTO.setJibunAddress(request.getParameter("jibunAddress"));
		memberDTO.setNamujiAddress(request.getParameter("namujiAddress"));
        
		MemberDAO.getInstance().registerMember(memberDTO);
		
		String jsScript = "<script>";
				jsScript += "alert('가입 되었습니다.');";
				jsScript += "location.href='bookList';";
				jsScript += "</script>";
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter pw = response.getWriter();
		pw.print(jsScript);
		
	}

}
