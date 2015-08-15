package cn.edu.jxau.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.jxau.Bean.User;
import cn.edu.jxau.DAO.UserDAO;

public class RenrenServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username = request.getParameter("username");
		User user = UserDAO.getUsername(username);
		if(user != null && !user.equals("")) {
			request.setAttribute("gerenUser", user);
			request.getRequestDispatcher("geren.jsp").forward(request, response);
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}
}
