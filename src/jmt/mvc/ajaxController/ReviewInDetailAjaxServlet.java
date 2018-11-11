package jmt.mvc.ajaxController;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jmt.mvc.model.dto.ReviewDTO;
import jmt.mvc.model.service.RestaurantService;
import jmt.mvc.model.service.RestaurantServiceImpl;
import net.sf.json.JSONArray;

@WebServlet("/ReviewInDetailAjaxServlet")
public class ReviewInDetailAjaxServlet extends HttpServlet
{
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
	{
		response.setContentType("text/html;charset=UTF-8"); //front�� ������������ ���� �ѱ�ó��
		
		//���۵� ������ �ޱ�
		int resId = Integer.parseInt(request.getParameter("resId"));
		String orderby = request.getParameter("orderby");
		System.out.println("orderby = " + orderby);
		
		
		List<ReviewDTO> reviewList = null;
		
		try
		{
			RestaurantService service  = new RestaurantServiceImpl();
			
			if (orderby == "" || orderby.equals("�ֽż�"))
			{
				reviewList = service.recentOrderReview(resId);
			}else 
			{
				reviewList = service.recommendOrderReview(resId);
			}
				
			
			if (reviewList == null || reviewList.size() == 0)
			{
				request.setAttribute("reviewEmpthMsg", "�� ���������� ���� ���䰡 �����. ���並 �ۼ��� �ּ���!");
			}
		} catch (Exception e)
		{
			e.printStackTrace();
			request.setAttribute("errorMsg", e.getMessage());
		}

		//request.setAttribute("reviewList", reviewList);
		
		//list�� javaScript�� �� �� �ִ� ������ ������ json���� ��ȯ�ؼ� �������Ѵ�.
		JSONArray jsonArr = JSONArray.fromObject(reviewList);
		PrintWriter out = response.getWriter();
		out.println(jsonArr);
	}

}
