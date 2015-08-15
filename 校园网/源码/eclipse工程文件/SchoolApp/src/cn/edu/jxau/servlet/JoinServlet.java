package cn.edu.jxau.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class JoinServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<String> list = new ArrayList<String>();
		ServletContext application = request.getServletContext();
		Map<String,String> map = (Map)application.getAttribute("MettingMap");
		Iterator it = map.entrySet().iterator();
		while(it.hasNext()) {
			Entry entry = (Entry)it.next();
			list.add((String) entry.getKey());
		}
		request.setAttribute("metting", list);
		request.getRequestDispatcher("metting.jsp").forward(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request,response);
	}
}
