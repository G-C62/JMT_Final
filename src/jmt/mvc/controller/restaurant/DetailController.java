package jmt.mvc.controller.restaurant;

import java.io.IOException;


import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
		//합쳐지면 세션or application에서 받아와야 함
	    String memberId = "aaa";
	   
	    //리뷰 좋아요를 위한 map
	    Map<Integer, Integer> reviewLikeAmountMap = new HashMap<>();
	    Map<Integer, Boolean> reviewLikeYesOrNoMap = new HashMap<>();
		
		try
		{	
			//유효성 체크
			if (resId == 0)
			{
				throw new SQLException("없는 음식점입니다.");
			}
			
			
			RestaurantService service  = new RestaurantServiceImpl();
			
			//음식점 부분정보 가져오기
			RestaurantDTO partialDetail =  service.selectById(resId);
			
			//해당 음식점의 리뷰들 list로 가져오기
			List<ReviewDTO> reviewList = service.recentOrderReview(resId);
			
			//음식점의 누적 좋아요 수 가져오기
			int resLikeAcc = service.resLikeAcc(resId);
			
			//내가 이 음식점 좋아요 했는지에 대한 여부
			boolean bookMarkYesOrNo = service.bookMarkYesOrNo(resId, memberId);		
			
			//해당 음식점 리뷰에 등록된 모든 사진 가져오기
			List<String> imgList = service.selectImgFromReview(resId);
			

			if (reviewList == null || reviewList.size() == 0)
			{
				request.setAttribute("reviewEmpthMsg", "이 음식점에는 아직 리뷰가 없어요. 리뷰를 작성해 주세요!");
			}else
			{
				int reviewId = 0;
				int reviewLikeAmount = 0;
				boolean reviewLikeYesOrNo = false;
				
				for(ReviewDTO review:reviewList)
				{	
					reviewId = review.getReviewId();
					
					//리뷰마다 좋아요가 몇 개 눌렸는지 가져오기
					reviewLikeAmount = service.reviewLikeAmount(reviewId);
					
					//내가 이 리뷰를 좋아요 했었는지 가져오기
					reviewLikeYesOrNo = service.reviewLikeYesOrNo(reviewId, memberId);
					
					//각자 map에 넣어서 앞 단에서 따로 reviewList와 함께 print
					reviewLikeAmountMap.put(reviewId, reviewLikeAmount);
					reviewLikeYesOrNoMap.put(reviewId, reviewLikeYesOrNo);
				}
			}

			if (imgList == null || imgList.size() == 0)
			{
				//리뷰가 없을 때 대표 이미지로 넣기
	            String fixedImg = "";
	            String key = "";
				if(partialDetail.getResCategory().equals("한식"))                
	                   key = Integer.toString((int)(Math.random()*5+21));                   
	            else if(partialDetail.getResCategory().equals("중식"))                
	                   key = Integer.toString((int)(Math.random()*5+11));
	            else if(partialDetail.getResCategory().equals("일식/수산물"))                
	                   key = Integer.toString((int)(Math.random()*5+26));
	            else if(partialDetail.getResCategory().equals("패스트푸드"))                
	                   key = Integer.toString((int)(Math.random()*5+16));
	            else if(partialDetail.getResCategory().equals("분식"))                
	                   key = Integer.toString((int)(Math.random()*5+6));
	            else if(partialDetail.getResCategory().equals("양식"))                
	                   key = Integer.toString((int)(Math.random()*5+31));
	            else              
	                   key = Integer.toString((int)(Math.random()*5+1));               
	            
	            fixedImg = ((String) application.getAttribute(key));               
	               request.setAttribute("fixedImg", fixedImg);
			}
			
			request.setAttribute("partialDetail", partialDetail);
			request.setAttribute("reviewList", reviewList);
			request.setAttribute("resLikeAcc", resLikeAcc);
			request.setAttribute("imgList", imgList);
			request.setAttribute("bookMarkYesOrNo", bookMarkYesOrNo);
			request.setAttribute("memberId", memberId);
			request.setAttribute("reviewLikeAmountMap", reviewLikeAmountMap);
			request.setAttribute("reviewLikeYesOrNoMap", reviewLikeYesOrNoMap);

			url = "restaurantDetail/detail.jsp";
		} catch (Exception e)
		{
			e.printStackTrace();
			request.setAttribute("errorMsg", e.getMessage());
		}

		
		mv.setPath(url);
		
		return mv;
	}

}
