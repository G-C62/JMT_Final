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

public class ReadMyReviewController implements Controller
{

	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
	{

		ReviewService reviewService = new ReviewServiceImpl();

		int reviewId = Integer.parseInt(request.getParameter("reviewId"));

		String url = "jihye_View/error.jsp";
		try
		{
			ReviewDTO reviewDTO = reviewService.selectByReviewId(reviewId);

			request.setAttribute("reviewDTO", reviewDTO);

			// url="jihye_View/reviewView.jsp";
			url = "jihye_View/reviewFirstUpdate.jsp?reviewId=" + reviewId; // 상세보기

		} catch (Exception e)
		{
			e.printStackTrace();
			request.setAttribute("errorMsg", e.getMessage());
		}

		ModelAndView mv = new ModelAndView();
		mv.setPath(url);

		return mv;
	}

}
