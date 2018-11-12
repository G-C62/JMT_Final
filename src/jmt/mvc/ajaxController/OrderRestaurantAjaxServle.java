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

@WebServlet("/orderRestaurantAjaxServle")
public class OrderRestaurantAjaxServle extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		String category = request.getParameter("category");
		String orderby = request.getParameter("orderby");
		
		List<ReviewDTO> list = null;
		
		try {
			RestaurantService service  = new RestaurantServiceImpl();
			if (orderby == "" || orderby.equals("ÃßÃµ¼ø"))
			{
				list = service.likeOrderSelectAll(category);
			}else {
				list = service.restaurantNameOrderReview(category);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		JSONArray jsonArr = JSONArray.fromObject(list);
		PrintWriter out = response.getWriter();
		out.println(jsonArr);
		
	}

}
