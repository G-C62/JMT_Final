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

		ModelAndView mv = new ModelAndView();
		MemberDTO dto = new MemberDTO();

		// ���۵� ������ �ޱ�
		String memberID = request.getParameter("memberID");
		String password = request.getParameter("password");

		try {

			dto = new MemberDTO(memberID, password);
			System.out.println(memberID);
			boolean result = ms.selectByInfo(dto);

			if (result) { // ��ġ�ϸ� session�� Id ���� ��
				session.setAttribute("memberID", memberID);
				mv.setPath("mainView/JmtMain.jsp");// �α��� �������� �̵�
			} else {
				mv.setPath("/indexEx.jsp");
			} // ���� ����� �޾Ƽ� �����ؼ� ��� �̵��Ѵ�
			mv.setRedirect(true);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return mv;
	}

}