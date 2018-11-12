package jmt.mvc.ajaxController;

import java.io.IOException;

import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jmt.mvc.model.dao.MemberDAO;
import jmt.mvc.model.dao.MemberDAOImpl;
import jmt.mvc.model.service.MemberService;
import jmt.mvc.model.service.MemberServiceImpl;

/**
 * Servlet implementation class IdCheckServlet
 */
@WebServlet("/idCheckServlet")
public class IdCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	MemberService service = new MemberServiceImpl();
     
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");// post방식 한글처리
		
		
		String memberID = request.getParameter("id");

		PrintWriter out = response.getWriter();
		
		boolean result;
		try {
			result = service.idCheck(memberID);
			if(result) {
			 out.print("이미사용중입니다.");}
			else {
			 out.print("사용가능합니다.");}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
	}

}












