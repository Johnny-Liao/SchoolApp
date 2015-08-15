package cn.edu.jxau.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.jxau.Bean.Speak;
import cn.edu.jxau.Bean.User;
import cn.edu.jxau.DAO.SpeakDAO;
import cn.edu.jxau.DAO.UserDAO;

public class AboutmeServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username = request.getParameter("username");
		User user = UserDAO.getUsername(username);
		String nickname = user.getNickname();
		List<Speak> list = SpeakDAO.getAboutme(nickname);
		request.setAttribute("aboutme", list);
		request.getRequestDispatcher("/liebiao/aboutmelb.jsp").forward(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request,response);
	}
}
