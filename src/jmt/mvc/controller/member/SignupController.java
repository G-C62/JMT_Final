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
      String url = "errorView/error.jsp";
      ModelAndView mv = new ModelAndView();

      // 전송된 데이터 받기
      String memberID = request.getParameter("memberID");
      String password = request.getParameter("password");
      String name = request.getParameter("name");
      String phone1 = request.getParameter("phone1");
      String phone2 = request.getParameter("phone2");
      String phone3 = request.getParameter("phone3");
      String gender = request.getParameter("gender");
      String email = request.getParameter("email");
      
      String phone = phone1+"-"+phone2+"-"+phone3; 
      
      System.out.println(gender);
      try {
         // 유효성 체크...
         if (memberID == null || memberID.equals("") || password == null || password.equals("") || name == null
               || name.equals("") || phone1 == null || phone1.equals("") || phone2 == null
               || phone2.equals("") || phone3.equals("") || phone3.equals("") || gender.equals("") || gender.equals("") 
               || email.equals("") || email.equals("")) {
            throw new SQLException("입력값이 충분하지 않습니다.");
         }
         
         
         MemberDTO memberDTO = new MemberDTO(memberID, password, name, phone, gender, email);
         
         
         ms.insert(memberDTO);
         
         
      // url = "indexEx.html"; 
       mv.setRedirect(true);
       mv.setPath("mainView/JmtMain.jsp");

      } catch (SQLException e) {
         e.printStackTrace();
         request.setAttribute("errorMsg", e.getMessage());

      }
      mv.setPath("mainView/JmtMain.jsp");
      return mv;
   }

}