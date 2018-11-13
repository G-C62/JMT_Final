package jmt.mvc.controller.review;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jmt.mvc.controller.Controller;
import jmt.mvc.controller.ModelAndView;
import jmt.mvc.model.dto.ReviewDTO;
import jmt.mvc.model.service.ReviewService;
import jmt.mvc.model.service.ReviewServiceImpl;

public class UpdateFormController implements Controller
{

	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
	{

		ReviewService reviewService = new ReviewServiceImpl();

		ModelAndView mv = new ModelAndView();
		String url = "jihye_View/error.jsp";

		String reviewId = request.getParameter("reviewId");

		try
		{
			ReviewDTO reviewDTO = reviewService.selectByReviewId(Integer.parseInt(reviewId));

			request.setAttribute("reviewDTO", reviewDTO);

			url = "final_view/reviewView/reviewSecondUpdate.jsp";// ¼öÁ¤Æû

		} catch (Exception e)
		{
			e.printStackTrace();
			request.setAttribute("errorMsg", e.getMessage());
		}

		mv.setPath(url);
		return mv;
	}

}
