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

public class myPageUpdateController implements Controller {
	MemberService ms = new MemberServiceImpl();

	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		System.out.println("myPageUpdateController 호출");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		ModelAndView mv = new ModelAndView();

		// 전송된 데이터 받기
		String memberID = request.getParameter("memberID"); // 프론트에서 수정못하게
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String phone1 = request.getParameter("phone1");
		String phone2 = request.getParameter("phone2");
		String phone3 = request.getParameter("phone3");
		String gender = request.getParameter("gender");
		String email = request.getParameter("email");
		String phone = phone1 + "-" + phone2 + "-" + phone3;
		System.out.println(memberID + password + gender);
		try {
			int result = ms.update(new MemberDTO(memberID, password, name, phone, gender, email));

			if (result == 1) {
				out.println("<script>alert(회원 정보 수정 성공);</script>");

				mv.setPath("seongho_view/indexEx.jsp");// 메인 페이지로 이동
			} else {
				out.println("<script>alert(회원 정보 수정 실패);</script>");
				mv.setPath("seongho_view/indexEx.jsp");
			}

		} catch (SQLException e) {

			e.printStackTrace();
		}

		return mv;
	}

}