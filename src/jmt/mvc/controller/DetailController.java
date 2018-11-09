package jmt.mvc.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		
		ModelAndView mv = new ModelAndView();
		String url ="suhyun_view/errorView/error.jsp";
		
		//���۵� ������ �ޱ�
		int resId = Integer.parseInt(request.getParameter("resId"));
		
		try
		{	
			//��ȿ�� üũ
			if (resId == 0)
			{
				throw new SQLException("���� �������Դϴ�.");
			}
			
			
			RestaurantService service  = new RestaurantServiceImpl();
			
			RestaurantDTO partialDetail =  service.selectById(resId);
			List<ReviewDTO> reviewList = service.recentOrderReview(resId);
			int resLikeAcc = service.resLikeAcc(resId);
			
			if (reviewList == null || reviewList.size() == 0)
			{
				request.setAttribute("reviewEmpthMsg", "�� ���������� ���� ���䰡 �����. ���並 �ۼ��� �ּ���!");
			}
			
			request.setAttribute("partialDetail", partialDetail);
			request.setAttribute("reviewList", reviewList);
			request.setAttribute("resLikeAcc", resLikeAcc);
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
