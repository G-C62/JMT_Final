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
		String url = "jihye_View/reviewView.jsp"; // default��
		String memberId = "aaa";

		// ���� ���ƿ並 ���� map
		Map<Integer, Integer> reviewLikeAmountMap = new HashMap<>();

		try
		{

			// ��ü�˻����

			ReviewService service = new ReviewServiceImpl();
			List<ReviewDTO> list = service.myReviewSelectAll(memberId);
			request.setAttribute("list", list);
			int reviewId = 0;
			int reviewLikeAmount = 0;

			for (ReviewDTO review : list)
			{
				reviewId = review.getReviewId();

				// ���丶�� ���ƿ䰡 �� �� ���ȴ��� ��������
				reviewLikeAmount = service.reviewLikeAmount(reviewId);

				// map�� �־ �� �ܿ��� ���� list�� �Բ� print
				reviewLikeAmountMap.put(reviewId, reviewLikeAmount);
			}
		} catch (Exception e)
		{
			e.printStackTrace(); // �ֿܼ� ���

		}
		

		request.setAttribute("reviewLikeAmountMap", reviewLikeAmountMap);
		
		ModelAndView mv = new ModelAndView();
		mv.setPath(url); // �����ص� �����ص� forward���
		return mv;

	}
}
