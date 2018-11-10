package jmt.mvc.controller.review;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jmt.mvc.controller.Controller;
import jmt.mvc.controller.ModelAndView;
import jmt.mvc.model.dto.ReviewDTO;
import jmt.mvc.model.service.ReviewService;
import jmt.mvc.model.service.ReviewServiceImpl;

public class SelectMyReviewController implements Controller {

	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url =  "jihye_View/reviewView.jsp"; //default로
		String id = "aaa";
		
		try {
				
				//전체검색기능
				
				ReviewService service =  new ReviewServiceImpl();
				List<ReviewDTO> list =service.myReviewSelectAll(id);
				request.setAttribute("list", list);
		}catch (Exception e) {
			e.printStackTrace(); //콘솔에 출력
			
		}
			ModelAndView mv = new ModelAndView();
			mv.setPath(url);  //성공해도 실패해도 forward방식
			return mv;
	 	
       }
}


