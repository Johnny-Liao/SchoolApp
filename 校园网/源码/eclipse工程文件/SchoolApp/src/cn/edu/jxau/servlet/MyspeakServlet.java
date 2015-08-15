package cn.edu.jxau.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.jxau.Bean.Speak;
import cn.edu.jxau.Bean.User;
import cn.edu.jxau.DAO.SpeakDAO;
import cn.edu.jxau.DAO.UserDAO;

public class MyspeakServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("gbk");
		response.setCharacterEncoding("gbk");
		PrintWriter out = response.getWriter();
		String text = request.getParameter("text");
		String username = request.getParameter("hidd");
		User user = UserDAO.getUsername(username);
		if(SpeakDAO.setInfo(user, text)) {
			request.setAttribute("Userinfo", user);
			request.getRequestDispatcher("main.jsp?username=" + user.getMyusername()).forward(request, response);
		}
		
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request,response);
	}

}
