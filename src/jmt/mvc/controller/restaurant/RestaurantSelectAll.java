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
		String url="restaurantDetail/categoryResDetail.jsp";
		ServletContext application = request.getServletContext();
		String category=request.getParameter("category");
		//1~5buffet,6~10bunsick,11~15china,16~20fastfood,21~25hansick,26~30ilsick,31~35yangsik
		//"�ѽ�", "�߽�", "�Ͻ�", "�н�ƮǪ��", "�н�", "���", "����"
		String image=null;
		try {
			List<ReviewDTO> list = service.RestaurantSelectAll(category);
			
			for(ReviewDTO dto :list) {
				if(category.equals("�ѽ�")) {
					 image = Integer.toString((int)(Math.random()*5+21));
				} else if(category.equals("�߽�")) {
					 image = Integer.toString((int)(Math.random()*5+11));
				} else if(category.equals("�Ͻ�")) {
					 image = Integer.toString((int)(Math.random()*5+26));
				} else if(category.equals("�н�ƮǪ��")) {
					 image = Integer.toString((int)(Math.random()*5+16));
				} else if(category.equals("�н�")) {
					 image = Integer.toString((int)(Math.random()*5+6));
				} else if(category.equals("���")) {
					 image = Integer.toString((int)(Math.random()*5+31));
				} else {
					 image = Integer.toString((int)(Math.random()*5+1));
				}
				if(dto.getReviewImg1()==null) {
					dto.setReviewImg1((String)application.getAttribute(image));
				}
			}
			request.setAttribute("selectAllRestaurant", list);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		ModelAndView mv = new ModelAndView();
		mv.setPath(url);
		return mv;
	}

}
