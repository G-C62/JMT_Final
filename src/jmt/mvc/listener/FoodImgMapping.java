package jmt.mvc.listener;

import java.util.HashMap;



import java.util.Iterator;
import java.util.Map;
import java.util.ResourceBundle;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import jmt.mvc.controller.Controller;

@WebListener
public class FoodImgMapping implements ServletContextListener {
	public void contextDestroyed(ServletContextEvent arg0) {

	}

	public void contextInitialized(ServletContextEvent e) {
		// �ʿ��� ��ü�� �̸� �����Ͽ� map�� �ְ� app������ map����
		Map<String, Controller> map2 = new HashMap<>();

		ServletContext application = e.getServletContext();
		String foodPicture = application.getInitParameter("foodPicture");

		try {
			ResourceBundle rb = ResourceBundle.getBundle(foodPicture);
			Iterator<String> it = rb.keySet().iterator();
			while (it.hasNext()) {
				String key = it.next();
				String value = rb.getString(key);
				System.out.println("key : " +key + ", value : "+value);
				application.setAttribute(key, value);
			}
			
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

}
