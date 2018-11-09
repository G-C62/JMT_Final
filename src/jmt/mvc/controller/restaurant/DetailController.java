package jmt.mvc.controller.restaurant;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jmt.mvc.controller.Controller;
import jmt.mvc.controller.ModelAndView;
import jmt.mvc.model.dto.RestaurantDTO;
import jmt.mvc.model.dto.ReviewDTO;
import jmt.mvc.model.service.RestaurantService;
import jmt.mvc.model.service.RestaurantServiceImpl;

public class DetailController implements Controller
{

	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
	{
		response.setContentType("text/html;charset=UTF-8"); //front로 내보내질때를 위한 한글처리
		ServletContext application = request.getServletContext();
		
		ModelAndView mv = new ModelAndView();
		String url ="suhyun_view/errorView/error.jsp";
		
		//전송된 데이터 받기
		int resId = Integer.parseInt(request.getParameter("resId"));
		
		try
		{	
			//유효성 체크
			if (resId == 0)
			{
				throw new SQLException("없는 음식점입니다.");
			}
			
			
			RestaurantService service  = new RestaurantServiceImpl();
			
			RestaurantDTO partialDetail =  service.selectById(resId);
			List<ReviewDTO> reviewList = service.recentOrderReview(resId);
			int resLikeAcc = service.resLikeAcc(resId);
			
			List<String> imgList = service.selectImgFromReview(resId);

			if (reviewList == null || reviewList.size() == 0)
			{
				request.setAttribute("reviewEmpthMsg", "이 음식점에는 아직 리뷰가 없어요. 리뷰를 작성해 주세요!");
			}

			if (imgList == null || imgList.size() == 0)
			{
				//리뷰가 없을 때 대표 이미지로 넣기
				String fixedImg = ((String) application.getAttribute("1"));;
				request.setAttribute("fixedImg", fixedImg);
			}
			
			request.setAttribute("partialDetail", partialDetail);
			request.setAttribute("reviewList", reviewList);
			request.setAttribute("resLikeAcc", resLikeAcc);
			request.setAttribute("imgList", imgList);
			
			url = "suhyun_view/detail.jsp";
			
		} catch (Exception e)
		{
			e.printStackTrace();
			request.setAttribute("errorMsg", e.getMessage());
		}

		
		mv.setPath(url);
		
		return mv;
	}

}
