package jmt.mvc.ajaxController;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
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

@WebServlet("/BookMarkToggleAjaxServlet")
public class BookMarkToggleAjaxServlet extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
	{
response.setContentType("text/html;charset=UTF-8"); //front로 내보내질때를 위한 한글처리
		
		//전송된 데이터 받기
		int resId = Integer.parseInt(request.getParameter("resId"));
		String memberId = request.getParameter("memberId");
		String flag = request.getParameter("flag");


		int result = 0;
		try
		{
			RestaurantService service  = new RestaurantServiceImpl();
			
			if (flag.equals("insert"))
			{
				result = service.insertBookMark(resId, memberId);
			}else 
			{
				result = service.deleteBookMark(resId, memberId);
			}
				
			
			if (result == 0)
			{
				throw new SQLException("즐겨찾기 기능에 실패하였습니다.");
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
