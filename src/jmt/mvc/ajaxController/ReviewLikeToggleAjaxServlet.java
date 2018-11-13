package jmt.mvc.ajaxController;

import java.io.IOException;

import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jmt.mvc.model.service.RestaurantService;
import jmt.mvc.model.service.RestaurantServiceImpl;

@WebServlet("/ReviewLikeToggleAjaxServlet")
public class ReviewLikeToggleAjaxServlet extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
	{
		response.setContentType("text/html;charset=UTF-8"); //front�� ������������ ���� �ѱ�ó��
		
		//���۵� ������ �ޱ�
		int reviewId = Integer.parseInt(request.getParameter("reviewId"));
		String memberId = request.getParameter("memberId");
		String flag = request.getParameter("flag");
		/*System.out.println(reviewId+"|"+memberId+"|"+flag);*/

		int result = 0;
		try
		{
			RestaurantService service  = new RestaurantServiceImpl();
			
			if (flag.equals("insert"))
			{
				result = service.insertRecommend(reviewId, memberId);
			}else 
			{
				result = service.deleteRecommend(reviewId, memberId);
			}
				
			if (result == 0)
			{
				throw new SQLException("��� ���ƿ� ��ɿ� �����Ͽ����ϴ�.");
			}
		} catch (Exception e)
		{
			e.printStackTrace();
			request.setAttribute("errorMsg", e.getMessage());
		}

		PrintWriter out = response.getWriter();
		out.print(result);
	}

}
