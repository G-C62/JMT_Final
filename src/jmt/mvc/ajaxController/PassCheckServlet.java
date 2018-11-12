package jmt.mvc.ajaxController;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jmt.mvc.model.service.MemberService;
import jmt.mvc.model.service.MemberServiceImpl;


@WebServlet("/passCheckServlet")
public class PassCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");// post��� �ѱ�ó��
		System.out.println("���񽺴� �Դ�");
		String pwd = request.getParameter("password");
		System.out.println("pwd="+pwd);
		String id = (String)request.getSession().getAttribute("memberID");
		MemberService service = new MemberServiceImpl();
		PrintWriter out = response.getWriter();
		try {
			String dbPwd = service.PassCheckService(id);
			System.out.println("dbPwd="+dbPwd);
			
			if(pwd.equals(dbPwd)) {
				out.print("��й�ȣ�� ��ġ�մϴ�");
			} else {
				out.print("��й�ȣ�� ��ġ���� �ʽ��ϴ�");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
