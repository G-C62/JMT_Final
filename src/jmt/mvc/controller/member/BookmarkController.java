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

public class BookmarkController implements Controller
{
	MemberService service = new MemberServiceImpl();

	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
	{
		String url = "Hosu_View/myBookmark.jsp";
		ServletContext application = request.getServletContext();
		String id = "kim";
		try
		{
			List<ReviewDTO> list = service.selectBookmarkById(id);
			for (ReviewDTO dto : list)
			{
				if (dto.getReviewImg1() == null)
				{
					dto.setReviewImg1((String) application.getAttribute("1"));
				}
			}
			request.setAttribute("listMyBookMark", list);

		} catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		ModelAndView mv = new ModelAndView();
		mv.setPath(url);
		return mv;
	}

}
