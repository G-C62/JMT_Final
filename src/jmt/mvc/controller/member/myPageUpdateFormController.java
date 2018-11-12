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

		// 전송된 데이터 받기
		String id = (String) session.getAttribute("memberID");
		// String password = (String)session.getAttribute("password");

		try {
	
			MemberDTO memberDTO = ms.selectById(id); // 1. memberDTO가
			request.setAttribute("memberDTO",
					memberDTO);/*
								 * setAttribute의 memberDTO로 넘어가고 "memberDTO"로 가서 사용된다. 쿼리문을 써서 뽑은 값이 memberDTO인데
								 * 이값은 자바에서 쓸 수 있는 것이니까 jsp에서 쓸 수 있도록 jsp접근가능한 어떤 영역에 memberDTO를 새로 선언해서 거기다가
								 * memberDTO를 넣은 것이다. 만약 request.setAttribute("sungho", memberDTO);로 바뀐다면 jsp페이지
								 * 에서는 sungho.getMemberId로 바뀐다. ${memberDTO.getMemberEmail()} ->
								 * ${sungho.getMemberEmail()}
								 */
			
			String phone = memberDTO.getMemberPhone();
			String phone1 = phone.split("-")[0];
			String phone2 = phone.split("-")[1];
			String phone3 = phone.split("-")[2];
			request.setAttribute("phone1", phone1);
			request.setAttribute("phone2", phone2);
			request.setAttribute("phone3", phone3);
		} catch (SQLException e) {

			e.printStackTrace();
		}
		mv.setPath("/seongho_view/myPageUpdate.jsp");

		return mv;
	}

}