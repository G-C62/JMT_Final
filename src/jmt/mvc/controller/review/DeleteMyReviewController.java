package jmt.mvc.controller.review;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jmt.mvc.controller.Controller;
import jmt.mvc.controller.ModelAndView;
import jmt.mvc.model.service.ReviewService;
import jmt.mvc.model.service.ReviewServiceImpl;



public class DeleteMyReviewController implements Controller {

	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		ReviewService reviewService = new ReviewServiceImpl();
		
		ModelAndView mv = new ModelAndView();
		String url="jihye_View/error.jsp";

		 int reviewId = Integer.parseInt(request.getParameter("reviewId"));
		
		try {
		 
		 reviewService.reviewDelete(reviewId);
		 url="jmt?command=review.selectAll";
		 mv.setRedirect(true);
		 
		}catch (SQLException e) {
			e.printStackTrace();
			request.setAttribute("errorMsg", e.getMessage());
		}
		
		mv.setPath(url);
		return mv;
	}
	
	

}





