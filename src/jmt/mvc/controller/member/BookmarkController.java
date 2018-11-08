package jmt.mvc.controller.member;

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

public class BookmarkController implements Controller {
	MemberService service = new MemberServiceImpl();
	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "jmtView/myBookmark.jsp";
		ServletContext application = request.getServletContext();
		String id = "kim";
		
		try {
			List<ReviewDTO> list = service.selectBookmarkById(id);
			for(ReviewDTO dto :list) {
				if(dto.getReview_img1()==null) {
					dto.setReview_img1((String)application.getAttribute("1"));
				}
			}
			request.setAttribute("listMyBookMark", list);
			
			/*Iterator<String> it = mapp.keySet().iterator();
			while (it.hasNext()) {
				String key = it.next();
				System.out.println(key);
				String value = mapp.get(key);
				if(value==null) {
					value=(String)application.getAttribute("1");
				}
			}
			request.setAttribute("resultMap", mapp);*/
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		ModelAndView mv = new ModelAndView();
		mv.setPath(url);
		return mv;
	}

}
