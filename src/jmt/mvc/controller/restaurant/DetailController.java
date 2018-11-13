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
import javax.servlet.http.HttpSession;

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
		response.setContentType("text/html;charset=UTF-8"); //front�� ������������ ���� �ѱ�ó��
		ServletContext application = request.getServletContext();
		ModelAndView mv = new ModelAndView();
		String url ="suhyun_view/errorView/error.jsp";
		
		//���۵� ������ �ޱ�
		int resId = Integer.parseInt(request.getParameter("resId"));
		//�������� ����or application���� �޾ƿ;� ��
		HttpSession session = request.getSession();
		String memberId = (String) session.getAttribute("memberID");
	   
	    //���� ���ƿ並 ���� map
	    Map<Integer, Integer> reviewLikeAmountMap = new HashMap<>();
	    Map<Integer, Boolean> reviewLikeYesOrNoMap = new HashMap<>();
		
		try
		{	
			//��ȿ�� üũ
			if (resId == 0)
			{
				throw new SQLException("���� �������Դϴ�.");
			}
			
			
			RestaurantService service  = new RestaurantServiceImpl();
			
			//������ �κ����� ��������
			RestaurantDTO partialDetail =  service.selectById(resId);
			
			//�ش� �������� ����� list�� ��������
			List<ReviewDTO> reviewList = service.recentOrderReview(resId);
			
			//�������� ���� ���ƿ� �� ��������
			int resLikeAcc = service.resLikeAcc(resId);
			
			//���� �� ������ ���ƿ� �ߴ����� ���� ����
			boolean bookMarkYesOrNo = service.bookMarkYesOrNo(resId, memberId);		
			
			//�ش� ������ ���信 ��ϵ� ��� ���� ��������
			List<String> imgList = service.selectImgFromReview(resId);
			

			if (reviewList == null || reviewList.size() == 0)
			{
				request.setAttribute("reviewEmpthMsg", "�� ���������� ���� ���䰡 �����. ���並 �ۼ��� �ּ���!");
			}else
			{
				int reviewId = 0;
				int reviewLikeAmount = 0;
				boolean reviewLikeYesOrNo = false;
				
				for(ReviewDTO review:reviewList)
				{	
					reviewId = review.getReviewId();
					
					//���丶�� ���ƿ䰡 �� �� ���ȴ��� ��������
					reviewLikeAmount = service.reviewLikeAmount(reviewId);
					
					//���� �� ���並 ���ƿ� �߾����� ��������
					reviewLikeYesOrNo = service.reviewLikeYesOrNo(reviewId, memberId);
					
					//���� map�� �־ �� �ܿ��� ���� reviewList�� �Բ� print
					reviewLikeAmountMap.put(reviewId, reviewLikeAmount);
					reviewLikeYesOrNoMap.put(reviewId, reviewLikeYesOrNo);
				}
			}

			if (imgList == null || imgList.size() == 0)
			{
				//���䰡 ���� �� ��ǥ �̹����� �ֱ�
	            String fixedImg = "";
	            String key = "";
				if(partialDetail.getResCategory().equals("�ѽ�"))                
	                   key = Integer.toString((int)(Math.random()*5+21));                   
	            else if(partialDetail.getResCategory().equals("�߽�"))                
	                   key = Integer.toString((int)(Math.random()*5+11));
	            else if(partialDetail.getResCategory().equals("�Ͻ�/���깰"))                
	                   key = Integer.toString((int)(Math.random()*5+26));
	            else if(partialDetail.getResCategory().equals("�н�ƮǪ��"))                
	                   key = Integer.toString((int)(Math.random()*5+16));
	            else if(partialDetail.getResCategory().equals("�н�"))                
	                   key = Integer.toString((int)(Math.random()*5+6));
	            else if(partialDetail.getResCategory().equals("���"))                
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

			url = "final_view/detailView/detail.jsp";
		} catch (Exception e)
		{
			e.printStackTrace();
			request.setAttribute("errorMsg", e.getMessage());
		}

		
		mv.setPath(url);
		
		return mv;
	}

}
