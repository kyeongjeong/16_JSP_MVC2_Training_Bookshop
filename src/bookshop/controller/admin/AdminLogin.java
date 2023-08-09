package bookshop.controller.admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bookshop.dao.AdminMemberDAO;
import bookshop.dto.AdminMemberDTO;

@WebServlet("/adminLogin")
public class AdminLogin extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dis = request.getRequestDispatcher("views/admin/adminLogin.jsp");
		dis.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		AdminMemberDTO adminMemberDTO = new AdminMemberDTO();
		adminMemberDTO.setAdminId(request.getParameter("adminId"));
		adminMemberDTO.setPasswd(request.getParameter("passwd"));
	
		String jsScript = "";
		if (AdminMemberDAO.getInstance().adminLogin(adminMemberDTO)) {
			HttpSession session = request.getSession();
			session.setAttribute("adminId" , adminMemberDTO.getAdminId());
			jsScript = "<script>";
			jsScript += "alert('로그인 되었습니다.');";
			jsScript += "location.href='adminOrderList';";
			jsScript += "</script>";
		}
		else {
			jsScript = "<script>";
			jsScript += "alert('아이디와 패스워드를 확인하세요.');";
			jsScript += "history.go(-1);";
			jsScript += "</script>";
		}
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter pw = response.getWriter();
		pw.print(jsScript);
	}

}
