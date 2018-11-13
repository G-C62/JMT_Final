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
		System.out.println("myPageUpdateController ȣ��");
		String url = "jmt?command=review.selectAll";
		
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		ModelAndView mv = new ModelAndView();

		// ���۵� ������ �ޱ�
		String memberID = request.getParameter("memberID"); // ����Ʈ���� �������ϰ�
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String phone1 = request.getParameter("phone1");
		String phone2 = request.getParameter("phone2");
		String phone3 = request.getParameter("phone3");
		String email = request.getParameter("email");
		String phone = phone1 + "-" + phone2 + "-" + phone3;
		System.out.println(memberID + password+email+phone);
		try {
			int result = ms.update(new MemberDTO(memberID, password, name, phone, email));

			if (result == 1) {
				out.println("<script>alert(ȸ�� ���� ���� ����);</script>");
				System.out.println("��������");
				mv.setPath("memberView/myPage.jsp");// ���� �������� �̵�
			} else {
				out.println("<script>alert(ȸ�� ���� ���� ����);</script>");
				mv.setPath("memberView/myPage.jsp");
			}

		} catch (Exception e) {

			e.printStackTrace();
		}
		mv.setPath(url);
		return mv;
	}

}