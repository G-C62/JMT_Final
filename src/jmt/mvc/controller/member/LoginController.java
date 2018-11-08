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
import jmt.mvc.model.dto.MemberDTO;
import jmt.mvc.model.service.MemberService;
import jmt.mvc.model.service.MemberServiceImpl;

public class LoginController implements Controller {
	MemberService ms = new MemberServiceImpl();

	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();

		//String url = "errorView/error.jsp";
		ModelAndView mv = new ModelAndView();
		MemberDTO dto = new MemberDTO();

		// 전송된 데이터 받기
		String memberID = request.getParameter("memberID");
		String password = request.getParameter("password");

		try {

			dto = new MemberDTO(memberID, password);
System.out.println(memberID);
			boolean result = ms.selectByInfo(dto);
			
			if (result) { // 일치하면 session에 Id 저장 후
				session.setAttribute("memberID", memberID);
				
				out.println("<script>alert('로그인 성공');</script>");
				
				mv.setPath("main/indexEx.jsp");// 로그인 페이지로 이동
			} else {
				System.out.println("result 가 false");
				out.println("<script>alert('로그인 실패');</script>");
				mv.setPath("main/indexEx.jsp");
			} // 최종 결과를 받아서 저장해서 뷰로 이동한다
		} catch (SQLException e) {
			mv.setPath("./errors/error.jsp");
			//session.setAttribute("errMsg", e.toString());
			return mv;
		}
		return mv;
	}

}