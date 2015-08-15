package cn.edu.jxau.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.jxau.Bean.Speak;
import cn.edu.jxau.DAO.SpeakDAO;

public class ShuoshuoServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("gbk");
		PrintWriter out = response.getWriter();
		String about = request.getParameter("about");
		if(about != null && about.equals("1")) {
				String nickname = request.getParameter("name");
				out.println(nickname);
		} else {
			List<Speak> list = SpeakDAO.getAllInfo();
			request.setAttribute("speaklist", list);
			request.getRequestDispatcher("/shuoshuo/shuoshuo.jsp").forward(request, response);
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request,response);
	}
}
