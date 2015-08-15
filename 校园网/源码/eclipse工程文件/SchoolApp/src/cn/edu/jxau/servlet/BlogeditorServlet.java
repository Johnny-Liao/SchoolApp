package cn.edu.jxau.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.jxau.Bean.User;
import cn.edu.jxau.DAO.BlogDAO;
import cn.edu.jxau.DAO.UserDAO;

public class BlogeditorServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("gbk");
		response.setCharacterEncoding("gbk");
		PrintWriter out = response.getWriter();
		String id = request.getParameter("id");
		String content = request.getParameter("content");
		String title = request.getParameter("title");
		User user = UserDAO.getUser(id);
		if(BlogDAO.setBlog(user, content, title)){
			request.setAttribute("Userinfo", user);
			request.getRequestDispatcher("main.jsp").forward(request, response);
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request,response);
	}
}
