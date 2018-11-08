
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
			//key="selectCategory"; �⺻���(command�� ���޵� ���� �������)
		}
		ModelAndView mv = map.get(key).execute(request, response);
		if(mv.isRedirect()) {	// redirect ������� �̵�
			response.sendRedirect(mv.getPath());
		}else {	//forward ������� �̵�
			request.getRequestDispatcher(mv.getPath()).forward(request, response);
		}
	}
}

