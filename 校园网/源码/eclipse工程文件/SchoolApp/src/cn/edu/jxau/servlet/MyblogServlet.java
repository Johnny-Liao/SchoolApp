package cn.edu.jxau.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.jxau.Bean.Blog;
import cn.edu.jxau.DAO.BlogDAO;

public class MyblogServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("gbk");
		String username = request.getParameter("username");
		if(username != null && !username.equals("")) {
			List<Blog> list = BlogDAO.getBloglist(username);
			request.setAttribute("mybloglist", list);
			request.getRequestDispatcher("myblog.jsp").forward(request, response);
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request,response);
	}
}
