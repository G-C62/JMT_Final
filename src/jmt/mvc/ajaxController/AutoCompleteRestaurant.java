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

import jmt.mvc.model.service.MemberService;
import jmt.mvc.model.service.MemberServiceImpl;
import net.sf.json.JSONArray;

@WebServlet("/autoCompleteRestaurant")
public class AutoCompleteRestaurant extends HttpServlet {
	MemberService service = new MemberServiceImpl();
	private static final long serialVersionUID = 1L;
    
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		String keyWord = request.getParameter("keyWord");
		
		try {
			List<String> list = service.autoCompleteRestaurant(keyWord);
			
			PrintWriter out = response.getWriter();
			JSONArray jsonArr = JSONArray.fromObject(list);
			out.println(jsonArr);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
