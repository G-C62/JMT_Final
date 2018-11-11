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
public class HandlerMapping implements ServletContextListener {
	public void contextDestroyed(ServletContextEvent arg0) {

	}

	public void contextInitialized(ServletContextEvent e) {
		// 필요한 객체를 미리 생성하여 map에 넣고 app영역에 map저장

		Map<String, Controller> map = new HashMap<>();

		ServletContext application = e.getServletContext();
		String fileName = application.getInitParameter("fileName");

		try {
			ResourceBundle rb = ResourceBundle.getBundle(fileName);
			Iterator<String> it = rb.keySet().iterator();
			while (it.hasNext()) {
				String key = it.next();
				String value = rb.getString(key);
				System.out.println("key : " +key + ", value : "+value);
				Controller classObj = (Controller) Class.forName(value).newInstance();
				map.put(key, classObj);
			}
			
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		application.setAttribute("map", map);
		System.out.println("map : "+map);
	}

}
