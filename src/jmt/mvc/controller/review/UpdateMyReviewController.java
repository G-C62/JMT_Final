package jmt.mvc.controller.review;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jmt.mvc.controller.Controller;
import jmt.mvc.controller.ModelAndView;
import jmt.mvc.model.dto.ReviewDTO;
import jmt.mvc.model.service.ReviewService;
import jmt.mvc.model.service.ReviewServiceImpl;

public class UpdateMyReviewController implements Controller
{

	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
	{

		ReviewService reviewService = new ReviewServiceImpl();

		ModelAndView mv = new ModelAndView();

		String url = "jihye_View/error.jsp";

		// 전송된 데이터 받기
		int reviewId = Integer.parseInt(request.getParameter("reviewId"));
		String reviewTitle = request.getParameter("reviewTitle");
		String reviewContents = request.getParameter("reviewContents");
		String reviewImg1 = request.getParameter("reviewImg1");
		String reviewImg2 = request.getParameter("reviewImg2");
		String reviewImg3 = request.getParameter("reviewImg3");
		int resId = Integer.parseInt(request.getParameter("resId"));
		String date = request.getParameter("reviewDate");

		try
		{
			ReviewDTO reviewDTO = new ReviewDTO(reviewId, reviewTitle, reviewContents,
					request.getParameter("reviewDate"), request.getParameter("memberId"), resId,
					request.getParameter("resName"), reviewImg1, reviewImg2, reviewImg3,
					request.getParameter("reviewIsLike"));
			reviewService.reivewUpdate(reviewDTO);
			request.setAttribute("reviewDTO", reviewDTO);

			url = "final_View/reviewView/reviewFirstUpdate.jsp?reviewId=" + reviewId; // 상세보기
			// mv.setRedirect(true);

		} catch (SQLException e)
		{
			e.printStackTrace();
			request.setAttribute("errorMsg", e.getMessage());
		}

		mv.setPath(url);

		return mv;

	}
}
