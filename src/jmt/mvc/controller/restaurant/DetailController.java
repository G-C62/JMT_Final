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
		response.setContentType("text/html;charset=UTF-8"); //front�� ������������ ���� �ѱ�ó��
		ServletContext application = request.getServletContext();
		
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
			
			List<String> imgList = service.selectImgFromReview(resId);

			if (reviewList == null || reviewList.size() == 0)
			{
				request.setAttribute("reviewEmpthMsg", "�� ���������� ���� ���䰡 �����. ���並 �ۼ��� �ּ���!");
			}

			if (imgList == null || imgList.size() == 0)
			{
				//���䰡 ���� �� ��ǥ �̹����� �ֱ�
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