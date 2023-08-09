package bookshop.controller.customer.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bookshop.dao.MemberDAO;
import bookshop.dto.MemberDTO;

@WebServlet("/modifyMember")
public class ModifyMember extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		request.setAttribute("memberDTO" , MemberDAO.getInstance().getMemberDetail((String)session.getAttribute("memberId")));
		
		RequestDispatcher dis = request.getRequestDispatcher("views/customer/modifyMember.jsp");
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
        
		MemberDAO.getInstance().updateMember(memberDTO);
		
		String jsScript = "<script>";
				jsScript += "alert('수정 되었습니다.');";
				jsScript += "location.href='bookList';";
				jsScript += "</script>";
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter pw = response.getWriter();
		pw.print(jsScript);
		
	}

}
