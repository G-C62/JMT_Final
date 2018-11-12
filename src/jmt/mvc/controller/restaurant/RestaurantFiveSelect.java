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

public class RestaurantFiveSelect implements Controller {
	RestaurantService service = new RestaurantServiceImpl();
	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "mainView/JmtMain.jsp";
		ServletContext application = request.getServletContext();
		String [] category= {"한식", "중식", "일식", "패스트푸드", "분식", "양식", "부페"};
		//1~5buffet,6~10bunsick,11~15china,16~20fastfood,21~25hansick,26~30ilsick,31~35yangsik
		for(int i=0;i<7;i++) {
		try {
			if(i==0) {
				List<ReviewDTO> list = service.RestaurantFiveSelect(category[i]);  //restaurantList에는 resCategory, resName 포함
				for(ReviewDTO dto :list) {
					String image = Integer.toString((int)(Math.random()*5+21));
					if(dto.getReviewImg1()==null) {
						dto.setReviewImg1((String)application.getAttribute(image));
					}
				}
				request.setAttribute("hansickFiveSelect", list); // 레스토랑 이름으로 된 변수에 사진을 저장시켜 view에 보냄.
			}else if(i==1) {
				List<ReviewDTO> list = service.RestaurantFiveSelect(category[i]);  //restaurantList에는 resCategory, resName 포함
				for(ReviewDTO dto :list) {
					String image = Integer.toString((int)(Math.random()*5+11));
					if(dto.getReviewImg1()==null) {
						dto.setReviewImg1((String)application.getAttribute(image));
					}
				}
				request.setAttribute("jungsickFiveSelect", list); // 레스토랑 이름으로 된 변수에 사진을 저장시켜 view에 보냄.
				
			}else if(i==2) {
				List<ReviewDTO> list = service.RestaurantFiveSelect(category[i]);  //restaurantList에는 resCategory, resName 포함
				for(ReviewDTO dto :list) {
					String image = Integer.toString((int)(Math.random()*5+26));
					if(dto.getReviewImg1()==null) {
						dto.setReviewImg1((String)application.getAttribute(image));
					}
				}
				request.setAttribute("ilsickFiveSelect", list); // 레스토랑 이름으로 된 변수에 사진을 저장시켜 view에 보냄.
			}
			else if(i==3) {
				List<ReviewDTO> list = service.RestaurantFiveSelect(category[i]);  //restaurantList에는 resCategory, resName 포함
				for(ReviewDTO dto :list) {
					String image = Integer.toString((int)(Math.random()*5+16));
					if(dto.getReviewImg1()==null) {
						dto.setReviewImg1((String)application.getAttribute(image));
					}
				}
				request.setAttribute("fastfoodFiveSelect", list); // 레스토랑 이름으로 된 변수에 사진을 저장시켜 view에 보냄.
			}
			else if(i==4) {
				List<ReviewDTO> list = service.RestaurantFiveSelect(category[i]);  //restaurantList에는 resCategory, resName 포함
				for(ReviewDTO dto :list) {
					String image = Integer.toString((int)(Math.random()*5+6));
					if(dto.getReviewImg1()==null) {
						dto.setReviewImg1((String)application.getAttribute(image));
					}
				}
				request.setAttribute("bunsickFiveSelect", list); // 레스토랑 이름으로 된 변수에 사진을 저장시켜 view에 보냄.
			}
			else if(i==5) {
				List<ReviewDTO> list = service.RestaurantFiveSelect(category[i]);  //restaurantList에는 resCategory, resName 포함
				for(ReviewDTO dto :list) {
					String image = Integer.toString((int)(Math.random()*5+31));
					if(dto.getReviewImg1()==null) {
						dto.setReviewImg1((String)application.getAttribute(image));
					}
				}
				request.setAttribute("yangsickFiveSelect", list); // 레스토랑 이름으로 된 변수에 사진을 저장시켜 view에 보냄.
			}
			else if(i==6) {
				List<ReviewDTO> list = service.RestaurantFiveSelect(category[i]);  //restaurantList에는 resCategory, resName 포함
				for(ReviewDTO dto :list) {
					String image = Integer.toString((int)(Math.random()*5+1));
					if(dto.getReviewImg1()==null) {
						dto.setReviewImg1((String)application.getAttribute(image));
					}
				}
				request.setAttribute("buffetFiveSelect", list); // 레스토랑 이름으로 된 변수에 사진을 저장시켜 view에 보냄.
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		}
		ModelAndView mv = new ModelAndView();
		mv.setPath(url);
		return mv;
	}
}