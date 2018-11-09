
package jmt.mvc.controller;

import java.io.IOException;


import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/jmt")
public class DispatcherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	Map<String, Controller> map;
	
	@Override
	public void init() throws ServletException {
		map = (Map<String,Controller>)super.getServletContext().getAttribute("map");
		
	}
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String key = request.getParameter("command");
		if(key==null || key.equals("")) {
			//key="review.selectAll";
		}
		
		
		
		ModelAndView mv = map.get(key).execute(request, response);
		System.out.println("key ="+key+"mv = "+mv);
		if(mv.isRedirect()) {	// redirect 방식으로 이동
			response.sendRedirect(mv.getPath());
		}else {	//forward 방식으로 이동
			request.getRequestDispatcher(mv.getPath()).forward(request, response);
		}
	}

}


