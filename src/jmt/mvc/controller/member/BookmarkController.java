package jmt.mvc.controller.member;

import java.io.IOException;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jmt.mvc.controller.Controller;
import jmt.mvc.controller.ModelAndView;
import jmt.mvc.model.dto.ReviewDTO;
import jmt.mvc.model.service.RestaurantService;
import jmt.mvc.model.service.RestaurantServiceImpl;

public class BookmarkController implements Controller {
	RestaurantService service = new RestaurantServiceImpl();
	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String url = "subView/favorite.jsp";
		ServletContext application = request.getServletContext();
		HttpSession session = request.getSession(true);
		String id = (String) session.getAttribute("memberID");
		System.out.println(id);
		try {
			List<ReviewDTO> list = service.selectBookmarkById(id);
			for(ReviewDTO dto :list) {
				if(dto.getReviewImg1()==null) {
					dto.setReviewImg1((String)application.getAttribute("1"));
				}
			}
			request.setAttribute("listMyBookMark", list);
			System.out.println(list);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		ModelAndView mv = new ModelAndView();
		mv.setPath(url);
		return mv;
	}

}
