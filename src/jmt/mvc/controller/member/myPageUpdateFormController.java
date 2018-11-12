package jmt.mvc.controller.member;

import java.io.IOException;

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

public class myPageUpdateFormController implements Controller {
	MemberService ms = new MemberServiceImpl();

	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		ModelAndView mv = new ModelAndView();

		// ���۵� ������ �ޱ�
		String id = (String) session.getAttribute("memberID");
		// String password = (String)session.getAttribute("password");

		try {
			MemberDTO memberDTO = ms.selectById(id); // 1. memberDTO��
			request.setAttribute("memberDTO",
					memberDTO);/*
								 * setAttribute�� memberDTO�� �Ѿ�� "memberDTO"�� ���� ���ȴ�. �������� �Ἥ ���� ���� memberDTO�ε�
								 * �̰��� �ڹٿ��� �� �� �ִ� ���̴ϱ� jsp���� �� �� �ֵ��� jsp���ٰ����� � ������ memberDTO�� ���� �����ؼ� �ű�ٰ�
								 * memberDTO�� ���� ���̴�. ���� request.setAttribute("sungho", memberDTO);�� �ٲ�ٸ� jsp������
								 * ������ sungho.getMemberId�� �ٲ��. ${memberDTO.getMemberEmail()} ->
								 * ${sungho.getMemberEmail()}
								 */
			String phone = memberDTO.getMemberPhone();
			String phone1 = phone.split("-")[0];
			String phone2 = phone.split("-")[1];
			String phone3 = phone.split("-")[2];
			request.setAttribute("phone1", phone1);
			request.setAttribute("phone2", phone2);
			request.setAttribute("phone3", phone3);
			System.out.println(memberDTO.getMemberGender());
		} catch (SQLException e) {

			e.printStackTrace();
		}
		mv.setPath("/memberView/myPageUpdate.jsp");

		return mv;
	}

}