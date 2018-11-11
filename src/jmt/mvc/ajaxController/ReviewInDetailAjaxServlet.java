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
		response.setContentType("text/html;charset=UTF-8"); //front로 내보내질때를 위한 한글처리
		
		//전송된 데이터 받기
		int resId = Integer.parseInt(request.getParameter("resId"));
		String orderby = request.getParameter("orderby");
		System.out.println("orderby = " + orderby);
		
		
		List<ReviewDTO> reviewList = null;
		
		try
		{
			RestaurantService service  = new RestaurantServiceImpl();
			
			if (orderby == "" || orderby.equals("최신순"))
			{
				reviewList = service.recentOrderReview(resId);
			}else 
			{
				reviewList = service.recommendOrderReview(resId);
			}
				
			
			if (reviewList == null || reviewList.size() == 0)
			{
				request.setAttribute("reviewEmpthMsg", "이 음식점에는 아직 리뷰가 없어요. 리뷰를 작성해 주세요!");
			}
		} catch (Exception e)
		{
			e.printStackTrace();
			request.setAttribute("errorMsg", e.getMessage());
		}

		//request.setAttribute("reviewList", reviewList);
		
		//list를 javaScript가 알 수 있는 데이터 형식인 json으로 변환해서 보내야한다.
		JSONArray jsonArr = JSONArray.fromObject(reviewList);
		PrintWriter out = response.getWriter();
		out.println(jsonArr);
	}

}
