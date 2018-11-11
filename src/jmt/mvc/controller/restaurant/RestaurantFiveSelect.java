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
import jmt.mvc.model.service.MemberService;
import jmt.mvc.model.service.MemberServiceImpl;

public class RestaurantFiveSelect implements Controller {
	MemberService service = new MemberServiceImpl();
	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "Hosu_View/NewFile.jsp";
		ServletContext application = request.getServletContext();
		try {
			List<ReviewDTO> list = service.RestaurantFiveSelect();  //restaurantList에는 resCategory, resName 포함
			System.out.println(list);
				
				for(ReviewDTO dto :list) {
					if(dto.getReviewImg1()==null) {
						dto.setReviewImg1((String)application.getAttribute("2"));
					}
				}
				
			request.setAttribute("RestaurantFiveSelect", list); // 레스토랑 이름으로 된 변수에 사진을 저장시켜 view에 보냄.
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		ModelAndView mv = new ModelAndView();
		mv.setPath(url);
		return mv;
	}

}
