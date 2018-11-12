package jmt.mvc.controller.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jmt.mvc.controller.Controller;
import jmt.mvc.controller.ModelAndView;
import jmt.mvc.model.service.MemberService;
import jmt.mvc.model.service.MemberServiceImpl;

public class DeleteController implements Controller {
	MemberService ms = new MemberServiceImpl();

	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		
		ModelAndView mv = new ModelAndView();
		
		// 전송된 데이터 받기
		String memberID = (String) session.getAttribute("memberID");

		System.out.println(memberID);
		try {
			//유효성 체크...
			if (memberID == null || memberID.equals("")){
			throw new SQLException("아이디가 없습니다.");
			}

			ms.delete(memberID);

			mv.setRedirect(true);
			session.invalidate();
			mv.setPath("mainView/JmtMain.jsp");
			

		} catch (SQLException e) {
			e.printStackTrace();
			request.setAttribute("errorMsg", e.getMessage());

		}
		return mv;
	}
}
