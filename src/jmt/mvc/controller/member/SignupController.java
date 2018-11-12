package jmt.mvc.controller.member;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jmt.mvc.controller.Controller;
import jmt.mvc.controller.ModelAndView;
import jmt.mvc.model.dto.MemberDTO;
import jmt.mvc.model.service.MemberService;
import jmt.mvc.model.service.MemberServiceImpl;

public class SignupController implements Controller {
   MemberService ms = new MemberServiceImpl();
   @Override
   public ModelAndView execute(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
      
      ModelAndView mv = new ModelAndView();

      // ���۵� ������ �ޱ�
      String memberID = request.getParameter("memberID");
      String password = request.getParameter("password");
      String name = request.getParameter("name");
      String phone1 = request.getParameter("phone1");
      String phone2 = request.getParameter("phone2");
      String phone3 = request.getParameter("phone3");
      String gender = request.getParameter("gender");
      String email = request.getParameter("email");
      System.out.println(memberID);
      System.out.println(password);
      System.out.println(name);
      
      System.out.println(gender);
      System.out.println(email);
      
      String phone = phone1+"-"+phone2+"-"+phone3; 
      System.out.println(phone);
      System.out.println(gender);
      try {
         // ��ȿ�� üũ...
         if (memberID == null || memberID.equals("") || password == null || password.equals("") || name == null
               || name.equals("") || phone1 == null || phone1.equals("") || phone2 == null
               || phone2.equals("") || phone3==null || phone3.equals("") || email==null || email.equals("")) {
            throw new SQLException("�Է°��� ������� �ʽ��ϴ�.");
         }
         
         
         MemberDTO memberDTO = new MemberDTO(memberID, password, name, phone, gender, email);
         
         
         ms.insert(memberDTO);
         
         
       mv.setRedirect(true);
       mv.setPath("seongho_view/indexEx.jsp");

      } catch (SQLException e) {
    	  e.printStackTrace();
         request.setAttribute("errorMsg", e.getMessage());

      }
      mv.setPath("seongho_view/indexEx.jsp");
      return mv;
   }

}