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
import jmt.mvc.model.dto.ReviewDTO;
import jmt.mvc.model.service.RestaurantService;
import jmt.mvc.model.service.RestaurantServiceImpl;

public class RestaurantSelectAll implements Controller {
	RestaurantService service = new RestaurantServiceImpl();
	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url="Hosu_View/NewFile.jsp";
		ServletContext application = request.getServletContext();
		String category=request.getParameter("category");
		try {
			List<ReviewDTO> list = service.RestaurantSelectAll(category);
			request.setAttribute("selectAllRestaurant", list);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		ModelAndView mv = new ModelAndView();
		mv.setPath(url);
		return mv;
	}

}
