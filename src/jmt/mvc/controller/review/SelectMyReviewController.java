package jmt.mvc.controller.review;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jmt.mvc.controller.Controller;
import jmt.mvc.controller.ModelAndView;
import jmt.mvc.model.dto.ReviewDTO;
import jmt.mvc.model.service.ReviewService;
import jmt.mvc.model.service.ReviewServiceImpl;

public class SelectMyReviewController implements Controller
{

	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
	{
		String url = "jihye_View/reviewView.jsp"; // default로
		String memberId = "aaa";

		// 리뷰 좋아요를 위한 map
		Map<Integer, Integer> reviewLikeAmountMap = new HashMap<>();

		try
		{

			// 전체검색기능

			ReviewService service = new ReviewServiceImpl();
			List<ReviewDTO> list = service.myReviewSelectAll(memberId);
			request.setAttribute("list", list);
			int reviewId = 0;
			int reviewLikeAmount = 0;

			for (ReviewDTO review : list)
			{
				reviewId = review.getReviewId();

				// 리뷰마다 좋아요가 몇 개 눌렸는지 가져오기
				reviewLikeAmount = service.reviewLikeAmount(reviewId);

				// map에 넣어서 앞 단에서 따로 list와 함께 print
				reviewLikeAmountMap.put(reviewId, reviewLikeAmount);
			}
		} catch (Exception e)
		{
			e.printStackTrace(); // 콘솔에 출력

		}
		

		request.setAttribute("reviewLikeAmountMap", reviewLikeAmountMap);
		
		ModelAndView mv = new ModelAndView();
		mv.setPath(url); // 성공해도 실패해도 forward방식
		return mv;

	}
}
