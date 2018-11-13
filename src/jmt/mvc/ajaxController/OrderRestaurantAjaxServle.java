package jmt.mvc.ajaxController;

import java.io.IOException;

import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletContext;
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
		ServletContext application = request.getServletContext();
		//1~5buffet,6~10bunsick,11~15china,16~20fastfood,21~25hansick,26~30ilsick,31~35yangsik
		
		try {
			RestaurantService service  = new RestaurantServiceImpl();
			if (orderby == "" || orderby.equals("��õ��"))
			{
				list = service.likeOrderSelectAll(category);
				if(category.equals("�ѽ�")) {
					for(ReviewDTO dto :list) {
						String image = Integer.toString((int)(Math.random()*5+21));
						if(dto.getReviewImg1()==null) {
							dto.setReviewImg1((String)application.getAttribute(image));
						}
					}
					request.setAttribute("hansickFiveSelect", list); // ������� �̸����� �� ������ ������ ������� view�� ����.
				}else if(category.equals("�߽�")) {
					for(ReviewDTO dto :list) {
						String image = Integer.toString((int)(Math.random()*5+11));
						if(dto.getReviewImg1()==null) {
							dto.setReviewImg1((String)application.getAttribute(image));
						}
					}
					request.setAttribute("jungsickFiveSelect", list); // ������� �̸����� �� ������ ������ ������� view�� ����.
					
				}else if(category.equals("�Ͻ�/���깰")) {
					for(ReviewDTO dto :list) {
						String image = Integer.toString((int)(Math.random()*5+26));
						if(dto.getReviewImg1()==null) {
							dto.setReviewImg1((String)application.getAttribute(image));
						}
					}
					request.setAttribute("ilsickFiveSelect", list); // ������� �̸����� �� ������ ������ ������� view�� ����.
				}
				else if(category.equals("�н�ƮǪ��")) {
					for(ReviewDTO dto :list) {
						String image = Integer.toString((int)(Math.random()*5+16));
						if(dto.getReviewImg1()==null) {
							dto.setReviewImg1((String)application.getAttribute(image));
						}
					}
					request.setAttribute("fastfoodFiveSelect", list); // ������� �̸����� �� ������ ������ ������� view�� ����.
				}
				else if(category.equals("�н�")) {
					for(ReviewDTO dto :list) {
						String image = Integer.toString((int)(Math.random()*5+6));
						if(dto.getReviewImg1()==null) {
							dto.setReviewImg1((String)application.getAttribute(image));
						}
					}
					request.setAttribute("bunsickFiveSelect", list); // ������� �̸����� �� ������ ������ ������� view�� ����.
				}
				else if(category.equals("���")) {
					for(ReviewDTO dto :list) {
						String image = Integer.toString((int)(Math.random()*5+31));
						if(dto.getReviewImg1()==null) {
							dto.setReviewImg1((String)application.getAttribute(image));
						}
					}
					request.setAttribute("yangsickFiveSelect", list); // ������� �̸����� �� ������ ������ ������� view�� ����.
				}
				else if(category.equals("����/ǻ���丮")) {
					for(ReviewDTO dto :list) {
						String image = Integer.toString((int)(Math.random()*5+1));
						if(dto.getReviewImg1()==null) {
							dto.setReviewImg1((String)application.getAttribute(image));
						}
					}
					request.setAttribute("buffetFiveSelect", list); // ������� �̸����� �� ������ ������ ������� view�� ����.
				}
/////////////////�����ټ�///////////////////////////////////////////////////////
			}else {
				list = service.restaurantNameOrderReview(category);
				//1~5buffet,6~10bunsick,11~15china,16~20fastfood,21~25hansick,26~30ilsick,31~35yangsik
				
				if(category.equals("�ѽ�")) {
					for(ReviewDTO dto :list) {
						String image = Integer.toString((int)(Math.random()*5+21));
						if(dto.getReviewImg1()==null) {
							dto.setReviewImg1((String)application.getAttribute(image));
						}
					}
					request.setAttribute("hansickFiveSelect", list); // ������� �̸����� �� ������ ������ ������� view�� ����.
				}else if(category.equals("�߽�")) {
					for(ReviewDTO dto :list) {
						String image = Integer.toString((int)(Math.random()*5+11));
						if(dto.getReviewImg1()==null) {
							dto.setReviewImg1((String)application.getAttribute(image));
						}
					}
					request.setAttribute("jungsickFiveSelect", list); // ������� �̸����� �� ������ ������ ������� view�� ����.
					
				}else if(category.equals("�Ͻ�/���깰")) {
					for(ReviewDTO dto :list) {
						String image = Integer.toString((int)(Math.random()*5+26));
						if(dto.getReviewImg1()==null) {
							dto.setReviewImg1((String)application.getAttribute(image));
						}
					}
					request.setAttribute("ilsickFiveSelect", list); // ������� �̸����� �� ������ ������ ������� view�� ����.
				}
				else if(category.equals("�н�ƮǪ��")) {
					for(ReviewDTO dto :list) {
						String image = Integer.toString((int)(Math.random()*5+16));
						if(dto.getReviewImg1()==null) {
							dto.setReviewImg1((String)application.getAttribute(image));
						}
					}
					request.setAttribute("fastfoodFiveSelect", list); // ������� �̸����� �� ������ ������ ������� view�� ����.
				}
				else if(category.equals("�н�")) {
					for(ReviewDTO dto :list) {
						String image = Integer.toString((int)(Math.random()*5+6));
						if(dto.getReviewImg1()==null) {
							dto.setReviewImg1((String)application.getAttribute(image));
						}
					}
					request.setAttribute("bunsickFiveSelect", list); // ������� �̸����� �� ������ ������ ������� view�� ����.
				}
				else if(category.equals("���")) {
					for(ReviewDTO dto :list) {
						String image = Integer.toString((int)(Math.random()*5+31));
						if(dto.getReviewImg1()==null) {
							dto.setReviewImg1((String)application.getAttribute(image));
						}
					}
					request.setAttribute("yangsickFiveSelect", list); // ������� �̸����� �� ������ ������ ������� view�� ����.
				}
				else if(category.equals("����/ǻ���丮")) {
					for(ReviewDTO dto :list) {
						String image = Integer.toString((int)(Math.random()*5+1));
						if(dto.getReviewImg1()==null) {
							dto.setReviewImg1((String)application.getAttribute(image));
						}
					}
					request.setAttribute("buffetFiveSelect", list); // ������� �̸����� �� ������ ������ ������� view�� ����.
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		JSONArray jsonArr = JSONArray.fromObject(list);
		PrintWriter out = response.getWriter();
		out.println(jsonArr);
		
	}

}
