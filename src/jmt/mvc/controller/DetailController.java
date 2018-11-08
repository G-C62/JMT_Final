package jmt.mvc.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jmt.mvc.model.dto.RestaurantDTO;
import jmt.mvc.model.service.RestaurantService;
import jmt.mvc.model.service.RestaurantServiceImpl;

public class DetailController implements Controller
{

	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
	{
		
		ModelAndView mv = new ModelAndView();
		String url ="errorView/error.jsp";
		
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
			RestaurantDTO detail =  service.selectById(resId);
			
			request.setAttribute("detail", detail);
			url = "detailView/detail.jsp";
			
		} catch (Exception e)
		{
			e.printStackTrace();
			request.setAttribute("errorMsg", e.getMessage());
		}
		
		mv.setPath(url);
		
		return mv;
	}

}
