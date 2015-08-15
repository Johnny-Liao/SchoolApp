package cn.edu.jxau.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MettingDelServlet extends HttpServlet {

	@SuppressWarnings("unchecked")
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		Map<String,String> map = (Map)request.getServletContext().getAttribute("MettingMap");
		String r = request.getParameter("houseid");
		String pass = request.getParameter("pass");
		if(r != null && !r.equals("")) {
			String password = map.get(r);
			if(password.equals(pass)) {
				response.sendRedirect("room?r=" + r);
			} else {
				out.println("√‹¬Î¥ÌŒÛ");
			}
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request,response);
	}
}
