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
